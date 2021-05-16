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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B88C43461
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E341E61159
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 21:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhEPVOf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 17:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbhEPVOe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 17:14:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDDCC06174A;
        Sun, 16 May 2021 14:13:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w4so4802567ljw.9;
        Sun, 16 May 2021 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ueM1JtdL2WEXVwCBbL9rRWyabHSIsAzV58fGIccOqXs=;
        b=ByY8TO2C1uEAXr1F3CypAxnTUfK/0fFIAoFZkpVirU/9/aNtE1L7ppLtBl7hynIt8e
         VIv3l7tYX6bASjAJ+qf2Y1NbkR8CbFBGpiiWogo9wCg8i33EqP+/A8HuTHZjm6QxNIHB
         wyP+u34A+f7AohY21/HtPZiani/BtLc5uj4Net2cuISyFeYWIY08qgMwB58Ct+wVyCf/
         SU+lgm8U62nuJzimuJmOojIt2Upwmvl7ufqrFM7QMzG8HmBk9+lnGgNrvdHPgQGFj5dR
         U2lPG1j2QSXCP+ke7sDgHoDg0cvkdQywFr+1OiudO2+Zr+kCuXO10c+gsAUJw6YLJhGG
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ueM1JtdL2WEXVwCBbL9rRWyabHSIsAzV58fGIccOqXs=;
        b=AX+zSBDQyuUakf5X0Z1nvFwx01TTgL39kwVvHyUL1MsjazGRUYe8772e2oguDW93J3
         NyGkowe5lQWyj28joYWPW9QIylMa0bshdSCmcT5s/4/fZr+l+AA9duRORzBReJKPse5K
         39rPVN99l8CI1b8McD7tymM9Qrp1c7HSPqPyKP8wDknvx7Qv3XFmLNmNw4PUL1iXRn7A
         72bnq2FJ/foiB1yyvdOPCKwAKn2CpunJDN2MxpfX+ZveT/iJzJ1C3KLwjAY493+04Rl4
         p5dGHApT42qy2bfx8x0svcSIn4bz4lk4IuMrEOIWtPYlKQV8S2lr5x1rBf+0HD4S7IDB
         s9vQ==
X-Gm-Message-State: AOAM530cRnkOiQ5LL/bRAfO7ubCPTViQMfe7xVPQhQuYWBMM2r7AXiZb
        jcIlC8pz4KhTEfllG6aErjc=
X-Google-Smtp-Source: ABdhPJwIY29VsnxKPTv8WNG7iibZ9VH5/JvBTSBP6Kcj3hgUWojRv3fpFFrgBDl88JRpMBjNohevZQ==
X-Received: by 2002:a2e:a167:: with SMTP id u7mr45725273ljl.495.1621199596385;
        Sun, 16 May 2021 14:13:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id q27sm1768785lfd.266.2021.05.16.14.13.15
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
Subject: [PATCH v1 1/2] memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
Date:   Mon, 17 May 2021 00:13:01 +0300
Message-Id: <20210516211302.32404-2-digetx@gmail.com>
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

Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 48 +++---------------------------
 1 file changed, 4 insertions(+), 44 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index da8a0da8da79..a534197a5fb2 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -908,49 +908,6 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 	return err;
 }
 
-static int tegra_emc_opp_table_init(struct tegra_emc *emc)
-{
-	u32 hw_version = BIT(tegra_sku_info.soc_process_id);
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
@@ -1077,6 +1034,7 @@ static int tegra_emc_devfreq_init(struct tegra_emc *emc)
 
 static int tegra_emc_probe(struct platform_device *pdev)
 {
+	struct tegra_core_opp_params opp_params = {};
 	struct device_node *np;
 	struct tegra_emc *emc;
 	int irq, err;
@@ -1122,7 +1080,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
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

