From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: gp10b: Use gp100_grctx and gp100_gr_zbc
Date: Wed, 15 Jan 2020 15:07:56 +0100
Message-ID: <20200115140756.70830-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

gp10b doesn't have all the registers that gp102_gr_zbc wants to access,
which causes IBUS MMIO faults to occur. Avoid this by using the gp100
variants of grctx and gr_zbc.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
index fafdd0bbea9b..c4b2e6346684 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -245,6 +245,7 @@ void gp100_gr_init_fecs_exceptions(struct gf100_gr *);
 void gp100_gr_init_shader_exceptions(struct gf100_gr *, int, int);
 void gp100_gr_zbc_clear_color(struct gf100_gr *, int);
 void gp100_gr_zbc_clear_depth(struct gf100_gr *, int);
+extern const struct gf100_gr_func_zbc gp100_gr_zbc;
 
 void gp102_gr_init_swdx_pes_mask(struct gf100_gr *);
 extern const struct gf100_gr_func_zbc gp102_gr_zbc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
index 9d0521ce309a..ef16fee61327 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
@@ -62,7 +62,7 @@ gp100_gr_zbc_clear_depth(struct gf100_gr *gr, int zbc)
 			  gr->zbc_depth[zbc].format << ((znum % 4) * 7));
 }
 
-static const struct gf100_gr_func_zbc
+const struct gf100_gr_func_zbc
 gp100_gr_zbc = {
 	.clear_color = gp100_gr_zbc_clear_color,
 	.clear_depth = gp100_gr_zbc_clear_depth,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
index 303dceddd4a8..0b375b2587d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
@@ -48,8 +48,8 @@ gp10b_gr = {
 	.gpc_nr = 1,
 	.tpc_nr = 2,
 	.ppc_nr = 1,
-	.grctx = &gp102_grctx,
-	.zbc = &gp102_gr_zbc,
+	.grctx = &gp100_grctx,
+	.zbc = &gp100_gr_zbc,
 	.sclass = {
 		{ -1, -1, FERMI_TWOD_A },
 		{ -1, -1, KEPLER_INLINE_TO_MEMORY_B },
-- 
2.24.1
