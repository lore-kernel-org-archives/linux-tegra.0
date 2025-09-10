Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C62831A57D
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501072; cv=none; b=DknJCEaHPEJPAJ0lx4o/W9zAxO1GdjLXDgzhCshVX1rMeggpwU6y/zZf556sRG9ZyzdVr87X2eQBo5+C1C6k6aReLYjQfYHqbSkZ9OYTePk5l7p3V0w+gyNAvDeAmAzikxpNmmgQMR2T7BLyynqLPl2fAnCi4yeAVA6E4wagAGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501072; c=relaxed/simple;
	bh=tlQi3r+H1JGGrk/YLRDqB/Z+oPYppKLe5bLhnA4eaRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQ3asuLQ0hw5WuGHwlwQ2TWbVy0ZALH+i8olW4OwgeTejd9AKLRmW89Ani30j3g9AAp+MVaereL8DLomcLb1HC6Skt1V0B4mjuWMZjFWgra9FdGNOQdV4NhMLdc7Dtdy8K44okPmiw/jYNpn0+F1O1SBGg4OVwxwTgAMwXvJM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQTWcIce; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQTWcIce"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61eaa4f6784so1142234a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501069; x=1758105869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awjAmmSZbAFmfogi+S/l4kjOeQDsQkYCuybhjXS0HiI=;
        b=fQTWcIceO40bLqzMmCz0LAqlbBYWcU327dNInAf+QoJU/bOxfBMmqBdvKtD2/GjV6j
         1NUO191TjaFYK3z3sbb9Bc1a5VqNFK0Gir6Z8zrJivj8DRgUKcuOMHbYJUujkgYvrfNG
         WycQXOd7FnLa9IqbDl2V8FXn+SU/uVfyILlIufpOYc4hlZYGeb6OlrYvgazEDrLxr38i
         7z/N1ZznsaA4ScVa0j0iPkOQJFAfi3ekj3uSkGhs6SRclRog+32TAvYgBLo6egmLGWtD
         0UkZ7A/Syn6zwcQaatFk2pd2judJT52u9XA/rwVW5O7qdVb0zAUhoKE6uqhtjQv2A5o4
         BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501069; x=1758105869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awjAmmSZbAFmfogi+S/l4kjOeQDsQkYCuybhjXS0HiI=;
        b=rCecoLLhs8fBLJUshy58ct3Ejs2MOsTHsUNwKxj6eA7nBBPJZiAJFqRg8DTFK0+p5F
         ssW6TAJNhRnjp1/QbQleAPwfYuNBtJ6GvngrvdG38ZSwtIj53cd06xwcjmYNgITMIrBb
         ro4WPnHzPE9/jmTrzISoPIE8HN1GWl5crJGh/VgBjEcxM/OFKx+fUVCoT1EzEiG3Z14z
         BhT4DLknz+DuOTf9BjAwswzHL9f9xrtmwFZ52ayz4YZJbOk1m9xUjnXdJRm3Fe2wCPCk
         E3DnX8KwjkvbdCaOs/HUOZQCFprpJ6HLwuRGtNEGlQVLaTixNlpPJX+3lYz5fHzQf0rI
         IlWA==
X-Forwarded-Encrypted: i=1; AJvYcCVaW3qvwROOiaXUlhDSOotmX43qRXvDmAyAQuMf72p+Iucn6awNg9wOMejC1lABR3k8S+0brGzVl+4fDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tkE554Aki7YlSeJ3OIwvcBTyEmyV2JBo1/E1bKJrinKv4JjN
	kqhWRpaLXnJRC9zjIWAoKnRKnvESbzrJetxj2pZCwsQLwlCPbhj27EuJMiSKRhRdWlju1pDRlTL
	ox1iG
X-Gm-Gg: ASbGncva+oomygU4L0sZTsDvP6DSniGnfM3GwCHdl/9eqgFhWj0DREz1ItqEe0W1Y4R
	Islz/K6K8YKAQsHt7UzRbhNxcF/Aom6yH3RMgScoI7Pxy4aLEAuk9A9iOdIdnkMOdICknoJ3OBI
	PL6Fhj7eMT57+xN58nQcBm/TeeVgMrzdRnSUmMGFcCGIFfdopUYJH469Re501ZeA/F6zlKUhWjz
	0ocipc/2FsNmrd/eP1Pizb1/9zgDNNLApoCFoFDlRFhh+l/DEUnXZoVVT6++x8UhA/Yzxyw2Zl7
	/e81FbYo/EqaksYWBoKjmeeFAz0avA1kNTTl0o3w/wNqJqf03TnTLhfWkWBYSrWe6AmYNdJEHms
	CMKYcUCrb9+s6itqPgJdKtBNZz/uYNh3aCRA+9t0EmoTjd7QiuA==
X-Google-Smtp-Source: AGHT+IHYWOvbvSNVW7lGcnVhQ31yPAiSLv/hdr/5YNQZR/qNGILwRXiZbORt5T5qnaUAFzFEzwKbDA==
X-Received: by 2002:a05:6402:26cf:b0:62c:af05:580d with SMTP id 4fb4d7f45d1cf-62caf055e13mr1859284a12.0.1757501068808;
        Wed, 10 Sep 2025 03:44:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:09 +0200
Subject: [PATCH 13/13] memory: tegra30-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-13-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9709;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tlQi3r+H1JGGrk/YLRDqB/Z+oPYppKLe5bLhnA4eaRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZ6p+Wg/cvmcpBedI/b23/dTkekCQenKngl8
 zJ4021ZUYmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWegAKCRDBN2bmhouD
 1xH/D/9v/cFr1rPdatL40Y7SD7ZLaHS1ZHY2/PasggZV3bZuTOpnuVu3Wfng6cFgfPOvkyqDpWf
 6xh3J3hj+FH9mkF236GAZq0zk8MibaMmL3jxhqJ0o+1c0XUjX6luZefSoBuxGRp5szuFioL34XZ
 tXTpU0/eI4zIfHLJGUU/mE0zgVrq/SO7zMRcdUZvyPGslJlWesMSnSzyUR2JZOHPBLbzsRmb8YD
 Eh9lYwNnqQ2KHbmPI5u2SaTLPRKKiM/j1ioAS47NY4oVkxfIv4twuPjPKq7X1iqkpr3lKW0nVl7
 OUx5eijBmbLZRzOHc6nUJKuedUgMv9AmMjBTo1Q2r7qEijVbY3Mew+3emBATEHixykRkTrZNjcc
 x1A5wO2m+y+ZCNZ4oBZQw51CHd5mLvL7lss6ifVDASn6e/iLODbhWTqmbEsyxE8r9hvCz335ZkM
 zv8t9Jfz022bDuw0kX8lbzf50gCqE9wYIQ/B+5lJc8Zj6p8V/BA5hiiW0xCTsVZOApusRHUX8p2
 8mJcwZI49yFgYUNlE8MSu7HX8WWMqHzyRA+opzUvHvThMnxHLaKqaqGd9YjynMzpUb2CUMdqbBV
 4y6yVmM4uuuTi9GbPXihbepRX115kjr578PCzfiGpOJVHF5B/ujwTuWXRGJHyNGoJ2AtMT8uMQu
 WnVigHq7DUj1K/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra124_emc" in all functions to:
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

