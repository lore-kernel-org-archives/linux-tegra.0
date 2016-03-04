From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 0/4] Add flashing support for T124 rsa fused board
Date: Fri, 4 Mar 2016 15:44:43 -0800
Message-ID: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

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


Jimmy Zhang (4):
  Add option "--pkc"
  Add option --ml_rcm <rcm_ml_blob>
  Add option --signed
  Increate USB timeout value

 src/Makefile.am |   2 +
 src/main.c      | 412 ++++++++++++++++++++++++++++++++++++++++++++++++--------
 src/rcm.c       |  16 ++-
 src/rcm.h       |   3 +-
 src/rsa-pss.cpp | 147 ++++++++++++++++++++
 src/rsa-pss.h   |  46 +++++++
 src/usb.c       |   2 +-
 7 files changed, 567 insertions(+), 61 deletions(-)
 create mode 100644 src/rsa-pss.cpp
 create mode 100644 src/rsa-pss.h

-- 
1.9.1
