From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/27] drm/tegra: Remove unused fields
Date: Mon,  7 Oct 2013 10:34:18 +0200
Message-ID: <1381134884-5816-2-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Some of the fields in struct host1x_drm haven't been used for a while,
so remove them.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index 02ce020..f7cd946 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -33,10 +33,6 @@ struct tegra_fbdev {
 struct host1x_drm {
 	struct drm_device *drm;
 	struct device *dev;
-	void __iomem *regs;
-	struct clk *clk;
-	int syncpt;
-	int irq;
 
 	struct mutex drm_clients_lock;
 	struct list_head drm_clients;
-- 
1.8.4
