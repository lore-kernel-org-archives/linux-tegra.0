Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE2736B928
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131502; cv=none; b=cTBGNFL4O5565UUVgWsZfcaeGmK29MB3Xv8ftV8lMTzWmv0FHA8GW+aIwhv+HbhYG9rfz01itp8F9VRT2jLSbeQurJq5Ct8HWiIM+3h84vUp3zeST7cGMctvHCd9aMNxnWF3RBeJ4BvIRMEoOQ01CibH7aCctaCGS41Mp3lIpCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131502; c=relaxed/simple;
	bh=hJ0AMOGpkVFh6tes6vr7WU2o0dH32OgRrFS165gUJos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e00nvbUh4/1F68J6mpvpZDiaoIaAjz/9Dpm873JC4HV2tz+5pDTMg9XwAtzB/Gh7eGTIkX0BZjQ9jzxvqd90bPE4JmfSJCSpxX/1R8jNXYKxEF4YRi/4rvw1AY+RINYAOiQ36PeWXWvhzhB1lMsdDjLyB3a106iiLfE2vZvv7Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFOiOMhC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFOiOMhC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so10632085e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131495; x=1791736295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRpRmCoE6+LjitLhlbODWGYkYqkKhVTLS9Y1oXVDxFE=;
        b=cFOiOMhCEulEg4+Db55TnPjxWKNAfVY5yzovp6dyHI0JU663+RcqZqbY2JNBk/dAaL
         JDVfmZGX7EOv9v+s7fKXhoVy+jRexi58RcMKHuYEx3dBTUDMDPqIl1ydBfKDGmMvAzNW
         U6ktd3S4QpQO78WZ2P6VirwiSDUGGKaoaQnrKQYOwxuJsDoS0Wp6dwRINrJv6Hxl3ae2
         IAgmXZXUAs9VaOhm2bBxqm6Jpj9yPX6/js6mUiZNe1VBLBbF8QF0FfWsFiZSrmWbBqUZ
         XY6v/RmyLFUpZCckHcYaVWr5A4pyZ7URZnZFVNrinL9PIxl+boCEEYEdfHJ9R3xpnWd+
         h72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131495; x=1791736295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BRpRmCoE6+LjitLhlbODWGYkYqkKhVTLS9Y1oXVDxFE=;
        b=ovlOxGOCJdyhYcZ7S8qpMER+kRL5rg+8Az6xaOE7EqQfDfTvtg2oXWJPCImDIH24rw
         +ZpwHpH7127LlZq5wHQGD3PiBlANmzjX9XZvd6WyA2vPE/H419Ye97gF+DWrbpEmowNs
         Wg07JUbbGBC4hEbWWsAay+94KynIzObS32fxn7n/tmDFnD3jOaMYR2mr2bzEXiRC2zpc
         i5IjgsOzgmi1JTYoGhzPMosxv2paHWDDa8j/1avY3vWBvDao5qUmi4/7BKk8bNiHD4Ac
         iHTISJsSYXKYm6OrcAyCcz6VeZgN2uePGOiRlnWTZ9Ksjdr1UHtzlzZGUiZl4Nju4O65
         hkyw==
X-Forwarded-Encrypted: i=1; AKwUvBxt8n1uWzMDOBtEXLzvCyCwORMurPE+dXyFYoJnJktF0LZKVq92lOwcdtmemtWVEb70W5wIN+avWBGrew==@vger.kernel.org
X-Gm-Message-State: AFuF++nEU6kGsdBB2cHIkawQD3SsWobTGHELEmSApOCV2Os7hqdGkqQG
	3CnaCRE1Xl4/sB0ilbUN2muMxUkzkvOdAUzCs3YwbKnXo+RCcUmPl+l6
X-Gm-Gg: AYBFou2bkVH8KLBYyldnoyuCTIyjQKWFxQC17Yo2ON0SXbwp2G4GNg71l2rhcJ3QnI/
	xFz1B6F8pELVwdiSYBifD2MuvQEsxRYNjnFC/alL3OpYFRS5TX6VtTaEaVu2UayYcn87mrUCKL7
	cDcpjqt4saFEBGyI+tlzAcXMYxzrFTDai2GqT8BhxOuYbUZ7zV7+HFoc7WmrIHn/VKU5a9ThGe+
	MkHxxL0ZcIwC7sU0W7oFd73ohSqYLJVtuFdDfixm3Pm+yZb6vanMNQdOQ3dDQnAjkAQwJHdTzUf
	B099oDvCsT4JO4IGUPSQ+JwOAJtAR5domqKi63yYOkhDjrtkDQwG0w28GUXtN0X9qUpUypTI4Iw
	GdL1CF9X2we8+qdTa6RlxgY3yJ+BU1fotuGexZOfj9WxmMnFDpYQ3ERazWYCSW2HYUpQoGM37Za
	EaKJam39Zv+x+doq5c3fSnWtwNshVxFWmgBvfI3nJlwni33NsmsufvE6n+YtEp5CUu8wUamuuS3
	qjhUy2LEPULptcif1Nz
