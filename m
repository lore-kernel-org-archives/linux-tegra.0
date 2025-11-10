Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC8301707
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766136; cv=none; b=gBuaOOodvmIEq7nvjaK+pCOoKesSqm9mmPWNyMKpgqqJVVLPPpWD0MEYjbJZsBflwZ6M1EjYy71NI/BLZHHYoUuM5+VNh5PuV0rFTROtBe8oN8Kh1ubc2L5y4NxYxTr/OKVNB03QkLkXhBAu/HbxoXAgrW+qmT6maMtA2lHsxs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766136; c=relaxed/simple;
	bh=SdZCEzKCCGPm/tecLXel6T2iDt75VCQKY+YZCfWX8i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbCkblyOJFwQLXCaSKkX0aAS3W0FVaHSPQ4VJx9oo9PM6AD7q2i9/bIBzK9hCraPEptYZsDlsZMP9WRCRj0aFfQPXElp20bNWKP1WNFQYbAyepbSG9IOZtO7U+yA456/+f5xaWESrpEjbIsJjY+lvqgOKrmjnQ5YTfWoX8K07X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCmE3cOZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCmE3cOZ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-594285c6509so3010196e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766132; x=1763370932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fab5qCv2aotV3Fj8kDbJUnYTD33aHY7VjmYq2cPYjic=;
        b=hCmE3cOZj9lNMqfXHpHxUr49uY8j19poh9NVnEDkwC9ClsQ3ml6hR5gV5whFjARKe9
         bv1CeG7A5+7qqZ4IKkwMXPDw0Jin7r0nj/RfLYxPiS0T0xE7JNePsDNA5xdBripKbkb6
         B6CYNus6JYCfkNXRhquzUX/jZc1t2K8ozMgT5dsaCQUyxDBYBZVdBH8yD6EIicHuTVx9
         LgNStc/iQ9rfacpc6Mwxs0BSMoTrhGlzEPNHJht8pDf0oBRurE2keH+a9aeG53SoHRsK
         x/7mF/B/7Ay9KqI2lK5kt+jgIYcXlEHF0R8WVrSOl5+q4ZT7crDns9y8zx9VTThcEKWQ
         HTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766132; x=1763370932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fab5qCv2aotV3Fj8kDbJUnYTD33aHY7VjmYq2cPYjic=;
        b=RqGBC2edu6rpS5Uw71v5s1d8nya02ox/Gmszcpea78NjxJyz5vx44rvCh1btDNIsMI
         o+3fliK76z1kPehpdBkdW5z3DFyYE1eZCbeDkRAOv7mwnq6iUupe7ms281/l2BAz6Qpj
         wtZtv3Uxv8uFs9xPQG3dqAbfzEkCa7pAueR+vhyLWXotxIr9SKnyv+HaDsj2x2tbuj1s
         hJDjRfSt7UgaR2/OhhAdfvfinfIf2ZEXTHc49ECGx1H/OJiVRC/j0b3BUAJ0H2+7NYba
         CuMGZzg2gu7hKbrgi8EHAUaEXv1BIIP2Uq4BdKV49Ra558eqpWK+hikUt76PDXFEA+EE
         E+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn085w1pleB9kjk7myfDdOIkALobTFezv483oT+UrbLTO0NvLXyzNrfUZZhBvtIpYWrrDM4Ftr7i5IDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7YKoOfnk/dtWXFxg+oYT7RhwjLBsVkMMkWJfjIz31Iw1iIqa
	GyfxU4oplgisN8Js8Y65os/z9dgdRjVYEQxzv2iNn8bYPIejJhLNycws
X-Gm-Gg: ASbGncvyk4UFBJraEBspayqcGZBy85SOccehucf42XaTbBB+o3GdoNbxYhEqBFVdisb
	cmUOt7uOuLFxHjtwpHlInaKzjBiJjjSFyNZKbVxmgj6hORHFdeKgrrsE8PHCHpjRWrZYP8yalOq
	epVTbUn4o+iWhbjA3n+FWGiicJGpMDe0Tmzyx9aPdmXapxj/SXqKeDm1g9fW1R3Y+cWtJVw1Txh
	9sVhgSP7+cetoah6XK74MAUYHmY/YKLHfxxOOM5DnQp/WuIuqFzi41Qz7hRwgToiuupwYmhFZFd
	NcZeWpT1y37t0Aq/aaQUHB7RhrXdwxgYy1HJ9UGXjvXoiNKuP571pC3DEaFzs7LjP25TLYNirW+
	+xJ/AJPzTqQFpq/QkyylMFwdPUv23chzgsV6NaKVq9Rz9CPrAJ7HDCXcySPu83u+hxw8RuknVfu
	Q=
