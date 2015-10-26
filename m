From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] gm20b: secure-boot FECS falcon
Date: Mon, 26 Oct 2015 14:47:37 +0900
Message-ID: <1445838457-26737-2-git-send-email-acourbot@nvidia.com>
References: <1445838457-26737-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445838457-26737-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable secure boot of FECS for GM20B.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/device/base.c | 4 ++++
 drm/nouveau/nvkm/engine/gr/gm20b.c    | 6 ++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 3e26fc5431d7..94ffc005c2cc 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2043,6 +2043,10 @@ nv12b_chipset = {
 	.fifo = gm20b_fifo_new,
 	.gr = gm20b_gr_new,
 	.sw = gf100_sw_new,
+	.secure_boot = {
+		.managed_falcons = BIT(LSF_FALCON_ID_FECS),
+		.boot_falcon = LSF_FALCON_ID_PMU,
+	},
 };
 
 static int
diff --git a/drm/nouveau/nvkm/engine/gr/gm20b.c b/drm/nouveau/nvkm/engine/gr/gm20b.c
index 65b6e3d1e90d..eabac5d1e44b 100644
--- a/drm/nouveau/nvkm/engine/gr/gm20b.c
+++ b/drm/nouveau/nvkm/engine/gr/gm20b.c
@@ -32,12 +32,10 @@ gm20b_gr_init_gpc_mmu(struct gf100_gr *gr)
 	struct nvkm_device *device = gr->base.engine.subdev.device;
 	u32 val;
 
-	/* TODO this needs to be removed once secure boot works */
-	if (1) {
+	/* Bypass MMU check for non-secure boot */
+	if (!device->chip->secure_boot.managed_falcons)
 		nvkm_wr32(device, 0x100ce4, 0xffffffff);
-	}
 
-	/* TODO update once secure boot works */
 	val = nvkm_rd32(device, 0x100c80);
 	val &= 0xf000087f;
 	nvkm_wr32(device, 0x418880, val);
-- 
2.6.1
