Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501082F7D15;
	Thu, 17 Jul 2025 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762129; cv=none; b=naLiSxB2O168azhIE+ZGilstuqAUgx92co/wnd816YFSkOs+0lraUUSNqyQ1kBoJOpL5cHp1sciAvygnmxGPf0PrPChoIQ534B+GTLQIYhWe+1I6JzgTlgwTPVxuzNJlY6AApJhHw4lTxyBak30AUjtw7OelqKxYdh1RY0Lh9J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762129; c=relaxed/simple;
	bh=OcDBfkMlEDbmFVFQBsZ8hTUlSAeF53HzTvYoSiCHOnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8P9QfEqQWe6E2Ko6exTkil9Oit2YuSuGOD44AEEWAzlA7koG5fEZi95KMcBrRJy/1qreyq6Ta3tGOcjcNEQNBmE7FGSedJqrjquM2aqKXIlvgqpJjgglvjyxlj5PA/XkKXZQlffLAH4UsL+cW6iZHYCgJXY2T8gwAMUJPw7sVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsIcVhFi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsIcVhFi"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b584ac96so1106873e87.1;
        Thu, 17 Jul 2025 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762125; x=1753366925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=IsIcVhFimdCvLizytypCufLYmfpztxBxU3AF7btKyd72xPiYbyAUzqO7NNJJjvsNgt
         wBfOKSackHiM91elQQZoaD8nqQoJfDriSEy+kU52SJeVbSb9vifHPE4eu1LF/TMlryeX
         GFnnM5JqgdNJCSVEyEfMCGPh7cwA+Vt2AoTvoXRz/sIMTkYy3fSEtADnk7WOzBj9xIsH
         F7x2e89ggAPbDlfwFR+7A5taBnBWkbjvq2FmaGe5NZGxFFSqs+cQBNNgCivYQH4rV9X+
         r8kDrjL2zfmAdTvFlkA4e/TA1KdcAgFRt6qlx71FW0bTzk+f2WucKkEWJrE6LF6laHc4
         RpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762125; x=1753366925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbJjEkdr1gdwOgkOrbiUvdWUHFLgDfQGisgY8rnIeVg=;
        b=cKUZ1JRwzJVNJQu5WiIA+upwTzbV5ZBKzSB7IEiwEjgeosO69nuu5do9lhy3qAaR8R
         nKKijqFjcsQ3tkMoE8X37lvR791TfC+gkExjOl22AT5ilOo071+9yu2CPGwtUx0nfl6o
         MGP1YTOiGyJ98Ih++/SCx776/oO+UHVZDqJMX4tXVyHQ5xbmkYscDKjR8OAhqEy/Oj2I
         7931Njk7OqorHDqfHFhYXD5hCP4MCcO2xwYbnMxI8YW8NneeHEhRDV3GCPiYlouhFEq6
         TvsQYMyCbTjNGAvQjUoc+FrecFwGCAaSXkcegcuGcx1nS3qokxDVgpFOGStHCdfjhNBy
         mAzg==
X-Forwarded-Encrypted: i=1; AJvYcCVntWVhOT6IPb1umA7nR59e2Nk3PW9sEXkP9fuwkmg+DplIjGwGt6/smDkIlo/7bcxPCbIgABWkT5Fj@vger.kernel.org, AJvYcCWWEzw7cRsVJCz+RMnxNM4LejAdg3xtQLdydmjqqrr3c5ydB91b4N46zEoefhZ/Sy7akuvApTXjOu9bjKlP@vger.kernel.org, AJvYcCX2ElQWBOFPhZh1sTJEzjsgQVE5uEzmIlS9qi/pe8mtxwIXO+5FD4KoIkykXCKAtyyzZELMMVVF1LR0u3Y=@vger.kernel.org, AJvYcCXzK3ZHSvFqKXFDvlC+dmOG3Zl0bXaeOkGiPu8XTLMYDrCv66DOkmBlVbEgQ5r94nnOr+yc7etx3tIA@vger.kernel.org
X-Gm-Message-State: AOJu0YxIh+4u1aZDyb4IT5e81ve+23R9grUSDA1Y4DMwgA/Ss5xLy42l
	tLWSb9lfSO7Oqu8MQAQWaRcE7jZ9Ni9ejQNe9iA5Jd3unLue0BJG7p/EQ5PZpA==
X-Gm-Gg: ASbGncsuu18PQ7Tlwk7IarE7BnKSjEMYhteAWoagDvVuIy6lhlR6TOHxJ0q4WebsuPx
	3xbVKqF38cF2QKlmCJ7hEXd568sRfO9rOc+9+JqTJrbt5m9ai1jDJQ/K3aXZoL3iUa3FR6uaKPh
	Zhm0ig+C2bBQ6HKog89JHpgN5PYaGsUvqpKrQX49mz7TdeuOSgitCtS9E7imc3Jfwb8XwHnZnh0
	ObcASQ2JF5c+fdzmfq93utiBFFY27VjB748HNMFRaoPhyQamwCLx9VuQqUJN6j39EfLvsxV5D5E
	Vb8A/EM7+tT+HdoOIA/Vw9fEcSaqK2Hj95eTM7cBCupBFO+qqqQoT+2eVJI71XVRiGtVFxTMKqt
	13MVR9uozaLgO8A==
X-Google-Smtp-Source: AGHT+IH4RXFtqCVL0YLN65Wn9Bt/27qc4euvLq73T0KycYwtneIb2P1HZxNmdruVVnLF2O/oLuvpoQ==
X-Received: by 2002:a05:6512:ea4:b0:553:2480:2308 with SMTP id 2adb3069b0e04-55a23331f60mr2013665e87.21.1752762125077;
        Thu, 17 Jul 2025 07:22:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
Date: Thu, 17 Jul 2025 17:21:37 +0300
Message-ID: <20250717142139.57621-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
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

