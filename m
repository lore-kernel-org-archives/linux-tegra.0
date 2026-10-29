Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287792;
	b=qB1mrZA/cnriJjFmCn3GfhiD/0V5ZNl3clRUOdemZ+oXHoZZ1zz3DNhNKQEbPGL7xBCN
	 KEg2hmSrcg4XwY5+YzN+CeF/DU1dQc9eDVMQjnYhhVFIgUkOgMPRL43OzJ9UIKpGOWmMQ
	 HWKGaFtxguF+BsmtJjHx5LZAnugTIP4lqjD3b9thWp924AFp7H8piGvdwO9imGITtM65e
	 w9MeYx+EzkqvS4xT8evmb90fM9z0Jm/qsd9PvY5JcmUSUqsQlZFEjknA4/n/1sXTwd84f
	 kkm24PQM8gNWdQOTX3z779+Pwew9NWFrb52vyPIV20S8kFHFSHcB2PyTJoQBb+xRvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n20yp1WfOkKyJcvfjNoh+sYbq2k8HN+gg6g++LCKhag=;
	b=ulaMmw1RkXxjRsb3bcn7nfLXbmOp28h+65+LlBTcvZis2zoqBwVLS4ZVxsu+BxAnq03x
	 714v5KscWH5bcgTP/W1f5UBp8o4fPxw16X9kFB8456QSsBvZ41QSp2OErbSlcFTsXoVHt
	 h3V1kJzNBuPihAWjoSry1RaP05axnRGIp6V2v6CzFpNob53HcATYke3e2224VA8WHYj/U
	 PBFxH2akpVUBwIT+Qn/wHdN9CfKlWhuLqX9XN5M27r0Wkb1+DL2JkB/RsEmYvHL2eyw8k
	 J1Wiohtj0sBE+J/ySXWSSpPyUP61V23QPQvhcoR45Z7YscZBHvSTvUqcL/8CiAF563w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NA6r896v;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21E4606A331
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NA6r896v
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3395693a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287790; x=1793892590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n20yp1WfOkKyJcvfjNoh+sYbq2k8HN+gg6g++LCKhag=;
        b=NA6r896vwIR+nWDU6vvh+wTLpQPICZx+ug2L4FB+ikGYFZHED1itQp0lFFjM6EVmhG
         gGobCJ9+NxZHpOscDg4qzf86WdylQDRtBh9txMGIaEoKeOcSQiseUazYM+Do6i9BrEKU
         iUZkSVLwRPfumVavILw+/XOSHYus2PzbBw3XWmPNCeaG4xMEZyym4kJHIGe3B52+GRsk
         W1IvrQZ5QMDZQaJ5Gdzpwf2YSV7IYA6pHcplrwwGFP8Eb8fosR0aRMcsRHE/MlHxmmAo
         dvmXF1G48bkjx+dVBnZ728QZySDCRsEpNcsqEdFpcBf/3n2YbTIDk1hF0mX7GNNJoPpu
         vIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287790; x=1793892590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n20yp1WfOkKyJcvfjNoh+sYbq2k8HN+gg6g++LCKhag=;
        b=iHou/gww24HBd8LepJA+BUzP4aijXehdEQeSjW5byq6VAS4QbJHrhTQCtFg2JT7BaD
         jNkfIC4Q++VgJdEbtf3lzKRRH+NfXbg4ZWD9zkulmYevpdx9tguN49oCxEASnHjtrqWK
         RLTF9wqUVHLd362NCXkj9F/7WLDZSY8p1Kyx2g6CRyzeFayhW1kOhII7J30NjyMMUyL9
         iFL9d7PtJl3HDaDbJXBG7wMP6T+5C5vCAuVTYWR54OCv/GmJ+mTHvsrfIDZScTPRhxyq
         GJrVp8dqjZ3HcctIEwGY7GtJujLqGbgDp6hEPifcxvjEr+izsH2N0U4wJJthGZELvjqG
         jgFA==
X-Forwarded-Encrypted: i=1; AKwUvBws0yj2BZUOg6AS1tN2IjzXDPTsKyzjpdlFeWPjfI/MxGparqRTrENUvCUOVbjdP8sUinEVKaul9eracg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLuTKih7W5QXtk1EPJOxUaDtVCcYQFUDBCE/5owt8lmhw5UindK
	oANaCPaHU0QbqqUh2QwgGU9ZfkKkWEpT4zsneQ5fR17HZhqtKutNrgKt
