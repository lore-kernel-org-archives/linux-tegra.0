From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 02/11] gr/gk20a: move firmware bundle release to gf100
Date: Wed, 24 Feb 2016 14:42:15 +0900
Message-ID: <1456292544-32206-3-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some members of gf100_gr were freed by the gk20a driver. That's not
where it should be done - free them in gf100 so other chips that use
NVIDIA-provided firmware free these structures properly.

This also removes the need for a GK20A-specific destructor.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.c | 11 +++++++++++
 drm/nouveau/nvkm/engine/gr/gf100.h |  3 +--
 drm/nouveau/nvkm/engine/gr/gk20a.c | 16 ----------------
 drm/nouveau/nvkm/engine/gr/gm20b.c |  1 -
 4 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engine/gr/gf100.c
index f2410aff07cf..7a8a0c7139e5 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -1684,6 +1684,12 @@ gf100_gr_dtor_fw(struct gf100_gr_fuc *fuc)
 	fuc->data = NULL;
 }
 
+static void
+gf100_gr_dtor_init(struct gf100_gr_pack *pack)
+{
+	vfree(pack);
+}
+
 void *
 gf100_gr_dtor(struct nvkm_gr *base)
 {
@@ -1698,6 +1704,11 @@ gf100_gr_dtor(struct nvkm_gr *base)
 	gf100_gr_dtor_fw(&gr->fuc41ac);
 	gf100_gr_dtor_fw(&gr->fuc41ad);
 
+	gf100_gr_dtor_init(gr->fuc_bundle);
+	gf100_gr_dtor_init(gr->fuc_method);
+	gf100_gr_dtor_init(gr->fuc_sw_ctx);
+	gf100_gr_dtor_init(gr->fuc_sw_nonctx);
+
 	nvkm_memory_del(&gr->unk4188b8);
 	nvkm_memory_del(&gr->unk4188b4);
 	return gr;
diff --git a/drm/nouveau/nvkm/engine/gr/gf100.h b/drm/nouveau/nvkm/engine/gr/gf100.h
index 8dca40dde06b..cff4b40d887e 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -82,7 +82,7 @@ struct gf100_gr {
 
 	/*
 	 * Used if the register packs are loaded from NVIDIA fw instead of
-	 * using hardcoded arrays.
+	 * using hardcoded arrays. To be allocated with vzalloc().
 	 */
 	struct gf100_gr_pack *fuc_sw_nonctx;
 	struct gf100_gr_pack *fuc_sw_ctx;
@@ -140,7 +140,6 @@ int gk104_gr_init(struct gf100_gr *);
 
 int gk20a_gr_new_(const struct gf100_gr_func *, struct nvkm_device *,
 		  int, struct nvkm_gr **);
-void gk20a_gr_dtor(struct gf100_gr *);
 int gk20a_gr_init(struct gf100_gr *);
 
 int gm200_gr_init(struct gf100_gr *);
diff --git a/drm/nouveau/nvkm/engine/gr/gk20a.c b/drm/nouveau/nvkm/engine/gr/gk20a.c
index b8758d3b8b51..a321dd019932 100644
--- a/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -26,12 +26,6 @@
 
 #include <nvif/class.h>
 
-static void
-gk20a_gr_init_dtor(struct gf100_gr_pack *pack)
-{
-	vfree(pack);
-}
-
 struct gk20a_fw_av
 {
 	u32 addr;
@@ -273,15 +267,6 @@ gk20a_gr_init(struct gf100_gr *gr)
 	return gf100_gr_init_ctxctl(gr);
 }
 
-void
-gk20a_gr_dtor(struct gf100_gr *gr)
-{
-	gk20a_gr_init_dtor(gr->fuc_method);
-	gk20a_gr_init_dtor(gr->fuc_bundle);
-	gk20a_gr_init_dtor(gr->fuc_sw_ctx);
-	gk20a_gr_init_dtor(gr->fuc_sw_nonctx);
-}
-
 int
 gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	      int index, struct nvkm_gr **pgr)
@@ -335,7 +320,6 @@ gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 
 static const struct gf100_gr_func
 gk20a_gr = {
-	.dtor = gk20a_gr_dtor,
 	.init = gk20a_gr_init,
 	.set_hww_esr_report_mask = gk20a_gr_set_hww_esr_report_mask,
 	.ppc_nr = 1,
diff --git a/drm/nouveau/nvkm/engine/gr/gm20b.c b/drm/nouveau/nvkm/engine/gr/gm20b.c
index 65b6e3d1e90d..443922e46ff9 100644
--- a/drm/nouveau/nvkm/engine/gr/gm20b.c
+++ b/drm/nouveau/nvkm/engine/gr/gm20b.c
@@ -61,7 +61,6 @@ gm20b_gr_set_hww_esr_report_mask(struct gf100_gr *gr)
 
 static const struct gf100_gr_func
 gm20b_gr = {
-	.dtor = gk20a_gr_dtor,
 	.init = gk20a_gr_init,
 	.init_gpc_mmu = gm20b_gr_init_gpc_mmu,
 	.set_hww_esr_report_mask = gm20b_gr_set_hww_esr_report_mask,
-- 
2.7.1
