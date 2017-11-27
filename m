From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/13] drm/tegra: Do not wrap lines unnecessarily
Date: Mon, 27 Nov 2017 11:07:56 +0100
Message-ID: <20171127100758.22149-12-thierry.reding@gmail.com>
References: <20171127100758.22149-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127100758.22149-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The tegra_drm_alloc() function signature fits on a single line, no need
to wrap it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/tegra/drm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 52552b9b89ef..de1d122ba820 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1148,8 +1148,7 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 	return 0;
 }
 
-void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size,
-			      dma_addr_t *dma)
+void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *dma)
 {
 	struct iova *alloc;
 	void *virt;
-- 
2.15.0
