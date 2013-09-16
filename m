From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 00/11] tegrarcm: T124 and new command support
Date: Mon, 16 Sep 2013 15:24:47 -0700
Message-ID: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds T124 support to tegrarcm, tested on laguna.  It
also adds support for new commands for ripping a BCT from a live
system, and for passing in the miniloader from a file.  Also fixed up
some of the error handling so now USB commands will time out instead
of hanging, and attempt to bring up nv3p even if RCM is unresponsive.

Changes:
v2:
 - Removed odmdata option
 - Renamed ripbct to readbct and made it a command not an option
 - Added missing SKUs, made default SKU be the chip family name
 - Removed some left over debug prints, whitespace errors

Allen Martin (11):
  tegrarcm: Change NVIDIA license to apply to all miniloader files
  tegrarcm: Add missing SKU information
  tegrarcm: Add support for RCM protocol version 40
  tegrarcm: Add Tegra124 miniloader
  tegrarcm: Add Tegra124 support
  tegrarcm: Add timeout to USB xfers
  tegrarcm: Assume nv3p server is running if RCM doesn't respond
  tegrarcm: Clean up usage info
  tegrarcm: Add readbct support
  tegrarcm: Add command to pass miniloader in from file
  tegrarcm: Bump version to 1.5

 LICENSE                              |    4 +-
 README                               |    4 +
 configure.ac                         |    2 +-
 src/Makefile.am                      |    1 +
 src/main.c                           |  416 +-
 src/miniloader/tegra124-miniloader.h | 8570 ++++++++++++++++++++++++++++++++++
 src/nv3p.c                           |   10 +-
 src/nv3p.h                           |   22 +
 src/rcm.c                            |   74 +
 src/rcm.h                            |   58 +-
 src/tegrarcm.1.in                    |   27 +-
 src/usb.c                            |   10 +-
 src/usb.h                            |    1 +
 13 files changed, 9058 insertions(+), 141 deletions(-)
 create mode 100644 src/miniloader/tegra124-miniloader.h

-- 
1.8.1.5
