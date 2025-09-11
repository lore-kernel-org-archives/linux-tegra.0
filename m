Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C62F3C19
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583827; cv=none; b=ALyRilddKyVtdOhU2O3QbC7txC+SyZ6V0Q2HQm89GOxyIXj1zNfVSRy94t3oaj1gxuY+GETny9DLjZdSh7NnHI9tZpSu5fBOnSJJTCGIU/dMICwYLkJNVciMtEEiq6gGvM7Eu+XF9t6ikPgqRpXJximGSU629H0AWyUH8NdyM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583827; c=relaxed/simple;
	bh=qGIxMSFLdD1OCW1aPIt9bsZ4hBPy6eHSxZx7l14iFd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GFC6EPcEwWRxwYVtr21ChQc0jtk9b+XfQNEroFhHqRYx+bxqiPAudSxGSqBdXYXPWR0itJ4rrEbXpPFHQEgUjLOJh/cjSuWfUh3sfWQXHwJqNExVjN+PZTLImllT/JxIgIgGFHfzJCW+pKe7GHTI9sPr5jGCp3xdsTSedHBp21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU6vfKHO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU6vfKHO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e2f33677efso7575f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583823; x=1758188623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxm1Eo+tRVdG33tlSfkjwXUAZLC8Gj8vvJyWE8eg9vc=;
        b=OU6vfKHOrW+PSV5cA3VHnZAjDNiB0x6FNGDKo+pIm0uPnGqJXJvjuKqBHllT2U0WnA
         kA1BB7s1YS8DTIX8FWf5TezwaUgGyYij4uBaLmC9GPpH8zUwGmx5c0UKROTJueZT+ikv
         Sc2VOpVPv8o1RVb0KuN4gOHLSyA+xc7u5ZadCmbdTaQuEM3/6sNdRyYTRxiZKNo6WfJK
         y7/Cb+I5vH6m342mDDX7AdCnc3Dvkn+7FdQ5mjTuuIiVnTxpX79eyJ920gRrw/bX2geC
         3Xtf6s3a9Pj48s10wWSbLtO+kXAWntD59am9NzNTrHCZ0cjfSeuIxMv6CTcdiF3AZCkx
         yuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583823; x=1758188623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxm1Eo+tRVdG33tlSfkjwXUAZLC8Gj8vvJyWE8eg9vc=;
        b=i4k2uqs4INeSGIGIPUDEuC5s/BCqoIOLjF6T78ydRRflAdnNCW62hpHvzris0c+azd
         m8Ak4Tr3a5wL/bWoqhVmpU7Xes/DyMIJnA0frxN4kg5dmAhS4/95/ZZrMGdQrjSrbNEJ
         3iqZ51YavVr/zruKqIyEtsGlj2EhFlXiGSkPaefGjuLWbengYlt5Bc0Z9anmRRFAGCX0
         MzvCbedMZpnQpoHNhrvYbWERWjsi9mixkQhTrV1xtfYprZ3og95U6X20LXG+ae3m58Cc
         mSObZJzKtxnPdboyl/ABnBd+qCGawbzMANrpaz/X/CTSEQz7lT8yyAWAvOjpNAuLZexk
         z8iw==
X-Forwarded-Encrypted: i=1; AJvYcCW6wedSLcRGDjXP7/lL+0DI1UT35StI+TaQK5lYq0RG1K77K4T346hMyTpXhqGjA//LHhkW5qlvPFIiuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mzjGM12bjhRYIshz5Iqj/KuKWhzCHV75AHBUGW45KvaXAyO+
	kxBMqS8dVIQYI8IE7SlhpORourV9a6R5MprOI0iGEwQK2HQHeW6Sck4HxaAcWrmSGhwQ6gSu1rJ
	K5pZH
X-Gm-Gg: ASbGncu8IHDC5t1zu+7Jn5o4D3+SZsXblgokRsxMnTTBVH8g8Aamjn+QBrw83RaNdFK
	BSSGYBbINPBtY3yJmoL9S88mLbiwvx/mZBUzX4RFfygFZxEGGneD2pHrVibr1cViOPKhr/ltBaF
	xct44M/3dLQtAOMhnhX5dnCTpETeBKN6yACdDeRywC1Nt5MLSaxLQVW9VXpdN6Uc978+QzGL+lK
	Mc3mVxxEYqXKYb+Lk13svvPQt0zUx/SDC0k67Afr2xTI3sQDwUi2X/9ukZlBw49gvGBYzWygbd5
	fypp5mbCB8w/y33pUIMNguRcBx56JMOtooRp2ig3vvVyGzfmp2uu0w8kJ/OWp9IEnl9qYAdLPH0
	dH8xNrz+6HDWq3Js8hDsFWXfMz/dOz2WEwt9gWx3dpClUHxxrJQ==
