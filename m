Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841860;
	b=YD+XalHAf7vG+ICkODRlM0duZrcNRJvgaiDp17zmUtEfXjnVCLz2qgcV66RiDH07bs0S
	 q3q9sdYJUPYEd6hexfEZ7AAxuRamc6fplkg0csjKKRlD5Za4IX/YF8EgfaBzaZCU647be
	 LqhYlVKTcZ5YmfhHdoKQ4BW+JEbomTHNtYGttSfaeTpK7pxKbcnD9zK15cC4O8yuvSASd
	 mAFL+UkMbal/mY7lLLGiFQ1vXJFO4Wsi+Ygkl94EwbXSibPXXGOPYgd9PGhTD5NyPOEH4
	 Yf3KtkkRi0OYW47IIH9vGrncoeSGjz2p8bsX/tLCaWa6SL91DiXinXbgrGlc5WmOOyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xeEzjYCd9YXzYB9YWrkuQPalUwpiL4j26kXgSrrNjp4=;
	b=qBoi72/Ry2s75EpX54/hQd7xje5nH9iIui1+HuFMl9VBYIHF/10gTSJOdmGDQgwa+p6f
	 3IYhVQO5vLadt3LZmq9DIc1qy/fhj3y6e2JHbvfcELRgf5NMWpTGuVuTjOBS11/rYLx0P
	 8EFYPekbFHSHiaPJuJGHfqMiUv86DGjfHlbk/RuzoW9qZTTc67Pn7CBpkUZUFdGVMxmE7
	 T6MztLi7q/6g0LrtnnH1unLhz6unKbObRvL3WnFH9v3CxyiR1g/dz+LHEQgo3NMxRv1oA
	 /G8SMJMlAEqnggl/Ib3MOVpyw4/8A46VqGsH3tL3+32JAbnHbGqn8plSVu9ursycYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7SKjkba;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B8606A897
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573B8606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7SKjkba
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4682977f9aso520676166b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841858; x=1795446658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xeEzjYCd9YXzYB9YWrkuQPalUwpiL4j26kXgSrrNjp4=;
        b=R7SKjkbaae1B3nuG3IReJ6XU6eD7VMNmXMJ0dRvtoapVRY8QRHbwD+T3Sog1c2solH
         +nigvSArbcrJF1eSWmOMnzNqQuM84kFul5fHlAx6u0DdslLQzu9MPnBlcSiYnvLM4UMA
         Y+Mq5RZrF8eaGPXuWvsVHNxvWAk/0OOYUx5YnFmLt/V1J2Fgq5k8F4YZih+gs2ubw20I
         GcsrLJpHjrYoaRWPXw7ShGWP6f5lT9FlxAdcEJIcphkEuPjv8cbPgr5vaS8Cu7RXchRC
         kL1ciXUrB8u31pEWEPmsrJijwGx3kXUTp/26cMqi8T/E479QfGLbzip/JFqflr+m08of
         kR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841858; x=1795446658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeEzjYCd9YXzYB9YWrkuQPalUwpiL4j26kXgSrrNjp4=;
        b=QVJFI0PbmitD1YYHrWun12iiNcmsqXL8C9uG/OpggzIK6lXadM+gAo6xZrYhw66q9T
         zoSLqyCyBv8+x+5x9OgP6wKd3drMQ2o22qWdLkGQSjvSdZ9VF5ucx84/SaVAq9yO9fBL
         TlsMspruoSRSTFAg9D1vGY2u8uZVTDDbgLfDFP1HmI7G/bQCA01m/Z10wm4wJt80y+5p
         OtpaAID7TkTI6CSqs6cftmPwiD46fIPaXR/Fh1XDN9pUbkeMxR33I/IFO3dqSfoWsg/A
         AEp6KUQvWqTkmzAQ625k87++RCfaYX+g6p9OuX6BBf337VANzNB6AmP4W85TLvgD6IrE
         hAjQ==
X-Forwarded-Encrypted: i=1; AL+hErG6x2QpzSBOg4mEcYwxxbZJGBSZwCd7g2ZjxMA1uQcbEmKJlkgIur0z5WQNgbm5YIOHkvI5ZeoQRQEz0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8I8DYhbaaquQ18rfqqyThpnVyypmTveAYN5G/eZTmJACvWdUwi
	dMp+LUp+w9nx9dg5skAN92Cc0TDWPFXE4NaYyuawZhDM4Cvi23klzdmG
