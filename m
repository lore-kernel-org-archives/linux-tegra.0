Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC319878
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501069; cv=none; b=NM/srO2KJQIqw9HVBOi6CVw8/WE5AWXJOLEOiYOUApwwGJ54SGBoLOYcmjsCQHgAHVSYSrJdlkojtJifxNUG4XnuShq30gISfNyMFYF4StSZpARfH6xGPgURqwB8g1iHoZzX1udPMbJ+/RyyeSlq6x0jXBYI9qmx9i7lFYtdJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501069; c=relaxed/simple;
	bh=NsGEIgGjbOpROhUmLr+vi+i7gGp3+YQdgw+pRaV7CFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsnsxq8bOloREmoXpkJpbKUEMwC1N5uec39nLj9nazMbuLPBoyxKGTMS17NDLCbk92Nw4EUsiLLtvZNutEjKQxt6AEH8CMaD/wkxQaKHcfcpXtp5hxGooLwDXuFcwt6SYvNKmOLwpBX7yX5wpa0ofen3VDp8kmFA9kXs/uOl2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0WXZJw+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0WXZJw+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-620dfa69895so1000535a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757501065; x=1758105865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EvFDcJgp1O+VKVo0SG7emVdOYaEBH1SQVuBhC1JrkI=;
        b=f0WXZJw+0E7aTRRmvy52PXpfxOvbC1eT2Nxd7Fe0zT7DflyCbKjbTnU2xpxdNCulDA
         Ixwt8UWd1j/UnmZRw6H4GcCDXC4GxXRpqfJiAmEDhVo/ufSJVV4C4gJRF8PGbpDF+ona
         WOzULSC9QQL+dTU2c8C7BX8NGHQoROLR+5ABaOj/NpTmxXj8hFPD82Va19LF7oLxXCMF
         GDaAwqSachJasS3kKisKFIAHByWzviB5j/RtjpsdMFnuk4Y8/2JLF6qkqhPsMF+Z6MGc
         A4eyygcyBjuLtN2Nu5A4zi2B4kRfEq8n6nxDyFrdlwdt/IFPfOC4luW4RD0gcezUIe6g
         98xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501065; x=1758105865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EvFDcJgp1O+VKVo0SG7emVdOYaEBH1SQVuBhC1JrkI=;
        b=Yqc2BN0vH0jOs/mHX//u6mcvf5Hz4poGcmnyzwAf7vxgYA2/mDVRVoQX86h+sXFEG3
         SNAumM3KssjpClHYJsytgZ9tGRycgRYgUubHrQSwbrjgXOnQ8EFxoaQhmbehTRL2c7am
         lkfoaLKq+oElmz2XmjegcIIz2+6/c9DaYG+bI8xCRcSstKZGXXfugAGl4wOu7QWb7ocD
         Q+y4TdVNyupIPV5jzMqwrz2aTX0M/K0n9/EZaVhtcIXLTsm46O0m2AqwwN8on88WoPqZ
         WvwZXe2mysnfuY5pexJdgvTnYCj98PTwy162rn2mKxcrW32AZI1cMwpXDUAERwHGftXl
         fJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6CoVZSc5QG6EDHWORFQafzPf19udntgvTGXhM60AY/Dgb7cnO+03xf0Xw8dIBQq/klQslsWuVem0C8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5HcLqsKNlcdoxgwPBYuhKPNKnYsXa2XU/WvJxpyflfWAJe06
	AKxPP33BZPYbhSy+0LVwLkPOdRjdgo7GS9nI0lFpMEadYfq8eoZPb4YxdCBvxGZW6A7HS/itxcr
	+9p+H
