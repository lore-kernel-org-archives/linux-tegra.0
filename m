From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 0/8] Add T132 support
Date: Tue, 17 Mar 2015 17:38:52 -0700
Message-ID: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T132 supporting patches were originally started under branch
dev/amartin/t132-dev. After further tuning Allen's patches and adding
additional changes, t132 supporting tegrarcm is now fully working.

Allen Martin (6):
  tegrarcm: Add Tegra132 support
  tegrarcm: Add support for loading cpu ucode
  tegrarcm: Get platform info
  tegrarcm: add support for odmdata command
  tegrarcm: Better usb debug messages
  tegrarcm: increase USB timeout

Jimmy Zhang (2):
  Tegra132: Fix miniloader issues when downloading u-boot as flasher
  Tegra132: Fix issue that cpu sometime can't start when downloading
    u-boot as flasher

 src/Makefile.am                       |    3 +
 src/main.c                            |  374 ++-
 src/miniloader/nvtboot_t132.h         | 5347 +++++++++++++++++++++++++++++++++
 src/miniloader/tegra132-miniloader.h  |   13 +
 src/miniloader/tegra132-mts.h         |   12 +
 src/miniloader/tegra132-preboot-mts.h |   11 +
 src/nv3p.c                            |   43 +-
 src/nv3p.h                            |   29 +
 src/rcm.h                             |    2 +
 src/tegrarcm.1.in                     |   11 +-
 src/usb.c                             |    9 +-
 src/usb.h                             |    1 +
 12 files changed, 5829 insertions(+), 26 deletions(-)
 create mode 100644 src/miniloader/nvtboot_t132.h
 create mode 100644 src/miniloader/tegra132-miniloader.h
 create mode 100644 src/miniloader/tegra132-mts.h
 create mode 100644 src/miniloader/tegra132-preboot-mts.h

-- 
1.8.1.5
