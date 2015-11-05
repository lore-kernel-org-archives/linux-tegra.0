From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [cbootimage PATCH 0/3] RSA on T124 and misc fixes
Date: Thu,  5 Nov 2015 17:03:19 +0100
Message-ID: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

this small series fix a few bugs when updating small images and add support
for the RSA fields on T124. Using these patches and an adapted version of
the sign.sh script I was able to generate images that works properly on a
fused SoC.

Alban

Alban Bedel (3):
  Fix the error reporting of get_bct_size_from_image()
  Fix image update with image smaller than 10KiB
  Add support to read and write rsa related fields on t124

 src/cbootimage.c         |  2 +-
 src/cbootimage.h         |  1 +
 src/data_layout.c        |  6 ++---
 src/t124/nvbctlib_t124.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.6.2
