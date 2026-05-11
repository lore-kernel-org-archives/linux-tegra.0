Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE53A0E97
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485569; cv=none; b=blv1Jpdl2nnf5CqMCcvfy7/Hj4rFgtJ2ATEVqp40l7/cBUEFF+T7ZzqSzIZdCyEoK/MeLqUdOF2t01rGGYt5W0aNDZRfzqcm6dmX2NV4eNrorQNfgEHXzOFP4UxJE4E/3gBysieJW5zSFOhZ2eYRI3gC07Cwn3I6+inyXoWTdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485569; c=relaxed/simple;
	bh=4lX3jmn6eJjVM3dmJR5K+haSPmZg31vbVjKpyCUuGBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXSy5vElqSGJ0C9rCXu1g5sk0+uFp90kxPibqyBzoEp30KRJTxBJg1KoVKZnNJSsTjicgKB7rGEZXy6CV5szqSI9baHFQH/ZXmvMF6zV5mwyF7q0pWQ2+VW6uDPtfqabamJI6DWyomJX1u41CjNgjl2qZuhZWW9SIln0EoMKyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4pei5jS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4pei5jS"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso2875937e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485558; x=1779090358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3opfryHfhilZL8PpB6M82lqXji5/jphiotiKFxgDVQo=;
        b=N4pei5jSxXiIrNb9t2/y5sKFtTm5+g/EFTaNYCEaLuzV9Ae9wulurK5+xOHBCaS6vg
         Qe+nmenIUjcYkB14fspEeeAZIA8gnJx2Fz0wA34JaHXyVQgP/vUwcw8A8WOHjZ/MaRjg
         rVS0KboQgr0rHE0VQzlKiuJNxZo5f8lNyO2o1wdCgAeRWOk9pbEnIC4rYpCVgMrFyKUp
         yZrEKgkZQ8/IMuDp4Z3K6uKTiKo0wKufNyLfBPGiiCZf+4RvTnN4VO3w3hOvmcKWasTs
         gWmdtiPDknL9b8AWT5XEKMPlykUrY3vF6/DUyZiYgLJ6uu9uHJfdyV3yOWGlNBUMuhYy
         xXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485558; x=1779090358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3opfryHfhilZL8PpB6M82lqXji5/jphiotiKFxgDVQo=;
        b=Uo/xLY8tvPJyi98ojeZ9qosHoJYsfcHF+7c0nBrydkid5Gi7NjZ4li5hI5s+yIyLHU
         RwyE2pqDuu3HPEUR3Id+nvwxLA8JPhY8vOG7pnslR+M1aA0KfhNF75F6oSYYcGceois2
         95CiGAzSPsUoYNHh51df7tK1yCDsNNUk3Uf7FkeJwx9KuwwFlajgKzEpP8VVkPNlfion
         FWDPvN6uNDyBM23ItuYMRKf7UKcmJB9tUvhzZ5cfbrOfLUun+EkKHXE5qBssYjw+MRmq
         GYfWzRDS/nuo8CAvuWmyKuVHQdFU17toMCTEHDvYzLh2buQYipHg6pzHY/IoGs3Pk0Qy
         B0rw==
X-Forwarded-Encrypted: i=1; AFNElJ/eBmXS885Gl275v2ELpx7bEIv6MhpqlYP9UU2q1jY/7B0xXhbdzFUuSFyxs2vL+Qvqm20eGVVDd1je9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5yXCtYOnSuJaI8+RaDj9NH8wMBpZhF7LemRgU76BRR4aQOlZ
	JOFbmFUO5QxmLsKWrEI3C4iN07j42OMiXRLy4KXfrQq/hf1UYPOW6NBo
X-Gm-Gg: Acq92OF6ULmT0Fou+fXOkVmJHU4Si7c5DB46ozJP02pwTV68z6P8oKGFFel4U7TRohn
	IdOEttKEaaXg0fuRKEptHBkDOgwzmMcczDknbeSLSR84n8iNNeDTNl1ZNGZzWDywKEaBwaGGOrv
	LgDWeTh7vw3UbAwnMw9H41YxWkArwU5JL7uzP3/jvAKfSBPoRSW/XmVx9GWYsYHO8fLZNdbp9b0
	0NAfWuHBvGz0ZFm+UscLgO8PuRCmVWs8FOTG0ONxwp/zFrf425mooE25E729ObROm/Lgs18cT/7
	3lO9GNqqbU7XQwzWBKIqQTe5OwYofAx/TY3C1SRF6LlKH17cQSOkqo5P6brn41t5TafN4cl+RgP
	tocNoI+hTCV8TEwPnv09lkZEnrBhysuD58JoU/po9TPiOLpH6LqbuaBtQ4goX5juvpTaVmO1zwV
	A8IOCjK55+tmPkpWD3MD1Z3is=
X-Received: by 2002:a05:6512:692:b0:5a8:707f:904 with SMTP id 2adb3069b0e04-5a887a9a8abmr8010872e87.0.1778485557391;
        Mon, 11 May 2026 00:45:57 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a952705asm2404394e87.32.2026.05.11.00.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:45:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2 RESEND] drm/tegra: dsi: add support for Tegra20/Tegra30
Date: Mon, 11 May 2026 10:45:36 +0300
Message-ID: <20260511074538.24563-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074538.24563-1-clamor95@gmail.com>
References: <20260511074538.24563-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driver
apart from clock configuration and pad calibration which are addressed by
this patch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 117 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dsi.h |  10 +++
 3 files changed, 98 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 1dcef4e7d104..b73d65cd0ac6 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1358,10 +1358,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops, host1x_drm_suspend,
 
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
index 7f25c50621c9..fbab10bc5c41 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -54,6 +54,11 @@ to_dsi_state(struct drm_connector_state *state)
 	return container_of(state, struct tegra_dsi_state, base);
 }
 
