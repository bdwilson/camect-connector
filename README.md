# Camect Connector
This flask API uses the [camect-py](https://github.com/camect/camect-py)
python library and allows your [Camect](https://www.camect.com) device to
interact with
[Hubitat](https://github.com/bdwilson/hubitat/tree/master/Camect).

# Installation (manual)
1. Install camect-py, requests, json
<pre>
# pip3 install camect-py
# pip3 install requests
# pip3 install json
</pre>
1. You'll need to then navigate to [https://local.home.camect.com](https://local.home.camect.com) and accept the Terms of Service. You'll end up on your local server and the name will be **xxxxxx**.l.home.camect.com. This beginning part is considered your **Camect Code**. 
2. You'll then need to determine your username and password - the username in the default case is **admin** and the password is the first part of your email address that you used to register your camect device - for instance, bob@gmail.com would give you the password "bob".
3. Install [Camect Hubitat](https://github.com/bdwilson/hubitat/tree/master/Camect) code, fill in your above information and **enable OAUTH**. You'll need to copy your OAUTH URL and use it in step 4.
4. Replace these variables within camect_connector.py
5. Change directory in the .service file to match where your camect-connect.py file is.
6. Copy service file to /lib/systemd/system/ then enable it.
<pre>
# systemctl daemon-reload
# systemctl enable camect-connector.service
# systemctl start camect-connector.service
</pre>

# Installation (Docker)
1. Grab the
[Dockerfile](https://raw.githubusercontent.com/bdwilson/camect-connector/master/Dockerfile)
via wget and put it in a directory on your Docker server. Then run the commands
below from that directory subbing in the variables from above.
2. <code> # docker build -t camect-connector --build-arg USERNAME='admin'
--build-arg PASSWORD='your_password' --build-arg CAMECTCODE='a1b2xxxx'
--build-arg
HUBITATOAUTH='http://192.168.x.x/apps/api/258/camect/?access_token=abc24323-13526236-23626-xxxxxxx'
. </code> **Don't forget your dot at the end**
CTRL-C out of it when it's complete.
3. Run your newly created image: <code> # docker run --name camect-connector -t
camect-connector</code> 
4. That's it. If you need to troubleshoot your docker image, you can get into
it via:
<code># docker exec -it camect-connector /bin/bash</code> or 
<code># docker run -it camect-connector /bin/bash</code> and then poke around and see what the issue is.

# Hubitat
1. Install [Camect
Hubitat](https://github.com/bdwilson/hubitat/tree/master/Camect) code and
See [here](https://github.com/bdwilson/hubitat/tree/master/Raincloud). 

Bugs/Contact Info
-----------------
Bug me on Twitter at [@brianwilson](http://twitter.com/brianwilson) or email me [here](http://cronological.com/comment.php?ref=bubba).
