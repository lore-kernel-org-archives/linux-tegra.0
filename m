Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AFB2FDC47
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829039; cv=none; b=M3LzelY02124gz6xjtzQXPTqRUsjC5L2HivSm7czFqmYanm/WQqaQ2IN55oxrfHXtdlly2hRUXOA/D06qyTPgoVKop5C5nZhwJwIzKmMdcPlwM2JQF7grQXODSa6jmIY+IMCBX5dkD/ji9wJ0zjhxm9lQA/uN1tbewgcKX/GFJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829039; c=relaxed/simple;
	bh=7MhN37ZrjcndwEVK0UG8bIaOv/sX3fYUDn7Msl1T6HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCvZec/hsH/OYAcrWxQq4oBR0csRs2qR+Lq0Uhpf7PK6/75erpchVmvKyRXuQXp5YAr0Co0Y2N/QVqdUigDVJULCPAbd7HUGhkCi0xdp0ePzTjSGoxfYssDtSAvJopMnAbNX99rcq2raxFIFzHUZmqJJ1z0i2uU1+Hmc4HBMCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5K5VgTo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5K5VgTo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b739ef3f739so81449166b.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829035; x=1765433835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
        b=O5K5VgTo//FmbhHZ9llCWQXTaS5wNdslSmTjKUjMR3gzcR0mG5WofKSO4/lX6YFrmK
         h7//7Hxco6wqUfyR/eTn1KkYKN6elEL5BM6ezVJSlJiiUX7b50JmzwjzHCF2q7Y07fFG
         twRN8cEmJhDrGPTEYyDNGWuwCmoSwRTaGjkX7ZMerI/8e8ECjXEx7/xP3p4FGP+uCNm/
         ZPStqUIDwq/r9oOD85YauDel4A56ck2Yq+UZsB5OohreKBB5uEcfaVqnpMKqhAp/H6tj
         mD1TwFMRocXDwddr/qDZDTLzF2/ju4ihs3K4bGYHhAt6QZedQPuqOjsGRsi88T5OhL6t
         UYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829035; x=1765433835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
        b=E5M6E/YHU06ibyFhGZTKqmZ+IZYrquemMP6OZgxAJ6A0jAI9OwDoi8+1zeRKb0j2A+
         wdInXbRehCtR2xutU0a8IoAIbNyP7bYRqJfxGDo0qg1hXN11qD6knbEDHr5WpXZVCx6Z
         sMzMxhY7YI2i1CXlA0x7XN3SXsuzCGSC64U2kMDf5YY3GbblvHAhISnPlvXmlN0kXIOD
         0ome1xJaSKf0RxYBw2GAzzGyfzYs4n1O6JPte4anq6Mk1S5V0J0FHIEozU98rFn6FNxj
         Ac5uJ8xTyxPCtQ5TXxA4gi4fbQ+xnqkELP8vT84rVyi4BOPDiGg6ERh/cdWqm+4dIRTM
         EXJA==
X-Forwarded-Encrypted: i=1; AJvYcCVEd1r0MaRpho1UfjZRvT2QvMH/37KMnQtkDZm//dPy8iqUdEGxqKSdmyP2kK8Kl3ARP9AeY5A35/NfTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvvtTzcKQU2fH/Z1BpvfyE0qjOrSplOlcbXgTxo8/WQk3sSS5
	rakzfpKJeXVSigmtRMoC9WYhE/PZrPHUgHo5rhgW4d1gwdAT7HnIZzEr
