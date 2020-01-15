From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: gm20b, gp10b: Fix Falcon bootstrapping
Date: Wed, 15 Jan 2020 15:06:13 +0100
Message-ID: <20200115140613.70268-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The low-level Falcon bootstrapping callbacks are expected to return 0 on
success or a negative error code on failure. However, the implementation
on Tegra returns the ID or mask of the Falcons that were bootstrapped on
success, thus breaking the calling code, which treats this as failure.

Fix this by making sure we only return 0 or a negative error code, just
like the code for discrete GPUs does.

Fixes: 86ce2a71539c ("drm/nouveau/flcn/cmdq: move command generation to subdevs")
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that this is against Ben's tree, which should only hit linux-next
tomorrow, so most people should not be hitting this yet.

 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c | 9 +++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
index 6d5a13e4a857..82571032a07d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -52,8 +52,13 @@ gm20b_pmu_acr_bootstrap_falcon(struct nvkm_falcon *falcon,
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gm20b_pmu_acr_bootstrap_falcon_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_id)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_id)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index 39c86bc56310..5b81c7320479 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -52,8 +52,13 @@ gp10b_pmu_acr_bootstrap_multiple_falcons(struct nvkm_falcon *falcon, u32 mask)
 	ret = nvkm_falcon_cmdq_send(pmu->hpq, &cmd.cmd.hdr,
 				    gp10b_pmu_acr_bootstrap_multiple_falcons_cb,
 				    &pmu->subdev, msecs_to_jiffies(1000));
-	if (ret >= 0 && ret != cmd.falcon_mask)
-		ret = -EIO;
+	if (ret >= 0) {
+		if (ret != cmd.falcon_mask)
+			ret = -EIO;
+		else
+			ret = 0;
+	}
+
 	return ret;
 }
 
-- 
2.24.1
