From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 03/11] gr/gf100: load firmware in outer function
Date: Wed, 24 Feb 2016 14:42:16 +0900
Message-ID: <1456292544-32206-4-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The firmwares required by GR may vary from chip to chip, especially with
the introduction of secure boot and NVIDIA-provided firmwares. Move the
firmware loading outside of gf100_gr_ctor so other chips may still call
it while managing their firmwares themselves.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.c | 26 ++++++++++++++++----------
 drm/nouveau/nvkm/engine/gr/gk20a.c |  6 ++++++
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engine/gr/gf100.c
index 7a8a0c7139e5..3fc5f7d962be 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -1762,15 +1762,6 @@ gf100_gr_ctor(const struct gf100_gr_func *func, struct nvkm_device *device,
 	if (ret)
 		return ret;
 
-	if (gr->firmware) {
-		nvkm_info(&gr->base.engine.subdev, "using external firmware\n");
-		if (gf100_gr_ctor_fw(gr, "fecs_inst", &gr->fuc409c) ||
-		    gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d) ||
-		    gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41ac) ||
-		    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
-			return -ENODEV;
-	}
-
 	return 0;
 }
 
@@ -1779,10 +1770,25 @@ gf100_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	      int index, struct nvkm_gr **pgr)
 {
 	struct gf100_gr *gr;
+	int ret;
+
 	if (!(gr = kzalloc(sizeof(*gr), GFP_KERNEL)))
 		return -ENOMEM;
 	*pgr = &gr->base;
-	return gf100_gr_ctor(func, device, index, gr);
+
+	ret = gf100_gr_ctor(func, device, index, gr);
+	if (ret)
+		return ret;
+
+	if (gr->firmware) {
+		if (gf100_gr_ctor_fw(gr, "fecs_inst", &gr->fuc409c) ||
+		    gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d) ||
+		    gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41ac) ||
+		    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
+			return -ENODEV;
+	}
+
+	return 0;
 }
 
 int
diff --git a/drm/nouveau/nvkm/engine/gr/gk20a.c b/drm/nouveau/nvkm/engine/gr/gk20a.c
index a321dd019932..a55331d68ff6 100644
--- a/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -283,6 +283,12 @@ gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	if (ret)
 		return ret;
 
+	if (gf100_gr_ctor_fw(gr, "fecs_inst", &gr->fuc409c) ||
+	    gf100_gr_ctor_fw(gr, "fecs_data", &gr->fuc409d) ||
+	    gf100_gr_ctor_fw(gr, "gpccs_inst", &gr->fuc41ac) ||
+	    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
+		return -ENODEV;
+
 	ret = gf100_gr_ctor_fw(gr, "sw_nonctx", &fuc);
 	if (ret)
 		return ret;
-- 
2.7.1