X-Gm-Gg: ASbGncs0/c3pHhXWHyu457ZYJ3SyDNre9ZhdL9SEPGv0/IuGBjmoM8FL2slq/oqHTDV
	kYkxJ2wQsOavnSSHglWPt6F4AMyoSw2j7V5JPMm+iaWW41IOWBiDS+tnMB89Pn+xoxY5rTzxFd7
	v7kyh9cjbAfMGBcU8soM37kaPKflbWVIXwPxj0rVSGRxjh/ljGeeteYDOjV/0MyTLpO7/zqmlYy
	gHPVUI02l7Nn+5xl9huo8z4zWpkaZHDMoiYwsNzfBGLqjE24QUuO0K/HdfI0dMgYiZdUxdo6/nA
	yluSru0z3fNHVFaY3hNd6FYSCB7I5ZYrzvZkWIWz8r+0IBmmxrGAOC1adDhvuBjUdrhbkI5EUbf
	6KYQcip2gHlZERMZpIWGzrJWldGDkVKrj3kRgH9A3ono9U6tyxkG8ws6Ga+F/4lDeNf5ifBrtwC
	rnR6h8q6vNvA==
X-Google-Smtp-Source: AGHT+IGGRcCBn7dDmnJ9YtWI4tOlSL4ai8HDBzVnkC7QNxtJAImhu/v/dhsGR+njm+E47PKBNIF3OQ==
X-Received: by 2002:a17:906:794a:b0:b72:af1f:af7d with SMTP id a640c23a62f3a-b79ec674170mr204057766b.29.1764829035144;
        Wed, 03 Dec 2025 22:17:15 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:14 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4 RESEND] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Thu,  4 Dec 2025 08:17:02 +0200
Message-ID: <20251204061703.5579-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20 and Tegra30 are fully compatible with existing tegra DSI driver
apart from clock configuration and PAD calibration which are addressed by
this patch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c |  2 +
 drivers/gpu/drm/tegra/dsi.c | 88 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/dsi.h | 15 +++++++
 3 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..5d64cd57e764 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1x_drm_suspend,
 
 static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-dc", },
+	{ .compatible = "nvidia,tegra20-dsi", },
 	{ .compatible = "nvidia,tegra20-hdmi", },
 	{ .compatible = "nvidia,tegra20-gr2d", },
 	{ .compatible = "nvidia,tegra20-gr3d", },
 	{ .compatible = "nvidia,tegra30-dc", },
+	{ .compatible = "nvidia,tegra30-dsi", },
 	{ .compatible = "nvidia,tegra30-hdmi", },
 	{ .compatible = "nvidia,tegra30-gr2d", },
 	{ .compatible = "nvidia,tegra30-gr3d", },
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 8e80c7efe8b4..d079aa7d2a85 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -53,6 +53,10 @@ to_dsi_state(struct drm_connector_state *state)
 	return container_of(state, struct tegra_dsi_state, base);
 }
 
