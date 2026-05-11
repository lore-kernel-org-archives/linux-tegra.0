Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCBE3A872C
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485704; cv=none; b=VpLp2q4B7W25Ti+AAi2h3HhCMG9X+eQH7Y7Q9lX80Ai6S5dkgqTUNzwp3HyOFXj7U1gI2UWr77qTKBxCgtPbxGGiYwNMeSPV9/ifUsu902UmPFN2i7mjTwpXUCxZhy/PygOrQW82yok2ks3Yyg99TW6JgbKhLrz2kgwUhc8MG1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485704; c=relaxed/simple;
	bh=s11kfFQEfwmRPGys4vi9dNVvePO0MgLuNby1VOtRHEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zi0zorDs+H6Z7UkVHnM5nu68MsSHYGUFdBr7+oK1SZoglqv2/RI/c7bbewKbX69xpROsn8GxcVkWEtN8rId/AnSj3pHD9Tm6yDcQOb2ngazREh83yt0BhSWYGBJhcpycXoT1jLDG2PND93Qx8QLY8tuy35ddlHbzRP0LK1nOLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQ0nEDzu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQ0nEDzu"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so3957535e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485689; x=1779090489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
        b=CQ0nEDzurYYLCNllRYCk4O3JVGzf3HZWTd6g37jKmrD8Wg/msEkt3i7TFKEHuR3bX+
         XVTF6lTNAOlCgaBw5dpxFYIR1ewVYamwHwOewYRnqfdSjDcpp3B1oEFRFkJG0jR1nltu
         T9uSk0nP8PUhounf6HLyDaHV/frx3mm0raeK4H5XleYkDd6QDJEGrXNgwFF/xF+lgpgv
         T18p2rehxa7J884Gc5sLlGOygmcRb8yZ2+C+GH5jElOV34kj2vfPDIg51paHZZQuw+gN
         qgNtjjPCf6rchqQRQXGes30zyN/icUl3ckyOaxuCW9f6U7EwYbQZZUAw/sA1w8C1HTFY
         jNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485689; x=1779090489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
        b=LzaFT3d+yLBbzREko+qOzNDkfoRp31aPIdaezeZrEA4gan+pMU15Myvsz2qcL8pA3Z
         6uXwe5paapfdJUEz8VRoGKuhHeFd9Ln7BMdEsCFteVIauQg5Emo9mOzGlqtvD55px0lc
         IfAI9/1z2kYMX8bfuAs4QVwD2Y6qHpoEUmWaphuya0ghePif2VFW1KjtoRdlt1LK85u0
         nldeEmf/cD54gPAQRtFXOpU6VuJ6zB3FC9j8pP7kVpVGjBn7C5x7oYCPgGAN6Ob6DV09
         sPbdHdb8pVQPjhyQGsmbX8EQgrdrdJ/aVGSaJ6fBc+KL2tfkdyE4SGbJ/12myyGCHfSV
         hSMA==
X-Forwarded-Encrypted: i=1; AFNElJ8VQHFbYufmHL2pr/Llxoi8lq4c2o0GbGrzLznzNjQ2YXnNtAiqc0PmKtafTj4Lr9eYyrP2FonAQTz3FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmydgtCD04oi323tlyNjyW7WyhKjtuyHi3/X3mcxqXSyui5XUI
	sdmRilkS0xWtlkIok2sDmjtWe31exKIcVKbNnngabJvQCC8aJ3jp/nzz
X-Gm-Gg: Acq92OEA/3BnNi9XjBNHzISyOC6N32L3qAqjFBVFu8YOqfIQ10dgoRjtYbaA4/hDBf6
	fyN1NNbDQ8wmYQyerHmVdPjF5CsyVWwHtU1IfMeWlZgj2qL7t3itFuXk3K9j8QSjZuwUE5mvoCh
	GU+VC1BARM3AKeCFh30vS6vRQSqDWQYZjiviOKKhNftcdmNMGFarUPf/332TW9rYlfyETxmnK3W
	ixoO/aR5LXY5ElxFVvFeIjNE5uA4ZLi26bHIOrfNS6+Y+2IfxG4jsk9U6ny/5DuxThkL8ovBLby
	t++lfMV0IXO9CUECkWh2+1w1BkaTk8UQE+R9U7D2H7tycGYKSfxberG7rFu3G0yhbxQHXIb8q4/
	yarvclXnZKuH+38pGsZymCaut7jbYdqg6EYSgjrPy9183gmEGy55zDMd1JTNDOtSrBlxuvcCVqV
	qXEsIsbVMSNvXA
X-Received: by 2002:a05:6512:15a6:b0:5a8:9135:126e with SMTP id 2adb3069b0e04-5a8913516d3mr6026981e87.36.1778485688619;
        Mon, 11 May 2026 00:48:08 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:08 -0700 (PDT)
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
Subject: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Mon, 11 May 2026 10:47:51 +0300
Message-ID: <20260511074752.24745-5-clamor95@gmail.com>
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

Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apart
clock configuration and MIPI calibration which are addressed by this patch.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c |  2 ++
 drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/dsi.h | 10 ++++++
 3 files changed, 54 insertions(+), 27 deletions(-)

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
index 3f91a24ebef2..85bcb8bee1ae 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
 {
 	u32 value;
 
-	value = DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
-	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	/* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
+	if (of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-dsi") ||
+	    of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-dsi")) {
+		value = DSI_PAD_CONTROL_LPUPADJ(0x1) | DSI_PAD_CONTROL_LPDNADJ(0x1) |
+			DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) |
+			DSI_PAD_CONTROL_SLEWUPADJ(0x6) | DSI_PAD_CONTROL_PDIO(0) |
+			DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0);
+		tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
+	} else {
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
@@ -1615,7 +1624,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1636,10 +1645,14 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	err = tegra_dsi_setup_clocks(dsi);
-	if (err < 0) {
-		dev_err(&pdev->dev, "cannot setup clocks\n");
-		goto remove;
+	/* Tegra20/Tegra30 do not use DSI parent muxing */
+	if (!of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-dsi") &&
+	    !of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-dsi")) {
+		err = tegra_dsi_setup_clocks(dsi);
+		if (err < 0) {
+			dev_err(&pdev->dev, "cannot setup clocks\n");
+			return err;
+		}
 	}
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1709,6 +1722,8 @@ static const struct of_device_id tegra_dsi_of_match[] = {
 	{ .compatible = "nvidia,tegra132-dsi", },
 	{ .compatible = "nvidia,tegra124-dsi", },
 	{ .compatible = "nvidia,tegra114-dsi", },
+	{ .compatible = "nvidia,tegra30-dsi", },
+	{ .compatible = "nvidia,tegra20-dsi", },
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
2.48.1

