Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA444A3F7
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751975; cv=none; b=IlFz2PskH9om29+naRBOtem3C3Q/nXHIhfdMSwQloYwIDo3v/qmh1ZT5LTpULAeFcbiWD67iJtb3IA7jYgb2wntduiBT2c+CExsgujZXxk5Td29tr0QBPSJLryKxn7mPz4lSFTTJRo+ikOYCftMm06+7jZ4AQyWKsTPTrrYYyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751975; c=relaxed/simple;
	bh=4JFdheQkSmIoRSHb8d5YjU7V1fbRbwiYYakNSYg75JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLJ2cK7tsp85Z6aHk23eyuL+az9wDJaSeiyJMfvd4JeaBEBjlgaAXtHsYNcKwRsCVOhFAOnhIYDQsCWIT8Fmn6IJV32EdWkA5bjN6z+lIdGmBwrbGEgXExjEzKTDnFYtExMmStc+04tDjxeyUEoYbUB7qvKGuXV1/gtnLiRcQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npUh3sZc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npUh3sZc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso20420845e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751962; x=1791356762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3z8vG5srk/ZUNTpJ2oGCNWAQjS+iPZwU1XzeVv3hmU=;
        b=npUh3sZcCnhghXAlKBTQk360jP/pR2W/mBNxWRsQxN4kEtVhBVKmgC4r6roN7nrHz/
         mjmek3GWRY35BhGxHZnZrUdEHImnlUdA8vRSd3XLP0/udE6KEXHnY0oatR6zUZga/IUi
         Y9Q2C6Z4z0drWSPvEsGBEYZBLvmTneDeu983n8rcdA86r2DUgVLJqZE+nbneG7EaD5ZW
         V+9DJ4HDbJBOsyJ9EX6B88v8YoaUh4PIsl2tNG7j3gAujjZG1OnRqu82zxSJZId0Q7Dp
         T5U+eBpZJmo0Sh8/IiiKnrCxtjQJyIqHwy4o39V6VQc3/CvraUHC5pi6YIP02zf4wx+y
         m16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751962; x=1791356762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3z8vG5srk/ZUNTpJ2oGCNWAQjS+iPZwU1XzeVv3hmU=;
        b=jTT6nifNBTj07i5XYk03gkgnxXELu1KIuR92uWmvlmcGjERML5CS8q/MMx/a1D1N7F
         bvwSxIVAmfcWNQxU5mGJ9prRy4kB2k1sTZL5URy6I5FZ78eal6gF6tv6bGX5k0puyp0f
         o8ZY+MaELbI50RFh1yiooS5J5ufTUvjkQIqTrBhtmdEjB66AlxgPtL5dgpdTwoApolLR
         pKmssgpXCOUz+8CYfCdXrVlTGZfFKai3m2BuYU1/XwHifHMLNUXLXAGYo/VjvuDRMRbs
         k+uApLiEW2yN0Gsit2zmZCljIrwQUIQ/MZCHOeLWgmawJMGiODRBH3TNGI6rS0+leQ7Q
         XEnw==
X-Forwarded-Encrypted: i=1; AKwUvBx28zBw1PaPMCH3Uan3qi1+4CxvpYJRhm1hyNvFfw8Qj9P8kNBgilbGH4C3qxo4vjD1AN2qka4MAEfLtg==@vger.kernel.org
X-Gm-Message-State: AFuF++lW3lhYNsJNbfiuA+1TpOS4qQVwtdc2dEMss/6aQRp7cgnPPYe7
	05j+aaL71nwlG08RZMPPJkOS3zOltIlRpm65EQ0KXEI/bTuyJTPF6+GD
