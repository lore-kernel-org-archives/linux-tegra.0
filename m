From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] drm/tegra: Set sgt pointer in BO pin
Date: Tue,  8 Nov 2016 19:51:35 +0200
Message-ID: <20161108175135.32004-4-mperttunen@nvidia.com>
References: <20161108175135.32004-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108175135.32004-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix tegra_bo_pin to set the parameter sgt pointer.
Host1x job pinning requires the sgt to determine
physical memory addresses of gathers.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 2508372..c08e527 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -36,6 +36,8 @@ static dma_addr_t tegra_bo_pin(struct host1x_bo *bo, struct sg_table **sgt)
 {
 	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
 
+	*sgt = obj->sgt;
+
 	return obj->paddr;
 }
 
-- 
2.9.3
