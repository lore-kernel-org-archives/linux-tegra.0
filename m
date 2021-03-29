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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D71C433F2
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D704861987
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhC2TrT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhC2TrB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:47:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660B9C061574;
        Mon, 29 Mar 2021 12:47:01 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f26so17249081ljp.8;
        Mon, 29 Mar 2021 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZoPfJ20qL3JwR6uAZFsq+CQb14ssqPbFmakTE1Xqn8E=;
        b=gAEcf3kjHc73g/2UFR2E9nA+6aSTsgjfl2HKNT5W1j/XCJHwU09gmucK7o9P3KbbaJ
         hEJ+WPYDfacZHK5EXuaUrglNDgQmIxEeK8Pm//BSWYEuSIdlFID43fq720I7Wm+rsSvr
         eaCefeWR7jT73hE/lhy93+ai1U8QCWq+sOwkQAj/obMxadvJ4RcNCpDBKkIjT+i9Hftz
         gKP2Zib3T7bz+n/y827/r+5egHBPUh8c32W3kEkpDLNQh+yVK9QUiukyCazcogUY1FpB
         7Q+pEHldNkxbm2rvDKryjOO3KcD4NI1uKQAn/FICdTK+xNARmuC62Cgi+cATMe8pqmRX
         cdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZoPfJ20qL3JwR6uAZFsq+CQb14ssqPbFmakTE1Xqn8E=;
        b=kH7TBKFX2EUqUS82bpUwm1IhFppa9ODScXUouAi3r/OIYHpmqUPmRAxV1eXn85uXXo
         tjoyrEhtCzbgPnBhs7/lq/I8ML23qr+/mT1K9lTQRzY2Fx+Svs8QaPbU9nTB+ng6I6/v
         qn+/al+HQFenqy2GX9EFYdmPibEvzMkFPKk9hZlQQNkejg45tPQXm69TfsEdKkGRJvhm
         2RR/GozQJu5VNxQwxSLS15ZUURaGvM8RHGJF6g3NohAW1MnTWPezEt8vgoFDcEQnLDT/
         +vm+d6iflT/vkAu46Ig13R7lFXD13/UG2SH4fnAipjHubiE1m5b31+Z5bG3jDdLUXHAK
         4VjA==
X-Gm-Message-State: AOAM533Z9Rw6Yr3jzgiKJS2HN6EwdkPJCVDfMFbWkBZLhhwunC0kprsz
        AhrVOYU+LK2KdPqUYxTNSWnIycRb/LM=
X-Google-Smtp-Source: ABdhPJyIVPdqkZkCmcg1E40ZR1lMcmNWqYzvl1gkaba/okG1lAD9Fcp4MZooTrtxIJuyz/pVi7s2Yw==
X-Received: by 2002:a05:651c:110a:: with SMTP id d10mr19285949ljo.307.1617047219990;
        Mon, 29 Mar 2021 12:46:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 6/6] memory: tegra: Print out info-level once per driver probe
Date:   Mon, 29 Mar 2021 22:46:02 +0300
Message-Id: <20210329194602.17049-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329194602.17049-1-digetx@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com>
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

