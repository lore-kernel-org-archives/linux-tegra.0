Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12A2F3630
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583825; cv=none; b=eOCQO0LbZobm4wi0Pd4p9NvWCCvw8Fa2TvjOXdlW38MJ1jw6ZNdkC2FaHv/ITT2P93DxORoy0uqp6wpLZk6txrzUHiLKFgCGYhCRK1XPCmPWecaYAPY00GuIk71FW/dtuhUDe4OZFAVQLi/lUFJHch/sWtQPeF26g3lKQdkjX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583825; c=relaxed/simple;
	bh=+DKhnZ/wfxN+lWYBhIDkpgdioNkSeR/jV1dNtS5sXFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkthp2eiO7pqRTS50ZKhULvVIH0FZTHS3UvdEQOpOBSw9fb/1C4gjLx9PR+NVh0xyFoGB+PJmI6KaQYMHnnKquVLWks3hw/05o0xVMVkRHTYwm+NHVaFEGApk3xRLOkZXremlBVS+k/cAyqtoW3LrzUKAP6T5WvkHY515nt+U9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUckuSjI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUckuSjI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e753a311d2so69996f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583821; x=1758188621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0wAbG0tLjrUM+iYP+v2dL+KRMi3fNkJUpDnkhwIEjQ=;
        b=OUckuSjIgKjKULLgJktHrGqEgMDW5aq8XouFT5lSSuvru/YRgiwDTb55habKXJE8QZ
         YYKb2tKCM6L6ZOPGt7+r4DTJHQ9fvjOzudz/ZLhHTR9WHvz1PRurr7fc0JO2UtgJHIs4
         C/iI0W/iq06Yv+NrSXJgSJcQS0QB5SIg/1y8rSoIdMoo1DkfmGzQxOIRjOhz5JIdnjdT
         f4+RISND6ctHfa6EGhWeAlTdnlsDvLCD2dZR8i5qofBofk72/bs4a0TkpOPBNXe+ysPC
         ypkxzlBImS4JYcux/vESCCJbIHFlG8phUmApuJRz8Jor2Ry4oEcJRowKFzU+KRtocR2g
         SPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583821; x=1758188621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0wAbG0tLjrUM+iYP+v2dL+KRMi3fNkJUpDnkhwIEjQ=;
        b=GBWwdwaZGfQj4X5Bw/4ZgGaBBkgNqztFUkEOlbw9MPXx146CzrYQVYtnMcttX4R4vh
         PGig1k2rpqr1i4Q+I34eBlvbqzxXJ8E8DXx0lPxoV+JRuRmYtgiEHlYsC5ZUVFe87siq
         oq6BnMJVKhvub8cHDnHdykaGqF6l2iN7N8xueSp/9qeMIYtsyADB8wpRmmzD95H0whRS
         oZMsW1ncXT8RHa8/SOHAU0sl3DT99KtbFDfgCZRJxtZr7A6evgqnyArCIQJWixLh7FsO
         a2G0ysLBqokflCje1hxPVQ2+FbI5J+ZZfbwvJfsWoGuLoSu4hyxq7KitRd3wZWQc8YPU
         +w6A==
X-Forwarded-Encrypted: i=1; AJvYcCU86bERM/JE4Qjb/Xm9XJFLfJHailIu33aWHdqBheycsFNwx4au5cr9NntDSksFx0WF7o3WOuKkPIiA0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhM6JKFysCY3sFCHuW7YsgDDhTVmeRQpyZcmvTS7vFzsmH0Xd
	gK3QpZpYN+ZkVqJcy1qVdHKFl73PHSvVI6dMYkbyTmM92ZGmbjly4b+epsPsM2QtFRuBD5kQ8NR
	tISbP
X-Gm-Gg: ASbGncskK1cOxMzozT/kZBlmxUk/5FCTVm0ldCT/kL9RiEr5GlpJ6VoiQ8l3b6gnrpA
	szPx0h9E5BO30tHWnTfc+WPO/ewrcsKEtLWEQX/Ixl+xXBa7g7OXZBW+Dafh7g2G5H/ooTddDV7
	g0ncKFkSMigqexruz9n1EvhOJ+Tl4PCDPutwLZISKDvaKfLkwWz6yK0MO8Gv6OIwomFavI0zZp1
	GLWTiKr9CF5Dxokgv5kVEBFudd1Cx0eaomIiCidVYg5zQ/xyAPy79PrX25w68NKXdanWLx7InqQ
	ps0xoFwlOZDTX1aYK5AU9QObVrd6EgHLoj7NPUbqW/koeOV8RuopQ+EIK17bACIOGZcB5HYiyQf
	2AgaUKZb6Vh0BOFrkT6Kd4rrNo9dNRwOwD9+jM4TY8tN0cG0nRQ==
