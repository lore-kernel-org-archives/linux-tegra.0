Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445B30CB35
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155931; cv=none; b=i7MD3aXj8dH6BnbGKSHLVdKmsKJap9OPliqGFTzlY2pfKNmfjKrN4m8H7dJd1JqICG9KoeZmYRtRC6wZPfPxpwni3Zdmei9DcY5JwhvXRqEHYag5jJro2ACptC8G7oP8WoR2nFyglaR/G9q+DphxZY9+k1JGTDvsUgviw/+udZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155931; c=relaxed/simple;
	bh=+GoO4hs/IEJLihbPAb1xVTX0/WXwsti4sdzlCpzm7Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lizcf57rcXxyi8c/ugQMKmPjZvo8eOEbn8CqRTabknGjZBhKjAw+EPHD4dSD0Jt/rUZ23bsiUs0GL3NZO5C5HEzlsSYT0VUFLyAf7u8ECOzqGh4ldyRS4VhGUYhUXGT6HskYs/D4BAuvJIPIUPPWqbSHb4ClOoFaUq+G9NP8UHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnMmfYXF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnMmfYXF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so5406454e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155927; x=1759760727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMRnRE0+turkA0G+/rtvJG6tJyLftSMWq+CTV80QGeA=;
        b=MnMmfYXFG6EOhiJOtF1D+U9ahu3h6kNzlhs6wkm0BPEj6d1bq+5WFzOT5HY4yQYgVX
         p0PFI0EPkyPEdT8kV3FvoWhgX4ZpUFicgLaEuINlHam6xs8pWhtJ3E21KMqfLZfSZj5v
         JS3w4KxeBnMwAcZ4NI0pT4Vr+00NUMo0nfCYjqgG7j/bYZ6yPvJ+yFn0Ockqf3vgIIIh
         K9AkCzEID3xMPg5a+4nZCQbwS3ka0nrk2kBbcTcEq+CPfndECAWgbj0JsW67oH33f18q
         rscxqI40ee5kfHwfqwr4fMZhy+HEq35ODfb5uFcs63pfF7yvlpyiuckHEJ1VYuyDGfQz
         8pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155927; x=1759760727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMRnRE0+turkA0G+/rtvJG6tJyLftSMWq+CTV80QGeA=;
        b=SlZ+80WRhTtYIDRLh2G6vGl/NjJhiH9JFAVsFLbRTNfZsXcnDiBUxPbct/D6DJOHEm
         wuUX1PhWWR3c18R2xFETG1lOngqaZ7mBeVTnQ6AsvgxuTkxDey0fyBcHh5RDaKje9e7N
         IEtoFwOJbfcA/m4C3R6NTau4r4/fYwiQYqhrnONee901dcZlQcRoiTu4T0s6BUvlLomW
         ZnuzUcl5i+jg0wIO6IeRRZfkvVniZ7Qu0teBJnNHrogaf4AvSPljcU01QBRq7UTYbOR1
         uKZyKnnNtxE3Akwt8B4u0RpJVnSaepNhamWDmjV0AAjf96DZDwPA61hZFLp0yfqizuOh
         11/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKJLX7LE3i+T3/7eOWXzwQoIBFV8B/bhC0xcT+adXJoVzWhGqi9ageYw3kHVgpt/79E6+5j62IK9rIBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyndEEMFc9CCHBW7MN5tIMnO/u1rlxUARXpu0sfI1X9Xwg0lAUR
	lxRM2WevdQAyj0A6Yqr24U7q+wYEb3f8dANiKIz9ci19HAq5yUWUHIFQ
X-Gm-Gg: ASbGncu3xaN7oyEPtHHkjzfI1c9r9y8erKp9RPw7npDkWEJ1iNRAjA09BjpH65/r0/M
	cA5HhbsyepeQC9+U/nG7e5PFlLpr7UJKmfIUi60NwFijnaD7fE45LNjA7D5iGemZXqU+cXXmFV1
	CD2NAtAO5EzKlh75zBJkn3U2XF/toPy+yL3VB6QEkC+LOAxzGhyD2X2fXMI+eJnXo2BjngqV6vA
	WcO0UqMlIUd9OJtvQqjXiZSqA2Ji/aWVU86CUJVVQKlm0onzPqX32DOhOs+9ctDwSYgdbDlbeET
	ErCo3AE3sFJyz/43xJLcs5xVXd3WFLvmO2TT/sv7oKLQ3dtcFnLRFnFRCKCHK97xqdWG8qVIq7a
	D1pcDKfHfwTecTutG6mmsMC0M
X-Google-Smtp-Source: AGHT+IF51Aa7Ys5uQxj6EfS4scy5ai6R/EIitZEmLlAwXhDSDzE+/Qi3wiy8AlYi0Rb1hE1xqyA5Eg==
X-Received: by 2002:ac2:5b8e:0:b0:57b:8675:e430 with SMTP id 2adb3069b0e04-583c859468amr2843766e87.13.1759155927047;
        Mon, 29 Sep 2025 07:25:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v1 7/8] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver
Date: Mon, 29 Sep 2025 17:24:53 +0300
Message-ID: <20250929142455.24883-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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
---
 drivers/gpu/drm/panel/Kconfig                 |  13 ++
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ltl106hl02.c  | 179 ++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ca5c5e60cfa1..55e4d5135562 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -745,6 +745,19 @@ config DRM_PANEL_SAMSUNG_LD9040
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
index a673a74cd371..48a10fbdca89 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_LTL106HL02) += panel-samsung-ltl106hl02.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c b/drivers/gpu/drm/panel/panel-samsung-ltl106hl02.c
new file mode 100644
index 000000000000..362b2323b771
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
+	return 0;
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

