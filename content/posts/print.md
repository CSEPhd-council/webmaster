+++
title =  "Printing / Printers"
date  = "2019-03-20"
tags = ["document"]
categories =  ["At the start of your PhD"]
+++


## Printer
[Web interface to printers](https://print.chalmers.se/auth/uploadme.cgi)
You can use web interface to see nearby printers, download drivers or directly send pdf, txt files to be printed.

# Setup on linux with SMB (tested on Ubuntu 18.x, 16.x, 14.x, 12.x)

See instructions [here](https://student.portal.chalmers.se/en/contactservice/ITServices/self-administered/linux/printing/Sidor/connect-to-printer.aspx).

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