X-Google-Smtp-Source: AGHT+IESgQNFTpFSdG46pbyJ2UEU3eU1nSWsrpT2/U9X2fR3VWQlkL0gjrMqXFn6GSKpJ4DwDpc7Yw==
X-Received: by 2002:a05:6000:4701:b0:3e7:41bf:e631 with SMTP id ffacd0b85a97d-3e741bfebabmr7390778f8f.6.1757583822571;
        Thu, 11 Sep 2025 02:43:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:24 +0200
Subject: [PATCH v2 13/13] memory: tegra30-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-13-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9708;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qGIxMSFLdD1OCW1aPIt9bsZ4hBPy6eHSxZx7l14iFd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm84iHlQtrL7wZB/qixqHvtxPxb87A4e746c
 IokH9VddreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZvAAKCRDBN2bmhouD
 127UD/428T8EFWTrGJuXRmbJ8M1VxxMbIkaLD0Bn5iKaiQSY/anngI7+nX0Vpu3xHilEc8GOlbV
 qDB7C2aA2glBtjX0NqixSAjHmXIS31ePZo4V45CdvnS7ww/eXXdKLNaNZaPnpa/vBAR/wgmGVq+
 wzWHIM+j8Qomf1DbxmwwZQL4epXmD/H2sZsr1KgvYzt2cvH03ODo+2Gr0eyWKfbt1rl16HF7tLg
 zGNyxfH5MA7ltp/4dDwX3rZGe8y/q7ORWU8r4ucC9/Sq8TKncjhgM6doZEiPIMFBPaILYFU8Wli
 uc1uUUoKMm3Y4K2tEAW6TLqDK0g60lvIqC4ZT5LBqi1KxzcMCb3nZ/IFSEiBEbWYBvhlim5yFwu
 6CL66kD34OlFvYsbLI03PDo/FX2GYLhl3JN5i5eEnhfkroXvsXqPQppPJTJ9r8LqbEAmSqIEjeI
 K4Qq14U052W3ag0b3jfgkywONwX2IO5zTmPwtQSc0/1P5xGVQU+ufugTnYnvL6OU9j64T5OGHhw
 HwUCIovUVEx6yYuI2edcR4WwiQc8QArcIUx3mNm0rkc5cO7bk5WYEwp0VEetHAqw1YprP8CNVsp
 uT5eycNSJvwvClfQbOiMK4qoEKTL12Szz4tIyuhMaxQFkd1mRTAnO6/XO7OPokgFTJ+M4nnp1ns
 UXKUEV1YlB79YiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra30_emc" in all functions to:
1. Avoid name clashing with other Tegra EMC drivers which makes it
   easier to jump to function definitions,
2. Decode the calltraces a bit easier,
3. Unify with other Tegra MC and EMC drivers, which use the SoC model
   prefixes.

No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra30-emc.c | 90 +++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index cca386af423e9647266878ce6cd1bcec09c8eba4..914116d8ec16d0d52180c7fadd1843adc139ceaf 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -413,7 +413,7 @@ static int emc_seq_update_timing(struct tegra_emc *emc)
 	return 0;
 }
 
-static irqreturn_t tegra_emc_isr(int irq, void *data)
+static irqreturn_t tegra30_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
@@ -1228,7 +1228,7 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+static void tegra30_emc_rate_requests_init(struct tegra_emc *emc)
 {
 	unsigned int i;
 
@@ -1330,7 +1330,7 @@ static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
  *       valid range.
  */
 
-static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+static bool tegra30_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 {
 	unsigned int i;
 
@@ -1341,7 +1341,7 @@ static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 	return false;
 }
 
-static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
+static int tegra30_emc_debug_available_rates_show(struct seq_file *s, void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
@@ -1356,9 +1356,9 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
+DEFINE_SHOW_ATTRIBUTE(tegra30_emc_debug_available_rates);
 
-static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+static int tegra30_emc_debug_min_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -1367,12 +1367,12 @@ static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+static int tegra30_emc_debug_min_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
@@ -1384,11 +1384,11 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
-			tegra_emc_debug_min_rate_get,
-			tegra_emc_debug_min_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra30_emc_debug_min_rate_fops,
+			 tegra30_emc_debug_min_rate_get,
+			 tegra30_emc_debug_min_rate_set, "%llu\n");
 
-static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+static int tegra30_emc_debug_max_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -1397,12 +1397,12 @@ static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+static int tegra30_emc_debug_max_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
@@ -1414,11 +1414,11 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
-			tegra_emc_debug_max_rate_get,
-			tegra_emc_debug_max_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra30_emc_debug_max_rate_fops,
+			 tegra30_emc_debug_max_rate_get,
+			 tegra30_emc_debug_max_rate_set, "%llu\n");
 
