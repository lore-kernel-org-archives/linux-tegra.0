From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH V3 0/4] Add support for flashing PKC secured board
Date: Mon, 14 Mar 2016 19:42:43 -0700
Message-ID: <1458009767-26615-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

V3:
1. Updated man page by adding all newly defined options. 
2. Clean up some cosmetic issues

V2:
1. Redefined sign and download command line parameters as below:
    generate signed messages: --gen-signed-msgs --signed-msgs-file <msgs.bin>
    download signed messages: --download-signed-msgs --signed-msgs-file <msgs.bin>
2. Added option --soc=<soc#> to specify tegra soc model number so that generating
   signed messages can be proceeded without accessing hardware.
3. Re-enabled cmac_hash when generating signed messages so that signed messages
   can also run on an unsecured board.
4. Download bootloader's pkc signature only when the board is in secured pkc mode.
5. Added error check on key length.
6. Added option --usb-timeout to allow user to specify usb transfer timeout value.

V1:
1. Use option "--pkc" to sign and download bootloader. This option is
   designed for developer. Patch 0001-Add-option-pkc.patch was originally
   submitted by Alban Bedel.
2. Use option "--ml_rcm" and "--pkc" to sign rcm messages and bootloader.
   This signing only feature is intended for production where signging
   is done at secured server and flashing can be done at different stage and
   site without requiring keyfile being present. 
3. Use option "--signed" to specify and download signed rcm messages.
   This option is used for flashing on fused board. ie, a system with
   security mode enabled.

Alban Bedel (1):
  Add support for production devices secured with PKC

Jimmy Zhang (3):
  Add option --gen-signed-msgs and --signed-msgs-file to generate signed
    blobs
  Add option --download-signed-msgs to download signed blobs
  Add option --usb-timeout=<value>

 src/Makefile.am   |   2 +
 src/main.c        | 541 ++++++++++++++++++++++++++++++++++++++++++++++++------
 src/rcm.c         |  18 +-
 src/rcm.h         |  15 +-
 src/rsa-pss.cpp   | 163 ++++++++++++++++
 src/rsa-pss.h     |  46 +++++
 src/tegrarcm.1.in | 118 +++++++++++-
 src/usb.c         |   7 +-
 8 files changed, 830 insertions(+), 80 deletions(-)
 create mode 100644 src/rsa-pss.cpp
 create mode 100644 src/rsa-pss.h

-- 
1.9.1