X-Gm-Gg: AYBFou2f7kvVbD+0p448tRfuyMDRNjwgTIjfgMNbp8FetWB9zyGyYPGDpZnWKH97UDY
	xHTHNOlR0XsYMipeGEB7pGj3mcuP55fNSZBGzLJsbwt9vbuwBv2p9US+tTHZ/0ZYBOhjj8YBNDj
	aTHvpstlqsbthhjneESwiJbtHX/Ba3RIVZBzGW2WRfw/nyMeH6NYpx0WC0piT9DTCfr/FfAUBqu
	iXsVLxSWAhyJV0rhUMzkDYJptPCke4rXRX7+s1devbV3uNGzFVO3jQ308av+GC1HESSuYSL8JGa
	BBKmbAzQfJ7HQe1JFhgWtgPCoj10+/XRdB4RrT0VpcqWBHiLHB0KjUgXmIGUK+GyjpPmb1mLDS9
	01/Ww1xEJBQqofxdgmm5WDADeGisn6CHkanLsIL+nCBx9274qRMBgyRMZktayExKm+xzPplTA8O
	wHEzIUQ32kRcwYoy0eFqzWR92IONXvP4PBRXmukze4y8H/y5mTi8ir17MdC0oPutG+koANZx9Tj
	/k4KmP7Nk4BUXVa8ye+k8DDN7slVTKM+UAIWtDGLN7yg0OhuJDjjGgFjMBIserrEXps1XwOZ7zh
	W2d3Pe4hFoEUr4QQsuCtfnHjphYJu4BicfgR7p0MLfU/m4R8btlWDSjwMpZQV7uGczQz/v8g9vD
	S4gq9WmMFtw==
X-Received: by 2002:a17:907:e98b:b0:c3f:dce3:20d5 with SMTP id a640c23a62f3a-c50963d4726mr956577966b.22.1794841857438;
        Mon, 16 Nov 2026 07:10:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/12] drm/tegra: Add support for 8-bit CPU interface
Date: Mon, 16 Nov 2026 17:10:17 +0200
Message-ID: <20261116151017.274764-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'. Each display controller provides two such interfaces, which
can be used to send MIPI DCS commands to initialize and control the panel
while image data is transmitted via 16/18/24-line RGB.

The '8-bit CPU', although being the DC interface, is modeled using a
bridge framework for flexibility and convenience. This implementation does
not change the existing codebase besides registering the bus.

Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # DC command transfer
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig  |   1 +
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/dbi.c    | 551 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c     |   4 +
 drivers/gpu/drm/tegra/dc.h     |   3 +
 5 files changed, 560 insertions(+)
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8a3b16aac5d68..6f57fd3985edc 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -12,6 +12,7 @@ config DRM_TEGRA
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_AUX_BUS
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DBI
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index e399b40d64a1d..ae7fccb3d6421 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -18,6 +18,7 @@ tegra-drm-y := \
 	hdmi.o \
 	mipi-phy.o \
 	dsi.o \
+	dbi.o \
 	sor.o \
 	dpaux.o \
 	gr2d.o \
