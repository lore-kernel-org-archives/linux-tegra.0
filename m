Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0736C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B86C619DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 23:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbhC3XGA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 19:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbhC3XF2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 19:05:28 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCDBC061574;
        Tue, 30 Mar 2021 16:05:28 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id q26so17628827qkm.6;
        Tue, 30 Mar 2021 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZoPfJ20qL3JwR6uAZFsq+CQb14ssqPbFmakTE1Xqn8E=;
        b=diEaOjOEtHwzWsdGEdF7Es9AqfR4lqoT9Ow8uEZ1BLL54vKAp34gNJlTf6fogDVAv0
         rNs6wncl1dynfzIJ3O7yKBZRf2RBef7ILnB2jlroeqi3JLFKYAYBmqFZoNrAEGVIR9Dk
         rHQ4JAR2FAKKExHaFpJQV/b5vvegJvw4CGm3bg+UxjgvHOyKsRezstPZSDn7JO/vSNfD
         JtfdbUTU/lRGg5X6nbXA+kroLqew9ymADSnpfgdj70v2SR+/MiZAPnfnLj/W7UmRh8Bc
         F+ccBZMPfllxi6zc/bW6oulaVZu74qsICpBqrzr3BG+PxUl4u038uz7/PAfZhwhU8zxT
         rA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZoPfJ20qL3JwR6uAZFsq+CQb14ssqPbFmakTE1Xqn8E=;
        b=cCzjENq7T0pkBxPrMKRrL/0u+lRMb9nnyyh0dyU4G/si6FRtKIt9kSLdGlfz+Urjhh
         6ZBMPkzn0TZ2PcYHEZutKIgp8pIs/89AEu/v+Foxgr07yaRuWypmUZ+FI1+8BihGQuqb
         Q1M7I7361wn+y0nQF8AWdrnXgsKiuNhmh3MSr6XIABSWVBLV32er6VWx6X7pWybYNBF6
         uCYtVPLkVENBXIoTyESPL8VqEx6KB4PoCb6NOge9aJAaqhp91TThlm1xEKmDh/WIYLqo
         yXRWh2JWq/O6or3dyewFhYPLybTzvl48gmy1qgrwBMY6r8id4bFmJwLWrZZZgOx0vviq
         u5sA==
X-Gm-Message-State: AOAM5310iIYvVPP4FfvN0lVccvH+gFSyyMEE84iCYhD97CV4llsMHDjW
        QE22y/bbnWlYSAWQ2M/1hYc=
X-Google-Smtp-Source: ABdhPJxm7KlaX/X6UdxtQQKt4HyQolFGx/OTOYdlhLQcCyig9xCmUWXAvDbkNMRWoFZp60s+XSDOeQ==
X-Received: by 2002:a05:620a:2013:: with SMTP id c19mr576001qka.403.1617145527632;
        Tue, 30 Mar 2021 16:05:27 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.gmail.com with ESMTPSA id 10sm160061qkc.83.2021.03.30.16.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 16:05:27 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 6/6] memory: tegra: Print out info-level once per driver probe
Date:   Wed, 31 Mar 2021 02:04:45 +0300
Message-Id: <20210330230445.26619-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Probing of EMC drivers may be deferred and in this case we get duplicated
info messages during kernel boot. Use dev_info_once() helper to silence
the duplicated messages.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 12 ++++++------
 drivers/memory/tegra/tegra20-emc.c  | 20 ++++++++++----------
 drivers/memory/tegra/tegra30-emc.c  | 18 +++++++++---------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 874e1a0f23cd..5699d909abc2 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -905,7 +905,7 @@ static int emc_init(struct tegra_emc *emc)
 	else
 		emc->dram_bus_width = 32;
 
-	dev_info(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
+	dev_info_once(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
 
 	emc->dram_type &= EMC_FBIO_CFG5_DRAM_TYPE_MASK;
 	emc->dram_type >>= EMC_FBIO_CFG5_DRAM_TYPE_SHIFT;
@@ -1419,8 +1419,8 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 		goto put_hw_table;
 	}
 
-	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		 hw_version, clk_get_rate(emc->clk) / 1000000);
+	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
+		      hw_version, clk_get_rate(emc->clk) / 1000000);
 
 	/* first dummy rate-set initializes voltage state */
 	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
