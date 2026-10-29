Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287780;
	b=pvWLd+5ln/DOxTiF0rW2b1RVVwlqfvk+S2KEUgv7YXuNAvmEWP+bUy2ujVxiSmP+kz8f
	 TgDDGRvOjxBhDKuwb5Boe64rdy6UPTDDC0ecF0YF+YJ0kQdbjztA/UaEX9czEwM1bkZ+b
	 Hkah2jKjimM/eYe6JbKj1t5FjiXzKx7R+vrr5G7XZEPD+rrvvZa0IYG9xfEEIFyZvBz+x
	 k3+TVYtEwhq81jDwiU48p+PFNb3FgJHIJWyNgjQjXUC6yAieNl7sFzLgBBue70m91I8YG
	 kcgsPwPdyF1vxwkFkYmSJmejxYgfAUTtd5fnIkSrry3wNmJ4zMSOCJaWYy/PolaCsxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0t137TYCXhuqa7rZmb7FtPECWpgLDjqquYuvOdmaVB0=;
	b=fXbX5Oym0jbsxXzvylx4oOQm4sAUUZWCuUzxw/cE8qXNWt8htSJz4plc5+QzX0HTFQE6
	 vuP+CbB6B+/RCyROltwyY+c+HdDbXJ7K1JgJQHseSB6HW6LE05HznZRLdz6pOZEE0zrXE
	 DQj1FoMMdoiv/mXuLHp9OMU5RTAUTycjKBpvFeX256DHITFzI0Kyw0Yk/qhaUXUVcM4rt
	 XeA5n7aHhWCk2snb1xDoVCNquCcRLqjfkx3y0mTzYMeybhjrKY3YWo3YWI6UiTQR3a4Hw
	 p0R1/08/7HU9dnDnF8IE8flakRlNGfiH1HQ7hzOSd9UAOslfB4caD7MNc68nonUbwPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmtGtAU1;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC108606A33A
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC108606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TmtGtAU1
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so369367666b.3
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287778; x=1793892578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0t137TYCXhuqa7rZmb7FtPECWpgLDjqquYuvOdmaVB0=;
        b=TmtGtAU1E0AyyLvNMnBcRMrA8ouZFuEb0Xzy3apDYtaD/X6xnJLsfzFfq7DXw0JphV
         5TIrq169teqAgIZZOoozEApSy4YSy+rkeKRoFTqcVf9EPVnBpEHvOryw0CxFkDqnMGhE
         pnNBTK55wjUgG0OrHe9xMHFWON6Z24V7PffvWi2p7xyJ3w5GxKk3vO7tqbvPUXOjegEa
         5hNTNJmhmpCOQn//35JD+EdH4yvhLHBGoHv8URYPlA1E1Hk35LQywLddwmbMGYLNDCFC
         ZEnxyMmkk382AG5FEQUDGd8ttnoWPIRA3l8CpUCR8cBaC3km02ZCs0H4dM0Yx+A9VQ0T
         mvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287778; x=1793892578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0t137TYCXhuqa7rZmb7FtPECWpgLDjqquYuvOdmaVB0=;
        b=l/SFrffstZ0H9+FuKlPMYUjI6JeQwBUl6nVqh60smzacB02cMk2ESaCpaK3BI294/U
         JVH+b7iCa2znQ8xfpWzmTGhMkHapM3hYwyrZyxIVj4h8zmxrPkJjfAjmXZsQobbMUPCV
         1axeZ/AUg0vka5UMsClz0bQOmRtA1vNuxUelHJfm8SFdz1e0uRiC4Te6UG6xloUSsFLR
         AkOF2DRbi0SYLrzi+mQ7TMh0RQZcg/Xu/CanLlJYQ6QV6EMReVXelrbdh+eM2CeuzaP4
         G8vClVhJCKQUcnJ/zbp3uYqyB8Kj8OFkeb1SUA1iCKYRlfDCoEHaGtkEe5Oo2y+B4zc4
         i8Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxHTfQmjfS1Ccpr1vGCvQ/lBD3VZtb2Ix7RhQWP1srmTz1ooRTZSm4oZNMc2ZMMvfKLJiM70aBlqt4P9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKe4AIUzlQUiBMXNMnawI21dzW8tMDqSw9vUwiCuxTfhhJJXt42
	TNvi9jl3Ts268cJDNE9Jdy/PjFBeyYOyciFsvSYPgieiZc1BeZZWijcR
