Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3D8CCA483
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiGAIWt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Jul 2022 04:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbiGAIWa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Jul 2022 04:22:30 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB4172EDB
        for <linux-tegra@vger.kernel.org>; Fri,  1 Jul 2022 01:21:46 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so1957154pjj.5
        for <linux-tegra@vger.kernel.org>; Fri, 01 Jul 2022 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dhuAUlxL6a2wqcLbBiio6+uEDAJd6LpL5jQUwIGjd+Y=;
        b=xuoDlNsMbbYjbf5K40c63W+oxOO2ayJobd0+7IcXkuEkBNqTF1PoOLTU2YepPNcQCy
         otKMcRGNKYW4t7Y6i345UxRRekCEEoHsvVpwa0N48AiXpwSHpn1lUUxdnIVqRTySs6Je
         //p8brfMIo9Kx7VS3I2MeKBBd2E/AGT0GIeMJVMrihp/VPDA0umCIk4MTKHTggEcQOa5
         2dlQ/xC7B8V+lxOJQmX3LhuQldkh1fmJQ8g7lVXEY5YQdPVMr6XXj93C6Ofofvy7GLxB
         c4N/ZrAtbosldmENE7W/SeDQuk4+4Rl0B4TGvReCUFR60S8PHa8eOEZ6A9OFEOl6GuRf
         73nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dhuAUlxL6a2wqcLbBiio6+uEDAJd6LpL5jQUwIGjd+Y=;
        b=3/XaC9qXqMWxSvssgMhCPqJ1NSdlYWMKGJ5xekpIMMQ2Rl5NtsbwN0xrUDOZzGyr4q
         rFUHPgxIHvV+OmDWifpbjicNrz6DUWdSC+e+zVheHr4EV60uBP2U+v11fraSvKmUVlJJ
         T1XIqI0BmeMKI7br3k86GaY7ryKlSRXnnzj96isi4NGqhrWd/biPZT8YbX8ZYDN/3cpL
         TvVe5XZ64zCWYUP3LSy+p+j4icP0nysHtH3EPfkKLtZWOMtJSTARoSQdWidoocY5lZs8
         q8hqC2FZCyYJVsN1GBkN0okMTiKpJp3GgQQpcD5iseU7a3LM1RZYmsi/dlRY6PHUwvXH
         N6oA==
X-Gm-Message-State: AJIora+iExVGEdXRHCULTAavvwknLpdAsXQugcXwx++z7RAKCasnaKPF
        gfTxfZzJggBXFN2EwBGtFWbjuQ==
X-Google-Smtp-Source: AGRyM1tShnw3nTxkpxq16des5jB4bU3hNiiZjUQRlbjeaDKskqJ/swhYj0egAaSFGfeBgUwAgc7/tw==
X-Received: by 2002:a17:90b:4b81:b0:1ec:adbe:3b0b with SMTP id lr1-20020a17090b4b8100b001ecadbe3b0bmr15524702pjb.147.1656663706133;
        Fri, 01 Jul 2022 01:21:46 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090320d100b0016a38f8ba7fsm14843586plb.162.2022.07.01.01.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:45 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 22/30] soc/tegra: Migrate to dev_pm_opp_set_config()
Date:   Fri,  1 Jul 2022 13:50:17 +0530
Message-Id: <bb406c0043e39848d1adc09b3918126523d3f4ab.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/soc/tegra/common.c | 52 +++++++++++++++++++++-----------------
 drivers/soc/tegra/pmc.c    |  8 ++++--
 2 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 9f3fdeb1a11c..6a099d764cce 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -107,36 +107,42 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 {
 	u32 hw_version;
 	int err;
-
-	/*
-	 * For some devices we don't have any OPP table in the DT, and in order
-	 * to use the same code path for all the devices, we create a dummy OPP
-	 * table for them via this call. The dummy OPP table is only capable of
-	 * doing clk_set_rate() on invocation of dev_pm_opp_set_rate() and
-	 * doesn't provide any other functionality.
-	 */
-	err = devm_pm_opp_set_clkname(dev, NULL);
-	if (err) {
-		dev_err(dev, "failed to set OPP clk: %d\n", err);
-		return err;
-	}
-
-	/* Tegra114+ doesn't support OPP yet */
-	if (!of_machine_is_compatible("nvidia,tegra20") &&
-	    !of_machine_is_compatible("nvidia,tegra30"))
-		return -ENODEV;
-
-	if (of_machine_is_compatible("nvidia,tegra20"))
+	struct dev_pm_opp_config config = {
+		/*
+		 * For some devices we don't have any OPP table in the DT, and
+		 * in order to use the same code path for all the devices, we
+		 * create a dummy OPP table for them via this. The dummy OPP
+		 * table is only capable of doing clk_set_rate() on invocation
+		 * of dev_pm_opp_set_rate() and doesn't provide any other
+		 * functionality.
+		 */
+		.clk_names = (const char *[]){ NULL },
+		.clk_count = 1,
+	};
+
+	if (of_machine_is_compatible("nvidia,tegra20")) {
 		hw_version = BIT(tegra_sku_info.soc_process_id);
-	else
+		config.supported_hw = &hw_version;
+		config.supported_hw_count = 1;
+	} else if (of_machine_is_compatible("nvidia,tegra30")) {
 		hw_version = BIT(tegra_sku_info.soc_speedo_id);
+		config.supported_hw = &hw_version;
+		config.supported_hw_count = 1;
+	}
 
-	err = devm_pm_opp_set_supported_hw(dev, &hw_version, 1);
+	err = devm_pm_opp_set_config(dev, &config);
 	if (err) {
-		dev_err(dev, "failed to set OPP supported HW: %d\n", err);
+		dev_err(dev, "failed to set OPP config: %d\n", err);
 		return err;
 	}
 
+	/*
+	 * Tegra114+ doesn't support OPP yet, return early for non tegra20/30
+	 * case.
+	 */
+	if (!config.supported_hw)
+		return -ENODEV;
+
 	/*
 	 * Older device-trees have an empty OPP table, we will get
 	 * -ENODEV from devm_pm_opp_of_add_table() in this case.
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5611d14d3ba2..64d74a227261 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1386,6 +1386,10 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	struct generic_pm_domain *genpd;
 	const char *rname = "core";
 	int err;
+	struct dev_pm_opp_config config = {
+		.regulator_names = &rname,
+		.regulator_count = 1,
+	};
 
 	genpd = devm_kzalloc(pmc->dev, sizeof(*genpd), GFP_KERNEL);
 	if (!genpd)
@@ -1395,10 +1399,10 @@ static int tegra_pmc_core_pd_add(struct tegra_pmc *pmc, struct device_node *np)
 	genpd->set_performance_state = tegra_pmc_core_pd_set_performance_state;
 	genpd->opp_to_performance_state = tegra_pmc_core_pd_opp_to_performance_state;
 
-	err = devm_pm_opp_set_regulators(pmc->dev, &rname, 1);
+	err = devm_pm_opp_set_config(pmc->dev, &config);
 	if (err)
 		return dev_err_probe(pmc->dev, err,
-				     "failed to set core OPP regulator\n");
+				     "failed to set OPP config\n");
 
 	err = pm_genpd_init(genpd, NULL, false);
 	if (err) {
-- 
2.31.1.272.g89b43f80a514

