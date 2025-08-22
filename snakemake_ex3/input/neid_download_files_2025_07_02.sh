#!/bin/sh

#   If /bin/sh isn't available on your system, update the script to use bash instead:
#   #!/usr/bin/env bash

#read -p "Username: " user
#read -s -p "Password : " pass

wget --save-cookies neid_cookie.txt \
      --keep-session-cookies \
      --delete-after \
      https://neid.ipac.caltech.edu/login.php

#      --post-data "username=${user}&password=${pass}" \

wget --load-cookies neid_cookie.txt -O neidL2_20250701T190115.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T190115.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250701T221851.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T221851.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250701T163717.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T163717.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250702T175605.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/02/l2/pv1/neidL2_20250702T175605.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250701T171430.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T171430.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250702T175021.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/02/l2/pv1/neidL2_20250702T175021.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250702T165229.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/02/l2/pv1/neidL2_20250702T165229.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250701T203754.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T203754.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250702T205232.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/02/l2/pv1/neidL2_20250702T205232.fits&solar"
wget --load-cookies neid_cookie.txt -O neidL2_20250701T215637.fits "https://neid.ipac.caltech.edu/get_file.php?filehand=sci/2025/07/01/l2/pv1/neidL2_20250701T215637.fits&solar"