X-Google-Smtp-Source: AGHT+IGmR1s/2MPG2Pbke0uniwcU/kybvh8YSSTTRSAWTnFpWI82AEsuzwU5fOS27uUlHUyxcst0qw==
X-Received: by 2002:a05:6512:3d05:b0:57e:c1e6:ba8 with SMTP id 2adb3069b0e04-5945f146395mr2027823e87.12.1762766132151;
        Mon, 10 Nov 2025 01:15:32 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 7/7 RESEND] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver
Date: Mon, 10 Nov 2025 11:14:37 +0200
Message-ID: <20251110091440.5251-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anton Bambura <jenneron@protonmail.com>

LTL106HL02 is a color active matrix TFT (Thin Film Transistor) liquid
crystal display (LCD) that uses amorphous silicon TFT as switching
devices. This model is composed of a TFT LCD panel, a driver circuit and a
backlight unit. The resolution of a 10.6" contains 1920 x 1080 pixels and
can display up to 16,8M color with wide viewing angle.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Anton Bambura <jenneron@protonmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                 |  13 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 ++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 1f660ba065a1..2433a2931f63 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -781,6 +781,19 @@ config DRM_PANEL_SAMSUNG_LD9040
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 
+config DRM_PANEL_SAMSUNG_LTL106HL02
+	tristate "Samsung LTL106HL02 panel"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y here if you want to enable support for the Samsung LTL106HL02
+	  panel driver which is used in Microsoft Surface 2.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called panel-samsung-ltl106hl02.
+
 config DRM_PANEL_SAMSUNG_S6E3FA7
 	tristate "Samsung S6E3FA7 panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 9281221183ac..a87ae98362bd 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_LTL106HL02) += panel-samsung-ltl106hl02.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c b/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
new file mode 100644
index 000000000000..1618841b7caa
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
@@ -0,0 +1,179 @@
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
+struct samsung_ltl106hl02 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *supply;
+	struct gpio_desc *reset_gpio;
+};
+
+static inline struct samsung_ltl106hl02 *to_samsung_ltl106hl02(struct drm_panel *panel)
+{
+	return container_of(panel, struct samsung_ltl106hl02, panel);
+}
+
+static void samsung_ltl106hl02_reset(struct samsung_ltl106hl02 *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(2000, 3000);
+}
+
+static int samsung_ltl106hl02_prepare(struct drm_panel *panel)
+{
+	struct samsung_ltl106hl02 *ctx = to_samsung_ltl106hl02(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_enable(ctx->supply);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable power supply %d\n", ret);
+		return ret;
+	}
+
+	if (ctx->reset_gpio)
+		samsung_ltl106hl02_reset(ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 70);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+}
+
+static int samsung_ltl106hl02_unprepare(struct drm_panel *panel)
+{
+	struct samsung_ltl106hl02 *ctx = to_samsung_ltl106hl02(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
+	if (ctx->reset_gpio)
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	regulator_disable(ctx->supply);
+
+	return 0;
+}
+
+static const struct drm_display_mode samsung_ltl106hl02_mode = {
+	.clock = (1920 + 32 + 32 + 64) * (1080 + 6 + 3 + 22) * 60 / 1000,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 32,
+	.hsync_end = 1920 + 32 + 32,
+	.htotal = 1920 + 32 + 32 + 64,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 6,
+	.vsync_end = 1080 + 6 + 3,
+	.vtotal = 1080 + 6 + 3 + 22,
+	.width_mm = 235,
+	.height_mm = 132,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int samsung_ltl106hl02_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &samsung_ltl106hl02_mode);
+}
+
+static const struct drm_panel_funcs samsung_ltl106hl02_panel_funcs = {
+	.prepare = samsung_ltl106hl02_prepare,
+	.unprepare = samsung_ltl106hl02_unprepare,
+	.get_modes = samsung_ltl106hl02_get_modes,
+};
+
+static int samsung_ltl106hl02_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct samsung_ltl106hl02 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct samsung_ltl106hl02, panel,
+				   &samsung_ltl106hl02_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(ctx->supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->supply),
+				     "Failed to get power regulator\n");
+
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void samsung_ltl106hl02_remove(struct mipi_dsi_device *dsi)
+{
+	struct samsung_ltl106hl02 *ctx = mipi_dsi_get_drvdata(dsi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_ltl106hl02_of_match[] = {
+	{ .compatible = "samsung,ltl106hl02-001" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_ltl106hl02_of_match);
+
+static struct mipi_dsi_driver samsung_ltl106hl02_driver = {
+	.driver = {
+		.name = "panel-samsung-ltl106hl02",
+		.of_match_table = samsung_ltl106hl02_of_match,
+	},
+	.probe = samsung_ltl106hl02_probe,
+	.remove = samsung_ltl106hl02_remove,
+};
+module_mipi_dsi_driver(samsung_ltl106hl02_driver);
+
+MODULE_AUTHOR("Anton Bambura <jenneron@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for Samsung LTL106HL02 video mode DSI panel");
+MODULE_LICENSE("GPL");
-- 
2.48.1