@@ -1475,9 +1475,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		if (err)
 			return err;
 	} else {
-		dev_info(&pdev->dev,
-			 "no memory timings for RAM code %u found in DT\n",
-			 ram_code);
+		dev_info_once(&pdev->dev,
+			      "no memory timings for RAM code %u found in DT\n",
+			      ram_code);
 	}
 
 	err = emc_init(emc);
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index d653a6be8d7f..da8a0da8da79 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -411,12 +411,12 @@ static int tegra_emc_load_timings_from_dt(struct tegra_emc *emc,
 	sort(emc->timings, emc->num_timings, sizeof(*timing), cmp_timings,
 	     NULL);
 
-	dev_info(emc->dev,
-		 "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
-		 emc->num_timings,
-		 tegra_read_ram_code(),
-		 emc->timings[0].rate / 1000000,
-		 emc->timings[emc->num_timings - 1].rate / 1000000);
+	dev_info_once(emc->dev,
+		      "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
+		      emc->num_timings,
+		      tegra_read_ram_code(),
+		      emc->timings[0].rate / 1000000,
+		      emc->timings[emc->num_timings - 1].rate / 1000000);
 
 	return 0;
 }
@@ -429,7 +429,7 @@ tegra_emc_find_node_by_ram_code(struct device *dev)
 	int err;
 
 	if (of_get_child_count(dev->of_node) == 0) {
-		dev_info(dev, "device-tree doesn't have memory timings\n");
+		dev_info_once(dev, "device-tree doesn't have memory timings\n");
 		return NULL;
 	}
 
@@ -496,7 +496,7 @@ static int emc_setup_hw(struct tegra_emc *emc)
 	else
 		emc->dram_bus_width = 32;
 
-	dev_info(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
+	dev_info_once(emc->dev, "%ubit DRAM bus\n", emc->dram_bus_width);
 
 	return 0;
 }
@@ -931,8 +931,8 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 		goto put_hw_table;
 	}
 
-	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		 hw_version, clk_get_rate(emc->clk) / 1000000);
+	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
+		      hw_version, clk_get_rate(emc->clk) / 1000000);
 
 	/* first dummy rate-set initializes voltage state */
 	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 6985da0ffb35..829f6d673c96 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -998,12 +998,12 @@ static int emc_load_timings_from_dt(struct tegra_emc *emc,
 	if (err)
 		return err;
 
-	dev_info(emc->dev,
-		 "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
-		 emc->num_timings,
-		 tegra_read_ram_code(),
-		 emc->timings[0].rate / 1000000,
-		 emc->timings[emc->num_timings - 1].rate / 1000000);
+	dev_info_once(emc->dev,
+		      "got %u timings for RAM code %u (min %luMHz max %luMHz)\n",
+		      emc->num_timings,
+		      tegra_read_ram_code(),
+		      emc->timings[0].rate / 1000000,
+		      emc->timings[emc->num_timings - 1].rate / 1000000);
 
 	return 0;
 }
@@ -1015,7 +1015,7 @@ static struct device_node *emc_find_node_by_ram_code(struct device *dev)
 	int err;
 
 	if (of_get_child_count(dev->of_node) == 0) {
-		dev_info(dev, "device-tree doesn't have memory timings\n");
+		dev_info_once(dev, "device-tree doesn't have memory timings\n");
 		return NULL;
 	}
 
@@ -1503,8 +1503,8 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 		goto put_hw_table;
 	}
 
-	dev_info(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
-		 hw_version, clk_get_rate(emc->clk) / 1000000);
+	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
+		      hw_version, clk_get_rate(emc->clk) / 1000000);
 
 	/* first dummy rate-set initializes voltage state */
 	err = dev_pm_opp_set_rate(emc->dev, clk_get_rate(emc->clk));
-- 
2.30.2