X-Gm-Gg: AYBFou0jllOtz0jlTiko08ERmGkVB7CqsiRieVeEshpNcueRDS9T/ksGDrR8fjTsqHq
	sRV2MjCsY9ap1QmT2HUIgK+CA1yEn1TZTiBG3ZMSQ4OACVW9Lvz4Xd/7sDNuzt5P6U6aiwNDpak
	HQ/AyfQzw2c12bjp6Vp50kAcURHx701v9Avn35HU2V+04ohkLNgSjh5eSyBUGA9BOupSyp+CF06
	iftxlmdH6HM44Vl9FxYxrxm05QA35nvKoT4ZszzrTKGV9z70WfOOFHIPO+fHJdJU8Dhtquy2QrY
	ShodiBqoDECQ/7UzD0QnJMQymyauv+0PHpHxfr+5FtFT9107zy5xNQHh5ZuGg4NqZ4cpfQ8/KVl
	dnaE14W2OPhiCHqkMR9vuNgpfRDox7QpmrTToX7cIOTOxZxnDB61C5JB5pWWd2Bvvu0CYyGyHuk
	0b4FvcUcz5hvwaa40PRCD73OEGeA7BhdDhEkbd6oVIFdJPOySMUymmF7TgdTFw2DF91rZxE1Iz6
	C6xke2d4J7aGYiXojg=
X-Received: by 2002:a05:600c:4512:b0:4a0:136d:f721 with SMTP id 5b1f17b1804b1-4a01b00c143mr5662565e9.17.1790751962183;
        Wed, 30 Sep 2026 00:06:02 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:06:01 -0700 (PDT)
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
Subject: [PATCH v1 4/6] drm/tegra: Add support for 8-bit CPU interface
Date: Wed, 30 Sep 2026 10:05:33 +0300
Message-ID: <20260930070535.47130-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'. Each display controller provides two such interfaces, which
can be used to send MIPI DCS commands to initialize and control the panel
while image data is transmitted via 16/18/24-line RGB.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig      |   7 +
 drivers/gpu/drm/tegra/Makefile     |   1 +
 drivers/gpu/drm/tegra/cpu-bridge.c | 427 +++++++++++++++++++++++++++++
 3 files changed, 435 insertions(+)
 create mode 100644 drivers/gpu/drm/tegra/cpu-bridge.c

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8a3b16aac5d68..db9839280b8aa 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -30,6 +30,13 @@ config DRM_TEGRA
 
 if DRM_TEGRA
 
+config DRM_TEGRA_CPU_BRIDGE
+	bool "Enable 8 bit panel communication protocol for Tegra 20/30"
+	help
+	  Tegra20 and Tegra30 feature 8 bit CPU driver panel control
+	  protocol (similar to MIPI DBI Type B). This option allows use
+	  it as a MIPI DBI bridge to set up and control compatible panel.
+
 config DRM_TEGRA_DEBUG
 	bool "NVIDIA Tegra DRM debug support"
 	help
diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index e399b40d64a1d..88d5ed2f9ded0 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -31,5 +31,6 @@ tegra-drm-y := \
 tegra-drm-y += trace.o
 
 tegra-drm-$(CONFIG_DRM_FBDEV_EMULATION) += fbdev.o
