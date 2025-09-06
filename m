Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326122F1FF4;
	Sat,  6 Sep 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164642; cv=none; b=nNSJY0U3E6JYw6ALmm/gkvH8EIlvoXfPQdl9Yyqsm+N1pbkxsQhd3uXEjSOl2zwpxjEYUumWO+kaKdjFHcgcddqi+eKc8JMWmS32DmVykpAgcdka0Dl2qBygmOE9ougLg48vZ1hNrS2Wk10dxN/XQyq9ELbQrRxjOTClAja4hTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164642; c=relaxed/simple;
	bh=7MhN37ZrjcndwEVK0UG8bIaOv/sX3fYUDn7Msl1T6HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qc5rIOuBNV8qC8fQHEC+whIA0a9dV7mVOM3ks+/NINYsdOjLurKL6u02oMQfisnKqaaB1J5TMRrGHywfO6/iGU6FHRvgxcflQtkkCqcr91iRf0q6S4KBANdHkAUnvFhONyAbaI1PCau70/IY3FBpikcjm2Fy/IZCxReIpuSdpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRxXT/ui; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRxXT/ui"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5607a240c75so3055187e87.2;
        Sat, 06 Sep 2025 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164638; x=1757769438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
        b=iRxXT/ui61PIagPtbJtxPAH09kfgYIQJqFqgdkSwCSznb3bDRE+QCjQn0CVLuDhVgx
         HDdy8RNLzJCVeBMXrf58RGeklMzy15N5KjkKX6AkX0nAjAUbpdFYZKnYpYJ5KMszniTd
         bTxb4+gHysJvk6plmpUQMABFL4iSD8JzwEyOosP2ODlSjZD/DmwiH05IrYSO70dKeoTH
         T176A7bvyCr7IH6DMJi4h2V3KQ/poJ/i9zk7RnZQO/WsAd6gruxYBEapIRovVr1EYG5m
         tM87gWs5fvvS48AlSC+263zV4kDKiWephMKbcHOqebAmWRQIKsZMlDjtES8wgQGDOekD
         hVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164638; x=1757769438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrokhqA6GJ5qHaATPIZtdAEmnKVCv3ZhPjrr90tfwBE=;
        b=KUObR2uzt2YG3zt08FRgUL8EUrx9OkTTtlTRDbNylW6bgUlSYIEn8B1wXQfGI6xrWe
         nS8ZuDUP4F5SdT412a8AYuStYZ0Bel1sXRQVP1DK802WbdP+Jtw9N3bMl3hz1LqLQ12F
         xe0Oc1YQ65Xf1riWoU4wld25hNnFcS2nH6WcLstDnblwy9rEpxFpoEaFwergo3jN4tzH
         Z9hvYVfQB1kyEb9WKwMul+PPr5AUdGBoGqtQ68S7w9RWzDM/AfKhWeJ2Qyb+qopwdhhu
         S3vLo7pObOJCw8PKGRGILHvPzvRW6oIPDfWagomXqdyhHBUO7Z1kKAihEDXLNawfw1mF
         f1cg==
X-Forwarded-Encrypted: i=1; AJvYcCUuLcJMeJwufpxKSNV+RYQhzsF5/okM5t6sGoo3pupuen4k3DvMv+k5qSblBEsJ8FGB5u858ahXY5Y/Rb8=@vger.kernel.org, AJvYcCVqxziMPIvKt3j9ULLLKh/jE7ijLv3b+HY7MvNL412RIlFLkE2ul5gRKL8ol2VinG9mJv0tkOI5bEk=@vger.kernel.org, AJvYcCWt7c1sFb4PrxiGIhko1g2ejkIn4K9vRGQZ+4T7gXR1gCQPK+MffrcqPWSu1Mtae04mucKBt9vEoG0kwVGa@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPWYXw1eY+TAvfm7PVt1ERqKigsYVC29TRbysEnmPiACOepV3
	6+hs2CtDswUm9bu6Jb5kuq/wqNztwNUmw/QaNDJO3jdlGp+PQOWVRKL6
X-Gm-Gg: ASbGncs9ZXFzMj4JAn5DqF29YsP2vXqiVTrSRkIxMzN52Ma6+TFFpEYy9ecCrXkLTOl
	egHOiCyLi+mr0DpWE4i5p7rrrGdn6pfPK0/krebqB+ThMlp8XtwzEW269v5YS2Cn1glSj2bE8mG
	s7Qhre+3KPisNWsJW0elp0EZVE0hg2oV/Tshf+iqorHFjl3GZ1MTdAJi3ij4F4FxqjRyI6PH0H6
	Nk1LT2aMun2kPIa0eTm6S/B0Ea0Jtszr6WhsaoDArvDEPp6X+OxNZc5vXjPCF3merBGSYqnC8Fx
	Dhza3ocwvu95onDJTPWYpmO9BWZX9Al1BNx/RNLGyI0Cr0pBmZIVNsg9gwkeqYrqi5qFlqVOoPN
	PGoTFHysA37T2dQ==
X-Google-Smtp-Source: AGHT+IHuGyverWPNj4Hu1YTQ/zo56Y1If/zSPVQaOxTnkb+VtXRvZTBbgrkuQRhGTZMWyOH4OfOAkw==
X-Received: by 2002:a05:6512:3daa:b0:560:89e3:2a0 with SMTP id 2adb3069b0e04-5625f536171mr604044e87.11.1757164638112;
        Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:17:17 -0700 (PDT)
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
Subject: [PATCH v2 3/4] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Sat,  6 Sep 2025 16:16:54 +0300
Message-ID: <20250906131655.239340-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
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