X-Gm-Gg: AYBFou15nAhjeh9SPYLbK5uRquDMCqfD5pfxz12e8a/EdeQJv7b1BiTdISTJzitvR5t
	meZlvKMjw3aG6ftCsVzGG2mFvIOImNj1DZ8v/XABxr92Ico6WnUBuXECb/milsDvuoJiFRYDJZ2
	SzUBypBqTeWMBj+enmVSeWPurLLZTah3114r72ZRo3zVdOEGe/6JnsdYiLviMBn6fXM0fihDaJP
	EaoXU28Pui51sO6urY4Y5ORBCn0qTwXOivpOP3Op08uB0lAxs/FWF/S3ovFt24SYLDBug3FknfV
	xPUGOe0gbbLn/857nV6SDCtSree6mlyk3Dw2xFCCtweAfhojG+tsuEtxbWPth1wSiJqRCn4UBI1
	5Vp82Pdj+RuZckuCaoYAQfzlJGrySSULv1b/eu55JW92z/UUTZHdUIt7TfeaUNcKq6RWQ9lRSfZ
	ruCe4BaDUjshEQVhCg901W+a5/WG6OQwNJ8sGBgHeS3WyLs7ToLgqlBDFUGMkKFr1U2ieTWNCxN
	OUnRin1+QUeaZa5kHxYOpwFpSpySfYCjyQB0zwH6N10nS2p3N3EwdxdIu8mNLcwJAC8iJKv+uFr
	bar57ivsiP/KDS7cirPqnfPFptRrFP6ppKggPIvBxOf8IZ1hCg==
X-Received: by 2002:a17:906:24c2:b0:c49:c76f:dad3 with SMTP id a640c23a62f3a-c49c76fdf1dmr322126266b.34.1793287778021;
        Thu, 29 Oct 2026 08:29:38 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 04/11] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
Date: Thu, 29 Oct 2026 17:29:02 +0200
Message-ID: <20261029152909.234584-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for panel used in LG Optimus 2X P990. Panel is 4" WVGA MIPI
DBI Type B linked to DRM encoder via RGB to DBI bridge.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/Kconfig             |  13 ++
 drivers/gpu/drm/panel/Makefile            |   1 +
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 233 ++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 0e86628bcdb80..036602e577953 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -554,6 +554,19 @@ config DRM_PANEL_LG_LG4573
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
index 2f57e350311f3..bed77ae90b660 100644
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
index 0000000000000..8a11049948635
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -0,0 +1,233 @@
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
+#include <drm/drm_mipi_dbi_bus.h>
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
+	struct mipi_dbi_device *dbi;
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
+#define panel_dbi_command(dbidev, cmd, seq...) \
+({ \
+	const u8 d[] = { seq }; \
+	struct device *dev = &(dbidev)->dev; \
+	int ret; \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
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
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_INVERT_MODE);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_TEAR_ON);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
+			  MIPI_DCS_PIXEL_FMT_24BIT << 4);
+
+	panel_dbi_command(priv->dbi, 0xb2, 0x00, 0xc8);
+	panel_dbi_command(priv->dbi, 0xb3, 0x00);
+	panel_dbi_command(priv->dbi, 0xb4, 0x04);
+	panel_dbi_command(priv->dbi, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
+	panel_dbi_command(priv->dbi, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
+	panel_dbi_command(priv->dbi, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
+
+	panel_dbi_command(priv->dbi, 0xc0, 0x01, 0x11);
+	panel_dbi_command(priv->dbi, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
+	panel_dbi_command(priv->dbi, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
+	panel_dbi_command(priv->dbi, 0xc5, 0x65);
+	panel_dbi_command(priv->dbi, 0xc6, 0x41, 0x63);
+
+	panel_dbi_command(priv->dbi, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+	panel_dbi_command(priv->dbi, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(120);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_WRITE_MEMORY_START);
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_ON);
+
+	return 0;
+}
+
+static int lg_lh400wv3_disable(struct drm_panel *panel)
+{
+	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+
+	panel_dbi_command(priv->dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	panel_dbi_command(priv->dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	msleep(150);
+
+	panel_dbi_command(priv->dbi, 0xc1, 0x01);
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
+	.width_mm = 52,
+	.height_mm = 86,
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
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbi)
+{
+	struct device *dev = &dbi->dev;
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
+	priv->dbi = dbi;
+	mipi_dbi_set_drvdata(dbi, priv);
+
+	ret = drm_panel_of_backlight(&priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
+
+	ret = devm_drm_panel_add(dev, &priv->panel);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add panel\n");
+
+	return devm_mipi_dbi_attach(dev, dbi);
+}
+
+static const struct of_device_id lg_lh400wv3_of_match[] = {
+	{ .compatible = "lg,lh400wv3-sd04" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
+
+static struct mipi_dbi_driver lg_lh400wv3_driver = {
+	.driver = {
+		.name = "panel-lg-lh400wv3",
+		.of_match_table = lg_lh400wv3_of_match,
+	},
+	.probe = lg_lh400wv3_probe,
+};
+module_mipi_dbi_driver(lg_lh400wv3_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