X-Google-Smtp-Source: AGHT+IEy8voEinK3BVG47F9R0HEk4/OyfusT1NLJgI+IHvactxZuhNeBeG6un9EMsviFxU4sExX7BQ==
X-Received: by 2002:a05:600c:37c9:b0:45d:dbf0:4826 with SMTP id 5b1f17b1804b1-45ded02d62fmr49716645e9.6.1757583821274;
        Thu, 11 Sep 2025 02:43:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:23 +0200
Subject: [PATCH v2 12/13] memory: tegra20-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-12-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13252;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+DKhnZ/wfxN+lWYBhIDkpgdioNkSeR/jV1dNtS5sXFk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm7BHYgc+Lq5cLJtVfPxdZDzccjS8+Ia5y5l
 M+04t7XQ1+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZuwAKCRDBN2bmhouD
 1835D/4gfXZfisy/4EKxTmMiAiNMWJe3VlfAWZjtS0sqdi5GtMjfBpATCs7F2clNu4oG10gzMPd
 v/0NqY6fdFCrN3ebWe+IE2hfDBqC9FgEoGqK2PB5YSW4pn5psTib2frjGkX4F7fJHzeZgdyzr+k
 bXlvd26QZxmBt29pNC1VE3hRH8uT1cd6GdrtQxkevYFA8rHx+eRg654W1D+juQxspa3bUKtl43o
 8tRaDN5seKZZtNKwy+efGenAIfgVBTutOEA9uJHPyXxRmuOoii08pUl61FhIL7AcPYm38DEXKnW
 MX+s63Ri+Q96rxklrjmVNse/8TdTS8JYxRDdHQ1TQkL0YGYjb0TjkroHYlOpZ5ANWulT1af+Cz8
 SDajapnzi9wrOgI5Tijyx+CoPXVE1l7S4d0QHENTcQmKygzPQNh43laX18ZZO1PjKwbhErvU5LB
 +0v50hCT0VZ4LW8DP7swdRYYS/N+XG15vfyHAG0wowD7iO4o4KKyiK2x9gkTb1g5Vx6Lft/7A99
 GXYoHFftXOX4bfUG3dZqXU6vQ/RwQUZ1SaXU5HJBmJkI8StHsia3WYdK5t6hya14d0T+m/Nmnc6
 gx8Ab0wFWjhNenc3wxULYYXwLq8mf3B5wajHvvkd7j774BgnAG/liqzNP28Ae4gxl2X5OUphfYh
 3P7p3qd/SoiAoWw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace "tegra_emc" with "tegra20_emc" in all functions to:
1. Avoid name clashing with other Tegra EMC drivers which makes it
   easier to jump to function definitions,
2. Decode the calltraces a bit easier,
3. Unify with other Tegra MC and EMC drivers, which use the SoC model
   prefixes.

No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/tegra/tegra20-emc.c | 120 ++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 18e266dde5d2a0fb962fadc04161b03fb79f76cb..398cb8ae2e38736fcac04d71738b11b3d5b75f4e 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -232,7 +232,7 @@ struct tegra_emc {
 	bool mrr_error;
 };
 
-static irqreturn_t tegra_emc_isr(int irq, void *data)
+static irqreturn_t tegra20_emc_isr(int irq, void *data)
 {
 	struct tegra_emc *emc = data;
 	u32 intmask = EMC_REFRESH_OVERFLOW_INT;
@@ -253,8 +253,8 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
-						unsigned long rate)
+static struct emc_timing *tegra20_emc_find_timing(struct tegra_emc *emc,
+						  unsigned long rate)
 {
 	struct emc_timing *timing = NULL;
 	unsigned int i;
@@ -276,7 +276,7 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 
 static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 {
-	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *timing = tegra20_emc_find_timing(emc, rate);
 	unsigned int i;
 
 	if (!timing)
@@ -321,8 +321,8 @@ static int emc_complete_timing_change(struct tegra_emc *emc, bool flush)
 	return 0;
 }
 
-static int tegra_emc_clk_change_notify(struct notifier_block *nb,
-				       unsigned long msg, void *data)
+static int tegra20_emc_clk_change_notify(struct notifier_block *nb,
+					 unsigned long msg, void *data)
 {
 	struct tegra_emc *emc = container_of(nb, struct tegra_emc, clk_nb);
 	struct clk_notifier_data *cnd = data;
@@ -407,8 +407,8 @@ static int cmp_timings(const void *_a, const void *_b)
 	return 0;
 }
 
-static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
-					  struct device_node *node)
+static int tegra20_emc_load_timings_from_dt(struct tegra_emc *emc,
+					    struct device_node *node)
 {
 	struct emc_timing *timing;
 	int child_count;
@@ -452,7 +452,7 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 }
 
 static struct device_node *
