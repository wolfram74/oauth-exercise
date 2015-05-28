


get '/public' do
  "This is the public page - everybody is welcome!"
end

get '/private' do
  halt(401,'Not Authorized') unless admin?
  "This is the private page - members only, authentication successful!!!"
end

get '/login' do
  redirect to("/auth/twitter")
end

get '/auth/twitter/callback' do
  session[:admin] = true
  p env['omniauth.auth']
  "Hey, how's stuff, %s" % env['omniauth.auth']["info"][:name]
  "Hey, how's stuff, #{env['omniauth.auth']["info"][:name]}"
  "%04d" % 4
end

get '/auth/failure' do
  params[:message]
end

get '/logout' do
  session[:admin] = nil
  "You are now logged out"
end


=begin
api key oopsiedaisy
Access level  Read and write (modify app permissions)
Consumer Key (API Key)  accidentallyAllTheThings (manage keys and access tokens)
Consumer Secret (API Secret)  what's this doing here?
Callback URL  http://mewallacee.com/auth/twitter/callback
Sign in with Twitter  Yes
App-only authentication https://api.twitter.com/oauth2/token
Request token URL https://api.twitter.com/oauth/request_token
Authorize URL https://api.twitter.com/oauth/authorize
Access token URL  https://api.twitter.com/oauth/access_token
=end

# http://www.sitepoint.com/twitter-authentication-in-sinatra/
