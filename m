From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 06/10] iommu/io-pgtable-arm-v7s: convert to SPDX license tags
Date: Thu, 13 Jun 2019 12:26:59 -0400
Message-ID: <20190613162703.986-6-tiny.windzz@gmail.com>
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
 drivers/iommu/io-pgtable-arm-v7s.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 9a8a8870e267..fd0c8f2def45 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * CPU-agnostic ARM page table allocator.
  *
@@ -14,18 +15,6 @@
  * - PXN
  * - Domains
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (C) 2014-2015 ARM Limited
  * Copyright (c) 2014-2015 MediaTek Inc.
  */
-- 
2.17.0
