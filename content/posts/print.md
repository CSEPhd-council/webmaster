+++
title =  "Printing / Printers"
date = 2017-11-24T14:17:25+01:00
tags = ["document"]
categories = ["Intro-pack"]
+++


## Printer
[Web interface to printers](https://print.chalmers.se/auth/uploadme.cgi)
You can use web interface to see nearby printers, download drivers or directly send pdf, txt files to be printed.

# Ubuntu installation (tested on 14.x, 12.x)
[Download Drivers](http://print.chalmers.se/drivers/)

- in "system-config-printer" type  smb://print.chalmers.se/cse-ed-5473-laser1 (or your printer address)
- add corresponding driver file (*.PDD). It fails to authenticate first, but you can set the password here when you look at printer queue.
- username: NET/CID

# Printing via ipp/kerberos:
Copy `krb5.conf` in this repository to `/etc/krb5.conf` and
run:
~~~~
test -d $HOME/.cups || mkdir $HOME/.cups
cat <<EOF >$HOME/.cups/client.conf
ServerName print.chalmers.se
GSSServiceName HTTP
EOF
~~~~
In older versions of CUPS, you may have to add those lines to the system-wide configuration file in `/etc/cups/client.conf`.
Then, printing should work whenever you have a valid Kerberos ticket that
can be obtained by running `kinit $YOUR_CID`


