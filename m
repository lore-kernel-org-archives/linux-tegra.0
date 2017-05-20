From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] drm: remove NULL pointer check for clk_disable_unprepare
Date: Sun, 21 May 2017 02:58:51 +0900
Message-ID: <1495303131-9814-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Lucas Stach <l.stach@pengutronix.de>, freedreno@lists.freedesktop.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Vincent Abriou <vincent.abriou@st.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, etnaviv@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Marek Vasut <marex@denx.de>, Rob Clark <robdclark@gmail.com>, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Russell King <linux+etnaviv@armlinux.org.uk>
List-Id: linux-tegra@vger.kernel.org

After long term efforts of fixing non-common clock implementations,
clk_disable() is a no-op for a NULL pointer input, and this is now
tree-wide consistent.

All clock consumers can safely call clk_disable(_unprepare) without
NULL pointer check.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              | 15 +++++----------
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c            |  6 ++----
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c            |  3 +--
 drivers/gpu/drm/msm/msm_gpu.c                      |  6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 |  3 +--
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |  6 ++----
 drivers/gpu/drm/omapdrm/dss/venc.c                 |  3 +--
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  3 +--
 drivers/gpu/drm/sti/sti_gdp.c                      |  3 +--
 10 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 9a9c407..70efe04 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1481,23 +1481,18 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
 	return 0;
 
 disable_clk_core:
-	if (gpu->clk_core)
-		clk_disable_unprepare(gpu->clk_core);
+	clk_disable_unprepare(gpu->clk_core);
 disable_clk_bus:
-	if (gpu->clk_bus)
-		clk_disable_unprepare(gpu->clk_bus);
+	clk_disable_unprepare(gpu->clk_bus);
 
 	return ret;
 }
 
 static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
 {
-	if (gpu->clk_shader)
-		clk_disable_unprepare(gpu->clk_shader);
-	if (gpu->clk_core)
-		clk_disable_unprepare(gpu->clk_core);
-	if (gpu->clk_bus)
-		clk_disable_unprepare(gpu->clk_bus);
+	clk_disable_unprepare(gpu->clk_shader);
+	clk_disable_unprepare(gpu->clk_core);
+	clk_disable_unprepare(gpu->clk_bus);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
index 3d26d77..886d07a 100644
--- a/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c
@@ -202,11 +202,9 @@ int mdp4_disable(struct mdp4_kms *mdp4_kms)
 	DBG("");
 
 	clk_disable_unprepare(mdp4_kms->clk);
-	if (mdp4_kms->pclk)
-		clk_disable_unprepare(mdp4_kms->pclk);
+	clk_disable_unprepare(mdp4_kms->pclk);
 	clk_disable_unprepare(mdp4_kms->lut_clk);
-	if (mdp4_kms->axi_clk)
-		clk_disable_unprepare(mdp4_kms->axi_clk);
+	clk_disable_unprepare(mdp4_kms->axi_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
index d3d6b4c..9175064 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
@@ -252,8 +252,7 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	clk_disable_unprepare(mdp5_kms->ahb_clk);
 	clk_disable_unprepare(mdp5_kms->axi_clk);
 	clk_disable_unprepare(mdp5_kms->core_clk);
-	if (mdp5_kms->lut_clk)
-		clk_disable_unprepare(mdp5_kms->lut_clk);
+	clk_disable_unprepare(mdp5_kms->lut_clk);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 97b9c38..c5fb326 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -116,8 +116,7 @@ static int disable_clk(struct msm_gpu *gpu)
 	int i;
 
 	for (i = gpu->nr_clocks - 1; i >= 0; i--)
-		if (gpu->grp_clks[i])
-			clk_disable(gpu->grp_clks[i]);
+		clk_disable(gpu->grp_clks[i]);
 
 	for (i = gpu->nr_clocks - 1; i >= 0; i--)
 		if (gpu->grp_clks[i])
@@ -148,8 +147,7 @@ static int enable_axi(struct msm_gpu *gpu)
 
 static int disable_axi(struct msm_gpu *gpu)
 {
-	if (gpu->ebi1_clk)
-		clk_disable_unprepare(gpu->ebi1_clk);
+	clk_disable_unprepare(gpu->ebi1_clk);
 	if (gpu->bus_freq)
 		bs_set(gpu, 0);
 	return 0;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index 1144e0c..05acf7a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -155,8 +155,7 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	mxsfb_disable_axi_clk(mxsfb);
 
 	clk_disable_unprepare(mxsfb->clk);
-	if (mxsfb->clk_disp_axi)
-		clk_disable_unprepare(mxsfb->clk_disp_axi);
+	clk_disable_unprepare(mxsfb->clk_disp_axi);
 }
 
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index d1b9c34..b0f33d4 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -87,8 +87,7 @@ void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
 
 void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
 {
-	if (mxsfb->clk_axi)
-		clk_disable_unprepare(mxsfb->clk_axi);
+	clk_disable_unprepare(mxsfb->clk_axi);
 }
 
 static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 6474bd2..bde8ab2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -64,8 +64,7 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 err_clamp:
 	clk_disable_unprepare(tdev->clk_pwr);
 err_clk_pwr:
-	if (tdev->clk_ref)
-		clk_disable_unprepare(tdev->clk_ref);
+	clk_disable_unprepare(tdev->clk_ref);
 err_clk_ref:
 	clk_disable_unprepare(tdev->clk);
 err_clk:
@@ -84,8 +83,7 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra *tdev)
 	udelay(10);
 
 	clk_disable_unprepare(tdev->clk_pwr);
-	if (tdev->clk_ref)
-		clk_disable_unprepare(tdev->clk_ref);
+	clk_disable_unprepare(tdev->clk_ref);
 	clk_disable_unprepare(tdev->clk);
 	udelay(10);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 19d1495..a4f91c4 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -943,8 +943,7 @@ static int venc_remove(struct platform_device *pdev)
 
 static int venc_runtime_suspend(struct device *dev)
 {
-	if (venc.tv_dac_clk)
-		clk_disable_unprepare(venc.tv_dac_clk);
+	clk_disable_unprepare(venc.tv_dac_clk);
 
 	dispc_runtime_put();
 
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index e773893..54bc783 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -61,8 +61,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
 	if (sdev->meram_dev && sdev->meram_dev->pdev)
 		pm_runtime_put_sync(&sdev->meram_dev->pdev->dev);
 #endif
-	if (sdev->clock)
-		clk_disable_unprepare(sdev->clock);
+	clk_disable_unprepare(sdev->clock);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 88f16cd..af3a156 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -458,8 +458,7 @@ static void sti_gdp_disable(struct sti_gdp *gdp)
 	if (sti_vtg_unregister_client(gdp->vtg, &gdp->vtg_field_nb))
 		DRM_DEBUG_DRIVER("Warning: cannot unregister VTG notifier\n");
 
-	if (gdp->clk_pix)
-		clk_disable_unprepare(gdp->clk_pix);
+	clk_disable_unprepare(gdp->clk_pix);
 
 	gdp->plane.status = STI_PLANE_DISABLED;
 	gdp->vtg = NULL;
-- 
2.7.4
