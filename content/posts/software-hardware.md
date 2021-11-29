+++
title =  "Software & Hardware"
date  = "2020-03-17"
tags = ["document"]
categories = ["Workplace"]
+++

# Internet

### Wireless access to eduroam
There is an installer in [eduroam website](https://cat.eduroam.org/) (even for Linux) that embedded the eduroam certificate.

#### Manual setup
- Login ID: CID@chalmers.se
- Anonymous ID: empty
- Password: CID password
- Authentication: MSCHAPv2
- EAP type: PEAP
- Eduroam certificate is in eduroam.pem


### Change password for CID / NOMAD

Go to [CDKS](http://cdks.chalmers.se)




# Email

### IMAP
- imap.chalmers.se - port: 993
- username : CID
- Auth method: CID password
- Connection: SSL/TLS
// Note : Thunderbird test doesn't work correctly.

### SMTP
- smtp.chalmers.se : 587
- username : CID
- Auth method: NTLM (TLS also works)
- Connection: STARTTLS (if required)

### iOS
[Detail setting from IT portal](https://it.portal.chalmers.se/itportal/MobilSurfPlattaApple/Epost)
- Select Exchange account
- On the first page, use 'CID@chalmers.se'
- Domain: NET
- Server: webmail.chalmers.se
// Note: if you found some information page from Chalmers with the server name "m.outlook.com", that is intended for Chalmers student accounts.

### Thunderbird/Outlook/Exchange integration
Tools -> addon -> "Lightning"

[Exchange calendar](https://github.com/Ericsson/exchangecalendar/releases) Get direct access to Chalmers ldap contacts in thunderbird using this extension


# Printers

Setting up your computer to print using the printers present in most corridors requires a bit of work, and you will need your SSO login. Follow the instructions from the chalmers IT page:
<https://it.portal.chalmers.se/itportal/Faq/Print>


# Commercial Software Available

Here you will find instructions to get programs such as several Affinity tools, Adobe tools, Matlab, Office, etc.
https://it.portal.chalmers.se/itportal/GenAnst/SoftwareGeneral#anvisningar

If you need other software, talk with your supervisor or with Technical Support (you can find them at the bottom of [this page](https://www.chalmers.se/en/departments/cse/organisation/Pages/localsupport.aspx))


### Microsoft tools
[Microsoft On-The-Hub](https://chalmers.onthehub.com/) Some versions of Windows, MS Office Home/Professional, utitily software (antivirus), Parallels Desktop for Mac, and many others (The software offered might change).


### Box account
As a Chalmers employee you get access to a Box account (similar to Dropbox). 
To start using it:

- [box](https://www.box.com/en-gb/home): 
 - select 'sign-in' (top right)
 - type in CID@chalmers.se
 - click on 'Sign in with SSO' 
 - type in 'Chalmers', click ad log in with your CID and CID password


### Other Software used at Chalmers

Here you can find some more software and cloud services that Chalmers provides to employees:

https://intranet.chalmers.se/en/tools-support/e-services/


### Free commercial services

- [Overleaf](https://overleaf.com/) online editor for LaTeX
- [GitLab](http://gitlab.com) repositories
- [Bitbucket](http://bitbucket.com) repositories
- [Github](http://github.com) repositories
- [Box](http://box.com) file sharing
- [Prezi](http://prezi.com) slide presentations

[//]: # (TODO: Add more things!)



# Home directory of remote servers
You have a limited (but large) space at Chalmers servers just for you! 
- enter in your Termial
- type 'ssh -X CID@remote12.chalmers.se/users/CID' 

there you are

- to copy file use the secure copy command: 

    scp (add ''-r'' if it is a directory) *path where from*    CIDp@remote12.chalmers.se:/*path where to*


### Web space
- /chalmers/users/CID/www/www.cse.chalmers.se
- http://www.cse.chalmers.se/~CID/


### Permissions
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

### Working remotely via SSH servers

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



### Windows servers via remote desktop
- rdesktop remote.cda.chalmers.se
- login name: NET\CID or CID@net.chalmers.se

This is specially useful for using Microsoft office (Word, powerpoint, Silverlight and IE!!)