+struct tegra_dsi_config {
+	bool has_multiple_pad_controls;
+	bool has_mux_parent_clk;
+};
+
 struct tegra_dsi {
 	struct host1x_client client;
 	struct tegra_output output;
@@ -83,6 +88,8 @@ struct tegra_dsi {
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
+
+	const struct tegra_dsi_config *config;
 };
 
 static inline struct tegra_dsi *
@@ -665,39 +672,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 {
 	u32 value;
 
-	value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	if (dsi->config->has_multiple_pad_controls) {
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
@@ -1174,6 +1188,12 @@ static int tegra_dsi_setup_clocks(struct tegra_dsi *dsi)
 	struct clk *parent;
 	int err;
 
+	/*
+	 * Tegra124+ uses a clock gate, not a mux, so this step
+	 * should be redundant for configuration; yet, DSI refuses
+	 * to work without it.
+	 */
+
 	parent = clk_get_parent(dsi->clk);
 	if (!parent)
 		return -EINVAL;
@@ -1562,6 +1582,10 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
+	dsi->config = device_get_match_data(&pdev->dev);
+	if (!dsi->config)
+		return -ENODEV;
+
 	dsi->output.dev = dsi->dev = &pdev->dev;
 	dsi->video_fifo_depth = 1920;
 	dsi->host_fifo_depth = 64;
@@ -1600,7 +1624,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1621,10 +1645,12 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	err = tegra_dsi_setup_clocks(dsi);
-	if (err < 0) {
-		dev_err(&pdev->dev, "cannot setup clocks\n");
-		goto remove;
+	if (dsi->config->has_mux_parent_clk) {
+		err = tegra_dsi_setup_clocks(dsi);
+		if (err < 0) {
+			dev_err(&pdev->dev, "cannot setup clocks\n");
+			goto remove;
+		}
 	}
 
 	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1688,11 +1714,40 @@ static void tegra_dsi_remove(struct platform_device *pdev)
 	tegra_mipi_free(dsi->mipi);
 }
 
+static const struct tegra_dsi_config tegra20_dsi_config = {
+	.has_multiple_pad_controls = false,
+	.has_mux_parent_clk = false,
+};
+
+/*
+ * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; this is
+ * simply not modeled in the clock driver yet. If this functionality is
+ * required, the has_mux_parent_clk flag can be set to true once the clock
+ * driver is patched.
+ */
+static const struct tegra_dsi_config tegra30_dsi_config = {
+	.has_multiple_pad_controls = false,
+	.has_mux_parent_clk = false,
+};
+
+static const struct tegra_dsi_config tegra114_dsi_config = {
+	.has_multiple_pad_controls = true,
+	.has_mux_parent_clk = true,
+};
+
+/* TODO: figure out why has_mux_parent_clk = true is necessary on Tegra124+ */
+static const struct tegra_dsi_config tegra124_dsi_config = {
+	.has_multiple_pad_controls = true,
+	.has_mux_parent_clk = true,
+};
+
 static const struct of_device_id tegra_dsi_of_match[] = {
-	{ .compatible = "nvidia,tegra210-dsi", },
-	{ .compatible = "nvidia,tegra132-dsi", },
-	{ .compatible = "nvidia,tegra124-dsi", },
-	{ .compatible = "nvidia,tegra114-dsi", },
+	{ .compatible = "nvidia,tegra210-dsi", .data = &tegra124_dsi_config },
+	{ .compatible = "nvidia,tegra132-dsi", .data = &tegra124_dsi_config },
+	{ .compatible = "nvidia,tegra124-dsi", .data = &tegra124_dsi_config },
+	{ .compatible = "nvidia,tegra114-dsi", .data = &tegra114_dsi_config },
+	{ .compatible = "nvidia,tegra30-dsi", .data = &tegra30_dsi_config },
+	{ .compatible = "nvidia,tegra20-dsi", .data = &tegra20_dsi_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
index f39594e65e97..d834ac0c47ab 100644
--- a/drivers/gpu/drm/tegra/dsi.h
+++ b/drivers/gpu/drm/tegra/dsi.h
@@ -95,6 +95,16 @@
 #define DSI_TALLY_LRX(x)		(((x) & 0xff) <<  8)
 #define DSI_TALLY_HTX(x)		(((x) & 0xff) <<  0)
 #define DSI_PAD_CONTROL_0		0x4b
+/* Tegra20/Tegra30 */
+#define DSI_PAD_CONTROL_PULLDN_ENAB(x)	(((x) & 0x1) << 28)
+#define DSI_PAD_CONTROL_SLEWUPADJ(x)	(((x) & 0x7) << 24)
+#define DSI_PAD_CONTROL_SLEWDNADJ(x)	(((x) & 0x7) << 20)
+#define DSI_PAD_CONTROL_PREEMP_EN(x)	(((x) & 0x1) << 19)
+#define DSI_PAD_CONTROL_PDIO_CLK(x)	(((x) & 0x1) << 18)
+#define DSI_PAD_CONTROL_PDIO(x)		(((x) & 0x3) << 16)
+#define DSI_PAD_CONTROL_LPUPADJ(x)	(((x) & 0x3) << 14)
+#define DSI_PAD_CONTROL_LPDNADJ(x)	(((x) & 0x3) << 12)
+/* Tegra114+ */
 #define DSI_PAD_CONTROL_VS1_PDIO(x)	(((x) & 0xf) <<  0)
 #define DSI_PAD_CONTROL_VS1_PDIO_CLK	(1 <<  8)
 #define DSI_PAD_CONTROL_VS1_PULLDN(x)	(((x) & 0xf) << 16)
-- 
2.51.0

