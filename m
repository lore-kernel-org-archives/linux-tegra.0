From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/11] tegrarcm: T124 and new command support
Date: Mon, 9 Sep 2013 13:15:50 -0700
Message-ID: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds T124 support to tegrarcm, tested on laguna.  It
also adds support for new commands for ripping a BCT from a live
system, for passing in the miniloader from a file, and for passing in
the odmdata on the command line.  Also fixed up some of the error
handling so now USB commands will time out instead of hanging, and
attempt to bring up nv3p even if RCM is unresponsive.

Allen Martin (11):
  tegrarcm: Change NVIDIA license to apply to all miniloader files
  tegrarcm: Add support for RCM protocol version 40
  tegrarcm: Add Tegra124 miniloader
  tegrarcm: Add Tegra124 support
  tegrarcm: Add timeout to USB xfers
  tegrarcm: Assume nv3p server is running if RCM doesn't respond
  tegrarcm: Clean up usage info
  tegrarcm: Add rip support
  tegrarcm: Add support for odmdata command
  tegrarcm: Add command to pass miniloader in from file
  tegrarcm: Bump version to 1.5

 LICENSE                              |    4 +-
 README                               |    2 +
 configure.ac                         |    2 +-
 src/Makefile.am                      |    1 +
 src/main.c                           |  398 +-
 src/miniloader/tegra124-miniloader.h | 8570 ++++++++++++++++++++++++++++++++++
 src/nv3p.c                           |   26 +-
 src/nv3p.h                           |   27 +
 src/rcm.c                            |   74 +
 src/rcm.h                            |   58 +-
 src/tegrarcm.1.in                    |   21 +-
 src/usb.c                            |   10 +-
 src/usb.h                            |    1 +
 13 files changed, 9066 insertions(+), 128 deletions(-)
 create mode 100644 src/miniloader/tegra124-miniloader.h

-- 
1.8.1.5