diff --git a/drivers/gpu/drm/tegra/dbi.c b/drivers/gpu/drm/tegra/dbi.c
new file mode 100644
index 0000000000000..290e4c51dd3a7
--- /dev/null
+++ b/drivers/gpu/drm/tegra/dbi.c
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nvidia Tegra20/30 MIPI-DBI Type B host driver
+ *
+ * Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/property.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
+#include <drm/drm_of.h>
+
+#include <video/mipi_display.h>
+
+#include "dc.h"
+
+enum tegra_dbi_dc_signal {
+	TEGRA_DBI_COMMAND,
+	TEGRA_DBI_DATA
+};
+
+#define TEGRA_DBI_DATA_PINS_MAX			8
+#define TEGRA_DBI_DEFAULT_BUS_WIDTH		24
+
+static const u32 tegra_dbi_pin_regs[] = {
+	DC_COM_PIN_OUTPUT_ENABLE(0),
+	DC_COM_PIN_OUTPUT_ENABLE(1),
+	DC_COM_PIN_OUTPUT_ENABLE(2),
+	DC_COM_PIN_OUTPUT_ENABLE(3),
+	DC_COM_PIN_OUTPUT_POLARITY(0),
+	DC_COM_PIN_OUTPUT_POLARITY(1),
+	DC_COM_PIN_OUTPUT_POLARITY(2),
+	DC_COM_PIN_OUTPUT_POLARITY(3),
+	DC_COM_PIN_OUTPUT_DATA(0),
+	DC_COM_PIN_OUTPUT_DATA(1),
+	DC_COM_PIN_OUTPUT_DATA(2),
+	DC_COM_PIN_OUTPUT_DATA(3),
+	DC_COM_PIN_OUTPUT_SELECT(0),
+	DC_COM_PIN_OUTPUT_SELECT(1),
+	DC_COM_PIN_OUTPUT_SELECT(2),
+	DC_COM_PIN_OUTPUT_SELECT(3),
+	DC_COM_PIN_OUTPUT_SELECT(4),
+	DC_COM_PIN_OUTPUT_SELECT(5),
+	DC_COM_PIN_OUTPUT_SELECT(6),
+};
+
+struct tegra_dbi_priv {
+	struct device *dev;
+	struct tegra_dc *dc;
+
+	struct mipi_dbi dbi;
+	struct mipi_dbi_host dbi_host;
+
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+
+	const struct tegra_dbi_interface *interface;
+	u32 com_pin_backup[ARRAY_SIZE(tegra_dbi_pin_regs)];
+
+	u32 bus_width;
+	bool active;
+};
+
+struct tegra_dbi_pin {
+	u32 reg;
+	u32 pos;
+};
+
+struct tegra_dbi_interface {
+	struct tegra_dbi_pin dc;
+	struct tegra_dbi_pin rw;
+	struct tegra_dbi_pin cs;
+	struct tegra_dbi_pin data[TEGRA_DBI_DATA_PINS_MAX];
+	void (*init)(struct tegra_dbi_priv *priv);
+};
+
+static inline struct tegra_dbi_priv *mipi_dbi_to_tegra_dbi(struct mipi_dbi *dbi)
+{
+	return container_of(dbi, struct tegra_dbi_priv, dbi);
+}
+
+static inline struct tegra_dbi_priv *dbi_host_to_tegra_dbi(struct mipi_dbi_host *host)
+{
+	return container_of(host, struct tegra_dbi_priv, dbi_host);
+}
+
+static inline struct tegra_dbi_priv *bridge_to_tegra_dbi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tegra_dbi_priv, bridge);
+}
+
+static void tegra_dbi_pin_set(struct tegra_dc *dc, const struct tegra_dbi_pin *pin, bool value)
+{
+	u32 val = PIN_UNMASK(pin->pos);
+
+	if (value)
+		val |= BIT(pin->pos);
+
+	tegra_dc_writel(dc, val, pin->reg);
+}
+
+static void tegra_dbi_write(struct tegra_dbi_priv *priv,
+			    enum tegra_dbi_dc_signal signal, u8 value)
+{
+	struct tegra_dc *dc = priv->dc;
+	const struct tegra_dbi_interface *interface = priv->interface;
+
+	tegra_dbi_pin_set(dc, &interface->dc, signal);
+
+	tegra_dbi_pin_set(dc, &interface->cs, 0);
+	tegra_dbi_pin_set(dc, &interface->rw, 0);
+
+	for (int i = 0; i < TEGRA_DBI_DATA_PINS_MAX; i++)
+		tegra_dbi_pin_set(dc, &interface->data[i], field_get(BIT(i), value));
+
+	tegra_dbi_pin_set(dc, &interface->cs, 1);
+	tegra_dbi_pin_set(dc, &interface->rw, 1);
+}
+
+static int tegra_dbi_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *param, size_t num)
+{
+	struct tegra_dbi_priv *priv = mipi_dbi_to_tegra_dbi(dbi);
+	u8 command = *cmd;
+
+	/* Blocks all commands when interface is not active */
+	if (!priv->active)
+		return -ENODEV;
+
+	tegra_dbi_write(priv, TEGRA_DBI_COMMAND, command);
+
+	for (int i = 0; i < num; i++)
+		tegra_dbi_write(priv, TEGRA_DBI_DATA, param[i]);
+
+	return 0;
+}
+
+static int tegra_dbi_host_attach(struct mipi_dbi_host *host, struct mipi_dbi_device *dbidev)
+{
+	struct tegra_dbi_priv *priv = dbi_host_to_tegra_dbi(host);
+	struct drm_bridge *bridge;
+	struct device_node *ep;
+
+	bridge = of_drm_get_bridge_by_endpoint(priv->bridge.of_node, 1, -1);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	bridge->type = DRM_MODE_CONNECTOR_DPI;
+	priv->next_bridge = bridge;
+	priv->bus_width = TEGRA_DBI_DEFAULT_BUS_WIDTH;
+
+	/* get input ep (port0/endpoint0) */
+	ep = of_graph_get_endpoint_by_regs(priv->bridge.of_node, 0, 0);
+	if (ep) {
+		of_property_read_u32(ep, "bus-width", &priv->bus_width);
+		of_node_put(ep);
+	}
+
+	return 0;
+}
+
+static void tegra_dbi_host_detach(struct mipi_dbi_host *host, struct mipi_dbi_device *dbidev)
+{
+	struct tegra_dbi_priv *priv = dbi_host_to_tegra_dbi(host);
+
+	drm_bridge_put(priv->next_bridge);
+}
+
+static const struct mipi_dbi_host_ops tegra_dbi_host_ops = {
+	.attach = tegra_dbi_host_attach,
+	.detach = tegra_dbi_host_detach,
+};
+
+static void tegra_dbi_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_commit *state)
+{
+	struct tegra_dbi_priv *priv = bridge_to_tegra_dbi(bridge);
+	struct drm_bridge *next_bridge = priv->next_bridge;
+	struct tegra_dc *dc = priv->dc;
+	u32 value;
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
+	tegra_dc_writel(dc, PULSE_END(1), DC_DISP_V_PULSE1_POSITION_A);
+	tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_B);
+	tegra_dc_writel(dc, 0, DC_DISP_V_PULSE1_POSITION_C);
+
+	value = 1 << FRAME_INIT_SEQ_CYCLES_SHIFT |
+		DC_SIGNAL_VPULSE1 << INIT_SEQ_DC_SIGNAL_SHIFT |
+		INIT_SEQUENCE_MODE_PLCD | SEND_INIT_SEQUENCE;
+	tegra_dc_writel(dc, value, DC_DISP_INIT_SEQ_CONTROL);
+
+	/* Init cycle 1: WRITE_MEMORY_START, set LCD_PCLK and COMMAND */
+	tegra_dc_writel(dc, MIPI_DCS_WRITE_MEMORY_START, DC_DISP_SPI_INIT_SEQ_DATA_A);
+	tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_B);
+	tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_C);
+	tegra_dc_writel(dc, BIT(12) | BIT(14), DC_DISP_SPI_INIT_SEQ_DATA_D);
+
+	/* Set LDC pin to V Pulse 1 */
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDC);
+	value |= PIN_OUTPUT_SELECT_F4(PIN_OUTPUT_SELECT_LDC);
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
+		value |= BASE_COLOR_SIZE_888;
+		break;
+	default:
+		WARN(1, "%u bus width not supported\n", priv->bus_width);
+		value |= BASE_COLOR_SIZE_888;
+		break;
+	}
+
+	tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
+
+	/*
+	 * Backup registers before unshadowing since actual register values
+	 * may differ and their state backed up now is the correct one.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(tegra_dbi_pin_regs); i++)
+		priv->com_pin_backup[i] = tegra_dc_readl(dc, tegra_dbi_pin_regs[i]);
+
+	/* Unshadow to set up command and data pins */
+	tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
+
+	priv->interface->init(priv);
+
+	priv->active = true;
+
+	/*
+	 * DBI requires that the next bridge be enabled here in order to
+	 * send DCS commands, since the interface pins will subsequently be
+	 * reconfigured for video data.
+	 *
+	 * Using the prepare_prev_first flag in the panel will not work,
+	 * because the DBI bridge requires the panel to be enabled beforehand
+	 * for proper configuration.
+	 */
+	if (next_bridge->funcs && next_bridge->funcs->atomic_enable)
+		next_bridge->funcs->atomic_enable(next_bridge, state);
+
+	tegra_dbi_pin_set(dc, &priv->interface->cs, 0);
+
+	priv->active = false;
+
+	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
+
+	for (int i = 0; i <  ARRAY_SIZE(tegra_dbi_pin_regs); i++)
+		tegra_dc_writel(dc, priv->com_pin_backup[i],
+				tegra_dbi_pin_regs[i]);
+
+	tegra_dc_commit(dc);
+
+	value = tegra_dc_readl(dc, DC_CMD_DISPLAY_COMMAND);
+	value &= ~DISP_CTRL_MODE_MASK;
+	value |= DISP_CTRL_MODE_C_DISPLAY;
+	tegra_dc_writel(dc, value, DC_CMD_DISPLAY_COMMAND);
+}
+
+static void tegra_dbi_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct tegra_dbi_priv *priv = bridge_to_tegra_dbi(bridge);
+	struct tegra_dc *dc = priv->dc;
+
+	tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
+
+	priv->interface->init(priv);
+	priv->active = true;
+}
+
+static int tegra_dbi_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
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
+static int tegra_dbi_attach(struct drm_bridge *bridge,
+			    struct drm_encoder *encoder,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct tegra_dbi_priv *priv = bridge_to_tegra_dbi(bridge);
+
+	return drm_bridge_attach(bridge->encoder, priv->next_bridge, bridge,
+				 flags);
+}
+
+static enum drm_mode_status tegra_dbi_mode_valid(struct drm_bridge *bridge,
+						 const struct drm_display_info *info,
+						 const struct drm_display_mode *mode)
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
+static const struct drm_bridge_funcs tegra_dbi_funcs = {
+	.attach = tegra_dbi_attach,
+	.mode_valid = tegra_dbi_mode_valid,
+
+	.atomic_enable = tegra_dbi_atomic_enable,
+	.atomic_disable = tegra_dbi_atomic_disable,
+	.atomic_check = tegra_dbi_atomic_check,
+
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+};
+
+static void tegra_dbi_init_primary_interface(struct tegra_dbi_priv *priv)
+{
+	struct tegra_dc *dc = priv->dc;
+	u32 value;
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_ENABLE(3));
+	value &= ~(BIT(PIN_LCSN) | BIT(PIN_LDC));
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_ENABLE(3));
+
+	/* Set LSC0/LCSN/LDC output polarity HIGH */
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_POLARITY(1));
+	value &= ~BIT(PIN_LSC0);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+	value &= ~(BIT(PIN_LCSN) | BIT(PIN_LDC));
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	value = PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD0) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD1) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD2) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD3) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD4) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD5) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD6) |
+		PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LD7);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(0));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(3));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LSC0);
+	value |= PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LSC0);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(3));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LCSN);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDC);
+	value |= PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LCSN) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LDC);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
+}
+
+static void tegra_dbi_init_secondary_interface(struct tegra_dbi_priv *priv)
+{
+	struct tegra_dc *dc = priv->dc;
+	u32 value;
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_ENABLE(2));
+	value &= ~(BIT(PIN_LDI) | BIT(PIN_LPP));
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_ENABLE(2));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(3));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPW0);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPW2);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LSC1);
+	value |= PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPW0) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPW2) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LSC1);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(3));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(4));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LHP0);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LHP1);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LVP0);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LVP1);
+	value |= PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LHP0) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LHP1) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LVP0) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LVP1);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(4));
+
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(5));
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LM0);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LM1);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LDI);
+	value &= ~PIN_OUTPUT_SELECT_MASK(PIN_OUTPUT_SELECT_LPP);
+	value |= PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LM0) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LM1) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LDI) |
+		 PIN_OUTPUT_SELECT_OUT(PIN_OUTPUT_SELECT_LPP);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(5));
+}
+
+static const struct tegra_dbi_interface tegra_dbi_idx[] = {
+	/* Nvidia Primary 8-bit CPU interface configuration */
+	{
+		.dc = { DC_COM_PIN_OUTPUT_DATA(3), PIN_LDC  },
+		.rw = { DC_COM_PIN_OUTPUT_DATA(1), PIN_LSC0 },
+		.cs = { DC_COM_PIN_OUTPUT_DATA(3), PIN_LCSN },
+		.data = {
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD0 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD1 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD2 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD3 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD4 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD5 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD6 },
+			{ DC_COM_PIN_OUTPUT_DATA(0), PIN_LD7 },
+		},
+		.init = tegra_dbi_init_primary_interface,
+	},
+	/* Nvidia Secondary 8-bit CPU interface configuration */
+	{
+		.dc = { DC_COM_PIN_OUTPUT_DATA(2), PIN_LVP0 },
+		.rw = { DC_COM_PIN_OUTPUT_DATA(1), PIN_LSC1 },
+		.cs = { DC_COM_PIN_OUTPUT_DATA(2), PIN_LM0  },
+		.data = {
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LHP1 },
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LM1  },
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LDI  },
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LPP  },
+			{ DC_COM_PIN_OUTPUT_DATA(1), PIN_LPW0 },
+			{ DC_COM_PIN_OUTPUT_DATA(1), PIN_LPW2 },
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LVP1 },
+			{ DC_COM_PIN_OUTPUT_DATA(2), PIN_LHP0 },
+		},
+		.init = tegra_dbi_init_secondary_interface,
+	},
+};
+
+static const struct drm_bridge_timings default_tegra_dbi_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_DE_HIGH,
+};
+
+int tegra_dc_dbi_probe(struct tegra_dc *dc)
+{
+	struct device *dev = dc->dev;
+	struct device_node *dbi_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev), "dbi");
+	struct mipi_dbi_device *dbidev;
+	struct tegra_dbi_priv *priv;
+	struct device_node *np;
+	u32 interface = 0;
+	int ret;
+
+	/* Missing node means that DBI is not used, continue DC probe */
+	if (!dbi_np)
+		return 0;
+
+	of_property_read_u32(dbi_np, "nvidia,interface", &interface);
+	if (interface != 0 && interface != 1)
+		return dev_err_probe(dev, -EINVAL, "Wrong interface value: %d\n", interface);
+
+	priv = devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge,
+				     &tegra_dbi_funcs);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->dc = dc;
+	priv->dev = dev;
+	priv->interface = &tegra_dbi_idx[interface];
+
+	/* Initialize MIPI DBI interface */
+	mutex_init(&priv->dbi.cmdlock);
+	priv->dbi.command = tegra_dbi_dbi_command;
+
+	priv->dbi_host.dev = dev;
+	priv->dbi_host.dbi = &priv->dbi;
+	priv->dbi_host.ops = &tegra_dbi_host_ops;
+
+	priv->bridge.of_node = of_node_get(dbi_np);
+	priv->bridge.timings = &default_tegra_dbi_timings;
+
+	ret = devm_drm_bridge_add(dev, &priv->bridge);
+	if (ret)
+		return ret;
+
+	np = of_graph_get_remote_node(dbi_np, 1, -1);
+	if (!np)
+		return -EINVAL;
+
+	dbidev = devm_mipi_dbi_device_register(dev, &priv->dbi_host, np);
+	of_node_put(np);
+	if (IS_ERR(dbidev))
+		return dev_err_probe(dev, PTR_ERR(dbidev),
+				     "Failed to register DBI device\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index c9df14544ced0..b491aa00bd101 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3381,6 +3381,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = tegra_dc_dbi_probe(dc);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to probe DBI\n");
+
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV)
 		return dev_err_probe(&pdev->dev, err,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index e8913c5530a2d..2847affa2532f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -177,6 +177,9 @@ void tegra_dc_rgb_remove(struct tegra_dc *dc);
 int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc);
 int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
+/* from dbi.c */
+int tegra_dc_dbi_probe(struct tegra_dc *dc);
+
 #define DC_CMD_GENERAL_INCR_SYNCPT		0x000
 #define DC_CMD_GENERAL_INCR_SYNCPT_CNTRL	0x001
 #define  SYNCPT_CNTRL_NO_STALL   (1 << 8)
-- 
2.53.0

