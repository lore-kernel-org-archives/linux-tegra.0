Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F572631
	for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769346826; cv=none; b=ajiZczpZwtvPdsMyvW2Vqw66hzhAMLOopueyVmTGsBf3zWHdb+PxKKN++GkDM9M22OSnGu/tGU7vT2/OrPh7bqKHfqnbjMDxS7zmtJxf5F3J4hSTv+fAvZs19RSTgMw8IBHPC7YB3LBq5f//rCTP6yf5vyuXZvAxIyF7lBEsPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769346826; c=relaxed/simple;
	bh=jVVD+DpNmVMqoRCeNtNFQY0wBEi7dPAW7oXyMMZv2aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Esi//MiKlISXcekpWJE/ZW5Np3MplpDW3zegzTRt8JS3DCwAqkGZD8KZvGC81ZdKYFkW+2DodbwIGk2Gjphd4mDkQKXMXaxySrCjmvdDlRfQgLU7jR+ohIUBZPILZKBNt+NCPwBmj1Exk08SDWv6HmGm+vrp80j8ylUifq7In8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs5qTmHV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs5qTmHV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so26684765e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 05:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769346823; x=1769951623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfXKY9PTCCCTBgICRlrtseHychldH64Yu72dfRqtlTk=;
        b=Fs5qTmHVYznsCgAldGZhw0VHO6D6vayelPJ1O/hz7XEf7nYbB2DVkbragCYQvmj/0M
         r/Xyq4NH7Dw7nBfBdBecWBi6oNEABYOJJE9Kh4dloR2kv5jomNzfqUvoPLRi0a5Jq8Bm
         u9K7ksWSocxzD3BqGCwTPHJrvcL8OKp86E98CZr9FOmVUw/k7kzmchAlLmorTkoMxXjW
         MmowdgDXp1ld8Z5Z6sknHkocADR0oVhob8pPbo9QZROHkvwO9WJad7oihMioQUQRqOjj
         ILsrRDKPD2cUqazC63eK1RKICTxh0d4fLHO7W/r1ihjWmdslOzDtEgKBISKkb8WteKQt
         NnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769346823; x=1769951623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfXKY9PTCCCTBgICRlrtseHychldH64Yu72dfRqtlTk=;
        b=L+7sqnGUXgkBymgDZsfDDFzrjrdMCV1N3MG6m0maXl1fB0Vxqzx6SxiGHEbOSAazM+
         mGslU+mFX1g7r9L07UsLOcsYuIMKkqXjQNdIHZKJIhCJp4xJPlOxyObQtf2M7G0Rh720
         E282Sx5rmXWI/xVBeytSIddaJ4bzgk/MXStDktbwwh9sAJE+gnueeGF9bCiFiuohhBgE
         QeIXqGwDxrXRokT5iaRxLDxevBNf0NrGnB84/7zlbPpZr9K+wE96Utc+/xvwTtWj7zft
         bpOb3bC65jU+6EO79x8EGmuhDgbyUxN863TuT61fw0f3wzYB52VMeAHOYEgY7tHjzXNx
         EbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8oq7YCcZ6fVdq1/+hUgNWSV0RL3aD2Ffy29mJL8hdXVZBuNJGfcCYIvL4YWHRP7qTjXMLQRh+L3Lb+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YylB0477kAaazYPqE54AKCRGRQtC/vIcApbkVLKY7Ai2ciDm/A1
	PxseoigZx9pFQmDk4w7ApN3OnFc0ektOBtlGBoD5/pwYssKpfYv7G3C5
X-Gm-Gg: AZuq6aI8DneNG1/ip/WvvVSmRsFkeGf24A77kmec/d0qZSO6OR0AdgrNBEzmnxA3il4
	LrFcXIUvUs1XdY4ei/u4YzQ59excVFixSDYaGiM8AAD+IqpOE4+cZmy2+WZ+ecSm8LoCnRzBqc6
	Jz3Ae7fTmZ/I9TC53k+KJW1Jk7+EdozsTdh8j2S2EnGNFJbRh2jZLv37aSc9qYc9eahdyLYXgf/
	WqgO9Aoe9+gqJFeUvrQYj0ZMaSsn5+SuWzmsZkpLrg+rbglQS5Cff7+dhAtfz7jUlFaPziQIYGW
	ab4sUeF3C2MlCIXuMFjbXUIeHy5qrM6m1PduaKGm76cRhsAxuZFusGFCd/JybefyF2FhNpTpQf4
	0qazYqQb/DaEX7rhCxdN3bm+sXEyZncEfWv4LPorjUUP6GkpyBi84BxTeIuLMjVX4otwqL+7zNa
	C6
X-Received: by 2002:a05:600c:4f4b:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-4805d06685fmr27861035e9.34.1769346822505;
        Sun, 25 Jan 2026 05:13:42 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm21958244f8f.12.2026.01.25.05.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:13:42 -0800 (PST)
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
Subject: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
Date: Sun, 25 Jan 2026 15:13:22 +0200
Message-ID: <20260125131323.45108-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
References: <20260125131323.45108-1-clamor95@gmail.com>
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
---
 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dsi.h |  10 ++++
 3 files changed, 88 insertions(+), 31 deletions(-)

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
index 02a661d86751..ebc78dceaee6 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
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
@@ -82,6 +87,8 @@ struct tegra_dsi {
 	/* for ganged-mode support */
 	struct tegra_dsi *master;
 	struct tegra_dsi *slave;
+
+	const struct tegra_dsi_config *config;
 };
 
 static inline struct tegra_dsi *
@@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *dsi)
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
@@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (!dsi)
 		return -ENOMEM;
 
+	dsi->config = of_device_get_match_data(&pdev->dev);
 	dsi->output.dev = dsi->dev = &pdev->dev;
 	dsi->video_fifo_depth = 1920;
 	dsi->host_fifo_depth = 64;
@@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 		goto remove;
 	}
 
-	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
+	dsi->clk_lp = devm_clk_get_optional(&pdev->dev, "lp");
 	if (IS_ERR(dsi->clk_lp)) {
 		err = dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp),
 				    "cannot get low-power clock\n");
@@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct platform_device *pdev)
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
@@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct platform_device *pdev)
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
+static const struct tegra_dsi_config tegra124_dsi_config = {
+	.has_multiple_pad_controls = true,
+	.has_mux_parent_clk = false,
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

