From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] iommu: tegra: remove include of <mach/iomap.h>
Date: Tue,  2 Oct 2012 16:15:49 -0600
Message-ID: <1349216149-858-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Nothing from this file is used, and the file will hopefully be deleted
soon.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Joerg, if this patch can get into 3.7 (it's late, I know) then that
would be great. If not, may I please request an ack so I can take the
change through the Tegra tree in 3.8, since I will probably have cleanup
patches that depend on this change. Thanks.

This is based on the IOMMU arm/tegra branch.
---
 drivers/iommu/tegra-smmu.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index e1d17fe..e7b56da 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -38,7 +38,6 @@
 #include <asm/page.h>
 #include <asm/cacheflush.h>
 
-#include <mach/iomap.h>
 #include <mach/tegra-ahb.h>
 
 enum smmu_hwgrp {
-- 
1.7.0.4
