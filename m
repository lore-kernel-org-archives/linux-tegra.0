Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB53A1CEC
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485706; cv=none; b=n7FrWU0ctYgYyma3zafYKrHgE5CHUuE1Bdz9x6vt/hwD7QeFbOehedFMC0ezqPie5JAB/V/R1s2gYLgu0u+3uv3rrYfjzKqunAMXOzGaoNpPe0A6IgQpQTuNUodgPtvuqI8eSzKwDVmi69yUcodKQMnSy8l63XqF2nalpBT8YVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485706; c=relaxed/simple;
	bh=OcDBfkMlEDbmFVFQBsZ8hTUlSAeF53HzTvYoSiCHOnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iwaoz1l87Y0lf6ClZuPnmgs1n8dC++RcZQjwMOW926X6IXRgfzxF3iIyzDZV8FfJhp2JrIYq+wWZEXf892Ht9xpfmzKJ4/aEswceVX5P77wvWVcEOpYTXlIbYNp9QbJUCPFB0Y7X/hRpT/n/qMZOIoPaas65qQ/X2DPVVxrG9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb06tWor; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb06tWor"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso3401210e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485688; x=1779090488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=gb06tWoru1+Z//N1uOYj5auYDoNsrRsGQmDAbnd9CMq0Q3aiUW7ba1am8pSBRryo48
         Tl6yxM9/NZxxcOlt9wvRI6Vxd3L4OQpXUox2+QEpJ1BXtrbFNKu2iK23LkhHMOVUyzjC
         G6AFkFx2CBxNK2M/23N+fNCAO9nINuTOIfoMldu3xu9wc9wBQY9JZbMxR0kEHI8gJWqt
         s9mFv5Ba60hjtAlWhLlP1eo6KNRMmz3F8ckLrrZHpbDA6FXwNIhLkERMSxY2PYh/6SGl
         N+FZYVwU4VdTCYJL7Dd69yq8JQUdcK0a4wc1DV8Gw5s3xiMse4ek+3JK2UZgX62qlTO3
         qmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485688; x=1779090488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=fLwIzKoVewElbkXkZJxQavXbETcj1znO2Sz/JQ8Kr5r4dARwABan3fkhqS1MkqkLEu
         ZVf4dz5iuOBjKQW/AAgJMOCpgp0lfGN4p0gbmY1ZMgYNRmKS28U6/F0cboZCZlmqhWAZ
         iMv2ogemD2esOpMalpUhlk/Ou2TidevghfEeiPdz+3PCntNv2q1Ncm14YVrNuMbnXTRj
         LgQj+J7E1IdzImn8HrVMabTyHNAQh5iBhRdKqjjBk9PCBQASOsWNoBFQtx3DkpCaei3B
         4te0YZXDuoi0WE70ITjhgDVfNBCX4hrDMmJWy89u0iXyOb7wILcM/BiHOmLmwrsUu3Tb
         iYGw==
X-Forwarded-Encrypted: i=1; AFNElJ9JLQ8k6YAfdIVCfNWjK550qjkOEhIhyFOMkfLOUokj4slDJ09Qz9Z4D7Vc1tQ17ly0IgsKWhJh5pT4pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8858A9F+0p7ZbEMvIgGS6lnjMbqGMtQCXVKvNKJ/OBnnwVRz
	Zf+sER+ARm3izZqrFiY9wUJY5nyRH4HLgfUbu5pnMEtNUVcjlEhgNvtS
X-Gm-Gg: Acq92OHye9O8oeJ+07wj0YGIyQqpJtUzuiC0qmiPqqhpnuhSUNS5654Z6/urYZJykmn
	diVbs3zn2CnEQMtUK8PWPSWZKOhasfLZR/STWuFSKO1i0pioii4wouRudNTgq+C++jmghbWTMH7
	2o5c96FDk25QtGOZeDCsEnTQJixHSX07K1HY4+jTB25DvYz1fpQymMqz0z4QWW8F7HIa1pTyR25
	m4O17XSR4rx+1rFtNWF95ijvqPfj3ykTp1D7+9gI9aaEPDHpEdMeXlse7aGkj1y6mxF8qAKe99E
	pkgcrHdwEKcRUHgz3Z8ZuQwD4HE8W/fnEfmFevZd3ssF1b7iUGGKDwA9/iIh/PhLMH+4f8AunSB
	tDFNUcghXqI3kQ/BfToasxLE/C7EG5zqdeeR8UQYBaGJ8V4BfvLGRYmfJPM4Q3Vw/WF2L98IqJU
	k8dhalfe0+NeJi
X-Received: by 2002:ac2:4e06:0:b0:5a2:b43d:ac47 with SMTP id 2adb3069b0e04-5a887add854mr9103374e87.5.1778485687414;
        Mon, 11 May 2026 00:48:07 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
Date: Mon, 11 May 2026 10:47:50 +0300
Message-ID: <20260511074752.24745-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
References: <20260511074752.24745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 have no dedicated MIPI calibration device and calibration
registers are incorporated into CSI. Lets reuse Tegra114 calibration
framework and add Tegra20/Tegra30 as a special case.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/host1x/mipi.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index e51b43dd15a3..cfaa27e0f892 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -61,6 +61,13 @@
 #define MIPI_CAL_CONFIG_DSID_CLK	0x1d
 #define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
 