X-Gm-Gg: AYBFou0LKmxNa/76nPOT5KqlBfoT6ykUeeQGu7WbhzG+2bGyUmSf6DcXMzCyy/IHwB7
	d9db+o6U2b9VDR2TCzrWRm2WMa52qF4QHmotcrp68Dl94WGv18R5+0WlVbOcsgXe+NJVVsIZ4Vd
	Jz/beYLHtZVJljpS8thH6R7QOmOwngSupBp+G1z57AIvXmvszwEIdemCzKrSs3/VY78RH6ZcrdC
	2F1y9MPKyPP0zfai6N09Qle8wm0wGOdlroX1IBG3E4OO1hZMzWQgrkSU2fFoUwiDi5XZC3BEzgT
	Bb9Dfusoqo+xur0oKhMXvqirADoH+YKKSnbeeFupgVjlULE36+wIu85uaMA3bjdO9bGI6/EwfBj
	5FOnWniffBOdTutEjDV3o11gxzpscWIkTtRsktljPYpe9HMVMC2Oh0IMQmuNBnn4f05hHyQ5s/c
	DgUV5+TnFM4Xprp3KAmKkDSZh3Wngi4l4113L5AkXt6p/VgDoi1lj4/7Pdt82JYwZA7F04dCvsr
	LYawC5kGooseuS3cRpPqIJvsRSCEkGXCg5/2eR14Fr4gCj2ZUF1Gmx9MHAFX1sX1ZcMgIudWKWd
	NU5z3VJdJ/F9xCd89p7bcfOOUB5TMv9fKDETYptD6qOTMqRBiA==
