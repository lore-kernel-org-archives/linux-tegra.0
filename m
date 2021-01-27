Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10F3C433E9
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 10:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B4F620731
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 10:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbhA0KTQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 05:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235443AbhA0KRH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 05:17:07 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35A5C061574
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 02:16:26 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id cq1so969112pjb.4
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qD/+ILMyGECjEd3sRp/n8SMb4ogY29j6AgT3rjADA+4=;
        b=KzcHxGOyDvWv4raQ3TTACVbnQg+7SPcSMZMDZKyI1t4yt/ZEq79MSdoQ4FirvBlWHV
         RgrJoAFGWCY/oKFny5UUtAt6zrxq4ICeG2kkPqpCxX+5lrnmGJoe3R3Vuv0KGv2sZf+h
         RLhzyT0o8TVLryscaSC9gstDup3jotDm5dSR6npnCDOTlJvQuW39QUB40/FHUxfNz723
         0I5FiJnR3f48PdfWODCnE4jnPzaSEmiBu4D6PI9BEgxHwxW+20k7d3iiPYVigJob8mv5
         WMrtmcth7rBOQZhdyvr0fdG1bEkqZegU+1SnfqAU5G1EoxbuHuAe+JDjaqK00MlR4xB0
         Fvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qD/+ILMyGECjEd3sRp/n8SMb4ogY29j6AgT3rjADA+4=;
        b=C1At+rDm26Tkl6SkM6srT499apTNIrduUmF1oJiCulUWfVxCpKG24WXIIhNXfJ6E6d
         +96ENQnKeaQObNfcpOWgJOfziI/j/oBDZkLVSspNI/4mcv/so30VzPUjYoafEZP2OVo5
         K7ivNAn7+kXF9vCWlFRMWycKosVJ6RTl2JYrMN2E+/uewr+E1I1jdzL7+orbZ5aIOXne
         ZoPtHi9qbTkE/t1QUOMQkfGYzkW1MS7VAljEwaMimsT9o03o8d/+x+CuS6wG+akd7++5
         X8bpObwrdR3OyBwvOx5SLPdejwKnq+mCqP0e4g4w/Xl7eXFTHTMMKPvPy+XSRLTjWFOt
         5Z5A==
X-Gm-Message-State: AOAM5339FbiWlfvLlW2glhRHZLssNw6q0I7rKmKng8N53KPy+rhTZQcp
        M2RHfHO6gL71htW4y5oN0b8EMw==
X-Google-Smtp-Source: ABdhPJxGsXfWTcttw7F47U9+G1CN8zo2akW3kfzmjmdHuEvkqOWGsx6ypxG0VFxZ5L4f+lx+aK1FWQ==
X-Received: by 2002:a17:90b:4c0b:: with SMTP id na11mr4764827pjb.45.1611742586379;
        Wed, 27 Jan 2021 02:16:26 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id s21sm1768166pga.12.2021.01.27.02.16.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 02:16:25 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
Date:   Wed, 27 Jan 2021 15:46:22 +0530
Message-Id: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
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
V2: Update tegra124 as well.

Krzysztof, please take this through your tree, it doesn't have any
dependency in the OPP tree.
---
 drivers/memory/tegra/tegra124-emc.c | 13 ++-----------
 drivers/memory/tegra/tegra20-emc.c  | 13 ++-----------
 drivers/memory/tegra/tegra30-emc.c  | 13 ++-----------
 3 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 9706550bdd5d..bee8d9f79b04 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1399,21 +1399,14 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
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
@@ -1442,8 +1435,6 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 	dev_pm_opp_of_remove_table(emc->dev);
 put_hw_table:
 	dev_pm_opp_put_supported_hw(hw_opp_table);
-put_clk_table:
-	dev_pm_opp_put_clkname(clk_opp_table);
 
 	return err;
 }
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