+tegra-drm-$(CONFIG_DRM_TEGRA_CPU_BRIDGE) += cpu-bridge.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/cpu-bridge.c b/drivers/gpu/drm/tegra/cpu-bridge.c
new file mode 100644
index 0000000000000..63ca87a0be909
--- /dev/null
+++ b/drivers/gpu/drm/tegra/cpu-bridge.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <video/mipi_display.h>
+
+#include "dc.h"
+
+#define CPU_BRIDGE_COMMAND			0
+#define CPU_BRIDGE_DATA				1
+#define CPU_BRIDGE_DATA_PINS_MAX		8
+
+struct tegra_cpu_bridge_dbi_output {
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+};
+
+struct tegra_cpu_bridge_priv {
+	struct mipi_dbi dbi;		/* must be first */
+	struct device *dev;
+	struct tegra_dc *dc;
+
+	struct gpio_desc *dc_gpio;
+	struct gpio_desc *rw_gpio;
+	struct gpio_desc *cs_gpio;
+	struct gpio_descs *data_gpios;
+
+	struct drm_bridge bridge;
+	struct tegra_cpu_bridge_dbi_output output;
+
+	u32 spi_init_seq[4];
+	u32 bus_width;
+	bool prepared;
+};
+
+static inline struct tegra_cpu_bridge_priv *mipi_dbi_to_tegra_cpu_bridge(struct mipi_dbi *dbi)
+{
+	return container_of(dbi, struct tegra_cpu_bridge_priv, dbi);
+}
+
+static inline struct tegra_cpu_bridge_priv *bridge_to_tegra_cpu_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tegra_cpu_bridge_priv, bridge);
+}
+
+static void tegra_cpu_bridge_write(struct tegra_cpu_bridge_priv *priv, u8 type, u8 value)
+{
+	DECLARE_BITMAP(value_bitmap, 8);
+
+	value_bitmap[0] = value;
+
+	gpiod_set_value(priv->dc_gpio, type);
+
+	gpiod_set_value(priv->cs_gpio, 0);
+	gpiod_set_value(priv->rw_gpio, 0);
+
+	gpiod_set_array_value(priv->data_gpios->ndescs, priv->data_gpios->desc,
+			      priv->data_gpios->info, value_bitmap);
+
+	gpiod_set_value(priv->cs_gpio, 1);
+	gpiod_set_value(priv->rw_gpio, 1);
+
+	udelay(10);
+}
+
+static int tegra_cpu_bridge_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *param, size_t num)
+{
+	struct tegra_cpu_bridge_priv *priv = mipi_dbi_to_tegra_cpu_bridge(dbi);
+	u8 command = *cmd;
+
+	tegra_cpu_bridge_write(priv, CPU_BRIDGE_COMMAND, command);
+
+	for (int i = 0; i < num; i++)
+		tegra_cpu_bridge_write(priv, CPU_BRIDGE_DATA, param[i]);
+
+	return 0;
+}
+
+static int tegra_cpu_bridge_prepare_gpios(struct tegra_cpu_bridge_priv *priv)
+{
+	struct device *dev = priv->dev;
+
+	if (priv->prepared)
+		return 0;
+
+	/*
+	 * Control and data GPIOs are shared between SPI and DPI. The bridge
+	 * driver must get and put the required GPIOs each time DCS commands
+	 * are transmitted.
+	 */
+
+	priv->data_gpios = devm_gpiod_get_array_optional(dev, "data", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->data_gpios)) {
+		dev_err(dev, "Failed to get data gpios %ld\n", PTR_ERR(priv->data_gpios));
+		return PTR_ERR(priv->data_gpios);
+	}
+
+	if (priv->data_gpios && priv->data_gpios->ndescs > CPU_BRIDGE_DATA_PINS_MAX) {
+		dev_err(dev, "Too many data gpios\n");
+		return -EINVAL;
+	}
+
+	priv->cs_gpio = devm_gpiod_get_optional(dev, "cs", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->cs_gpio)) {
+		dev_err(dev, "Failed to get CS GPIO: %ld\n", PTR_ERR(priv->cs_gpio));
+		return PTR_ERR(priv->cs_gpio);
+	}
+
+	priv->rw_gpio = devm_gpiod_get_optional(dev, "rw", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->rw_gpio)) {
+		dev_err(dev, "Failed to get RW GPIO: %ld\n", PTR_ERR(priv->rw_gpio));
+		return PTR_ERR(priv->rw_gpio);
+	}
+
+	priv->dc_gpio = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->dc_gpio)) {
+		dev_err(dev, "Failed to get DC GPIO: %ld\n", PTR_ERR(priv->dc_gpio));
+		return PTR_ERR(priv->dc_gpio);
+	}
+
+	priv->prepared = true;
+
+	return 0;
+}
+
+static void tegra_cpu_bridge_atomic_enable(struct drm_bridge *bridge,
+					   struct drm_atomic_commit *state)
+{
+	struct tegra_cpu_bridge_priv *priv = bridge_to_tegra_cpu_bridge(bridge);
+	struct tegra_dc *dc = priv->dc;
+	u32 value;
+	int ret;
+
+	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+	value &= ~DISP_CTRL_MODE_MASK;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+
+	/* Disable all options except cursor if enabled */
+	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
+	value &= CURSOR_ENABLE;
+	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
+
+	tegra_dc_commit(dc);
+
+	tegra_dc_writel(dc, V_PULSE1_ENABLE, DC_DISP_DISP_SIGNAL_OPTIONS0);
+	tegra_dc_writel(dc, PULSE_POLARITY_LOW, DC_DISP_V_PULSE1_CONTROL);
+
+	tegra_dc_writel(dc, PULSE_END(1), DC_DISP_V_PULSE0_POSITION_A);
+	tegra_dc_writel(dc, 0, DC_DISP_V_PULSE0_POSITION_B);
+	tegra_dc_writel(dc, 0, DC_DISP_V_PULSE0_POSITION_C);
+
+	value = 1 << FRAME_INIT_SEQ_CYCLES_SHIFT |
+		DC_SIGNAL_VPULSE1 << INIT_SEQ_DC_SIGNAL_SHIFT |
+		INIT_SEQUENCE_MODE_PLCD | SEND_INIT_SEQUENCE;
+	tegra_dc_writel(dc, value, DC_DISP_INIT_SEQ_CONTROL);
+
+	tegra_dc_writel(dc, priv->spi_init_seq[0], DC_DISP_SPI_INIT_SEQ_DATA_A);
+	tegra_dc_writel(dc, priv->spi_init_seq[1], DC_DISP_SPI_INIT_SEQ_DATA_B);
+	tegra_dc_writel(dc, priv->spi_init_seq[2], DC_DISP_SPI_INIT_SEQ_DATA_C);
+	tegra_dc_writel(dc, priv->spi_init_seq[3], DC_DISP_SPI_INIT_SEQ_DATA_D);
+
+	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+	value &= ~DISP_CTRL_MODE_MASK;
+	value |= DISP_CTRL_MODE_C_DISPLAY;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+
+	/* set LDC pin to V Pulse 1 */
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
+	value |= LDC_OUTPUT_SELECT_V_PULSE1;
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
+
+	value = SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+		SC0_V_QUALIFIER(SC_V_QUALIFIER_VACTIVE) |
+		SC0_H_QUALIFIER(SC_H_QUALIFIER_HACTIVE);
+	tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
+
+	value = tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
+	value &= ~BASE_COLOR_SIZE_MASK;
+
+	switch (priv->bus_width) {
+	case 16:
+		value |= BASE_COLOR_SIZE_565;
+		break;
+	case 18:
+		value |= BASE_COLOR_SIZE_666;
+		break;
+	case 24:
+	default:
+		value |= BASE_COLOR_SIZE_888;
+		break;
+	}
+
+	tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
+
+	ret = tegra_cpu_bridge_prepare_gpios(priv);
+	if (ret)
+		return;
+
+	if (priv->output.panel)
+		drm_panel_enable(priv->output.panel);
+
+	gpiod_set_value(priv->cs_gpio, 0);
+
+	devm_gpiod_put(priv->dev, priv->dc_gpio);
+	devm_gpiod_put(priv->dev, priv->rw_gpio);
+	devm_gpiod_put(priv->dev, priv->cs_gpio);
+
+	devm_gpiod_put_array(priv->dev, priv->data_gpios);
+	priv->prepared = false;
+}
+
+static void tegra_cpu_bridge_atomic_disable(struct drm_bridge *bridge,
+					    struct drm_atomic_commit *state)
+{
+	struct tegra_cpu_bridge_priv *priv = bridge_to_tegra_cpu_bridge(bridge);
+	int ret;
+
+	ret = tegra_cpu_bridge_prepare_gpios(priv);
+	if (ret)
+		return;
+
+	if (priv->output.panel)
+		drm_panel_disable(priv->output.panel);
+
+	gpiod_set_value(priv->cs_gpio, 0);
+
+	devm_gpiod_put(priv->dev, priv->dc_gpio);
+	devm_gpiod_put(priv->dev, priv->rw_gpio);
+	devm_gpiod_put(priv->dev, priv->cs_gpio);
+
+	devm_gpiod_put_array(priv->dev, priv->data_gpios);
+	priv->prepared = false;
+}
+
+static int tegra_cpu_bridge_atomic_check(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/* Set safe default bus flags if panel does not specify them */
+	if (!bridge_state->input_bus_cfg.flags)
+		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
+
+	/* Default to positive sync */
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PHSYNC;
+
+	if (!(adjusted_mode->flags &
+	      (DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC)))
+		adjusted_mode->flags |= DRM_MODE_FLAG_PVSYNC;
+
+	return 0;
+}
+
+static int tegra_cpu_bridge_attach(struct drm_bridge *bridge,
+				   struct drm_encoder *encoder,
+				   enum drm_bridge_attach_flags flags)
+{
+	struct tegra_cpu_bridge_priv *priv = bridge_to_tegra_cpu_bridge(bridge);
+	struct device_node *rgb_node, *dc_node;
+	struct platform_device *dc_pdev;
+
+	rgb_node = of_graph_get_remote_node(dev_of_node(priv->dev), 0, 0);
+	if (!rgb_node)
+		return -ENODEV;
+
+	dc_node = of_get_parent(rgb_node);
+	of_node_put(rgb_node);
+	if (!dc_node)
+		return -ENODEV;
+
+	dc_pdev = of_find_device_by_node(dc_node);
+	of_node_put(dc_node);
+	if (!dc_pdev)
+		return -ENODEV;
+
+	priv->dc = platform_get_drvdata(dc_pdev);
+	if (!priv->dc)
+		return -ENODEV;
+
+	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
+				 flags);
+}
+
+static enum drm_mode_status
+tegra_cpu_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	if (mode->hdisplay > 800)
+		return MODE_H_ILLEGAL;
+
+	if (mode->vdisplay > 800)
+		return MODE_V_ILLEGAL;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs tegra_cpu_bridge_funcs = {
+	.attach = tegra_cpu_bridge_attach,
+	.mode_valid = tegra_cpu_bridge_mode_valid,
+
+	.atomic_enable = tegra_cpu_bridge_atomic_enable,
+	.atomic_disable = tegra_cpu_bridge_atomic_disable,
+	.atomic_check = tegra_cpu_bridge_atomic_check,
+
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+};
+
+static const struct drm_bridge_timings default_tegra_cpu_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_DE_HIGH,
+};
+
+static int tegra_cpu_bridge_probe(struct platform_device *pdev)
+{
+	struct tegra_cpu_bridge_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct device_node *ep;
+	int ret;
+
+	priv = devm_drm_bridge_alloc(dev, struct tegra_cpu_bridge_priv, bridge,
+				     &tegra_cpu_bridge_funcs);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->dev = dev;
+
+	ret = device_property_read_u32_array(dev, "nvidia,init-sequence",
+					     priv->spi_init_seq, 4);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get init sequence\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to probe children\n");
+
+	/* Initialize MIPI DBI interface */
+	mutex_init(&priv->dbi.cmdlock);
+	priv->dbi.command = tegra_cpu_bridge_dbi_command;
+
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, &bridge);
+	if (ret)
+		return ret;
+
+	if (panel) {
+		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
+							 DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
+
+	priv->output.bridge = bridge;
+	priv->output.panel = panel;
+
+	/* get input ep (port0/endpoint0) */
+	ret = -EINVAL;
+	ep = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (ep) {
+		ret = of_property_read_u32(ep, "bus-width", &priv->bus_width);
+		of_node_put(ep);
+	}
+
+	if (ret)
+		priv->bus_width = 24;
+
+	priv->bridge.of_node = np;
+	priv->bridge.timings = &default_tegra_cpu_bridge_timings;
+
+	drm_bridge_add(&priv->bridge);
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static void tegra_cpu_bridge_remove(struct platform_device *pdev)
+{
+	struct tegra_cpu_bridge_priv *priv = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&priv->bridge);
+	if (priv->output.panel)
+		drm_panel_bridge_remove(priv->output.bridge);
+}
+
+static const struct of_device_id tegra_cpu_bridge_of_match[] = {
+	{ .compatible = "nvidia,tegra-8bit-cpu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra_cpu_bridge_of_match);
+
+static struct platform_driver tegra_cpu_bridge_driver = {
+	.driver = {
+		.name = "tegra-cpu-bridge",
+		.of_match_table = tegra_cpu_bridge_of_match,
+	},
+	.probe = tegra_cpu_bridge_probe,
+	.remove = tegra_cpu_bridge_remove,
+};
+module_platform_driver(tegra_cpu_bridge_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Nvidia Tegra20/30 RGB to MIPI-DBI bridge driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