X-Received: by 2002:a05:600c:3103:b0:4a0:1efa:c746 with SMTP id 5b1f17b1804b1-4a1680f61damr68822115e9.21.1791131494674;
        Sun, 04 Oct 2026 09:31:34 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:34 -0700 (PDT)
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
Subject: [PATCH v2 4/7] drm/tegra: Add support for 8-bit CPU interface
Date: Sun,  4 Oct 2026 19:31:11 +0300
Message-ID: <20261004163114.181800-5-clamor95@gmail.com>
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

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'. Each display controller provides two such interfaces, which
can be used to send MIPI DCS commands to initialize and control the panel
while image data is transmitted via 16/18/24-line RGB.

The '8-bit CPU', although being the DC interface, is modeled using a
bridge framework for flexibility and convenience. This implementation does
not change the existing codebase besides registering a fragment and can be
enabled/disabled without losing other Tegra DRM functionality.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig  |   7 +
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/dbi.c    | 416 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c     |  21 ++
 drivers/gpu/drm/tegra/dc.h     |   1 +
 5 files changed, 446 insertions(+)
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 8a3b16aac5d68..3258e077d6666 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -30,6 +30,13 @@ config DRM_TEGRA
 
 if DRM_TEGRA
 
+config DRM_TEGRA_DBI
+	bool "Enable MIPI DBI type B communication protocol for Tegra 20/30"
+	help
+	  Tegra20 and Tegra30 feature 8 bit CPU driver panel control
+	  protocol (similar to MIPI DBI Type B). This option allows use
+	  it to set up and control compatible panel.
+
 config DRM_TEGRA_DEBUG
 	bool "NVIDIA Tegra DRM debug support"
 	help
diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index e399b40d64a1d..4850aa1c56ba3 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -31,5 +31,6 @@ tegra-drm-y := \
 tegra-drm-y += trace.o
 
 tegra-drm-$(CONFIG_DRM_FBDEV_EMULATION) += fbdev.o
