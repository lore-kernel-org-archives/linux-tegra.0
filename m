Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A205366821
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042795; cv=none; b=oxgpoI+pnwcoaUVAeZ+402u9V9zejH+dd+PehWQJdLPvy422p8SKAYD9CoecWNKPPieTaspkmaJCw61EKvDB8RAwnUHUvwyUsDPJeeVMZfQ3EYbrjPMekq4z+/Eq++DozRyFDw9JtEu+xdC/JCoXkzs9REvXwF0gPpH4kcQ+HAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042795; c=relaxed/simple;
	bh=4lX3jmn6eJjVM3dmJR5K+haSPmZg31vbVjKpyCUuGBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkjP5gmo5d6vyCgKN4ibdN8zmVKxTsYAi4maAidpFADLaPcxyPEZYZiLrFZ6fAwAZLr24bc8Q/znV0xHS/4p5Ot1fcsLGVpZ5v3XROpP4CGpw8rUI0lGd3MwNx4r0ubutfDDe7VblwCAs/tQGj+avjfBqR+SaweD7e1aTuzCrck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVaUljAg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVaUljAg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso103343955e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773042792; x=1773647592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3opfryHfhilZL8PpB6M82lqXji5/jphiotiKFxgDVQo=;
        b=CVaUljAggjepnXD2c/Lpy9KnyXw79MQ3L+ONI+ZRNma1++DTNNBjWEXRNxSsuweMu4
         I+BEftSfZHuikLLcdhCGmxAupOCB9x6iEwDsy5mgjCEcmVOSKfnu/oIZhEByyAB6ppEY
         GFtZMqMBjQy42cI+13uKVunJ8F/oniNqWaUNEz6sMpcZAKF8hebE3+TQCotWw/EbbAqz
         XXyZq75fCgqdzydTwqyc5OH6vKMtjdnuGxl4ecXkQqYLpto6gGQVfgzsnDHxtPKb6+4W
         VfZ72ykz1y8jiFeOQsxcMdgdxmKJNDPMO5f2NN0nsHCk9vYo48tCfDGlZwvXlZTnMFHg
         cjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042792; x=1773647592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3opfryHfhilZL8PpB6M82lqXji5/jphiotiKFxgDVQo=;
        b=nhZLnv43fqJW+yMHQhh43pFPWrQbgnkhyB4ADt8L1GwxWNEXyABSetQymY+ALtA4fb
         aWJhpJrn6ddquXPctnXNJ52Qu0vQceZCgF+wghPj3fawM6XHfZJajtuchc2pgvjAUi/F
         XmnyDkmrFkNzBlg7JqvZ+zAtgacwgALtsCiX+bk3+vu1h2eIseZ2lEaQJSei4MWQxIp4
         wbS9r5S/2us/Yky6Va2Uqn7Ebwz71V5TK3DDHWfNbbBtHzkJHJ3jfbpHyS9G8C7E+9Jb
         aBVqcoYUsnyIlzwnta94SVL0kJOdwjzmy67DKW1DHbFJdE7Twqwefr0YRYd60bfeFqc9
         KK2g==
X-Forwarded-Encrypted: i=1; AJvYcCUqjrgF6mHlu7Vp8lMTKTnfXA5f+kR01Pm3eqhDvMufAyg4APvkaz491K3QiPOv989VbTGmVeQD0tWg3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3JXUI+h3nwq7L5gSsK9I2gXMuDu+Ahzhz0eePmitkMDqGhw2
	W85Kr8TWxlTgrzOkpsb964RztDa9Ct0Nl3dbO4gQAeBYJYBFQfr+XCQf
X-Gm-Gg: ATEYQzxDVqMSOHsrxZwQKHGXnhC4q91hOlCeo7krdAYfdY8Sn8RvTfeqUufBLpK+zV2
	9MAuR036ConDIX39EGFgppA3dSgtRdQHKPPyuh+IO7+x1RrfPk7WhCvzEycZboeF5DjGrgnC2Vs
	QuzBr0AZPJKhlxBX0xwML51fGp7cgSxnKSSNMqx4I1ig+gHMiyQZhjEyJMmakA301dUiFQkZMmT
	xYN52elna6yRJKVkfmJMG5MR40CJZ+97Hmbo1fuLB5T/3CHuftHlqe7/1cqDHpgUUPZoTvEqheY
	n4EpG68g2yC59Ycnzu4cPxLARvrlIa2492Dpu7ZWRR1a63Wz7PecWK+ILiUbVa1sAf7+UkcVJ8F
	rc9ggMwlTYHqO7Ai/rM9R6ghoAmqJgRDbRYmMD3PlV5rsNzMdDpPScat6VBWT5gZNsKJKsKS0RM
	Cn8IsQo5r5zSYT
X-Received: by 2002:a05:600c:4f4a:b0:485:3f58:da6 with SMTP id 5b1f17b1804b1-4853f580fc8mr9422245e9.2.1773042791679;
        Mon, 09 Mar 2026 00:53:11 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbd87sm97799975e9.16.2026.03.09.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:53:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/tegra: dsi: add support for Tegra20/Tegra30
Date: Mon,  9 Mar 2026 09:52:47 +0200
Message-ID: <20260309075248.47730-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260309075248.47730-1-clamor95@gmail.com>
References: <20260309075248.47730-1-clamor95@gmail.com>
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

