Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782F4C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 06:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 455F5238EE
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 06:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbhAVGBV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 01:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbhAVGBN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 01:01:13 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B3AC061756
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 22:00:33 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id q20so3005145pfu.8
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 22:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p5gxMZPm4PZ2rpKTFEgwKlwXFVCJLHtF6PjdnahhMhg=;
        b=lPr5/zLCr8ZGdAWYA/jTfcxtbP0IAyjNCgmQM22nnj94Gebthxj9bcGRqCcwHHnneV
         G0lTKPZ0bcgRjZvYbPoymTZvQlJuW5Fa0EIDFNviiPlta429aMm5AZ0fqOfLesc4/jqN
         hNTVYlpvciMys8b3WOvqIIbYEG2sR/2YfPqra8ulbe4PorbhJi3pZ+rc6gCqyX6hmPfj
         6tq6Tfpayr1opGOsOtKO1/TyHxGbPs1vVTMlVlza9PJLqwRh/GNwrakk9uDrRQ97m0cU
         DUJNmf7vn+gNgu6VNyAxliB9x0zrBzXOxAcpCzCvRRSFw2KoRx/yMAET7gcO/DcO334d
         xibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p5gxMZPm4PZ2rpKTFEgwKlwXFVCJLHtF6PjdnahhMhg=;
        b=qKf5f6gHGJ/4usHA1YJXy7hPLVVC3Fh8Bgc72l/9sP7GyIrz8BqqRDOieWBGxjeOab
         /J8d8jHhrB9fxoFgp/D3thGP9b8gM1B/iLgyIxVFGgx6ep0iL5SCcP3g/bg3VYQBKdKM
         amaq9MxOSbOowRWpLon81p4U0HCkx4M8cPymLL2Lfd/5gEl0nA++9v5h/ej3EXwnVoDR
         R1gLAw1yL9ry8shmPzms6usDag39voERbRcSntHLaVsmwSCoCkfysA/7ThOVsi8hcEhF
         pQCWw2ExxqadTWFMGIiFpA6fSuymRa0ikYHE4Wpatn/FE37HfBm48o6huzhLY3TH1Mqk
         ELKw==
X-Gm-Message-State: AOAM533eR0nAKbdiYjlLn12QA7vnK8QHMNnQefVNnFX1hfpdmBWfXoJ2
        9xTsNdAtEkeFqQ8mx8/a3lmOpg==
X-Google-Smtp-Source: ABdhPJyJs80rRHKzzfa9cbpX+5oYFoa/8DdYpiEfkLFvLFM9r2jL3FobSQxV97NwOINP6a3A0Lo+Yg==
X-Received: by 2002:a17:90b:e8b:: with SMTP id fv11mr3374510pjb.5.1611295232804;
        Thu, 21 Jan 2021 22:00:32 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id r1sm7062032pfh.2.2021.01.21.22.00.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 22:00:32 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
Date:   Fri, 22 Jan 2021 11:30:21 +0530
Message-Id: <1430e70777fdcf1c946ca2fef296f439762a4f21.1611295029.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no point calling dev_pm_opp_set_clkname() with the "name"
parameter set to NULL, this is already done by the OPP core at setup
time and should work as it is.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Dmitry, am I missing something obvious here ?

 drivers/memory/tegra/tegra20-emc.c | 13 ++-----------
 drivers/memory/tegra/tegra30-emc.c | 13 ++-----------
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 686aaf477d8a..d653a6be8d7f 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -911,21 +911,14 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_process_id);
-	struct opp_table *clk_opp_table, *hw_opp_table;
+	struct opp_table *hw_opp_table;
 	int err;
 
-	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
-	err = PTR_ERR_OR_ZERO(clk_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
-		return err;
-	}
-
 	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
 	err = PTR_ERR_OR_ZERO(hw_opp_table);
 	if (err) {
 		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		goto put_clk_table;
+		return err;
 	}
 
 	err = dev_pm_opp_of_add_table(emc->dev);
@@ -954,8 +947,6 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	dev_pm_opp_of_remove_table(emc->dev);
 put_hw_table:
 	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
 
 	return err;
 }
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 44ac155936aa..6985da0ffb35 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1483,21 +1483,14 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
-	struct opp_table *clk_opp_table, *hw_opp_table;
+	struct opp_table *hw_opp_table;
 	int err;
 
-	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
-	err = PTR_ERR_OR_ZERO(clk_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
-		return err;
-	}
-
 	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
 	err = PTR_ERR_OR_ZERO(hw_opp_table);
 	if (err) {
 		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		goto put_clk_table;
+		return err;
 	}
 
 	err = dev_pm_opp_of_add_table(emc->dev);
@@ -1526,8 +1519,6 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	dev_pm_opp_of_remove_table(emc->dev);
 put_hw_table:
 	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
 
 	return err;
 }
-- 
2.25.0.rc1.19.g042ed3e048af

