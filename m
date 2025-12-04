Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE22D8DD9
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828418; cv=none; b=kL4FV7taZv9izeT+rYQubZvieKV2PUsWp9A41LiE1TRElXKdDrUmKZvmkrUOLTV8xyEV5zGhc9vtboT0x7HgtABXztH1kMAUa8fhBO8djy/pDeABC4jFsx4L972Vb8Mna3vgkO8qPggcYkNjUyZjVvJG6feONXJTdu8cZkAfdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828418; c=relaxed/simple;
	bh=/CXzj5jTIsG6xjXWB8a3Ddy3m9DDciOJ66r1kBk8d4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDenLrhCy9sekssfNGgPIeOZDbgHcd88VxJXbsQrsDdDZe/PUo+ejanOh3gQ37peXnEfCP9YU8UgmAuE8Zt3ROB49uPoa9cgylp1mex3GtdQcsr20cwaVMflokQt9+svgyv6T7uCSrJTR8Ny+HlHNPsyItq+T5jNXYiYn9T/eO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG0NxU7q; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG0NxU7q"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso893998a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828414; x=1765433214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
        b=WG0NxU7qvzM2095auWVA4GlKVyr4S+ttb6vXL0ACsZ8hMLC0p5fFQyrSPZ1Q13gPnX
         Z6uMZ5rzk8KWJzJ8HMUSB8sJOy8Ompu9Y3KXPYBKMT5ZT0y7Cuhex3mvSePYmmWH/BKO
         URnQOFqvQmqtsVwZTVAdBVntrjwk/FxJS0J1uIBsnb7MW0XCUfBOhiToi857AHvAz+0o
         WS7yJ5jfROHS6192N2xt9skfu5mFX9BeAphgdPx6C+Ganlj4jQjc42T6ZATAksw/QvJ+
         4r2c4cFz+5p72Fd1GpKEiHTKwuKt2XeUkAIlrheKCR/b7teS2kpQPFnfx42UoIAY6Qxt
         kWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828414; x=1765433214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veHv/uRfxtfoSVQhbpvYC1/mXF+mOr0qW/T/KMequQ0=;
        b=lIEMTJ9yXzUkFnG9MhNxdRv0X3x1dBBzCtbr8d6GKC6sdJx3GvT+iT+Y+A3t4xVkxD
         igUA/NXj1gE7kblAqU2mZcgqPgUakCaeOMGk0EWFc9TRsgb9Kis/HOhkzD42jznZmFq5
         tuEU5swmupOR3/abQ9QWUgUXjra/m4If0spt1Lwirk/YFOnzuZ+IOhSqO1QRnPls6pQ2
         z/E5aGlVDUptGgvtZ675ntSdmcbMCs8/hhZmMud6RVSGikPPEQMQrHEz/XifCqlh+WRQ
         QGo17bwVbDBk7LCAQC+U2PHqevic9pX2J4bykflKjjwscz8okpNq4VIE2RHdSwRzeOxn
         GYhw==
X-Forwarded-Encrypted: i=1; AJvYcCXLJIzQrP51oZUtdUhSjTAaIpPU9Q4l2S17vxzqvbS/ismsGrYAZoAhN7gaXzRLXyfoqwbZq1qnbo8rkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8Ij8GonW+lertqhjwfkyOyUEUm5XGK8yz8BY7zu3R+qacyHn
	CXz1ICCZ3D9o1GT8LTKNkHvIRFgdmFHLoYU78bVl6uc8NWFSgWAoIytK
