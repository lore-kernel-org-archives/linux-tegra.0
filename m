From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 09/10] iommu/rockchip: convert to SPDX license tags
Date: Thu, 13 Jun 2019 12:27:02 -0400
Message-ID: <20190613162703.986-9-tiny.windzz@gmail.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org, krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com, agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Updates license to use SPDX-License-Identifier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 77d4bd93fe4b..9c4c6eb7d42b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * IOMMU API for Rockchip
  *
  * Module Authors:	Simon Xue <xxm@rock-chips.com>
  *			Daniel Kurtz <djkurtz@chromium.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
-- 
2.17.0