X-Gm-Gg: ASbGncs90NCEOI5MEQJZA5sJaBJt9HxcMZsUd3JLVtyKv4tVmydgGT8N/vPRI9QwDuZ
	WUXEjMsTCsHN/+Nh9z+s5PmW4wdnwSPfgEUzQd3FEG3pu/2Jj0YjswHe0IGB+GVwhCFRb6P0j7k
	tjSpF/PFV7qe1AgB2aAvavZnZ/ZmX6uM2NU36/GLvKfldMxBS52aYX4ECSM32EyI4M4jYcFwmnd
	UvtbD+EKU+VemEE1reRT3DT4yYrHSjrjNzhNweeLfK7Sw9trwBXNLEPYZa8ZuIHm4HQ2OvXG+X5
	bhHudgfhyr+XZQ/Ej+zfGnds9HKzVoVdl5Q7dKGlbtkDD4RRyqqUFLL3vgghElShGZlqVWyP4Fw
	GTHalZCTH6HOImH7OrilP0WaMkxxoURSC4mL7ka4=
X-Google-Smtp-Source: AGHT+IGrVEygP3UQK3QPTRuiouliI2cTlmDJdwPnEmCPDJmwgq+w28bEx+GIfvtNrVdyRG2wjb+52w==
X-Received: by 2002:a05:6402:5205:b0:628:20b9:2607 with SMTP id 4fb4d7f45d1cf-62820b928c8mr5230834a12.2.1757501065066;
        Wed, 10 Sep 2025 03:44:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm3144890a12.46.2025.09.10.03.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:44:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Sep 2025 12:44:06 +0200
Subject: [PATCH 10/13] memory: tegra124-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-memory-tegra-cleanup-v1-10-023c33a2d997@linaro.org>
References: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
In-Reply-To: <20250910-memory-tegra-cleanup-v1-0-023c33a2d997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10836;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NsGEIgGjbOpROhUmLr+vi+i7gGp3+YQdgw+pRaV7CFw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowVZ3uXiv8MPkFYPIlzPELdHjjsK8XWAaXGIe8
 9TlHv+EB6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMFWdwAKCRDBN2bmhouD
 12rFEACYAlo4n+X9dQpbM9T4VCfKNl28TRQtZdQtsAm1bXBSu3A4Zjy1WUpJ2PIDXv4RCEJOTvj
 8QKuiLDav5lAv4OjyVEfCYi3vU00UgTgOW7QUV6VBDmrw0ml1GIUi4VKJdoEcARNLSjCwC2r5Ct
 yuezkb+zvIGvhObs1+gqA6zEwbrDQXDX/RjwdHr+NrWp3P1dBJ9nHLvxbl0d8AxVh2WCevcJ671
 nvyqc9xKIPfF+CEJWHhhJsnN5lObBCirtXITAlrjy3QPxD4BFeMjfC1hmghOjOiZRAeCecBLhb7
 IrmkqMkhE6579MgoehuRd4L1C7jVCm3cmQDqhe476LeBEQcjmxdlu+aGdpt6AftKnGhljIz7KZw
 hRGTiqV/7TSae63xw6IlbePYrWg4lViEi87FYLSbEjcJY7OIukZpo/gqyLh7BywZHbX9m5qipVa
 PrjrqyrDvzHOliozYBLKqZsbFGWx8xDCxpH81jlDOirLlcCWqDS053WJis7tMUc3msLrBBE7vsl
 EIrCeMKaTweVKhR1cJKssnZEw20CxrZFhbSQRaoWhFpitDisXIfDtNb4sYS2Rb8XP+Z980Q8Y7f
 oIz5OqKvbCKtlNA6YOIrMzh8MY7N8ZwbpSS5L2s3x7jjUJ45h4O2xY2I1ewBVJAQAQWGeWCLWaW
 zqHeffqH8uhEquA==
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
 drivers/memory/tegra/tegra124-emc.c | 98 ++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index f4d703103d9ca155eca92331ee762cecd4e01302..9978ff911c4790b30423064c8fe0d3d53e8efcef 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -571,8 +571,8 @@ static void emc_seq_wait_clkchange(struct tegra_emc *emc)
 	dev_err(emc->dev, "clock change timed out\n");
 }
 
