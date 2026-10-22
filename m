Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675412;
	b=w+dVBuNQbPzSR5cHDucDFBaMxcAHU3NjYl8clNDcEOONCgWLnCwh8hUCZJmlnCH1qbDL
	 7T+bg+Ky1ueYy1oxNTza19RyB9HdSoRNQ8gu1xqMm4YjNWEw5uF6Lyn5L0NWBErfGrC5t
	 sLnm/WCTPzSmJd54QDoTkGcrmpGUkgkrSu4B/ugmjyMghBdwKimn7i0jheRkE1usbq0Mj
	 e4dqu4W5mEW1gAF+/RCliVyu1zAk6Ufmh3qgYcg91MyWUJItioHoiEA0WoXXXTpCRmv2w
	 iE2xjoJFk8gViV6sOtMiC6mVJV1nVa4vTftdD1ksEhtjt5TiY5lCM/Jj/iWlfUwThmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2TJBy12/JPm+g3NY68goqoCFp9uNWzymX40uiPV8AhY=;
	b=ekNTw34O4/8qwzrTb3A0HbGMi8roXVQiko7/IlAGF+Q7soU06UuqxMQ9NKfQ+JBDKXeX
	 xWZzeu/AfgfU754iVZJkrETxYgr/heYjOL8pzhC7tNbveDLM5/BHOnyDLurFk9J4kwJlK
	 W1fKAthr+0wYtgheeKI2HnuXcsECz21xilCcM1huChYi4m2OLWk0YEqjNfr1B9WyKKZxb
	 LoJ5A+gg6lguC9EcMNt6h+Yw3UerUU9p1nfN+NnwGxVhM8JcZ1DMa0I2+o8NDuROJQYvl
	 K4+UEVrQul4/OgyWjrPEpV/UVHI4y7p4RuWs7FAa9oGt+u//cQuQhFR8LmoBQVu2j3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gqZXSaYh;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8F606A323
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B8F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gqZXSaYh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3023442a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675410; x=1793280210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TJBy12/JPm+g3NY68goqoCFp9uNWzymX40uiPV8AhY=;
        b=gqZXSaYhcwZq5puSoMKYAmFeLviDOJWGzMK7DIK21+hLMtwgNbreKwDy0yXLhf/UNL
         OvdXbNIc5xUZCpcZMpXjSdRgvQ1vzyF3DNf4LWyEwC8BCITh/CKHimt3FtFb5gxiUhvm
         3O8n+9tOttbPK19a1fqLB5FmJdDj9LUOGaKmpaQdlmNm43ar/ciqRlnWJATY03gipjbb
         bhUZ5CZaLG7ij6Z2e8JqZJUr6V8xDf9mJpEQEZZRh0hW8ue+Ac0GopwRBE5Gyue408Ht
         jIpSA9459dzBRcdVKQTXCpvM54ErR6HW4H5uemf8pcmm7IohWGWpC6KQ94ba5kajNeCH
         C6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675410; x=1793280210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TJBy12/JPm+g3NY68goqoCFp9uNWzymX40uiPV8AhY=;
        b=qEmm/LY478Zx/hU5CvqOrXQCad00NFTGfplE9tKRie9/zK8DmoU4bVezmQddz1yoPd
         73YQMMKTwXFRCdmRU/CGUQycoOAo+UuqiaTH6Ddyh1h/ll8FXbohqKtJZEdfD2ZiDoOq
         oRGRkBXRaBKSuaZW+cypj4Z4fEJvxvg7/2rYWFlXkmqWkBH5i9jkAW6MfoLQ4qcQ9O6T
         o1Kh8xnxMxhAzCXPbrtmFtdzw5SHhNjO0fr7POGBI9scbbLxpbxP3kSk0fA21klePJTp
         inHMaMQf/4Z0Q14/vVDrOEAgIwsGceeS3yVeofOjTxQhrfJ+gzsuj0uUHSc0u0sWsNhq
         8mHw==
X-Forwarded-Encrypted: i=1; AKwUvBy0TJGgwTqkatjx6uZzIaZDrKbjghSTttGPOIZP2WdT1yrFKQczqLMglAXfNHfy70NMPEpQ2QlEebNU9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJOKtRhYTmCI4TT5oZR3oVddVan0j74fLtPlNjqK4wj/LhxMBsh
	swFmF1G2bnnJn0RJuIcR3f/l5Qh9pxUSjtM4yXXFy5VuijAPxvsXvVwY
X-Gm-Gg: AYBFou3Wae/63MMNktM1hWzBaUi1k2TXDhVRNsyDqElgvuINFQJeyGTjPENoI8Frasa
	rB/bYcVRtc2RjrdUBqqj8T5AsJfTnW6AIGqJmmp5yIXZiOP6Co1P/XOO+q1IiPWqYw1fsFD/gqD
	JGnvzKj+dV7sVRA3/2ynnr9J6smhxWMaX0EmkGua5e5ziWE710SQrJsCqWM9vQIYjBNR7LMHoV5
	lX01t0dxjfEq/b9YzlZ45PEoqWeK/RXmbA9/LRFGIpwCmWRGFkSzEgeK1pfeuMkRROBr2TmXzGx
	FdNiLnY519mFH42ESIYofF7gYn7lnxP/09KLaBZk/EzWukYc0tNjxdNP/jFBFWBAlFiUpweFt+Q
	CWBESZ5eJgHi871hkkra7kt6TfC7E3epyvlSxMt58Uj4c7b38M6q8kE1wPNeMEMW2OYp72X+2rU
	oD8yYWw9FgM68TlyteWV9xPKHY9frZTV4qIsrKpyQeupC5KZ2B2teE/XrqL0yUwRCV3ttWjHJml
	ngRpLP/MfqM9eZ1Nk24FgLUlrdRENpX6+ejddv2Ex9n1rMP4r6MdDDBsWoLUDaSpoXnjBPYBtFr
	F4VxlVicK42xhkH9tgKvjw==
X-Received: by 2002:a05:6402:a58b:10b0:6b3:f983:22b8 with SMTP id 4fb4d7f45d1cf-6b408efb288mr4170880a12.43.1792675410074;
        Thu, 22 Oct 2026 06:23:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:26 -0700 (PDT)
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
Subject: [PATCH v4 3/7] drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
Date: Thu, 22 Oct 2026 16:22:55 +0300
Message-ID: <20261022132259.240717-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 236 ++++++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 5f68b78526c3e..f29b63ad8ba0f 100644
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
index 0000000000000..557bcb6f2ca70
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

