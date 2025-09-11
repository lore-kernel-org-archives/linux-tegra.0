Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE62EF664
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583822; cv=none; b=YXxA6mM0QVgTclqVb/0YTyzNmtvUGklT+m8+3Onk2Lfm1weYvbdKnXFrvGmbFVp0VnpITaCr8xYIjj8EUz7LRQA3bl1sHdUfiAi53QpWY8I4cZuH101I9bKNnp27O1WQ31ueCIKnt4sb0W5RkPhWPvOWs3j5DQvGNXD68Mf3Jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583822; c=relaxed/simple;
	bh=NsGEIgGjbOpROhUmLr+vi+i7gGp3+YQdgw+pRaV7CFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCkGogzRaG0VSG0mDKHOYIHqthji7xg5/6dlqO0Mtb8bEY11ic2S9IEv3gRNFqGr6/GJYrR9pi/xgFy0ST8KLmNtHJInOV9sQuopBDB1s5cZs5jh1At7b4JdrSrZYJmDIFH8UikX0yfsYQtXIYufONZ79YKmj8RrLl7GjFF4/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E0PGyN7X; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E0PGyN7X"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e753a311d2so69989f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757583819; x=1758188619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EvFDcJgp1O+VKVo0SG7emVdOYaEBH1SQVuBhC1JrkI=;
        b=E0PGyN7XMv35WszBD3I/ooqbQIQenXIbaEX5m11JFf1ZSuHLDQu4n5RzkmqmqYMV2A
         ZycXPZk3hW2oR+3/9kuA9CK6p3omzILAzDMjQbFNRW8x2IhYhAbPjbZlE5wa0yQZ2c+a
         8ps1vPTHFDqdRh8uzKzZ9ZObYriuFMC29PKyrpHbeYXEyjMoSihl5HsW6cfM/2ePjR1x
         fJUm4Bbn8xWtu0GJPHZPE0/Ck5dt1MoHW0vWAW9bVdZ5ebahijIMe4SiyOOA17AyOMFm
         C+50t6f8upxiQvLhMX5/f5xN2F1ZuYrZCKr7KvAPTTfwWUCRA9NtdLvGa8QN/hcdWEos
         Ddag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583819; x=1758188619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EvFDcJgp1O+VKVo0SG7emVdOYaEBH1SQVuBhC1JrkI=;
        b=voHQK/27bWCs7iGkonOiWpImlWShBiFfcPzis7vO5uq3JU+ELl1HjStzBAB8wDMiWb
         b2DIXBe4kw+AVbKWya8mBsxz6xzH7/mH5iU+HRAdR6JU/cXQ69e4mKAbKSr1KUqe2zKS
         PqiTc9PH6ebainCQSoIlOlE81kOplsLg6rLL+lgcOoGeuQPTB3ygnGzgeAcMbaakcPU/
         ZJDbEZ8qpNHjW1giXmtztbBUThJJaJtunbttHF2QBzZwfVDO9Jrlqexe8w2USi9e54d8
         7bG6MtjIu7y0wLMaf6SsXGyQRIQtJuNUOsflDBTrELEwn0nlpF8nAZgbLIL04/8FWHsM
         3O7A==
X-Forwarded-Encrypted: i=1; AJvYcCWP+7maKFsBMqVhJjrxfiJsSVhRKO/GeR8kHHr/A776n8X457+OSb08uR0VNRNCSpUos3WzJC8+GcXH8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXkCcEf3AJxz2CrCYe1KDnVyX8YWRf8WxvEFM66ijUuHzVM+o4
	jLfxG0ZM4FZS319PwDiPSepiY2ARpVXBh8OQ2OZwBEeBlHn38ZbRYkMIsXLKQwA/KnklQN2OgSv
	Gu3TI
X-Gm-Gg: ASbGncswwLJAdpzSjftKxrO/BCi/KmZyFOM8h7nBnzP5Bn0TRLB38HirVZomWSuWl+f
	1+AUzqcw8SKlzJv+2GFmg4X3TfMzfn5PU+UTKe/A4skUmAWcun2t1346HrDWjK15ZH9JNT0vpYM
	PGdiWWx6VdTugSiVMS6JuoC+AkQ0WATGL+Kjq+OxosepqccoUO09ik4GL97CaRo5qYvji4CPL0X
	7G8JPzq85TfxMnH3YTlZRZhxV+BLMLMxJ1Q6xg1olEk0rkuMKEjjY3SyCniVFHP+bJBNHhknPef
	uX3Ye34VN0BZsDy4ziZBesqKj2/3q2fwkBg+1Yv+WaTFnWbObk/yiJHN6ChVEmaaNur4KXaJV6I
	OMVct0wuwY+5c0QplSE0b9EVVSbRA2HYwYJJpf88=
X-Google-Smtp-Source: AGHT+IFQATZ5uV9m+s4qitY14CNE6n5q3MaFIEeJl26/7kZH/FIZPFZHicuPgJZqEB4MJGjuy6zN4g==
X-Received: by 2002:a05:6000:40de:b0:3e7:5f26:f1d9 with SMTP id ffacd0b85a97d-3e75f26f67bmr1055051f8f.3.1757583818669;
        Thu, 11 Sep 2025 02:43:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm1759218f8f.28.2025.09.11.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:43:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Sep 2025 11:43:21 +0200
Subject: [PATCH v2 10/13] memory: tegra124-emc: Add the SoC model prefix to
 functions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-memory-tegra-cleanup-v2-10-d08022ff2f85@linaro.org>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
In-Reply-To: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowpm65lTN/m95NUl69MLbrPKF8ihpruNwpNKz8
 fiQ2vCTH0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMKZugAKCRDBN2bmhouD
 1z0+D/9escPOZFJ19BWYtWVn3aglhmAMEVdHZT3+zxJ6q3lwjLKIKF7++w7zl9YaukUhXaD2hHa
 DBJlCK4tXh8V9aMduzuSA303Y1kInERZn00S5idUFyhr7aarF/dSs3RaT0AMOoLIw8GrJw5OXX7
 s7A3NSjZNtMJqOXVUTfTVuJPfaSHtrKeoj20XuXPxhttLq9BsM+fn9k2gJ0O06qGh2zzdv6grrM
 PoSoLndwFmoRtTm/3eoRegAl8Pa4fGuNGJXrVom2OwZ2KciX50+GCAX5/HOmQCbpr9lWSVa1A3U
 P7PagFutwGLIaiZWQCAIngr7l5293czb3DNhGhom2eBLuC1/mHFMZ6oOwWchYw8l1wr8C7eSZtl
 EgHpqBG9oh0S2QjXtV5dhf+zlVoWcw2kai8qWKa4E6HetUy1YtZRf7YSCfB54zxcTg96tNMSCjJ
 ICmQB7OgCrPRhvD+5KmffvFRy1/GGAFi4EUmjWPwtMKNOdJ0OsOBEglaEgn2ZR3HT50e48MSqvm
 H/8tnh6OAX/AH5hxcOlmKR++OeRTvjfoRztB9/3WaiQSue05YkbsMLOgJGdymrNQYk9klsDnzQL
 vN/wNSBHisrwtHm3fxYYYlQWTUDUgkPLcUYKEvyUtHf9d5JSm4Xj/nWs8/Cumx8JOE5vMSPZ3f2
 O4UWhtluHNCwX3A==
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

