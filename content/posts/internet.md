+++
title =  "Internet"
date = 2017-11-24T14:17:25+01:00
tags = ["document"]
categories = ["Intro-pack"]
+++

## Wireless access to eduroam
There is an installer in [eduroam website](https://cat.eduroam.org/) (even for Linux) that embedded the eduroam certificate.

# Manual setup
- Login ID: CID@chalmers.se
- Anonymous ID: empty
- Password: CID password
- Authentication: MSCHAPv2
- EAP type: PEAP
- Eduroam certificate is in eduroam.pem



## Change password for CID / NOMAD

Go to[CDKS](http://cdks.chalmers.se)

## Home directory of remote servers
You have a limited (but large) space at Chalmers servers just for you! 
- enter in your Termial
- type 'ssh -X CID@remote12.chalmers.se/users/CID' 
there you are
- to copy file use the secure copy command: 
scp (add ''-r'' if it is a directory) *path where from*    CIDp@remote12.chalmers.se:/*path where to*



## Web space
- /chalmers/users/CID/www/www.cse.chalmers.se
- http://www.cse.chalmers.se/~CID/

# Permissions
Sometimes after editing a file in your web directory if will become inaccessible from the web.
This script applies the right permissions to everything.
Run from within your `www` directory.

```bash
#!/bin/bash
CONF=/chalmers/sw/sup64/fix_personal_www_rights-1.1/etc
find www.cse.chalmers.se -type d                -print0 | xargs -r -0 nfs4_setfacl -S ${CONF}/dir.acl
find www.cse.chalmers.se -type f   -perm /ugo+x -print0 | xargs -r -0 nfs4_setfacl -S ${CONF}/xfile.acl
find www.cse.chalmers.se -type f ! -perm /ugo+x -print0 | xargs -r -0 nfs4_setfacl -S ${CONF}/file.acl
```

(Source: Patrick Forsberg, private email 2013-12-18)

## Working remotely via SSH servers

VPN, SSH can be used to work remotely while keeping your access to chalmers resources, restricted articles and libraries.

[self-administered](https://student.portal.chalmers.se/en/contactservice/ITServices/self-administered/Sidor/default.aspx)

- ssh CID@remote12.chalmers.se
- ssh CID@remote2.student.chalmers.se
- ssh CID@remote11.chalmers.se

If you do not want to reenter your password all the time, add
the following two lines to the corresponding entries in `$HOME/.ssh/config`:

~~~~
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
~~~~

After that, having a valid Kerberos ticket will suffice to log in.

A more lightweight solution is to use sshuttle (https://github.com/apenwarr/sshuttle).
Running the following command will automatically tunnel all TCP connections and
DNS requests through the chalmers network:
~~~~
sshuttle -r remote11.chalmers.se 0/0
~~~~



## Windows servers via remote desktop
- rdesktop remote.cda.chalmers.se
- login name: NET\CID or CID@net.chalmers.se

This is specially useful for using Microsoft office (Word, powerpoint, Silverlight and IE!!)



