From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 04/11] gr/gk20a: simplify external bundle loading functions
Date: Wed, 24 Feb 2016 14:42:17 +0900
Message-ID: <1456292544-32206-5-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make these functions easier to use by handling memory management from
within.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gk20a.c | 120 ++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 47 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gk20a.c b/drm/nouveau/nvkm/engine/gr/gk20a.c
index a55331d68ff6..66720aba213b 100644
--- a/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -32,25 +32,34 @@ struct gk20a_fw_av
 	u32 data;
 };
 
-static struct gf100_gr_pack *
-gk20a_gr_av_to_init(struct gf100_gr_fuc *fuc)
+static int
+gk20a_gr_av_to_init(struct gf100_gr *gr, const char *fw_name,
+		    struct gf100_gr_pack **ppack)
 {
+	struct gf100_gr_fuc fuc;
 	struct gf100_gr_init *init;
 	struct gf100_gr_pack *pack;
-	const int nent = (fuc->size / sizeof(struct gk20a_fw_av));
+	int nent;
+	int ret;
 	int i;
 
+	ret = gf100_gr_ctor_fw(gr, fw_name, &fuc);
+	if (ret)
+		return ret;
+
+	nent = (fuc.size / sizeof(struct gk20a_fw_av));
 	pack = vzalloc((sizeof(*pack) * 2) + (sizeof(*init) * (nent + 1)));
-	if (!pack)
-		return ERR_PTR(-ENOMEM);
+	if (!pack) {
+		ret = -ENOMEM;
+		goto end;
+	}
 
 	init = (void *)(pack + 2);
-
 	pack[0].init = init;
 
 	for (i = 0; i < nent; i++) {
 		struct gf100_gr_init *ent = &init[i];
-		struct gk20a_fw_av *av = &((struct gk20a_fw_av *)fuc->data)[i];
+		struct gk20a_fw_av *av = &((struct gk20a_fw_av *)fuc.data)[i];
 
 		ent->addr = av->addr;
 		ent->data = av->data;
@@ -58,7 +67,11 @@ gk20a_gr_av_to_init(struct gf100_gr_fuc *fuc)
 		ent->pitch = 1;
 	}
 
-	return pack;
+	*ppack = pack;
+
+end:
+	gf100_gr_dtor_fw(&fuc);
+	return ret;
 }
 
 struct gk20a_fw_aiv
@@ -68,25 +81,34 @@ struct gk20a_fw_aiv
 	u32 data;
 };
 
-static struct gf100_gr_pack *
-gk20a_gr_aiv_to_init(struct gf100_gr_fuc *fuc)
+static int
+gk20a_gr_aiv_to_init(struct gf100_gr *gr, const char *fw_name,
+		     struct gf100_gr_pack **ppack)
 {
+	struct gf100_gr_fuc fuc;
 	struct gf100_gr_init *init;
 	struct gf100_gr_pack *pack;
-	const int nent = (fuc->size / sizeof(struct gk20a_fw_aiv));
+	int nent;
+	int ret;
 	int i;
 
+	ret = gf100_gr_ctor_fw(gr, fw_name, &fuc);
+	if (ret)
+		return ret;
+
+	nent = (fuc.size / sizeof(struct gk20a_fw_aiv));
 	pack = vzalloc((sizeof(*pack) * 2) + (sizeof(*init) * (nent + 1)));
-	if (!pack)
-		return ERR_PTR(-ENOMEM);
+	if (!pack) {
+		ret = -ENOMEM;
+		goto end;
+	}
 
 	init = (void *)(pack + 2);
-
 	pack[0].init = init;
 
 	for (i = 0; i < nent; i++) {
 		struct gf100_gr_init *ent = &init[i];
-		struct gk20a_fw_aiv *av = &((struct gk20a_fw_aiv *)fuc->data)[i];
+		struct gk20a_fw_aiv *av = &((struct gk20a_fw_aiv *)fuc.data)[i];
 
 		ent->addr = av->addr;
 		ent->data = av->data;
@@ -94,30 +116,45 @@ gk20a_gr_aiv_to_init(struct gf100_gr_fuc *fuc)
 		ent->pitch = 1;
 	}
 
-	return pack;
+	*ppack = pack;
+
+end:
+	gf100_gr_dtor_fw(&fuc);
+	return ret;
 }
 