+tegra-drm-$(CONFIG_DRM_TEGRA_DBI) += dbi.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/dbi.c b/drivers/gpu/drm/tegra/dbi.c
new file mode 100644
index 0000000000000..74a1051b86778
--- /dev/null
+++ b/drivers/gpu/drm/tegra/dbi.c
@@ -0,0 +1,416 @@
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
+#include <linux/property.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+
+#include <video/mipi_display.h>
+
+#include "dc.h"
+
+#define TEGRA_DBI_COMMAND			0
+#define TEGRA_DBI_DATA				1
+#define TEGRA_DBI_DATA_PINS_MAX			8
+
+struct tegra_dbi_output {
+	struct drm_panel *panel;
+	struct drm_bridge *bridge;
+};
+
+struct tegra_dbi_priv {
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
+	struct tegra_dbi_output output;
+
+	u32 spi_init_seq[4];
+	u32 bus_width;
+	u32 idx;
+	bool prepared;
+};
+
+static inline struct tegra_dbi_priv *mipi_dbi_to_tegra_dbi(struct mipi_dbi *dbi)
+{
+	return container_of(dbi, struct tegra_dbi_priv, dbi);
+}
+
+static inline struct tegra_dbi_priv *bridge_to_tegra_dbi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tegra_dbi_priv, bridge);
+}
+
+static void tegra_dbi_write(struct tegra_dbi_priv *priv, u8 type, u8 value)
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
+static int tegra_dbi_dbi_command(struct mipi_dbi *dbi, u8 *cmd, u8 *param, size_t num)
+{
+	struct tegra_dbi_priv *priv = mipi_dbi_to_tegra_dbi(dbi);
+	u8 command = *cmd;
+
+	if (!priv->data_gpios)
+		return 0;
+
+	tegra_dbi_write(priv, TEGRA_DBI_COMMAND, command);
+
+	for (int i = 0; i < num; i++)
+		tegra_dbi_write(priv, TEGRA_DBI_DATA, param[i]);
+
+	return 0;
+}
+
+static int tegra_dbi_prepare_gpios(struct tegra_dbi_priv *priv)
+{
+	struct device *dev = priv->dev;
+	int ret;
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
+	priv->cs_gpio = gpiod_get(dev, "cs", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->cs_gpio)) {
+		dev_err(dev, "Failed to get CS GPIO: %ld\n", PTR_ERR(priv->cs_gpio));
+		return PTR_ERR(priv->cs_gpio);
+	}
+
+	priv->rw_gpio = gpiod_get(dev, "rw", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->rw_gpio)) {
+		ret = PTR_ERR(priv->rw_gpio);
+		dev_err(dev, "Failed to get RW GPIO: %d\n", ret);
+		goto free_cs;
+	}
+
+	priv->dc_gpio = gpiod_get(dev, "dc", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->dc_gpio)) {
+		ret = PTR_ERR(priv->dc_gpio);
+		dev_err(dev, "Failed to get DC GPIO: %d\n", ret);
+		goto free_rw;
+	}
+
+	priv->data_gpios = gpiod_get_array(dev, "data", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->data_gpios)) {
+		ret = PTR_ERR(priv->data_gpios);
+		dev_err(dev, "Failed to get data gpios %d\n", ret);
+		goto free_dc;
+	}
+
+	if (priv->data_gpios && priv->data_gpios->ndescs > TEGRA_DBI_DATA_PINS_MAX) {
+		ret = -EINVAL;
+		dev_err(dev, "Too many data gpios\n");
+		goto free_data;
+	}
+
+	priv->prepared = true;
+
+	return 0;
+
+free_data:
+	gpiod_put_array(priv->data_gpios);
+free_dc:
+	gpiod_put(priv->dc_gpio);
+free_rw:
+	gpiod_put(priv->rw_gpio);
+free_cs:
+	gpiod_put(priv->cs_gpio);
+
+	return ret;
+}
+
+static void tegra_dbi_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_commit *state)
+{
+	struct tegra_dbi_priv *priv = bridge_to_tegra_dbi(bridge);
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
+	ret = tegra_dbi_prepare_gpios(priv);
+	if (ret)
+		return;
+
+	if (priv->output.panel)
+		drm_panel_enable(priv->output.panel);
+
+	gpiod_set_value(priv->cs_gpio, 0);
+
+	gpiod_put(priv->dc_gpio);
+	gpiod_put(priv->rw_gpio);
+	gpiod_put(priv->cs_gpio);
+
+	gpiod_put_array(priv->data_gpios);
+	priv->prepared = false;
+}
+
+static void tegra_dbi_atomic_disable(struct drm_bridge *bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct tegra_dbi_priv *priv = bridge_to_tegra_dbi(bridge);
+	int ret;
+
+	ret = tegra_dbi_prepare_gpios(priv);
+	if (ret)
+		return;
+
+	if (priv->output.panel)
+		drm_panel_disable(priv->output.panel);
+
+	gpiod_set_value(priv->cs_gpio, 0);
+
+	gpiod_put(priv->dc_gpio);
+	gpiod_put(priv->rw_gpio);
+	gpiod_put(priv->cs_gpio);
+
+	gpiod_put_array(priv->data_gpios);
+	priv->prepared = false;
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
+	struct device *dev = priv->dev;
+
+	priv->dc = dev_get_drvdata(dev->parent);
+	if (!priv->dc)
+		return -ENODEV;
+
+	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
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
+static const struct drm_bridge_timings default_tegra_dbi_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_DE_HIGH,
+};
+
+static int tegra_dbi_probe(struct platform_device *pdev)
+{
+	struct tegra_dbi_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	struct device_node *ep;
+	int ret;
+
+	priv = devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge,
+				     &tegra_dbi_funcs);
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
+	priv->dbi.command = tegra_dbi_dbi_command;
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
+	priv->bridge.timings = &default_tegra_dbi_timings;
+
+	ret = devm_drm_bridge_add(dev, &priv->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add bridge\n");
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static struct platform_driver tegra_dbi_driver = {
+	.driver.name = "tegra-dbi",
+	.probe = tegra_dbi_probe,
+};
+module_platform_driver(tegra_dbi_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5c67928bcabfa..dae2b14f79e31 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3282,6 +3282,7 @@ static int tegra_dc_init_opp_table(struct tegra_dc *dc)
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	u64 dma_mask = dma_get_mask(pdev->dev.parent);
+	struct device_node *dbi_np;
 	struct tegra_dc *dc;
 	int err;
 
@@ -3382,6 +3383,23 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		}
 	}
 
+	dbi_np = of_get_available_child_by_name(pdev->dev.of_node, "dbi");
+	if (dbi_np) {
+		struct platform_device_info dbi_info = {
+			.parent = &pdev->dev,
+			.name = "tegra-dbi",
+			.id = PLATFORM_DEVID_AUTO,
+			.fwnode = of_fwnode_handle(dbi_np),
+			.of_node_reused = true,
+		};
+
+		dc->dbi = platform_device_register_full(&dbi_info);
+		of_node_put(dbi_np);
+		if (IS_ERR(dc->dbi))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dc->dbi),
+					     "Failed to create DBI device\n");
+	}
+
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV)
 		return dev_err_probe(&pdev->dev, err,
@@ -3418,6 +3436,9 @@ static void tegra_dc_remove(struct platform_device *pdev)
 
 	tegra_dc_rgb_remove(dc);
 
+	if (dc->dbi)
+		platform_device_unregister(dc->dbi);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 7005df32f485f..27dbee57f8f72 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -95,6 +95,7 @@ struct tegra_dc {
 
 	struct tegra_output *rgb;
 	struct tegra_pmc *pmc;
+	struct platform_device *dbi;
 
 	struct tegra_dc_stats stats;
 	struct list_head list;
-- 
2.53.0

