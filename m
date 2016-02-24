From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 05/11] gr/gk20a: share external bundles loading functions
Date: Wed, 24 Feb 2016 14:42:18 +0900
Message-ID: <1456292544-32206-6-git-send-email-acourbot@nvidia.com>
References: <1456292544-32206-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456292544-32206-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There functions are going to be used by other chips that rely on
NVIDIA-provided firmware. Export them.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nvkm/engine/gr/gf100.h | 8 ++++++++
 drm/nouveau/nvkm/engine/gr/gk20a.c | 6 +++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/gr/gf100.h b/drm/nouveau/nvkm/engine/gr/gf100.h
index cff4b40d887e..ea8d2831ff31 100644
--- a/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -203,6 +203,14 @@ void gf100_gr_icmd(struct gf100_gr *, const struct gf100_gr_pack *);
 void gf100_gr_mthd(struct gf100_gr *, const struct gf100_gr_pack *);
 int  gf100_gr_init_ctxctl(struct gf100_gr *);
 
+/* external bundles loading functions */
+int gk20a_gr_av_to_init(struct gf100_gr *, const char *,
+			struct gf100_gr_pack **);
+int gk20a_gr_aiv_to_init(struct gf100_gr *, const char *,
+			 struct gf100_gr_pack **);
+int gk20a_gr_av_to_method(struct gf100_gr *, const char *,
+			  struct gf100_gr_pack **);
+
 /* register init value lists */
 
 extern const struct gf100_gr_init gf100_gr_init_main_0[];
diff --git a/drm/nouveau/nvkm/engine/gr/gk20a.c b/drm/nouveau/nvkm/engine/gr/gk20a.c
index 66720aba213b..297a4d2ed814 100644
--- a/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -32,7 +32,7 @@ struct gk20a_fw_av
 	u32 data;
 };
 
-static int
+int
 gk20a_gr_av_to_init(struct gf100_gr *gr, const char *fw_name,
 		    struct gf100_gr_pack **ppack)
 {
@@ -81,7 +81,7 @@ struct gk20a_fw_aiv
 	u32 data;
 };
 
-static int
+int
 gk20a_gr_aiv_to_init(struct gf100_gr *gr, const char *fw_name,
 		     struct gf100_gr_pack **ppack)
 {
@@ -123,7 +123,7 @@ end:
 	return ret;
 }
 
-static int
+int
 gk20a_gr_av_to_method(struct gf100_gr *gr, const char *fw_name,
 		      struct gf100_gr_pack **ppack)
 {
-- 
2.7.1