X-Received: by 2002:a17:906:ef07:b0:c3e:4f41:e2a6 with SMTP id a640c23a62f3a-c49bdd7dcd4mr513550366b.6.1793287789850;
        Thu, 29 Oct 2026 08:29:49 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:49 -0700 (PDT)
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
Subject: [PATCH v5 11/11] drm/tegra: Add support for 8-bit CPU interface
Date: Thu, 29 Oct 2026 17:29:09 +0200
Message-ID: <20261029152909.234584-12-clamor95@gmail.com>
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
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/dbi.c    | 632 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c     |   4 +
 drivers/gpu/drm/tegra/dc.h     |   3 +
 4 files changed, 640 insertions(+)
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

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
index 0000000000000..e129be0f21da5
--- /dev/null
+++ b/drivers/gpu/drm/tegra/dbi.c
@@ -0,0 +1,632 @@
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
+#define TEGRA_DBI_INTERFACE_MAX			2
+
+struct reg_entry {
+	u32 offset;
+	u32 value;
+};
+
+static const struct reg_entry com_pin_output[] = {
+	{ DC_COM_PIN_OUTPUT_ENABLE(0),   0 },
+	{ DC_COM_PIN_OUTPUT_ENABLE(1),   0 },
+	{ DC_COM_PIN_OUTPUT_ENABLE(2),   0 },
+	{ DC_COM_PIN_OUTPUT_ENABLE(3),   0 },
+	{ DC_COM_PIN_OUTPUT_POLARITY(0), 0 },
+	{ DC_COM_PIN_OUTPUT_POLARITY(1), 0 },
+	{ DC_COM_PIN_OUTPUT_POLARITY(2), 0 },
+	{ DC_COM_PIN_OUTPUT_POLARITY(3), 0 },
+	{ DC_COM_PIN_OUTPUT_DATA(0),     0 },
+	{ DC_COM_PIN_OUTPUT_DATA(1),     0 },
+	{ DC_COM_PIN_OUTPUT_DATA(2),     0 },
+	{ DC_COM_PIN_OUTPUT_DATA(3),     0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(0),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(1),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(2),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(3),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(4),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(5),   0 },
+	{ DC_COM_PIN_OUTPUT_SELECT(6),   0 },
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
+	const struct tegra_dbi_interface *index;
+	struct reg_entry com_pin_backup[ARRAY_SIZE(com_pin_output)];
+
+	u32 bus_width;
+	u32 reg;
+	bool active;
+};
+
+struct pin {
+	u32 reg;
+	u32 pos;
+};
+
+struct tegra_dbi_interface {
+	struct pin dc;
+	struct pin rw;
+	struct pin cs;
+	struct pin data[TEGRA_DBI_DATA_PINS_MAX];
+};
+
+static const struct tegra_dbi_interface tegra_dbi_idx[TEGRA_DBI_INTERFACE_MAX] = {
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
+	},
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
+static void tegra_dbi_pin_set(struct tegra_dc *dc, const struct pin *pin, bool value)
+{
+	u32 val = BIT(pin->pos + 1); /* unmask is 1 bit above position */
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
+	const struct tegra_dbi_interface *idx = priv->index;
+
+	tegra_dbi_pin_set(dc, &idx->dc, signal);
+
+	tegra_dbi_pin_set(dc, &idx->cs, 0);
+	tegra_dbi_pin_set(dc, &idx->rw, 0);
+
+	for (int i = 0; i < TEGRA_DBI_DATA_PINS_MAX; i++)
+		tegra_dbi_pin_set(dc, &idx->data[i], field_get(BIT(i), value));
+
+	tegra_dbi_pin_set(dc, &idx->cs, 1);
+	tegra_dbi_pin_set(dc, &idx->rw, 1);
+
+	udelay(10);
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
+	struct device *dev = priv->dev;
+	struct drm_bridge *bridge;
+	struct device_node *ep;
+	int ret;
+
+	bridge = of_drm_get_bridge_by_endpoint(dev_of_node(dev), 1, -1);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	bridge->type = DRM_MODE_CONNECTOR_DPI;
+	priv->next_bridge = bridge;
+
+	/* get input ep (port0/endpoint0) */
+	ret = -EINVAL;
+	ep = of_graph_get_endpoint_by_regs(dev_of_node(dev), 0, 0);
+	if (ep) {
+		ret = of_property_read_u32(ep, "bus-width", &priv->bus_width);
+		of_node_put(ep);
+	}
+
+	if (ret)
+		priv->bus_width = 24;
+
+	return devm_drm_bridge_add(dev, &priv->bridge);
+}
+
+static void tegra_dbi_host_detach(struct mipi_dbi_host *host, struct mipi_dbi_device *dbidev)
+{
+	struct tegra_dbi_priv *priv = dbi_host_to_tegra_dbi(host);
+
+	drm_bridge_remove(&priv->bridge);
+	drm_bridge_put(priv->next_bridge);
+}
+
+static const struct mipi_dbi_host_ops tegra_dbi_host_ops = {
+	.attach = tegra_dbi_host_attach,
+	.detach = tegra_dbi_host_detach,
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
+	 /* Init cycle 1: WRITE_MEMORY_START, set LCD_PCLK and COMMAND */
+	tegra_dc_writel(dc, MIPI_DCS_WRITE_MEMORY_START, DC_DISP_SPI_INIT_SEQ_DATA_A);
+	tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_B);
+	tegra_dc_writel(dc, 0x0, DC_DISP_SPI_INIT_SEQ_DATA_C);
+	tegra_dc_writel(dc, BIT(12) | BIT(14), DC_DISP_SPI_INIT_SEQ_DATA_D);
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
+	/*
+	 * Backup registers before unshadowing since actual register values
+	 * may differ and their state backed up now is the correct one.
+	 */
+	for (int i = 0; i < ARRAY_SIZE(com_pin_output); i++)
+		priv->com_pin_backup[i].value = tegra_dc_readl(dc,
+			priv->com_pin_backup[i].offset);
+
+	/* Unshadow to set up command and data pins */
+	tegra_dc_writel(dc, WRITE_MUX | READ_MUX, DC_CMD_STATE_ACCESS);
+
+	if (priv->reg)
+		tegra_dbi_init_secondary_interface(priv);
+	else
+		tegra_dbi_init_primary_interface(priv);
+
+	priv->active = true;
+
+	/*
+	 * DBI requires that the next bridge be enabled here in order to
+	 * send DCS commands, since the interface pins will subsequently be
+	 * reconfigured for video data.
+	 */
+	if (next_bridge->funcs && next_bridge->funcs->atomic_enable)
+		next_bridge->funcs->atomic_enable(next_bridge, state);
+
+	tegra_dbi_pin_set(dc, &priv->index->cs, 0);
+
+	priv->active = false;
+
+	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
+
+	for (int i = 0; i <  ARRAY_SIZE(com_pin_output); i++)
+		tegra_dc_writel(dc, priv->com_pin_backup[i].value,
+				priv->com_pin_backup[i].offset);
+
+	tegra_dc_commit(dc);
+
+	/* Set LDC pin to V Pulse 1 */
+	value = tegra_dc_readl(dc, DC_COM_PIN_OUTPUT_SELECT(6));
+	value |= PIN_OUTPUT_SELECT_F4(PIN_OUTPUT_SELECT_LDC);
+	tegra_dc_writel(dc, value, DC_COM_PIN_OUTPUT_SELECT(6));
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
+	struct drm_bridge *next_bridge = priv->next_bridge;
+	struct tegra_dc *dc = priv->dc;
+
+	for (int i = 0; i < ARRAY_SIZE(com_pin_output); i++)
+		priv->com_pin_backup[i].value = tegra_dc_readl(dc,
+			priv->com_pin_backup[i].offset);
+
+	tegra_dc_writel(dc, WRITE_MUX, DC_CMD_STATE_ACCESS);
+
+	if (priv->reg)
+		tegra_dbi_init_secondary_interface(priv);
+	else
+		tegra_dbi_init_primary_interface(priv);
+
+	priv->active = true;
+
+	/*
+	 * DBI requires that the next bridge be disabled here in order to
+	 * send DCS commands, since the interface pins will subsequently be
+	 * reconfigured for video data.
+	 */
+	if (next_bridge->funcs && next_bridge->funcs->atomic_disable)
+		next_bridge->funcs->atomic_disable(next_bridge, state);
+
+	priv->active = false;
+
+	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
+
+	for (int i = 0; i <  ARRAY_SIZE(com_pin_output); i++)
+		tegra_dc_writel(dc, priv->com_pin_backup[i].value,
+				priv->com_pin_backup[i].offset);
+
+	tegra_dc_commit(dc);
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
+static const struct drm_bridge_timings default_tegra_dbi_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			   DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE |
+			   DRM_BUS_FLAG_DE_HIGH,
+};
+
+static int tegra_dbi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mipi_dbi_device *dbidev;
+	struct tegra_dbi_priv *priv;
+	struct device_node *np;
+	int ret;
+
+	priv = devm_drm_bridge_alloc(dev, struct tegra_dbi_priv, bridge,
+				     &tegra_dbi_funcs);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	priv->dev = dev;
+
+	/* Default to primaty */
+	ret = device_property_read_u32(dev, "reg", &priv->reg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get reg\n");
+
+	if (priv->reg != 0 && priv->reg != 1)
+		return dev_err_probe(dev, -EINVAL, "Wrong reg value: %d\n", priv->reg);
+
+	priv->index = &tegra_dbi_idx[priv->reg];
+	memcpy(priv->com_pin_backup, com_pin_output, sizeof(com_pin_output));
+
+	/* Initialize MIPI DBI interface */
+	mutex_init(&priv->dbi.cmdlock);
+	priv->dbi.command = tegra_dbi_dbi_command;
+
+	priv->dbi_host.dev = dev;
+	priv->dbi_host.dbi = &priv->dbi;
+	priv->dbi_host.ops = &tegra_dbi_host_ops;
+
+	priv->bridge.of_node = dev_of_node(dev);
+	priv->bridge.timings = &default_tegra_dbi_timings;
+
+	np = of_graph_get_remote_node(dev_of_node(dev), 1, -1);
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
+
+static struct platform_driver tegra_dbi_driver = {
+	.driver.name = "tegra-dbi",
+	.probe = tegra_dbi_probe,
+};
+
+static void tegra_dbi_release(void *pdev)
+{
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&tegra_dbi_driver);
+}
+
+int devm_tegra_dc_dbi_init(struct device *dev)
+{
+	struct device_node *dbi_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev), "dbi");
+	struct platform_device_info dbi_info = { 0 };
+	struct platform_device *dbi;
+	int ret;
+
+	/* Missing node means that DBI is not used, continue */
+	if (!dbi_np)
+		return 0;
+
+	ret = platform_driver_register(&tegra_dbi_driver);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register DBI driver\n");
+
+	dbi_info.parent = dev;
+	dbi_info.name = "tegra-dbi";
+	dbi_info.id = PLATFORM_DEVID_AUTO;
+	dbi_info.fwnode = of_fwnode_handle(dbi_np);
+	dbi_info.of_node_reused = true;
+
+	dbi = platform_device_register_full(&dbi_info);
+	if (IS_ERR(dbi)) {
+		platform_driver_unregister(&tegra_dbi_driver);
+		return dev_err_probe(dev, PTR_ERR(dbi),
+				     "Failed to create DBI device\n");
+	}
+
+	ret = devm_add_action_or_reset(dev, tegra_dbi_release, dbi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 5bbf2c028edd8..768cf82776632 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3382,6 +3382,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = devm_tegra_dc_dbi_init(&pdev->dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to init DBI\n");
+
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV)
 		return dev_err_probe(&pdev->dev, err,
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 2b87bb675d4cf..3df49422a2bd1 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -177,6 +177,9 @@ void tegra_dc_rgb_remove(struct tegra_dc *dc);
 int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc);
 int tegra_dc_rgb_exit(struct tegra_dc *dc);
 
+/* from dbi.c */
+int devm_tegra_dc_dbi_init(struct device *dev);
+
 #define DC_CMD_GENERAL_INCR_SYNCPT		0x000
 
 #define DC_CMD_GENERAL_INCR_SYNCPT_CNTRL	0x001
-- 
2.53.0

