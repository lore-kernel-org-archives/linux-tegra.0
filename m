Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D853C47082
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 22:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61D92611AC
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 22:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhEWWpA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 18:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbhEWWo7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 18:44:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847CBC061756;
        Sun, 23 May 2021 15:43:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a2so37886824lfc.9;
        Sun, 23 May 2021 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QrbZfFAlvahMlx2onf5N7LsOj4l18BaiDKGnlBtkUuo=;
        b=OWa/a3oTJOeZTJ1gaWteSVnJYSFONENuIwT6gwmObr0C3fzXioVbeQsWkd5DKB3gkW
         eu+/ARObHPs0MkXOrkkgRjMkf9RtauGoFbk2yRWYnDcfRrzTtbiSXzZ3cowj7uIdrzmG
         lazRgl9LhtP2eTOREu+YM1L067X9eL87ItrrwHw0Zk4RRF3IhguRBcvehmKxxFk0zm/u
         Nr2A1O5ER33vi8yC1dxdHSkGWILHJdS6YXp8J8lN21651goSRkTnFdhzjRX55NNiWF4I
         V2fXQpDnFPPr7Vo47xu/xeib1d0wnevrK3DUYAWjH7gdIFLIBILiEIv1uHdmKMDDoBbi
         PhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QrbZfFAlvahMlx2onf5N7LsOj4l18BaiDKGnlBtkUuo=;
        b=sm6T2f6oi6rBIRU7zsadHPT8BX4br9rbQIjf3ZnsV8TJD4E7fhlzWZIvkAVMCDQMaS
         lAhD9AMeRNZTXcJhC4GCcTuqeKFeEswYIh5JXyPt0M813+io9cv4Xo820elqaT54Yf74
         gSrujU0wkYS38/a28d++Cjg7mWm1klXR23W6xaxHaXDHVTU5yCsZ/5Ys9TiThCbhFOZa
         qO3pgaeuLCSlQpoedlHu5mnlK6VOU6Vqg/11hoyoJHVsoOAnPEDnY+GPOg6te6LiGGrA
         JPCk9drnULFryI/UOWmuxiN9tLFzmxRS23kU4RIl/tbRbhvF7QXq7e8rGEm0hpAojtH2
         RmNg==
X-Gm-Message-State: AOAM531cbMmQGtmlvsx1SG1B2sBN4WT6GU/exVZWUQWauGMfVfX4Fh0E
        Zugp0f9Mkof0mQCB7AEOkX4=
X-Google-Smtp-Source: ABdhPJy4S8iKqd01bq5z3lxJ2k9xYpWLsCnubhbdlg2xNIUqjVw8rLY87d1NWuxLq6PdxwTY7G8o6g==
X-Received: by 2002:a05:6512:3f08:: with SMTP id y8mr8835954lfa.657.1621809796856;
        Sun, 23 May 2021 15:43:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id m5sm1531622ljg.118.2021.05.23.15.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:43:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] regulator: max77620: Use device_set_of_node_from_dev()
Date:   Mon, 24 May 2021 01:42:42 +0300
Message-Id: <20210523224243.13219-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523224243.13219-1-digetx@gmail.com>
References: <20210523224243.13219-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The MAX77620 driver fails to re-probe on deferred probe because driver
core tries to claim resources that are already claimed by the PINCTRL
device. Use device_set_of_node_from_dev() helper which marks OF node as
reused, skipping erroneous execution of pinctrl_bind_pins() for the PMIC
device on the re-probe.

Fixes: aea6cb99703e ("regulator: resolve supply after creating regulator")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/max77620-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 8d9731e4052b..5c439c850d09 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -814,6 +814,13 @@ static int max77620_regulator_probe(struct platform_device *pdev)
 	config.dev = dev;
 	config.driver_data = pmic;
 
+	/*
+	 * Set of_node_reuse flag to prevent driver core from attempting to
+	 * claim any pinmux resources already claimed by the parent device.
+	 * Otherwise PMIC driver will fail to re-probe.
+	 */
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
 	for (id = 0; id < MAX77620_NUM_REGS; id++) {
 		struct regulator_dev *rdev;
 		struct regulator_desc *rdesc;
-- 
2.30.2

