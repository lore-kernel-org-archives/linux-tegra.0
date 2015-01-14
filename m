From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH 0/2] Add T132 support
Date: Tue, 13 Jan 2015 16:20:00 -0800
Message-ID: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Allen originally started T132 supporting patches under branch dev/amartin/t132-dev.
Recently I added more changes on top of his works. Since Allen is tied with other
project, I was assigned to update and upstream all Allen's patches as well as my
changes.

Allen Martin (2):
  tegrarcm: Add Tegra132 support
  tegrarcm: Add support for loading MTS

 src/Makefile.am                       |   15 +-
 src/bin2h.sh                          |    9 +
 src/main.c                            |  256 +-
 src/miniloader/tegra132-miniloader.h  | 5259 +++++++++++++++++++++++++++++++++
 src/miniloader/tegra132-mts.h         |   13 +
 src/miniloader/tegra132-preboot-mts.h |   13 +
 src/nv3p.c                            |   19 +
 src/nv3p.h                            |   12 +
 src/rcm.h                             |    1 +
 src/tegrarcm.1.in                     |   11 +-
 src/usb.c                             |    3 +-
 src/usb.h                             |    1 +
 12 files changed, 5597 insertions(+), 15 deletions(-)
 create mode 100755 src/bin2h.sh
 create mode 100644 src/miniloader/tegra132-miniloader.h
 create mode 100644 src/miniloader/tegra132-mts.h
 create mode 100644 src/miniloader/tegra132-preboot-mts.h

-- 
1.8.1.5
