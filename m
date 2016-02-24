From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 06/11] gr/gm200: load external firmware and bundles
Date: Wed, 24 Feb 2016 14:42:19 +0900
Message-ID: <1456292544-32206-7-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Load firmware and bundles in GM200's constructor. The previously called
GF100 function did not care about the bundles.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.h |  5 +++--
 drm/nouveau/nvkm/engine/gr/gk20a.c | 41 ++++++++++++++++----------------------
 drm/nouveau/nvkm/engine/gr/gm200.c | 32 ++++++++++++++++++++++++++++-
 drm/nouveau/nvkm/engine/gr/gm206.c |  2 +-
 drm/nouveau/nvkm/engine/gr/gm20b.c |  2 +-
 5 files changed, 53 insertions(+), 29 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.h b/drm/nouveau/nvkm/engine/gr/gf100.h
index ea8d2831ff31..5626cae67291 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -138,8 +138,6 @@ int gf100_gr_init(struct gf100_gr *);
 
 int gk104_gr_init(struct gf100_gr *);
 
-int gk20a_gr_new_(const struct gf100_gr_func *, struct nvkm_device *,
-		  int, struct nvkm_gr **);
 int gk20a_gr_init(struct gf100_gr *);
 
 int gm200_gr_init(struct gf100_gr *);
@@ -211,6 +209,9 @@ int gk20a_gr_aiv_to_init(struct gf100_gr *, const char *,
 int gk20a_gr_av_to_method(struct gf100_gr *, const char *,
 			  struct gf100_gr_pack **);
 
+int gm200_gr_new_(const struct gf100_gr_func *, struct nvkm_device *, int,
+		  struct nvkm_gr **);
+
 /* register init value lists */
 
 extern const struct gf100_gr_init gf100_gr_init_main_0[];
diff --git a/drm/nouveau/nvkm/engine/gr/gk20a.c b/drm/nouveau/nvkm/engine/gr/gk20a.c
index 297a4d2ed814..7ffb8a626196 100644
--- a/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -309,9 +309,23 @@ gk20a_gr_init(struct gf100_gr *gr)
 	return gf100_gr_init_ctxctl(gr);
 }
 
+static const struct gf100_gr_func
+gk20a_gr = {
+	.init = gk20a_gr_init,
+	.set_hww_esr_report_mask = gk20a_gr_set_hww_esr_report_mask,
+	.ppc_nr = 1,
+	.grctx = &gk20a_grctx,
+	.sclass = {
+		{ -1, -1, FERMI_TWOD_A },
+		{ -1, -1, KEPLER_INLINE_TO_MEMORY_A },
+		{ -1, -1, KEPLER_C, &gf100_fermi },
+		{ -1, -1, KEPLER_COMPUTE_A },
+		{}
+	}
+};
+
 int
-gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
-	      int index, struct nvkm_gr **pgr)
+gk20a_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
 {
 	struct gf100_gr *gr;
 	int ret;
@@ -320,7 +334,7 @@ gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 		return -ENOMEM;
 	*pgr = &gr->base;
 
-	ret = gf100_gr_ctor(func, device, index, gr);
+	ret = gf100_gr_ctor(&gk20a_gr, device, index, gr);
 	if (ret)
 		return ret;
 
@@ -349,24 +363,3 @@ gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 
 	return 0;
 }
-
-static const struct gf100_gr_func
-gk20a_gr = {
-	.init = gk20a_gr_init,
-	.set_hww_esr_report_mask = gk20a_gr_set_hww_esr_report_mask,
-	.ppc_nr = 1,
-	.grctx = &gk20a_grctx,
-	.sclass = {
-		{ -1, -1, FERMI_TWOD_A },
-		{ -1, -1, KEPLER_INLINE_TO_MEMORY_A },
-		{ -1, -1, KEPLER_C, &gf100_fermi },
-		{ -1, -1, KEPLER_COMPUTE_A },
-		{}
-	}
-};
-
-int
-gk20a_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
-{
-	return gk20a_gr_new_(&gk20a_gr, device, index, pgr);
-}
diff --git a/drm/nouveau/nvkm/engine/gr/gm200.c b/drm/nouveau/nvkm/engine/gr/gm200.c
index c76dc67e9406..f0e087a15cd2 100644
--- a/drm/nouveau/nvkm/engine/gr/gm200.c
+++ b/drm/nouveau/nvkm/engine/gr/gm200.c
@@ -351,6 +351,36 @@ gm200_gr_init(struct gf100_gr *gr)
 	return gm200_gr_init_ctxctl(gr);
 }
 
+int gm200_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
+		  int index, struct nvkm_gr **pgr)
+{
+	struct gf100_gr *gr;
+	int ret;
+
+	if (!(gr = kzalloc(sizeof(*gr), GFP_KERNEL)))
+		return -ENOMEM;
+	*pgr = &gr->base;
+
+	ret = gf100_gr_ctor(func, device, index, gr);
+	if (ret)
+		return ret;
+
+	if ((ret = gf100_gr_ctor_fw(gr, "gr/fecs_inst", &gr->fuc409c)) ||
+	    (ret = gf100_gr_ctor_fw(gr, "gr/fecs_data", &gr->fuc409d)))
+		return ret;
+	if ((ret = gf100_gr_ctor_fw(gr, "gr/gpccs_inst", &gr->fuc41ac)) ||
+	    (ret = gf100_gr_ctor_fw(gr, "gr/gpccs_data", &gr->fuc41ad)))
+		return ret;
+
+	if ((ret = gk20a_gr_av_to_init(gr, "gr/sw_nonctx", &gr->fuc_sw_nonctx)) ||
+	    (ret = gk20a_gr_aiv_to_init(gr, "gr/sw_ctx", &gr->fuc_sw_ctx)) ||
+	    (ret = gk20a_gr_av_to_init(gr, "gr/sw_bundle_init", &gr->fuc_bundle)) ||
+	    (ret = gk20a_gr_av_to_method(gr, "gr/sw_method_init", &gr->fuc_method)))
+		return ret;
+
+	return 0;
+}
+
 static const struct gf100_gr_func
 gm200_gr = {
 	.init = gm200_gr_init,
@@ -369,5 +399,5 @@ gm200_gr = {
 int
 gm200_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
 {
-	return gf100_gr_new_(&gm200_gr, device, index, pgr);
+	return gm200_gr_new_(&gm200_gr, device, index, pgr);
 }
diff --git a/drm/nouveau/nvkm/engine/gr/gm206.c b/drm/nouveau/nvkm/engine/gr/gm206.c
index 398e3f52f489..74c4f7384ff6 100644
--- a/drm/nouveau/nvkm/engine/gr/gm206.c
+++ b/drm/nouveau/nvkm/engine/gr/gm206.c
@@ -44,5 +44,5 @@ gm206_gr = {
 int
 gm206_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
 {
-	return gf100_gr_new_(&gm206_gr, device, index, pgr);
+	return gm200_gr_new_(&gm206_gr, device, index, pgr);
 }
diff --git a/drm/nouveau/nvkm/engine/gr/gm20b.c b/drm/nouveau/nvkm/engine/gr/gm20b.c
index 443922e46ff9..a440772f8de4 100644
--- a/drm/nouveau/nvkm/engine/gr/gm20b.c
+++ b/drm/nouveau/nvkm/engine/gr/gm20b.c
@@ -78,5 +78,5 @@ gm20b_gr = {
 int
 gm20b_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
 {
-	return gk20a_gr_new_(&gm20b_gr, device, index, pgr);
+	return gm200_gr_new_(&gm20b_gr, device, index, pgr);
 }
-- 
2.7.1
