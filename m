From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V2 0/5] Re-enable jtag function for Tegra124
Date: Tue, 8 Apr 2014 22:30:17 +0800
Message-ID: <1396967422-6018-1-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series is used to update BCT configs to re-enable jtag function
for Tegra124.

Since the secure jtag is disabled by default once SECURITY_MODE fuse is
blown. BOOTROM will re-enable secure jtag function if BCT has
SecureJTAGControl=1 and a matching chip UID included.

After applying these changes, cbootimage can access jtag control and chip uid
fields. It can also read the BCT data from pre-built image, update the BCT
configs based on config file, and generate a new image file.

Changes from V1:
 - Improvement based on reviewed comments.

Penny Chiu (5):
  Add format functions to express BCT and bootloader data value
  Accept void pointer as input data type for get/set_value functions
  Add token_supported function
  Add Tegra124 bct data access for jtag control and chip uid
  Add update BCT configs feature

 src/bct_dump.c           | 103 ++++++++++++++++++++++++++++++++++-------------
 src/cbootimage.c         |  91 ++++++++++++++++++++++++++++++++++-------
 src/cbootimage.h         |  12 +++++-
 src/context.c            |  10 +++--
 src/data_layout.c        |  94 ++++++++++++++++++++++++++++++++++--------
 src/data_layout.h        |   9 +++++
 src/parse.c              |  72 +++++++++++++++++++++++++++++++++
 src/parse.h              |  16 ++++++--
 src/set.c                |  72 ++++++++++++++++++++++-----------
 src/set.h                |   4 +-
 src/t114/nvbctlib_t114.c |  47 ++++++++++++++++-----
 src/t124/nvbctlib_t124.c |  60 ++++++++++++++++++++++-----
 src/t20/nvbctlib_t20.c   |  47 ++++++++++++++++-----
 src/t30/nvbctlib_t30.c   |  47 ++++++++++++++++-----
 14 files changed, 552 insertions(+), 132 deletions(-)

-- 
1.9.1
