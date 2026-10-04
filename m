Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4593BFAEE
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131504; cv=none; b=awVarj3FPmTi0xwN9oI/g8vhsROuldSW+wA5cC/rgLHDSBtmj/SeM8TutBSOJC0mkbgOcaVT3sn/qFZ2AmyiJKAJdoZlMmKGJXgJduStdXN2Xk0p5qsjI/33UWr/VWYBCB00YqjEOcrNrdLCjiLLOZXUsFmM9Jqa9c6JmUTnDdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131504; c=relaxed/simple;
	bh=rjx9P8u2OQBh75m88vRSyDlnFb3KTLsJ2xhClRuDYwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KG5j5SWXfh/tG2JvhzTmZMjkLc0w88XW4yU11B4lOQHBEjoS84l03VnhHWrB2sGuD4Fvu5eyOGZBzy3VTF5zaf9BXTm/zTexROqKtxSpKSCIiL3TNYAuTwsB+jX3q0Yegjo/GoFV2/Q2tWf7QyZRizNaGXPS05bNvs0ztv2CrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdecQkux; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdecQkux"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so7213455e9.0
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131500; x=1791736300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+zPMfUMmOUlTJbyvmKPlE1XJl+xCDuNseUrhEUtbX0=;
        b=TdecQkuxO1KKmNJEv6LnvyarPhRBylL9elksZ7vyI8qkk8/arzPfisMjt8vDqSdSGB
         or3N+b4teabTztCCkdvcMq4XSe4X3IFUeMTfDICn4G4Vyk/DrkHnU+qiyK7UIHPKNv4r
         vqLxcCKbYF3VtgkhMHtQwdnChk9VFJlxKJj19TTBVm+/8cEX7GSvj1BEmT/wkn04Wj/B
         STZ4WM42pvQkGIr3h0Cg+ZZhjfoXI2syceqe/ebCNlerKODGJUxXevv8VtBVHQV2To2h
         7MN7n4sbSV1NRXAQdnd5cZ5SV8rZtAdrRL5/sPQOU2FgGrmZVQLgvCPyYQNUwh/Tcl+G
         u2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131500; x=1791736300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+zPMfUMmOUlTJbyvmKPlE1XJl+xCDuNseUrhEUtbX0=;
        b=ng2ttaJKxQ0g+0pKUMZLI+jwn+INqsTI9ZVKIIC2CKKk0KdCnr3mi6BdhzlfEGhW8E
         XamrCOuhUAL3+xJD8MD5FDI6yTvq6WZkzHFuUfhYT+tNLzn/DAJdr6pQSn6fn/WjCl9n
         HYC+cE5+bbaHTmJFusSSmGBZ1m8EV/qa/DsAIKckzrJ4ThZ0U/NKQevv+xVwglQ6Ceda
         OzRw95bJpCzMUnQ5MPfuZVYWwazBR6j1UdszjunS0gzZvDMPGfrOUagpNB80IBQxP30F
         t8Jyo9TGcFqmezTWglFfa7UQf4ycck3uC1mNU7KGzq0Knd0GWET6MINFU0wNr21xE+Wr
         opgg==
X-Forwarded-Encrypted: i=1; AKwUvBw75CIirxIFDODYwAsrY2CiKqNmUg1qfhFFw3X0Tn3m11GTII8ecD8i36prjcqkDYyHAA47DnDHIjPofA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpy2EVUuAHWL3JIhhDZDb7gW8LUGtENuYinouamzURTbmJf30c
	F8XFRjbPIIqZROAlDiKpjkU65eWAuCgyQVSHmmk0kt2MvXEjqmZ52pql
X-Gm-Gg: AYBFou0FOCxvJtiCnE71PrzwnYwKyworZcUVOxb7u2GOFvRCorkzYgEuHIDTxXXtAwn
	YTfm268132zQ4N90mZ4hVax8Fenl7ao5TL7OeIC+dT4uTgvKoB+gkyQuLVUGoc2zseLM2PK5sw/
	KsRQt5M/WAtSnHS9zaHrqClS9gqXearWdYMNTpy1yvQxz0CBb6BnwfravG7VP1Oq8KSbScTijrN
	kNtwE/Cf8wXwhifQg1e+mS3POKlMeBVGFHCTWK04TWf3Gf1oc5YXh7FxDst9Ant2nXoHy6dIEDV
	9gopouFf3dhCPwY8pyzJssMwUH0xdI42MXIYiuiojEZm4CdD+NFQSD2fLIn3JAs3OaQ19UEK7NK
	0y8XxSfU+U8FtmeBLXUMrCKWp7CZ47Aa/501HRj6vjYpRwZUr9EY0CKWLw5tyqQpMB6Tzs0CiGu
	NSv2fV58Du0vzYC4m9XCuCdqZIqfHSpmvMxGeT4AsCXk8E+of3imHQbIxAVAvxJbQiRqag3QZEg
	1bA2Kz2ioc+7MLa89UrwrYsDjkQng==
X-Received: by 2002:a05:600c:1394:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a02759dc21mr154737945e9.31.1791131499953;
        Sun, 04 Oct 2026 09:31:39 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
Date: Sun,  4 Oct 2026 19:31:14 +0300
Message-ID: <20261004163114.181800-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for panel used in LG Optimus 2X P990. Panel is 4" WVGA MIPI
DBI Type B linked to DRM encoder via RGB to DBI bridge.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 236 ++++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index f9e4441dad1c0..0d3845c9bd477 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -553,6 +553,19 @@ config DRM_PANEL_LG_LG4573
 	  Say Y here if you want to enable support for LG4573 RGB panel.
 	  To compile this driver as a module, choose M here.
 
