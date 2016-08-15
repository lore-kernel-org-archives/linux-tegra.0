From: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau/tegra: Modify error handling
Date: Mon, 15 Aug 2016 10:24:09 +0530
Message-ID: <20160815045409.GA12886@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

iommu_domain_alloc returns NULL on error so replace an incorrect
IS_ERR check with a NULL check.

The Coccinelle semantic patch used to find this issue is as follows:
@@
expression e;
statement S;
@@

*e = iommu_domain_alloc(...);
if (IS_ERR(e)) S

Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 939682f..ffd8def 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -102,7 +102,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 
 	if (iommu_present(&platform_bus_type)) {
 		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (IS_ERR(tdev->iommu.domain))
+		if (!tdev->iommu.domain)
 			goto error;
 
 		/*
-- 
1.9.1