+struct tegra_dsi_config {
+	u32 dsi_version;
+};
+
 struct tegra_dsi {
 	struct host1x_client client;
 	struct tegra_output output;
@@ -82,6 +86,8 @@ struct tegra_dsi {
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
+
+	const struct tegra_dsi_config *config;
 };
 
 static inline struct tegra_dsi *
@@ -663,39 +669,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 {
 	u32 value;
 
-	value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	if (dsi->config->dsi_version == TEGRA_DSI_V1) {
+		/*
+		 * XXX Is this still needed? The module reset is deasserted right
+		 * before this function is called.
+		 */
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
+		tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
+
+		value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+
+		value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
+			DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
+			DSI_PAD_OUT_CLK(0x0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
+
+		value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
+			DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
+	} else {
+		value = DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_LPDNADJ(0x1) |
+			DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) |
+			DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_PDIO(0) |
+			DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	}
 
 	return 0;
 }
 
 static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
 {
-	u32 value;
 	int err;
 
-	/*
-	 * XXX Is this still needed? The module reset is deasserted right
-	 * before this function is called.
-	 */
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
-	tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
-
 	/* start calibration */
 	tegra_dsi_pad_enable(dsi);
 
-	value = DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
-		DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
-		DSI_PAD_OUT_CLK(0x0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
-
-	value = DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(0x3) |
-		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
-
 	err = tegra_mipi_start_calibration(dsi->mipi);
 	if (err < 0)
 		return err;
@@ -1577,6 +1590,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
+	dsi->config = of_device_get_match_data(&pdev->dev);
 	dsi->output.dev = dsi->dev = &pdev->dev;
 	dsi->video_fifo_depth = 1920;
 	dsi->host_fifo_depth = 64;
@@ -1615,7 +1629,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1636,10 +1650,12 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	err = tegra_dsi_setup_clocks(dsi);
-	if (err < 0) {
-		dev_err(&pdev->dev, "cannot setup clocks\n");
-		goto remove;
+	if (dsi->config->dsi_version == TEGRA_DSI_V1) {
+		err = tegra_dsi_setup_clocks(dsi);
+		if (err < 0) {
+			dev_err(&pdev->dev, "cannot setup clocks\n");
+			goto remove;
+		}
 	}
 
 	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1703,11 +1719,21 @@ static void tegra_dsi_remove(struct platform_device *pdev)
 	tegra_mipi_free(dsi->mipi);
 }
 
+static const struct tegra_dsi_config tegra20_dsi_config = {
+	.dsi_version = TEGRA_DSI_V0,
+};
+
+static const struct tegra_dsi_config tegra114_dsi_config = {
+	.dsi_version = TEGRA_DSI_V1,
+};
+
 static const struct of_device_id tegra_dsi_of_match[] = {
-	{ .compatible = "nvidia,tegra210-dsi", },
-	{ .compatible = "nvidia,tegra132-dsi", },
-	{ .compatible = "nvidia,tegra124-dsi", },
-	{ .compatible = "nvidia,tegra114-dsi", },
+	{ .compatible = "nvidia,tegra210-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra132-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra124-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra114-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra30-dsi", .data = &tegra20_dsi_config },
+	{ .compatible = "nvidia,tegra20-dsi", .data = &tegra20_dsi_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
index f39594e65e97..5049ec7813c7 100644
--- a/drivers/gpu/drm/tegra/dsi.h
+++ b/drivers/gpu/drm/tegra/dsi.h
@@ -95,6 +95,16 @@
 #define DSI_TALLY_LRX(x)		(((x) & 0xff) <<  8)
 #define DSI_TALLY_HTX(x)		(((x) & 0xff) <<  0)
 #define DSI_PAD_CONTROL_0		0x4b
+/* DSI V0 */
+#define DSI_PAD_CONTROL_PULLDN_ENAB(x)	(((x) & 0x1) << 28)
+#define DSI_PAD_CONTROL_SLEWUPADJ(x)	(((x) & 0x7) << 24)
+#define DSI_PAD_CONTROL_SLEWDNADJ(x)	(((x) & 0x7) << 20)
+#define DSI_PAD_CONTROL_PREEMP_EN(x)	(((x) & 0x1) << 19)
+#define DSI_PAD_CONTROL_PDIO_CLK(x)	(((x) & 0x1) << 18)
+#define DSI_PAD_CONTROL_PDIO(x)		(((x) & 0x3) << 16)
+#define DSI_PAD_CONTROL_LPUPADJ(x)	(((x) & 0x3) << 14)
+#define DSI_PAD_CONTROL_LPDNADJ(x)	(((x) & 0x3) << 12)
+/* DSI V1 */
 #define DSI_PAD_CONTROL_VS1_PDIO(x)	(((x) & 0xf) <<  0)
 #define DSI_PAD_CONTROL_VS1_PDIO_CLK	(1 <<  8)
 #define DSI_PAD_CONTROL_VS1_PULLDN(x)	(((x) & 0xf) << 16)
@@ -140,4 +150,9 @@ enum tegra_dsi_format {
 	TEGRA_DSI_FORMAT_24P,
 };
 
+enum tegra_dsi_version {
+	TEGRA_DSI_V0,
+	TEGRA_DSI_V1,
+};
+
 #endif
-- 
2.48.1