-static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
-						unsigned long rate)
+static struct emc_timing *tegra124_emc_find_timing(struct tegra_emc *emc,
+						   unsigned long rate)
 {
 	struct emc_timing *timing = NULL;
 	unsigned int i;
@@ -592,10 +592,10 @@ static struct emc_timing *tegra_emc_find_timing(struct tegra_emc *emc,
 	return timing;
 }
 
-static int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
-					   unsigned long rate)
+static int tegra124_emc_prepare_timing_change(struct tegra_emc *emc,
+					      unsigned long rate)
 {
-	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *timing = tegra124_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
 	enum emc_dll_change dll_change;
 	unsigned int pre_wait = 0;
@@ -820,10 +820,10 @@ static int tegra_emc_prepare_timing_change(struct tegra_emc *emc,
 	return 0;
 }
 
-static void tegra_emc_complete_timing_change(struct tegra_emc *emc,
-					     unsigned long rate)
+static void tegra124_emc_complete_timing_change(struct tegra_emc *emc,
+						unsigned long rate)
 {
-	struct emc_timing *timing = tegra_emc_find_timing(emc, rate);
+	struct emc_timing *timing = tegra124_emc_find_timing(emc, rate);
 	struct emc_timing *last = &emc->last_timing;
 	u32 val;
 
@@ -986,8 +986,8 @@ static int cmp_timings(const void *_a, const void *_b)
 		return 1;
 }
 
-static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
-					  struct device_node *node)
+static int tegra124_emc_load_timings_from_dt(struct tegra_emc *emc,
+					     struct device_node *node)
 {
 	int child_count = of_get_child_count(node);
 	struct emc_timing *timing;
@@ -1015,15 +1015,15 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 	return 0;
 }
 
-static const struct of_device_id tegra_emc_of_match[] = {
+static const struct of_device_id tegra124_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra124-emc" },
 	{ .compatible = "nvidia,tegra132-emc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
+MODULE_DEVICE_TABLE(of, tegra124_emc_of_match);
 
 static struct device_node *
-tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
+tegra124_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 {
 	struct device_node *np;
 	int err;
@@ -1041,7 +1041,7 @@ tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 	return NULL;
 }
 
-static void tegra_emc_rate_requests_init(struct tegra_emc *emc)
+static void tegra124_emc_rate_requests_init(struct tegra_emc *emc)
 {
 	unsigned int i;
 
@@ -1143,7 +1143,7 @@ static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
  *       valid range.
  */
 
-static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+static bool tegra124_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 {
 	unsigned int i;
 
@@ -1154,8 +1154,8 @@ static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 	return false;
 }
 
-static int tegra_emc_debug_available_rates_show(struct seq_file *s,
-						void *data)
+static int tegra124_emc_debug_available_rates_show(struct seq_file *s,
+						   void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
@@ -1171,9 +1171,9 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s,
 	return 0;
 }
 
-DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
+DEFINE_SHOW_ATTRIBUTE(tegra124_emc_debug_available_rates);
 
-static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+static int tegra124_emc_debug_min_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -1182,12 +1182,12 @@ static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+static int tegra124_emc_debug_min_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
@@ -1199,11 +1199,11 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
-			tegra_emc_debug_min_rate_get,
-			tegra_emc_debug_min_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra124_emc_debug_min_rate_fops,
+			 tegra124_emc_debug_min_rate_get,
+			 tegra124_emc_debug_min_rate_set, "%llu\n");
 
-static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+static int tegra124_emc_debug_max_rate_get(void *data, u64 *rate)
 {
 	struct tegra_emc *emc = data;
 
@@ -1212,12 +1212,12 @@ static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
 	return 0;
 }
 
-static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+static int tegra124_emc_debug_max_rate_set(void *data, u64 rate)
 {
 	struct tegra_emc *emc = data;
 	int err;
 
-	if (!tegra_emc_validate_rate(emc, rate))
+	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
 	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
@@ -1229,9 +1229,9 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
-			tegra_emc_debug_max_rate_get,
-			tegra_emc_debug_max_rate_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(tegra124_emc_debug_max_rate_fops,
+			 tegra124_emc_debug_max_rate_get,
+			 tegra124_emc_debug_max_rate_set, "%llu\n");
 
 static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 {
@@ -1266,11 +1266,11 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
 
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
-			    &tegra_emc_debug_available_rates_fops);
+			    &tegra124_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_min_rate_fops);
+			    emc, &tegra124_emc_debug_min_rate_fops);
 	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
-			    emc, &tegra_emc_debug_max_rate_fops);
+			    emc, &tegra124_emc_debug_max_rate_fops);
 }
 
 static inline struct tegra_emc *
