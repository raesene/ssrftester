SSRF Tester
--

A basic Sinatra application to test container services for SSRF issues.  There are two forms at /getter_form/ and /poster_form/ to have the server test GET and POST requests.

Security
--

The application is behind basic Auth (username is 'ssrftester') to provide a basic protection against people messing with your instance.  This is obviously not a robust security mechanism, so do be carefuly about where you deploy this :)

To specify your own password ensure that the environment variable SSRFPASSWORD is set and visible to the application otherwise it'll use the default password.

Starting the image is something like

`docker run -e SSRFPASSWORD=LoremIpsum -d -p 4567:4567 ssrftest`

At that point it'll be availble on port 4567, obviously this can be changed to something else if needs be.