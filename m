Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B13D14A8E;
	Mon, 24 Nov 2025 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763965209; cv=none; b=pMyLgT2A3vEUisqYUqracNuU2KFUZMWgTlb2BB8tnANrjQ0hWO5KyQwL3YeL7CfOuxHMQZ2Iv+PWlRv/3B2iHxSoYhPDUdzDQr4Q+SzwikAotIYHaH2A/KwzA32gEgvYpStQojiAdPpqh3QLFytUqCuq/q7iusKNAeBcgh4O67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763965209; c=relaxed/simple;
	bh=p+mVid8r0ROMi/cN2VpkF51dxkYFqiGnDz8HjO1KQJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cNPfU30yUQ/3mjYpJTH1btdgh3g02j5rk7xA91O71HzHVJqA8LyB1lpEP2KCR6okYpK4Lf2SKjKt7RgbWRfklFwkl7cn3XCvtBc6WjGq7Q73rv7UP0VAa+SlpMpLIqDmxYxDqd7+VeQcsy4uQRk0sqqNGPKaVjON7m4ova//9aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0QLtdQK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0QLtdQK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1C63C4CEF1;
	Mon, 24 Nov 2025 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763965206;
	bh=p+mVid8r0ROMi/cN2VpkF51dxkYFqiGnDz8HjO1KQJw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=h0QLtdQK56lROn1F69nHBA2ld4U3a4DB80FC38qrDSnIq1cX5IK8Nbxg1WKkvVYyj
	 waLUHYEf2d7LELVociIZhN+DqZ734eGQR7n11ALjJWtIEhDz63YTfd8g3GklXkzn26
	 RxtvoaEO/H2RWrZlp66/0lyKv2KYi5qfC1IRqUyHGyZ286Rf+C6aF7qfrndT2GyMAe
	 LMY7pjttdE4fVetpWqsUXlnECE17s+gQsfoGxlRlMqUp5RLDVt79DCqVoN9iMKNCdf
	 cL3T71DVaXKJPh6v5EdJsTffnZlkSfgNESUjEEhNy49WPxMYKbVvhZJugVVkrs3YcW
	 E6LrebZuayJFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04B1CFD31C;
	Mon, 24 Nov 2025 06:20:05 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Mon, 24 Nov 2025 00:19:53 -0600
Subject: [PATCH] memory: tegra210: Fix opp table cleanup
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-tegra210-actmon-fix-v1-1-3c4e2aa98e5f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAj5I2kC/x2MywqAIBAAfyX23ILaA+tXooPUantIQyMC8d+Tj
 jMwkyFRZEowNxkiPZw4+AqybWA7jHeEvFcGJdQgperwJheNkgLNdp/Bo+UXJ6vJ9KMWu+ihlle
 kqv/rspbyAQNSYzZlAAAA
X-Change-ID: 20251123-tegra210-actmon-fix-9f8ea4680d04
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763965205; l=3756;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=aVqO6+a1rJ5KerMJYPS3eL1JGgvR/IUQqyrj0a4Y5Oo=;
 b=xNaJIoIR8XO7UUQnzvAenXAN+WuOtmlEF0szkKf/waMdR00xcssqwghS81Wn0p82osVAqu0as
 S2UNzDiG/j2B/k31/HNhdzPKpFwU0074HsU0AtPNUHLhDWdySCO7rR7
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The original change did not clean up the opp table or hardware table on
probe error or on remove.

Fixes: b33c93babead ("memory: tegra210: Support interconnect framework")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-tegra/aSAxxzcRZduavJQT@stanley.mountain/
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Change-Id: Ie40abdc1f2b1a66ef60cabf00d64cc5ff069ea91
---
 drivers/memory/tegra/tegra210-emc-core.c | 23 ++++++++++++++++++-----
 drivers/memory/tegra/tegra210-emc.h      |  1 +
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 397448cb472d5a31565bf201df06e027248f4d5c..7be810eac79faf8ce2d1b90f7931e41e32c4dddd 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1960,13 +1960,13 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
 	struct dev_pm_opp *opp;
 	unsigned long rate;
-	int opp_token, err, max_opps, i;
+	int err, max_opps, i;
 
 	err = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
 	if (err < 0)
 		return dev_err_probe(emc->dev, err, "failed to set OPP supported HW\n");
 
-	opp_token = err;
+	emc->hw_opp_token = err;
 
 	err = dev_pm_opp_of_add_table(emc->dev);
 	if (err) {
@@ -2009,11 +2009,21 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 remove_table:
 	dev_pm_opp_of_remove_table(emc->dev);
 put_hw_table:
-	dev_pm_opp_put_supported_hw(opp_token);
+	dev_pm_opp_put_supported_hw(emc->hw_opp_token);
+	emc->hw_opp_token = 0;
 
 	return err;
 }
 
+static void tegra210_emc_opp_table_cleanup(struct tegra210_emc *emc)
+{
+	if (emc->hw_opp_token) {
+		dev_pm_opp_of_remove_table(emc->dev);
+		dev_pm_opp_put_supported_hw(emc->hw_opp_token);
+		emc->hw_opp_token = 0;
+	}
+}
+
 static void tegra210_emc_detect(struct tegra210_emc *emc)
 {
 	u32 value;
@@ -2227,7 +2237,7 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 		tegra210_emc_rate_requests_init(emc);
 		tegra210_emc_interconnect_init(emc);
 	} else if (err != -ENODEV) {
-		return err;
+		goto detach;
 	}
 
 	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
@@ -2236,11 +2246,13 @@ static int tegra210_emc_probe(struct platform_device *pdev)
 		err = PTR_ERR(cd);
 		dev_err(emc->dev, "failed to register cooling device: %d\n",
 			err);
-		goto detach;
+		goto cleanup_table;
 	}
 
 	return 0;
 
+cleanup_table:
+	tegra210_emc_opp_table_cleanup(emc);
 detach:
 	debugfs_remove_recursive(emc->debugfs.root);
 	tegra210_clk_emc_detach(emc->clk);
@@ -2254,6 +2266,7 @@ static void tegra210_emc_remove(struct platform_device *pdev)
 {
 	struct tegra210_emc *emc = platform_get_drvdata(pdev);
 
+	tegra210_emc_opp_table_cleanup(emc);
 	debugfs_remove_recursive(emc->debugfs.root);
 	tegra210_clk_emc_detach(emc->clk);
 	of_reserved_mem_device_release(emc->dev);
diff --git a/drivers/memory/tegra/tegra210-emc.h b/drivers/memory/tegra/tegra210-emc.h
index 3c9142bfd5ae5c57bbc139e69e62c893b50ce40c..e6f267823f9f0ee18cd60778116dc5ca2730a5d4 100644
--- a/drivers/memory/tegra/tegra210-emc.h
+++ b/drivers/memory/tegra/tegra210-emc.h
@@ -946,6 +946,7 @@ struct tegra210_emc {
 	struct tegra210_clk_emc_provider provider;
 
 	struct icc_provider icc_provider;
+	int hw_opp_token;
 
 	/*
 	 * There are multiple sources in the EMC driver which could request

---
base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
change-id: 20251123-tegra210-actmon-fix-9f8ea4680d04

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


