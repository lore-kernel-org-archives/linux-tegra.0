From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 02/27] drm/tegra: Cleanup tegra_dc structure
Date: Mon,  7 Oct 2013 10:34:19 +0200
Message-ID: <1381134884-5816-3-git-send-email-treding@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove the unused host1x field from the structure and group the fields
more logically.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/drm/drm.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/drm/drm.h b/drivers/gpu/host1x/drm/drm.h
index f7cd946..b8d9f43 100644
--- a/drivers/gpu/host1x/drm/drm.h
+++ b/drivers/gpu/host1x/drm/drm.h
@@ -94,16 +94,13 @@ struct tegra_output;
 
 struct tegra_dc {
 	struct host1x_client client;
-	spinlock_t lock;
-
-	struct host1x_drm *host1x;
 	struct device *dev;
+	spinlock_t lock;
 
 	struct drm_crtc base;
 	int pipe;
 
 	struct clk *clk;
-
 	void __iomem *regs;
 	int irq;
 
-- 
1.8.4