-tegra_emc_find_node_by_ram_code(struct tegra_emc *emc)
+tegra20_emc_find_node_by_ram_code(struct tegra_emc *emc)
 {
 	struct device *dev = emc->dev;
 	struct device_node *np;
@@ -710,7 +710,7 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+static void tegra20_emc_rate_requests_init(struct tegra_emc *emc)
 {
 	unsigned int i;
 
@@ -812,7 +812,7 @@ static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
  *       valid range.
  */
 
-static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+static bool tegra20_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 {
 	unsigned int i;
 
@@ -823,7 +823,7 @@ static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 	return false;
 }
 
-static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
+static int tegra20_emc_debug_available_rates_show(struct seq_file *s, void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
@@ -838,9 +838,9 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
+DEFINE_SHOW_ATTRIBUTE(tegra20_emc_debug_available_rates);
 
-static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+static int tegra20_emc_debug_min_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -849,12 +849,12 @@ static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+static int tegra20_emc_debug_min_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
@@ -866,11 +866,11 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
-			tegra_emc_debug_min_rate_get,
-			tegra_emc_debug_min_rate_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(tegra20_emc_debug_min_rate_fops,
+			tegra20_emc_debug_min_rate_get,
+			tegra20_emc_debug_min_rate_set, "%llu\n");
 
-static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+static int tegra20_emc_debug_max_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -879,12 +879,12 @@ static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+static int tegra20_emc_debug_max_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
@@ -896,11 +896,11 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
-			tegra_emc_debug_max_rate_get,
-			tegra_emc_debug_max_rate_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(tegra20_emc_debug_max_rate_fops,
+			tegra20_emc_debug_max_rate_get,
+			tegra20_emc_debug_max_rate_set, "%llu\n");
 
-static void tegra_emc_debugfs_init(struct tegra_emc *emc)
+static void tegra20_emc_debugfs_init(struct tegra_emc *emc)
 {
 	struct device *dev = emc->dev;
 	unsigned int i;
@@ -933,11 +933,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
-			    emc, &tegra_emc_debug_available_rates_fops);
+			    emc, &tegra20_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_min_rate_fops);
+			    emc, &tegra20_emc_debug_min_rate_fops);
 	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_max_rate_fops);
+			    emc, &tegra20_emc_debug_max_rate_fops);
 }
 
 static inline struct tegra_emc *
@@ -1000,7 +1000,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	return 0;
 }
 
-static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+static int tegra20_emc_interconnect_init(struct tegra_emc *emc)
 {
 	const struct tegra_mc_soc *soc;
 	struct icc_node *node;
@@ -1055,25 +1055,25 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
-static void devm_tegra_emc_unset_callback(void *data)
+static void devm_tegra20_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
 }
 
-static void devm_tegra_emc_unreg_clk_notifier(void *data)
+static void devm_tegra20_emc_unreg_clk_notifier(void *data)
 {
 	struct tegra_emc *emc = data;
 
 	clk_notifier_unregister(emc->clk, &emc->clk_nb);
 }
 
-static int tegra_emc_init_clk(struct tegra_emc *emc)
+static int tegra20_emc_init_clk(struct tegra_emc *emc)
 {
 	int err;
 
 	tegra20_clk_set_emc_round_callback(emc_round_rate, emc);
 
-	err = devm_add_action_or_reset(emc->dev, devm_tegra_emc_unset_callback,
+	err = devm_add_action_or_reset(emc->dev, devm_tegra20_emc_unset_callback,
 				       NULL);
 	if (err)
 		return err;
@@ -1088,15 +1088,15 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 		return dev_err_probe(emc->dev, err, "failed to register clk notifier\n");
 
 	err = devm_add_action_or_reset(emc->dev,
-				       devm_tegra_emc_unreg_clk_notifier, emc);
+				       devm_tegra20_emc_unreg_clk_notifier, emc);
 	if (err)
 		return err;
 
 	return 0;
 }
 