-static void tegra_emc_debugfs_init(struct tegra_emc *emc)
+static void tegra30_emc_debugfs_init(struct tegra_emc *emc)
 {
 	struct device *dev = emc->dev;
 	unsigned int i;
@@ -1451,11 +1451,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
-			    emc, &tegra_emc_debug_available_rates_fops);
+			    emc, &tegra30_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_min_rate_fops);
+			    emc, &tegra30_emc_debug_min_rate_fops);
 	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_max_rate_fops);
+			    emc, &tegra30_emc_debug_max_rate_fops);
 }
 
 static inline struct tegra_emc *
@@ -1518,7 +1518,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	return 0;
 }
 
-static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+static int tegra30_emc_interconnect_init(struct tegra_emc *emc)
 {
 	const struct tegra_mc_soc *soc = emc->mc->soc;
 	struct icc_node *node;
@@ -1567,25 +1567,25 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
-static void devm_tegra_emc_unset_callback(void *data)
+static void devm_tegra30_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 }
 
-static void devm_tegra_emc_unreg_clk_notifier(void *data)
+static void devm_tegra30_emc_unreg_clk_notifier(void *data)
 {
 	struct tegra_emc *emc = data;
 
 	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 }
 
-static int tegra_emc_init_clk(struct tegra_emc *emc)
+static int tegra30_emc_init_clk(struct tegra_emc *emc)
 {
 	int err;
 
 	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
 
-	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
+	err = devm_add_action_or_reset(emc->dev, devm_tegra30_emc_unset_callback,
 				       NULL);
 	if (err)
 		return err;
@@ -1600,14 +1600,14 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 		return dev_err_probe(emc->dev, err, "failed to register clk notifier\n");
 
 	err = devm_add_action_or_reset(emc->dev,
-				       devm_tegra_emc_unreg_clk_notifier, emc);
+				       devm_tegra30_emc_unreg_clk_notifier, emc);
 	if (err)
 		return err;
 
 	return 0;
 }
 
-static int tegra_emc_probe(struct platform_device *pdev)
+static int tegra30_emc_probe(struct platform_device *pdev)
 {
 	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
@@ -1648,12 +1648,12 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc->irq = err;
 
-	err = devm_request_irq(&pdev->dev, emc->irq, tegra_emc_isr, 0,
+	err = devm_request_irq(&pdev->dev, emc->irq, tegra30_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err)
 		return dev_err_probe(&pdev->dev, err, "failed to request irq\n");
 
-	err = tegra_emc_init_clk(emc);
+	err = tegra30_emc_init_clk(emc);
 	if (err)
 		return err;
 
@@ -1664,9 +1664,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra_emc_rate_requests_init(emc);
-	tegra_emc_debugfs_init(emc);
-	tegra_emc_interconnect_init(emc);
+	tegra30_emc_rate_requests_init(emc);
+	tegra30_emc_debugfs_init(emc);
+	tegra30_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -1678,7 +1678,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_emc_suspend(struct device *dev)
+static int tegra30_emc_suspend(struct device *dev)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 	int err;
@@ -1699,7 +1699,7 @@ static int tegra_emc_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_emc_resume(struct device *dev)
+static int tegra30_emc_resume(struct device *dev)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 
@@ -1711,28 +1711,28 @@ static int tegra_emc_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops tegra_emc_pm_ops = {
-	.suspend = tegra_emc_suspend,
-	.resume = tegra_emc_resume,
+static const struct dev_pm_ops tegra30_emc_pm_ops = {
+	.suspend = tegra30_emc_suspend,
+	.resume = tegra30_emc_resume,
 };
 
-static const struct of_device_id tegra_emc_of_match[] = {
+static const struct of_device_id tegra30_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra30-emc", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
+MODULE_DEVICE_TABLE(of, tegra30_emc_of_match);
 
-static struct platform_driver tegra_emc_driver = {
-	.probe = tegra_emc_probe,
+static struct platform_driver tegra30_emc_driver = {
+	.probe = tegra30_emc_probe,
 	.driver = {
 		.name = "tegra30-emc",
-		.of_match_table = tegra_emc_of_match,
-		.pm = &tegra_emc_pm_ops,
+		.of_match_table = tegra30_emc_of_match,
+		.pm = &tegra30_emc_pm_ops,
 		.suppress_bind_attrs = true,
 		.sync_state = icc_sync_state,
 	},
 };
-module_platform_driver(tegra_emc_driver);
+module_platform_driver(tegra30_emc_driver);
 
 MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra30 EMC driver");

-- 
2.48.1

