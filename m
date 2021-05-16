Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B37C43460
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6120610C8
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbhEPVOe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 17:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbhEPVOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 17:14:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DA0C061573;
        Sun, 16 May 2021 14:13:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h10so5821400lfm.7;
        Sun, 16 May 2021 14:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBewSlIx5ZiP13Gkx/3IvP55YYjnedIAupIhadAqOmw=;
        b=rtqFD34JCHRkmMEE049oMG09fGVImJlbH/tFIZ55qtJZh856UJBYJu3DDVX8TTuRGM
         CNr9R6g6Z3QpRU3WaGUW71sB9H8VldJOME4+t0nRfS4xgcwSTikXQYQXVkGG4pSjnDEQ
         q3RywhITxMecowbyjXRvf05a7+4iA7SUIrLhrmpSSNNAZirrGQph8PPqSEInF/DyZPKQ
         +Pg68s7zXA06yT3P//1zk5F5oWIzvDDFgcISSYCy95ggO2F2lb7wPWOyzCz/AxOn6liy
         q41EGWf92Tv1ccRFoT45UmvA1JRz2kZdUdYWebg7Q1VAiSJXmet3/7tSlmKQDDg8MpFy
         9QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBewSlIx5ZiP13Gkx/3IvP55YYjnedIAupIhadAqOmw=;
        b=gAmxHHk6Y/bW6oKiZXM+k+fxzCiwjU8wBzc0ujLBd97IZEWp9RMjxL5eV0byXeIvqD
         Jvkxkbo5JakaIuSIi3ggWyvcTHR1fxOUBmd3KYm+ZoXt6B/gdmcvdUAd6XA+Vb6P4EeT
         vf37dfyWVnpyDzQ/O2y2RStvlqqZOnNxadSpiq8LWgHgAtCVBuREf2xZIs/C6IJ6hQEQ
         D+VR2uCXzhVY2w3iKqUaoyrsDoWBZTRup0cnhaCXC7+0K3cvHyZi2oKqG9OOW/eGQw0E
         tp2OIcYZG4gc8ac3ROMCLYdXvH2OtAvqrhXWXvjNWnY6UgGO+znrFn5aFaXLuCuKqxjU
         sFeQ==
X-Gm-Message-State: AOAM533g0kmxUfmEvKa1l4+gd4n+h+VNNPNRsnMSBl9PLcWQjoaJDIXf
        tsZjyvF4qqYu8HTNxBITDIHpaGTDNAY=
X-Google-Smtp-Source: ABdhPJya1HCfYZJjxtlkC+Avc2PzRfBGddvw2uxw5cJCVsadswkW3HU3Fz4V0uL0KwXOn8PvJP00iQ==
X-Received: by 2002:a05:6512:c04:: with SMTP id z4mr38673200lfu.167.1621199597033;
        Sun, 16 May 2021 14:13:17 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm1768785lfd.266.2021.05.16.14.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 14:13:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()
Date:   Mon, 17 May 2021 00:13:02 +0300
Message-Id: <20210516211302.32404-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516211302.32404-1-digetx@gmail.com>
References: <20210516211302.32404-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
initialization.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 48 +++---------------------------
 1 file changed, 4 insertions(+), 44 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 829f6d673c96..239074c5ff75 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1480,49 +1480,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return err;
 }
 
-static int tegra_emc_opp_table_init(struct tegra_emc *emc)
-{
-	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
-	struct opp_table *hw_opp_table;
-	int err;
-
-	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(hw_opp_table);
-	if (err) {
-		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
-		return err;
-	}
-
-	err = dev_pm_opp_of_add_table(emc->dev);
-	if (err) {
-		if (err == -ENODEV)
-			dev_err(emc->dev, "OPP table not found, please update your device tree\n");
-		else
-			dev_err(emc->dev, "failed to add OPP table: %d\n", err);
-
-		goto put_hw_table;
-	}
-
-	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		      hw_version, clk_get_rate(emc->clk) / 1000000);
-
-	/* first dummy rate-set initializes voltage state */
-	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
-	if (err) {
-		dev_err(emc->dev, "failed to initialize OPP clock: %d\n", err);
-		goto remove_table;
-	}
-
-	return 0;
-
-remove_table:
-	dev_pm_opp_of_remove_table(emc->dev);
-put_hw_table:
-	dev_pm_opp_put_supported_hw(hw_opp_table);
-
-	return err;
-}
-
 static void devm_tegra_emc_unset_callback(void *data)
 {
 	tegra20_clk_set_emc_round_callback(NULL, NULL);
@@ -1568,6 +1525,7 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
 	struct tegra_emc *emc;
 	int err;
@@ -1617,7 +1575,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = tegra_emc_opp_table_init(emc);
+	opp_params.init_state = true;
+
+	err = devm_tegra_core_dev_init_opp_table(&pdev->dev, &opp_params);
 	if (err)
 		return err;
 
-- 
2.30.2