-static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
-				    u32 flags)
+static int tegra20_emc_devfreq_target(struct device *dev, unsigned long *freq,
+				      u32 flags)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
@@ -1114,8 +1114,8 @@ static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
 	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
 }
 
-static int tegra_emc_devfreq_get_dev_status(struct device *dev,
-					    struct devfreq_dev_status *stat)
+static int tegra20_emc_devfreq_get_dev_status(struct device *dev,
+					      struct devfreq_dev_status *stat)
 {
 	struct tegra_emc *emc = dev_get_drvdata(dev);
 
@@ -1137,13 +1137,13 @@ static int tegra_emc_devfreq_get_dev_status(struct device *dev,
 	return 0;
 }
 
-static struct devfreq_dev_profile tegra_emc_devfreq_profile = {
+static struct devfreq_dev_profile tegra20_emc_devfreq_profile = {
 	.polling_ms = 30,
-	.target = tegra_emc_devfreq_target,
-	.get_dev_status = tegra_emc_devfreq_get_dev_status,
+	.target = tegra20_emc_devfreq_target,
+	.get_dev_status = tegra20_emc_devfreq_get_dev_status,
 };
 
-static int tegra_emc_devfreq_init(struct tegra_emc *emc)
+static int tegra20_emc_devfreq_init(struct tegra_emc *emc)
 {
 	struct devfreq *devfreq;
 
@@ -1165,7 +1165,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 	writel_relaxed(0x00000000, emc->regs + EMC_STAT_LLMC_CONTROL);
 	writel_relaxed(0xffffffff, emc->regs + EMC_STAT_PWR_CLOCK_LIMIT);
 
-	devfreq = devm_devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
+	devfreq = devm_devfreq_add_device(emc->dev, &tegra20_emc_devfreq_profile,
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
 					  &emc->ondemand_data);
 	if (IS_ERR(devfreq))
@@ -1175,7 +1175,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 	return 0;
 }
 
-static int tegra_emc_probe(struct platform_device *pdev)
+static int tegra20_emc_probe(struct platform_device *pdev)
 {
 	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
@@ -1191,7 +1191,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mutex_init(&emc->rate_lock);
-	emc->clk_nb.notifier_call = tegra_emc_clk_change_notify;
+	emc->clk_nb.notifier_call = tegra20_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1202,22 +1202,22 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	np = tegra_emc_find_node_by_ram_code(emc);
+	np = tegra20_emc_find_node_by_ram_code(emc);
 	if (np) {
-		err = tegra_emc_load_timings_from_dt(emc, np);
+		err = tegra20_emc_load_timings_from_dt(emc, np);
 		of_node_put(np);
 		if (err)
 			return err;
 	}
 
-	err = devm_request_irq(&pdev->dev, irq, tegra_emc_isr, 0,
+	err = devm_request_irq(&pdev->dev, irq, tegra20_emc_isr, 0,
 			       dev_name(&pdev->dev), emc);
 	if (err) {
 		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
 		return err;
 	}
 
-	err = tegra_emc_init_clk(emc);
+	err = tegra20_emc_init_clk(emc);
 	if (err)
 		return err;
 
@@ -1228,10 +1228,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra_emc_rate_requests_init(emc);
-	tegra_emc_debugfs_init(emc);
-	tegra_emc_interconnect_init(emc);
-	tegra_emc_devfreq_init(emc);
+	tegra20_emc_rate_requests_init(emc);
+	tegra20_emc_debugfs_init(emc);
+	tegra20_emc_interconnect_init(emc);
+	tegra20_emc_devfreq_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -1243,22 +1243,22 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id tegra_emc_of_match[] = {
+static const struct of_device_id tegra20_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra20-emc", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
+MODULE_DEVICE_TABLE(of, tegra20_emc_of_match);
 
-static struct platform_driver tegra_emc_driver = {
-	.probe = tegra_emc_probe,
+static struct platform_driver tegra20_emc_driver = {
+	.probe = tegra20_emc_probe,
 	.driver = {
 		.name = "tegra20-emc",
-		.of_match_table = tegra_emc_of_match,
+		.of_match_table = tegra20_emc_of_match,
 		.suppress_bind_attrs = true,
 		.sync_state = icc_sync_state,
 	},
 };
-module_platform_driver(tegra_emc_driver);
+module_platform_driver(tegra20_emc_driver);
 
 MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra20 EMC driver");

-- 
2.48.1

