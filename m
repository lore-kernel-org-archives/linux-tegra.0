From: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH V3 0/7] Re-enable jtag function for Tegra124
Date: Fri, 11 Apr 2014 17:50:36 +0800
Message-ID: <1397209843-31275-1-git-send-email-pchiu@nvidia.com>
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

Changes from V2:
 - Improvement based on V2 reviewed comments.
 - Disallow the update image feature for T20/T30.

Penny Chiu (7):
  Add format functions to express BCT and bootloader data value
  Add page_size validation when setting page_size value
  Accept void pointer as input data type for get/set_value functions
  Add token_supported function
  Use block_size and page_size tokens when dump BCT data
  Add Tegra124 bct data access for jtag control and chip uid
  Add update BCT configs feature

 src/bct_dump.c           | 111 +++++++++++++++++++++++++++++++----------------
 src/cbootimage.c         | 103 ++++++++++++++++++++++++++++++++++++-------
 src/cbootimage.h         |   9 +++-
 src/context.c            |  10 +++--
 src/data_layout.c        |  80 +++++++++++++++++++++++++++-------
 src/data_layout.h        |   9 ++++
 src/parse.c              |  76 ++++++++++++++++++++++++++++++++
 src/parse.h              |  23 ++++++++--
 src/set.c                |  77 ++++++++++++++++++++++----------
 src/set.h                |   4 +-
 src/t114/nvbctlib_t114.c |  65 ++++++++++++++++++++++-----
 src/t124/nvbctlib_t124.c |  78 ++++++++++++++++++++++++++++-----
 src/t20/nvbctlib_t20.c   |  65 ++++++++++++++++++++++-----
 src/t30/nvbctlib_t30.c   |  65 ++++++++++++++++++++++-----
 14 files changed, 634 insertions(+), 141 deletions(-)

-- 
1.9.1