X-Gm-Gg: ASbGncv72mu6UEPtcL4kcFTBeE7zFzQCnNCX+mhodu4P0jJE4EcIk2tdhY4fzSBlHi1
	/TCLmJ/fe05gRUckjX5RBFCSbxTsq5kJiS7urebxtXD1wnjHgv6pWsGZIzVg3wTINLEYl0l62le
	WVH/kSD3esWfFtknfG8asxirwBbnGjZ4BBw3nmvEY9edh0n+BFEseYgu9p4uk/rnM6+5i6vsjT6
	CAeMdUp7opK5d0Z6I+e3WlCNKyfBlOMDN7JwBJ3mCh0RQDi8TW0oFCc4nYyyQyPBxtW6XcdQpWi
	gZKLRWtGUUh7CXRwuPd99kfEjkjvolwJpr4xuNhXE/FTLZM/7KFG4ds/hG/0gdHktOEH0UPw//L
	HuyZFFpL7y1CuxCb7F7BJWkGXaSwunwoq4hinyTk7nc5YBHpCLCdcmVzJQrNwMZsRWhnxpQB0Ed
	o=
X-Google-Smtp-Source: AGHT+IGIY456nDKAquJYqhqJz5aNWSg1c8AIQiMpWzN3vSnECpyPWlD0YcfkKel4ArG/Oznrht9jIQ==
X-Received: by 2002:a05:6402:42c9:b0:645:dc9d:83bc with SMTP id 4fb4d7f45d1cf-6479c41fc11mr4336412a12.14.1764828413739;
        Wed, 03 Dec 2025 22:06:53 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 2/7 RESEND] gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
Date: Thu,  4 Dec 2025 08:06:18 +0200
Message-ID: <20251204060627.4727-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LD070WX3 is a Color Active Matrix Liquid Crystal Display with an
integral Light Emitting Diode (LED) backlight system. The matrix employs
a-Si Thin Film Transistor as the active element. It is a transmissive type
display operating in the normally Black mode. This TFT-LCD has 7.0 inches
diagonally measured active display area with WXGA resolution (800 by 1280
pixel array).

LG LD070WX3-SL01 MIPI DSI panel was treated as simple DSI panel when it is
actually not and requires proper setup for correct work. Simple panel work
relied on preliminary configuration done by bootloader.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-ld070wx3.c | 184 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c      |  31 ----
 4 files changed, 198 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-ld070wx3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 045ffb2ccd0f..1f660ba065a1 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -408,6 +408,19 @@ config DRM_PANEL_LG_LB035Q02
 	  (found on the Gumstix Overo Palo35 board). To compile this driver as
 	  a module, choose M here.
 
+config DRM_PANEL_LG_LD070WX3
+	tristate "LG LD070WX3 MIPI DSI panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the LD070WX3 MIPI DSI
+	  panel found in the NVIDIA Tegra Note 7 tablet.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called panel-lg-ld070wx3.
+
 config DRM_PANEL_LG_LG4573
 	tristate "LG4573 RGB/SPI panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 0356775a443a..9281221183ac 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
 obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
 obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
+obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
diff --git a/drivers/gpu/drm/panel/panel-lg-ld070wx3.c b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
new file mode 100644
index 000000000000..00cbfc5518a5
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-ld070wx3.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data lg_ld070wx3_supplies[] = {
+	{ .supply = "vdd" }, { .supply = "vcc" },
+};
+
+struct lg_ld070wx3 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator_bulk_data *supplies;
+};
+
+static inline struct lg_ld070wx3 *to_lg_ld070wx3(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg_ld070wx3, panel);
+}
+
+static int lg_ld070wx3_prepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+	struct device *dev = panel->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * According to spec delay between enabling supply is 0,
+	 * for regulators to reach required voltage ~5ms needed.
+	 * MIPI interface signal for setup requires additional
+	 * 110ms which in total results in 115ms.
+	 */
+	mdelay(115);
+
+	mipi_dsi_dcs_soft_reset_multi(&ctx);
+	mipi_dsi_msleep(&ctx, 20);
+
+	/* Differential input impedance selection */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
+
+	/* Enter test mode 1 and 2*/
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
+
+	/* Increased MIPI CLK driving ability */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
+
+	/* Exit test mode 1 and 2 */
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
+
+	return ctx.accum_err;
+}
+
+static int lg_ld070wx3_unprepare(struct drm_panel *panel)
+{
+	struct lg_ld070wx3 *priv = to_lg_ld070wx3(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = priv->dsi };
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
+
+	msleep(50);
+
+	regulator_bulk_disable(ARRAY_SIZE(lg_ld070wx3_supplies), priv->supplies);
+
+	/* power supply must be off for at least 1s after panel disable */
+	msleep(1000);
+
+	return 0;
+}
+
+static const struct drm_display_mode lg_ld070wx3_mode = {
+	.clock = (800 + 32 + 48 + 8) * (1280 + 5 + 3 + 1) * 60 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 32,
+	.hsync_end = 800 + 32 + 48,
+	.htotal = 800 + 32 + 48 + 8,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 5,
+	.vsync_end = 1280 + 5 + 3,
+	.vtotal = 1280 + 5 + 3 + 1,
+	.width_mm = 94,
+	.height_mm = 151,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int lg_ld070wx3_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &lg_ld070wx3_mode);
+}
+
+static const struct drm_panel_funcs lg_ld070wx3_panel_funcs = {
+	.prepare = lg_ld070wx3_prepare,
+	.unprepare = lg_ld070wx3_unprepare,
+	.get_modes = lg_ld070wx3_get_modes,
+};
+
+static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct lg_ld070wx3 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
+				    &lg_ld070wx3_panel_funcs,
+				    DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(lg_ld070wx3_supplies),
+					    lg_ld070wx3_supplies, &priv->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get supplies\n");
+
+	priv->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, priv);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get backlight\n");
+
+	drm_panel_add(&priv->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&priv->panel);
+		return dev_err_probe(dev, ret, "failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void lg_ld070wx3_remove(struct mipi_dsi_device *dsi)
+{
+	struct lg_ld070wx3 *priv = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&priv->panel);
+}
+
+static const struct of_device_id lg_ld070wx3_of_match[] = {
+	{ .compatible = "lg,ld070wx3-sl01" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lg_ld070wx3_of_match);
+
+static struct mipi_dsi_driver lg_ld070wx3_driver = {
+	.driver = {
+		.name = "panel-lg-ld070wx3",
+		.of_match_table = lg_ld070wx3_of_match,
+	},
+	.probe = lg_ld070wx3_probe,
+	.remove = lg_ld070wx3_remove,
+};
+module_mipi_dsi_driver(lg_ld070wx3_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("LG LD070WX3-SL01 DSI panel driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index da6b71b70a46..6369e5828189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5600,34 +5600,6 @@ static const struct panel_desc_dsi boe_tv080wum_nl0 = {
 	.lanes = 4,
 };
 
-static const struct drm_display_mode lg_ld070wx3_sl01_mode = {
-	.clock = 71000,
-	.hdisplay = 800,
-	.hsync_start = 800 + 32,
-	.hsync_end = 800 + 32 + 1,
-	.htotal = 800 + 32 + 1 + 57,
-	.vdisplay = 1280,
-	.vsync_start = 1280 + 28,
-	.vsync_end = 1280 + 28 + 1,
-	.vtotal = 1280 + 28 + 1 + 14,
-};
-
-static const struct panel_desc_dsi lg_ld070wx3_sl01 = {
-	.desc = {
-		.modes = &lg_ld070wx3_sl01_mode,
-		.num_modes = 1,
-		.bpc = 8,
-		.size = {
-			.width = 94,
-			.height = 151,
-		},
-		.connector_type = DRM_MODE_CONNECTOR_DSI,
-	},
-	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS,
-	.format = MIPI_DSI_FMT_RGB888,
-	.lanes = 4,
-};
-
 static const struct drm_display_mode lg_lh500wx1_sd03_mode = {
 	.clock = 67000,
 	.hdisplay = 720,
@@ -5751,9 +5723,6 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "boe,tv080wum-nl0",
 		.data = &boe_tv080wum_nl0
-	}, {
-		.compatible = "lg,ld070wx3-sl01",
-		.data = &lg_ld070wx3_sl01
 	}, {
 		.compatible = "lg,lh500wx1-sd03",
 		.data = &lg_lh500wx1_sd03
-- 
2.48.1