+/* DSI V0 controller */
+#define CSI_CIL_PAD_CONFIG		0x09
+#define CSI_CILA_MIPI_CAL_CONFIG	0x0a
+#define CSI_CILB_MIPI_CAL_CONFIG	0x0b
+#define CSI_DSI_MIPI_CAL_CONFIG		0x14
+#define CSI_MIPIBIAS_PAD_CONFIG		0x15
+
 /* for data and clock lanes */
 #define MIPI_CAL_CONFIG_SELECT		(1 << 21)
 
@@ -92,6 +99,8 @@ struct tegra_mipi_pad {
 };
 
 struct tegra_mipi_soc {
+	bool dsi_v0;
+
 	bool has_clk_lane;
 	const struct tegra_mipi_pad *pads;
 	unsigned int num_pads;
@@ -122,6 +131,7 @@ struct tegra_mipi {
 	void __iomem *regs;
 	struct mutex lock;
 	struct clk *clk;
+	struct clk *csi_clk;
 
 	unsigned long usage_count;
 };
@@ -265,6 +275,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
+	if (dev->mipi->soc->dsi_v0)
+		return 0;
+
 	mutex_lock(&dev->mipi->lock);
 
 	if (dev->mipi->usage_count++ == 0)
@@ -281,6 +294,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
 {
 	int err = 0;
 
+	if (dev->mipi->soc->dsi_v0)
+		return 0;
+
 	mutex_lock(&dev->mipi->lock);
 
 	if (--dev->mipi->usage_count == 0)
@@ -300,6 +316,9 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 	u32 value;
 	int err;
 
+	if (mipi->soc->dsi_v0)
+		return 0;
+
 	err = readl_relaxed_poll_timeout(status_reg, value,
 					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
 					 (value & MIPI_CAL_STATUS_DONE), 50,
@@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_finish_calibration);
 
+static int tegra20_mipi_calibration(struct tegra_mipi_device *device)
+{
+	struct tegra_mipi *mipi = device->mipi;
+	const struct tegra_mipi_soc *soc = mipi->soc;
+	u32 value;
+	int err;
+
+	err = clk_enable(mipi->csi_clk);
+	if (err < 0)
+		return err;
+
+	mutex_lock(&mipi->lock);
+
+	value = MIPI_CAL_CONFIG_TERMOS(soc->termos);
+	tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_CONFIG_TERMOS(soc->termos);
+	tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
+		MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
+	tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
+
+	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
+		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
+	tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
+
+	tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
+
+	mutex_unlock(&mipi->lock);
+
+	clk_disable(mipi->csi_clk);
+	clk_disable(mipi->clk);
+
+	return 0;
+}
+
 int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 {
 	const struct tegra_mipi_soc *soc = device->mipi->soc;
@@ -322,6 +378,9 @@ int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 	if (err < 0)
 		return err;
 
+	if (soc->dsi_v0)
+		return tegra20_mipi_calibration(device);
+
 	mutex_lock(&device->mipi->lock);
 
 	value = MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
@@ -386,6 +445,15 @@ int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 }
 EXPORT_SYMBOL(tegra_mipi_start_calibration);
 
+static const struct tegra_mipi_soc tegra20_mipi_soc = {
+	.dsi_v0 = true,
+	.pad_drive_down_ref = 0x5,
+	.pad_drive_up_ref = 0x7,
+	.hspdos = 0x4,
+	.hspuos = 0x3,
+	.termos = 0x4,
+};
+
 static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 	{ .data = MIPI_CAL_CONFIG_CSIA },
 	{ .data = MIPI_CAL_CONFIG_CSIB },
@@ -399,6 +467,7 @@ static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra114_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = false,
 	.pads = tegra114_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra114_mipi_pads),
@@ -426,6 +495,7 @@ static const struct tegra_mipi_pad tegra124_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra124_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra124_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
@@ -443,6 +513,7 @@ static const struct tegra_mipi_soc tegra124_mipi_soc = {
 };
 
 static const struct tegra_mipi_soc tegra132_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra124_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra124_mipi_pads),
@@ -473,6 +544,7 @@ static const struct tegra_mipi_pad tegra210_mipi_pads[] = {
 };
 
 static const struct tegra_mipi_soc tegra210_mipi_soc = {
+	.dsi_v0 = false,
 	.has_clk_lane = true,
 	.pads = tegra210_mipi_pads,
 	.num_pads = ARRAY_SIZE(tegra210_mipi_pads),
@@ -490,6 +562,8 @@ static const struct tegra_mipi_soc tegra210_mipi_soc = {
 };
 
 static const struct of_device_id tegra_mipi_of_match[] = {
+	{ .compatible = "nvidia,tegra20-mipi", .data = &tegra20_mipi_soc },
+	{ .compatible = "nvidia,tegra30-mipi", .data = &tegra20_mipi_soc },
 	{ .compatible = "nvidia,tegra114-mipi", .data = &tegra114_mipi_soc },
 	{ .compatible = "nvidia,tegra124-mipi", .data = &tegra124_mipi_soc },
 	{ .compatible = "nvidia,tegra132-mipi", .data = &tegra132_mipi_soc },
@@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_device *pdev)
 		return PTR_ERR(mipi->clk);
 	}
 
+	if (mipi->soc->dsi_v0) {
+		mipi->csi_clk = devm_clk_get_prepared(&pdev->dev, "csi");
+		if (IS_ERR(mipi->csi_clk)) {
+			dev_err(&pdev->dev, "failed to get CSI clock\n");
+			return PTR_ERR(mipi->csi_clk);
+		}
+	}
+
 	platform_set_drvdata(pdev, mipi);
 
 	return 0;
-- 
2.48.1