@@ -1334,7 +1334,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	return 0;
 }
 
-static int tegra_emc_interconnect_init(struct tegra_emc *emc)
+static int tegra124_emc_interconnect_init(struct tegra_emc *emc)
 {
 	const struct tegra_mc_soc *soc = emc->mc->soc;
 	struct icc_node *node;
@@ -1383,7 +1383,7 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return dev_err_probe(emc->dev, err, "failed to initialize ICC\n");
 }
 
-static int tegra_emc_opp_table_init(struct tegra_emc *emc)
+static int tegra124_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
 	int opp_token, err;
@@ -1425,12 +1425,12 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	return err;
 }
 
-static void devm_tegra_emc_unset_callback(void *data)
+static void devm_tegra124_emc_unset_callback(void *data)
 {
 	tegra124_clk_set_emc_callbacks(NULL, NULL);
 }
 
-static int tegra_emc_probe(struct platform_device *pdev)
+static int tegra124_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
@@ -1454,9 +1454,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	ram_code = tegra_read_ram_code();
 
-	np = tegra_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
+	np = tegra124_emc_find_node_by_ram_code(pdev->dev.of_node, ram_code);
 	if (np) {
-		err = tegra_emc_load_timings_from_dt(emc, np);
+		err = tegra124_emc_load_timings_from_dt(emc, np);
 		of_node_put(np);
 		if (err)
 			return err;
@@ -1470,10 +1470,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, emc);
 
-	tegra124_clk_set_emc_callbacks(tegra_emc_prepare_timing_change,
-				       tegra_emc_complete_timing_change);
+	tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change,
+				       tegra124_emc_complete_timing_change);
 
-	err = devm_add_action_or_reset(&pdev->dev, devm_tegra_emc_unset_callback,
+	err = devm_add_action_or_reset(&pdev->dev, devm_tegra124_emc_unset_callback,
 				       NULL);
 	if (err)
 		return err;
@@ -1483,16 +1483,16 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
 				     "failed to get EMC clock\n");
 
-	err = tegra_emc_opp_table_init(emc);
+	err = tegra124_emc_opp_table_init(emc);
 	if (err)
 		return err;
 
-	tegra_emc_rate_requests_init(emc);
+	tegra124_emc_rate_requests_init(emc);
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
 
-	tegra_emc_interconnect_init(emc);
+	tegra124_emc_interconnect_init(emc);
 
 	/*
 	 * Don't allow the kernel module to be unloaded. Unloading adds some
@@ -1504,16 +1504,16 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	return 0;
 };
 
-static struct platform_driver tegra_emc_driver = {
-	.probe = tegra_emc_probe,
+static struct platform_driver tegra124_emc_driver = {
+	.probe = tegra124_emc_probe,
 	.driver = {
 		.name = "tegra-emc",
-		.of_match_table = tegra_emc_of_match,
+		.of_match_table = tegra124_emc_of_match,
 		.suppress_bind_attrs = true,
 		.sync_state = icc_sync_state,
 	},
 };
-module_platform_driver(tegra_emc_driver);
+module_platform_driver(tegra124_emc_driver);
 
 MODULE_AUTHOR("Mikko Perttunen <mperttunen@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra124 EMC driver");

-- 
2.48.1

