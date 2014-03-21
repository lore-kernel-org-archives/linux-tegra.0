From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH 0/2] Re-enable jtag function for Tegra124
Date: Fri, 21 Mar 2014 17:41:24 +0800
Message-ID: <1395394886-8145-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series is used to re-enable jtag function for Tegra124.

Since the secure jtag is disabled by default once SECURITY_MODE fuse is
blown. BOOTROM will re-enable secure jtag function if BCT has
SecureJTAGControl=1 and a matching chip UID included.

After applying these changes, cbootimage can access jtag control and chip uid
fields. It can also read the BCT data from pre-built image, update the BCT
configs based on config file, and generate a new image file.

Penny Chiu (2):
  Add Tegra124 bct data access for jtag control and chip uid
  Add update BCT configs feature

 src/bct_dump.c           | 45 ++++++++++++++++++++---------
 src/cbootimage.c         | 70 +++++++++++++++++++++++++++++++++++---------
 src/cbootimage.h         |  7 ++++-
 src/data_layout.c        | 69 ++++++++++++++++++++++++++++++++++++++------
 src/data_layout.h        |  8 +++++-
 src/parse.c              | 75 +++++++++++++++++++++++++++++++++++++++++++++++-
 src/parse.h              |  2 ++
 src/set.c                | 54 ++++++++++++++++++++++++++++------
 src/set.h                |  5 ++++
 src/t124/nvbctlib_t124.c | 14 +++++++++
 10 files changed, 303 insertions(+), 46 deletions(-)

-- 
1.9.0
