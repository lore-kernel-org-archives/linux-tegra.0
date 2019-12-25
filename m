From: yu kuai <yukuai3@huawei.com>
Subject: [PATCH] drm: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Wed, 25 Dec 2019 21:20:42 +0800
Message-ID: <20191225132042.5491-1-yukuai3@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org, wens@csie.org, jernej.skrabec@siol.net, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, yukuai3@huawei.com, zhengbin13@huawei.com, yi.zhang@huawei.com
List-Id: linux-tegra@vger.kernel.org

no functional change, just to make the code simpler

Signed-off-by: yu kuai <yukuai3@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c         | 5 +----
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c    | 6 ++----
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c    | 4 +---
 drivers/gpu/drm/omapdrm/dss/hdmi_phy.c      | 4 +---
 drivers/gpu/drm/sun4i/sun4i_dotclock.c      | 4 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c      | 4 +---
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 4 +---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 5 +----
 drivers/gpu/drm/tegra/drm.c                 | 4 +---
 drivers/gpu/drm/tegra/gem.c                 | 4 +---
 10 files changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 0f557fad4513..eb71baedf19e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -587,10 +587,7 @@ static int hdmi_audio_register(struct omap_hdmi *hdmi)
 		&hdmi->pdev->dev, "omap-hdmi-audio", PLATFORM_DEVID_AUTO,
 		&pdata, sizeof(pdata));
 
-	if (IS_ERR(hdmi->audio_pdev))
-		return PTR_ERR(hdmi->audio_pdev);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
index ea5d5c228534..fdd73fb73653 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
@@ -924,8 +924,6 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(core->base))
-		return PTR_ERR(core->base);
-
-	return 0;
+
+	return PTR_ERR_OR_ZERO(core->base);
 }
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
index ff4d35c8771f..30454bc9de78 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
@@ -908,8 +908,6 @@ int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(core->base))
-		return PTR_ERR(core->base);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(core->base);
 }
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
index 00bbf24488c1..bbc02d5aa8fb 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
@@ -191,8 +191,6 @@ int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy,
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
 	phy->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(phy->base))
-		return PTR_ERR(phy->base);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(phy->base);
 }
diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
index 417ade3d2565..84c04d8192b3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
+++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
@@ -191,10 +191,8 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 	dclk->hw.init = &init;
 
 	tcon->dclk = clk_register(dev, &dclk->hw);
-	if (IS_ERR(tcon->dclk))
-		return PTR_ERR(tcon->dclk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(tcon->dclk);
 }
 EXPORT_SYMBOL(sun4i_dclk_create);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
index b66fa27fe6ea..12a7b7b1c99c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
@@ -278,10 +278,8 @@ static int sun4i_hdmi_init_regmap_fields(struct sun4i_hdmi *hdmi)
 	hdmi->field_ddc_sck_en =
 		devm_regmap_field_alloc(hdmi->dev, hdmi->regmap,
 					hdmi->variant->field_ddc_sck_en);
-	if (IS_ERR(hdmi->field_ddc_sck_en))
-		return PTR_ERR(hdmi->field_ddc_sck_en);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->field_ddc_sck_en);
 }
 
 int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592..41044f013933 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -229,8 +229,6 @@ int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
 	tmds->div_offset = hdmi->variant->tmds_clk_div_offset;
 
 	hdmi->tmds_clk = devm_clk_register(hdmi->dev, &tmds->hw);
-	if (IS_ERR(hdmi->tmds_clk))
-		return PTR_ERR(hdmi->tmds_clk);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(hdmi->tmds_clk);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
index a4d31fe3abff..0456b9c144ba 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
@@ -169,10 +169,7 @@ int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 
 	priv->phy = phy;
 	priv->hw.init = &init;
-
 	phy->clk_phy = devm_clk_register(dev, &priv->hw);
-	if (IS_ERR(phy->clk_phy))
-		return PTR_ERR(phy->clk_phy);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(phy->clk_phy);
 }
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f455ce71e85d..15be6bfdfe0b 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -347,10 +347,8 @@ static int tegra_gem_create(struct drm_device *drm, void *data,
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }
 
 static int tegra_gem_mmap(struct drm_device *drm, void *data,
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 1237df157e05..0a1c96129b2f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -462,10 +462,8 @@ int tegra_bo_dumb_create(struct drm_file *file, struct drm_device *drm,
 
 	bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
 					 &args->handle);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(bo);
 }
 
 static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
-- 
2.17.2
