From: Sandipan Patra <spatra@nvidia.com>
Subject: [PATCH V2] soc/tegra: Add defines for Tegra186+ chip IDs
Date: Fri, 26 Jun 2020 17:15:22 +0530
Message-ID: <1593171922-30632-1-git-send-email-spatra@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: treding@nvidia.com, jonathanh@nvidia.com
Cc: bbasu@nvidia.com, kyarlagadda@nvidia.com, snikam@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sandipan Patra <spatra@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add the chip IDs for NVIDIA Tegra186, Tegra194 and Tegra234
SoC families.

Signed-off-by: Sandipan Patra <spatra@nvidia.com>
---
V2:
  - Precise commit message

 include/soc/tegra/fuse.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 252ea20..4a5236b 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef __SOC_TEGRA_FUSE_H__
@@ -12,6 +12,9 @@
 #define TEGRA124	0x40
 #define TEGRA132	0x13
 #define TEGRA210	0x21
+#define TEGRA186	0x18
+#define TEGRA194	0x19
+#define TEGRA234	0x23
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.7.4