-static struct gf100_gr_pack *
-gk20a_gr_av_to_method(struct gf100_gr_fuc *fuc)
+static int
+gk20a_gr_av_to_method(struct gf100_gr *gr, const char *fw_name,
+		      struct gf100_gr_pack **ppack)
 {
+	struct gf100_gr_fuc fuc;
 	struct gf100_gr_init *init;
 	struct gf100_gr_pack *pack;
 	/* We don't suppose we will initialize more than 16 classes here... */
 	static const unsigned int max_classes = 16;
-	const int nent = (fuc->size / sizeof(struct gk20a_fw_av));
-	int i, classidx = 0;
-	u32 prevclass = 0;
+	u32 classidx = 0, prevclass = 0;
+	int nent;
+	int ret;
+	int i;
+
+	ret = gf100_gr_ctor_fw(gr, fw_name, &fuc);
+	if (ret)
+		return ret;
+
+	nent = (fuc.size / sizeof(struct gk20a_fw_av));
 
 	pack = vzalloc((sizeof(*pack) * max_classes) +
 		       (sizeof(*init) * (nent + 1)));
-	if (!pack)
-		return ERR_PTR(-ENOMEM);
+	if (!pack) {
+		ret = -ENOMEM;
+		goto end;
+	}
 
 	init = (void *)(pack + max_classes);
 
 	for (i = 0; i < nent; i++) {
 		struct gf100_gr_init *ent = &init[i];
-		struct gk20a_fw_av *av = &((struct gk20a_fw_av *)fuc->data)[i];
+		struct gk20a_fw_av *av = &((struct gk20a_fw_av *)fuc.data)[i];
 		u32 class = av->addr & 0xffff;
 		u32 addr = (av->addr & 0xffff0000) >> 14;
 
@@ -127,7 +164,8 @@ gk20a_gr_av_to_method(struct gf100_gr_fuc *fuc)
 			prevclass = class;
 			if (++classidx >= max_classes) {
 				vfree(pack);
-				return ERR_PTR(-ENOSPC);
+				ret = -ENOSPC;
+				goto end;
 			}
 		}
 
@@ -137,7 +175,11 @@ gk20a_gr_av_to_method(struct gf100_gr_fuc *fuc)
 		ent->pitch = 1;
 	}
 
-	return pack;
+	*ppack = pack;
+
+end:
+	gf100_gr_dtor_fw(&fuc);
+	return ret;
 }
 
 static int
@@ -271,7 +313,6 @@ int
 gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	      int index, struct nvkm_gr **pgr)
 {
-	struct gf100_gr_fuc fuc;
 	struct gf100_gr *gr;
 	int ret;
 
@@ -289,37 +330,22 @@ gk20a_gr_new_(const struct gf100_gr_func *func, struct nvkm_device *device,
 	    gf100_gr_ctor_fw(gr, "gpccs_data", &gr->fuc41ad))
 		return -ENODEV;
 
-	ret = gf100_gr_ctor_fw(gr, "sw_nonctx", &fuc);
+	ret = gk20a_gr_av_to_init(gr, "sw_nonctx", &gr->fuc_sw_nonctx);
 	if (ret)
 		return ret;
-	gr->fuc_sw_nonctx = gk20a_gr_av_to_init(&fuc);
-	gf100_gr_dtor_fw(&fuc);
-	if (IS_ERR(gr->fuc_sw_nonctx))
-		return PTR_ERR(gr->fuc_sw_nonctx);
 
-	ret = gf100_gr_ctor_fw(gr, "sw_ctx", &fuc);
+	ret = gk20a_gr_aiv_to_init(gr, "sw_ctx", &gr->fuc_sw_ctx);
 	if (ret)
 		return ret;
-	gr->fuc_sw_ctx = gk20a_gr_aiv_to_init(&fuc);
-	gf100_gr_dtor_fw(&fuc);
-	if (IS_ERR(gr->fuc_sw_ctx))
-		return PTR_ERR(gr->fuc_sw_ctx);
 
-	ret = gf100_gr_ctor_fw(gr, "sw_bundle_init", &fuc);
+	ret = gk20a_gr_av_to_init(gr, "sw_bundle_init", &gr->fuc_bundle);
 	if (ret)
 		return ret;
-	gr->fuc_bundle = gk20a_gr_av_to_init(&fuc);
-	gf100_gr_dtor_fw(&fuc);
-	if (IS_ERR(gr->fuc_bundle))
-		return PTR_ERR(gr->fuc_bundle);
 
-	ret = gf100_gr_ctor_fw(gr, "sw_method_init", &fuc);
+	ret = gk20a_gr_av_to_method(gr, "sw_method_init", &gr->fuc_method);
 	if (ret)
 		return ret;
-	gr->fuc_method = gk20a_gr_av_to_method(&fuc);
-	gf100_gr_dtor_fw(&fuc);
-	if (IS_ERR(gr->fuc_method))
-		return PTR_ERR(gr->fuc_method);
+
 
 	return 0;
 }
-- 
2.7.1
