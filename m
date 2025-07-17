Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23532F85D9;
	Thu, 17 Jul 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762130; cv=none; b=in61ygAszNzUKV/Irs5u9Eif5qEXFmubAKC4LAbZMECR60My/4QunsX6uT+1FIplNc0grfhlR0kE7uekFvI8qrUodFthuFd7lrRa6YwVDYv+wjdqpVAwYlGzPOqwe/O4kfjWftHY7+8HFhKqIVPF4u10j4agXViwS8kIptS2Po8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762130; c=relaxed/simple;
	bh=s11kfFQEfwmRPGys4vi9dNVvePO0MgLuNby1VOtRHEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TjEIE0NVfoWAvgs2jywjoOWoXU6OGX4xQgz7qf4qA4qm7PBB6PuVnbcEiA81dsN2JtEnI5+Z0js//PNQDYhckg4FQpwSXq89Mid+gI8nD+6L7ZCEWHGf5CyQMa9kE4EeGH2X1MS5BZ3b03IHlsyiKjZmF/4Exo5DIWZE84HhmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L40mPCDd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L40mPCDd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1057387e87.1;
        Thu, 17 Jul 2025 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762127; x=1753366927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
        b=L40mPCDd0AclwYTJokDHBVESn5wUOdh2vA3FdCbf7cVNDmSfmTYQne183TNkIAYfRI
         ysGqKLrLKn/PpBjeZdg5Z8YfLqF5Da4xjgTleIdP1FMtFGHMnPBvMPBplJv9Kf3zfU8K
         4SgiOLUl0Omz1vfisiV2Or0N8p7BY/m0AC8NQ9UA15rbpDQxK5o5jkjgBltV/cnYGj17
         fwCtFa0K6hTLdJcTGxj8gbQBKxwmf4qpl7H5hrdYD/+lKz9qb9jGGeQQt8FWO0pww9LE
         JqrCMrb+ujKjrAd3XOnC6x94PTiSvgKJh07hewfsVN1YZJouMWSvyC9mvMMAJa59cXS0
         kSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762127; x=1753366927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCRPXJuyMzLZkmX2SvGMR/caiVTF8zEmEw035VGaKNA=;
        b=pjEyGZomeTMHFp1tpXb354RCRT5FPkGezG4peyyTuEf1p7Kk0stxN0eKSIuDEaJZXs
         LI9s9AEyK7C4MtEzt/0erLVK0cxEe2cgdMR3+wbMS8K+dbfdQ7D/WT+h1H0zDYUPtfnK
         QBtrVHT/wHey78fGrhfVXo44+xmIABYLm09yJaGmXK3sLswXLYHX/XrH1vgnv8iQ9dOk
         Q5RnzhQ5p4uOhJLjpayn8RrhTXHE3rz3tJuPknSYhQJq1uimKoMnqib9Itca7KrfTTpT
         VUV8SP9Fv1r7VeSiBf8rfAIUMsrxmPiKIZrD2UtDaT+H34Lqv0Wiu1MNLB6XCYobv8vm
         nIgg==
X-Forwarded-Encrypted: i=1; AJvYcCUiHk9Qx7yIitsHw1eUKGlFrEDA/gQo8PAygy5pg2oMQU9Ob6gQIj+aGDK3FcuTC56+VtFa8M4PB88Y@vger.kernel.org, AJvYcCUkHxcF/VuVvv9nrVMSBG3F9yuiHLIIO9ha3ATRwRS+/6xUbaN80mxSRaUlWBUGbhl+Jjr+NIwOD37008cy@vger.kernel.org, AJvYcCVEzW5zZ4qLTLm/b66DfF19XGqKB2qZZDiBog6MX9VLnK+aQOOkzPI+bB3HClvXgx1FB0umYvFld9wh@vger.kernel.org, AJvYcCWhOkMt1ufH/OLuK6bV3u7RSfKXJIuQi1XKfwQKJttJzcdaOaBN+4qwpFg9syQnbdP49Iwj83nhsJykAAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn5Tb4pfPCMtmhL5aeJ5sRMoAnEf4Q1riqPwXXlABV918U7VQQ
	46NsrJmbj1zWJ7wtv1I1FQqwndKdKSHWDvaV7yGsNBzqYw0FomHjjdaJ
X-Gm-Gg: ASbGncsoptYxSzIgE/Lq7jh+Kv09neley9Sb5G9Xeo27l0VZgXYaQ5YzO4SQYY/xeZe
	6MLoK0cOEd8s9USKPAPoUStCeINor8EbD0jtL0p74gC+CRhj6Z+TE2zb9pu5VOk/RuoE19PxNL3
	B71uQGlqFIGU299u0bqRIK5wXbvNW/BNvCi5QFWHjvh9KOD2oFnG+/KxAlU7eTA09zPwAh7eosm
	HGeXU1QZFYcZP6weB1cKZqzSVTChDibwr42IERDRAkIo9f4OvbH9LpvjcS21YfHPeR1epHI7qtN
	pnoF5e960jrUmskWrO3b7cviQygOttci/AW+xYsKOqDNSQP/XT8VFWzZmu86XWIuBt8hkWX07sD
	sBnZmetFtf4Inug==
X-Google-Smtp-Source: AGHT+IGrbN5mHRPiiMtppVmbuHGOd3g9rJ3Oq45Lxs0VPpdE/NlkM5b45zOZqDMAcFqvsAHYbXrcfw==
X-Received: by 2002:a05:6512:39d6:b0:553:2a16:2513 with SMTP id 2adb3069b0e04-55a2971a2afmr1090464e87.47.1752762126484;
        Thu, 17 Jul 2025 07:22:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:06 -0700 (PDT)
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
Subject: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:38 +0300
Message-ID: <20250717142139.57621-5-clamor95@gmail.com>
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

