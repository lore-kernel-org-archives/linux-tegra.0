From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [tegrarcm PATCH 0/2] Initial support for secured devices
Date: Mon,  9 Nov 2015 18:19:44 +0100
Message-ID: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series add the bare minimum to be able to use RCM on secured production
devices. For this the CMAC hash just has to be replaced with an RSA-PSS
signature, as CryptoPP already provides this algorith it is quiet trivial
to implement.

Although RCM is now working this doesn't yet allow running the bootloader.
The miniloader works and it loads the BCT and bootloader, but the handsoff
to the bootloader isn't working yet. I currently suspect the miniloader as
the same bootloader works properly when it is flashed on a secured device
with the proper signature.

Alban

Alban Bedel (2):
  Remove the operational mode check
  Add support for communicating with secured production devices

 src/Makefile.am |  2 ++
 src/main.c      | 29 ++++++++++++---------
 src/rcm.c       | 20 +++++++++++---
 src/rcm.h       |  2 +-
 src/rsa-pss.cpp | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/rsa-pss.h   | 15 +++++++++++
 6 files changed, 132 insertions(+), 17 deletions(-)
 create mode 100644 src/rsa-pss.cpp
 create mode 100644 src/rsa-pss.h

-- 
2.6.3