+config DRM_PANEL_LG_LH400WV3
+	tristate "LG LH400WV3 MIPI DBI Type B panel"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DBI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the LG LH400WV3 MIPI
+	  DBI Type B panel found in the LG Optimus 2X P990 smartphone.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called panel-lg-lh400wv3.
+
 config DRM_PANEL_LG_SW43408
 	tristate "LG SW43408 panel"
 	depends on GPIOLIB
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 414267a49d922..842a2a973777f 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_LINCOLNTECH_LCD197) += panel-lincolntech-lcd197.o
 obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
 obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
 obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
+obj-$(CONFIG_DRM_PANEL_LG_LH400WV3) += panel-lg-lh400wv3.o
 obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
 obj-$(CONFIG_DRM_PANEL_LXD_M9189A) += panel-lxd-m9189a.o
 obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
new file mode 100644
index 0000000000000..cb2a09699fc6d
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+static const struct regulator_bulk_data lg_lh400wv3_supplies[] = {
+	{ .supply = "avci" }, { .supply = "iovcc" },
+};
+
+struct lg_lh400wv3 {
+	struct drm_panel panel;
+	struct mipi_dbi *dbi;
+
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg_lh400wv3, panel);
+}
+
+#define panel_dbi_command(priv, cmd, seq...) \
+({ \
+	const u8 d[] = { seq }; \
+	struct drm_panel *panel = &(priv)->panel; \
+	struct device *dev = panel->dev; \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	if (ret) \
+		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
+	ret; \
+})
+
+static int lg_lh400wv3_prepare(struct drm_panel *panel)
+{
+	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+	struct device *dev = panel->dev;
+	int ret;
+
+	priv->dbi = dev_get_drvdata(dev->parent);
+	if (!priv->dbi)
+		return -ENODEV;
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable power supplies: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(1000, 2000);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+
+	usleep_range(10000, 11000);
+
+	return 0;
+};
+
+static int lg_lh400wv3_enable(struct drm_panel *panel)
+{
+	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+
+	panel_dbi_command(priv, MIPI_DCS_EXIT_INVERT_MODE);
+	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_ON);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
+			  MIPI_DCS_PIXEL_FMT_24BIT << 4);
+
+	panel_dbi_command(priv, 0xb2, 0x00, 0xc8);
+	panel_dbi_command(priv, 0xb3, 0x00);
+	panel_dbi_command(priv, 0xb4, 0x04);
+	panel_dbi_command(priv, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
+	panel_dbi_command(priv, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
+	panel_dbi_command(priv, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
+
+	panel_dbi_command(priv, 0xc0, 0x01, 0x11);
+	panel_dbi_command(priv, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
+	panel_dbi_command(priv, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
+	panel_dbi_command(priv, 0xc5, 0x65);
+	panel_dbi_command(priv, 0xc6, 0x41, 0x63);
+
+	panel_dbi_command(priv, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
+	panel_dbi_command(priv, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
+
+	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(120);
+
+	panel_dbi_command(priv, MIPI_DCS_WRITE_MEMORY_START);
+	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int lg_lh400wv3_disable(struct drm_panel *panel)
+{
+	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+
+	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
+	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(150);
+
+	panel_dbi_command(priv, 0xc1, 0x01);
+	usleep_range(10000, 11000);
+
+	return 0;
+};
+
+static int lg_lh400wv3_unprepare(struct drm_panel *panel)
+{
+	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
+
+	msleep(50);
+
+	return 0;
+}
+
+static const struct drm_display_mode lg_lh400wv3_mode = {
+	.clock = (480 + 10 + 10 + 10) * (800 + 4 + 4 + 4) * 60 / 1000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 10,
+	.htotal = 480 + 10 + 10 + 10,
+	.vdisplay = 800,
+	.vsync_start = 800 + 4,
+	.vsync_end = 800 + 4 + 4,
+	.vtotal = 800 + 4 + 4 + 4,
+	.width_mm = 86,
+	.height_mm = 52,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int lg_lh400wv3_get_modes(struct drm_panel *panel,
+				 struct drm_connector *connector)
+{
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &bus_format, 1);
+
+	connector->display_info.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+					    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+					    DRM_BUS_FLAG_DE_HIGH |
+					    DRM_BUS_FLAG_DATA_LSB_TO_MSB;
+
+	return drm_connector_helper_get_modes_fixed(connector, &lg_lh400wv3_mode);
+}
+
+static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
+	.prepare = lg_lh400wv3_prepare,
+	.enable = lg_lh400wv3_enable,
+	.disable = lg_lh400wv3_disable,
+	.unprepare = lg_lh400wv3_unprepare,
+	.get_modes = lg_lh400wv3_get_modes,
+};
+
+static int lg_lh400wv3_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lg_lh400wv3 *priv;
+	int ret;
+
+	priv = devm_drm_panel_alloc(dev, struct lg_lh400wv3, panel,
+				    &lg_lh400wv3_panel_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(lg_lh400wv3_supplies),
+					    lg_lh400wv3_supplies, &priv->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "Failed to get reset gpio\n");
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(dev, &priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add panel\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static const struct of_device_id lg_lh400wv3_of_match[] = {
+	{ .compatible = "lg,lh400wv3-sd04" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
+
+static struct platform_driver lg_lh400wv3_driver = {
+	.driver = {
+		.name = "panel-lg-lh400wv3",
+		.of_match_table = lg_lh400wv3_of_match,
+	},
+	.probe = lg_lh400wv3_probe,
+};
+module_platform_driver(lg_lh400wv3_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

