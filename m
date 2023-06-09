Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7E6C7EE2E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbjFIOme (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjFIOmd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:42:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25802E43
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:42:32 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-97467e06511so314908566b.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686321750; x=1688913750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=El8oyFZNh8lSxaHd6WMVJll3Yl13SXdC7CmGBCc6L7M=;
        b=YB1u65ToDOC+pWQYt1KzPAuH19hoVojOcBFOj1J5e5WBcBO9TTGSdseiD2jdmwxRyD
         xwfK/irFrEDjDMrs9Qpzn1ZdISYFiI3JVk6AOrlZ0wAohRE7jzzEAHKwoqTszdlxePMp
         lAD6z6hw9+3+bSjOd4ntqc92rb+/0CxNZt3S8oVgXql99FS3WQHgbO4se4LInYzOBPAc
         zS03pdVh9AciPOiKaqIIqo53jmCL0JL9/xFVDah3M0DKOiJuuvo+IWyKtuG87aH7dSsf
         PQlwavHvWNL7QJ8LYjlGBM1baeUuhMB9ANvyPqbdd3sX7bUejT63Cn6PvowqSpD+b9+s
         /Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686321750; x=1688913750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El8oyFZNh8lSxaHd6WMVJll3Yl13SXdC7CmGBCc6L7M=;
        b=gUHwrkrWOOtPIOpFpHWNgFHE6hmGWUqp/dYuB+EDgwpJZdnwv7LEVNvIxPxsgcHCzP
         rk/WKSLHvRfkjLKs8suU+h/egjiw1E9zDOI/Ol1zf8Ogfb1uGzObHrYcOrkhvCNWOztU
         eifsVHiDSOnyoZO9AWh4t+BWOHtXfXrsivkzeYQ/9bLhIol6Sb2ykCk3wj5lzANcs4nd
         /qs62aKPKCaDagAzlQEtDLUFYq5QeBWmnVnkVmxI9jVa9JbSPipHfEdWO2SbPz/ueul8
         ZvOnWXUhvzJWNBKbFU1iRxyuz65ytZIVp1z8hw+Gyeu//qvmx8Wu6EmK7TcTeCrT5YEz
         INOA==
X-Gm-Message-State: AC+VfDzl4QFO7HUfXcldeJ5NWkbOoDqrb3kQ9D5r38bazViI0W1AKYKN
        c23QyMHMydQuAPxrH90jnK4=
X-Google-Smtp-Source: ACHHUZ7D24LFTrnXPRiDrj9e+XKa5xzzwKaC8DQZ215CswJ/N8WYDqV2E2MlS1yOTN0cXbSE8oRo7g==
X-Received: by 2002:a17:907:72d2:b0:974:1ef1:81ae with SMTP id du18-20020a17090772d200b009741ef181aemr2052316ejc.54.1686321750337;
        Fri, 09 Jun 2023 07:42:30 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906165800b00977c7566ccbsm1362029ejd.164.2023.06.09.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:42:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc/tegra: pmc: Simplify debugfs initialization
Date:   Fri,  9 Jun 2023 16:42:24 +0200
Message-Id: <20230609144225.3898934-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

debugfs calls should generally not be error-checked to simplify the case
where debugfs is disabled. Since this driver is built-in and has the
sysfs bind/unbind attributes disabled, it cannot be unloaded, so there
is no need to hold onto a reference to the debugfs files that are
created.

We can further simplify this by moving the debugfs file creation to a
later stage to avoid any cleanup we might have to do during error unwind
operations. This is also a little cleaner because the debugfs file
relies on data structures that are created at a later point than when
the file was previously created.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b562b005744d..438c30c5d473 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -396,7 +396,6 @@ struct tegra_pmc_soc {
  * @clk: pointer to pclk clock
  * @soc: pointer to SoC data structure
  * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
- * @debugfs: pointer to debugfs entry
  * @rate: currently configured rate of pclk
  * @suspend_mode: lowest suspend mode available
  * @cpu_good_time: CPU power good time (in microseconds)
@@ -431,7 +430,6 @@ struct tegra_pmc {
 	void __iomem *aotag;
 	void __iomem *scratch;
 	struct clk *clk;
-	struct dentry *debugfs;
 
 	const struct tegra_pmc_soc *soc;
 	bool tz_only;
@@ -1190,16 +1188,6 @@ static int powergate_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(powergate);
 
-static int tegra_powergate_debugfs_init(void)
-{
-	pmc->debugfs = debugfs_create_file("powergate", S_IRUGO, NULL, NULL,
-					   &powergate_fops);
-	if (!pmc->debugfs)
-		return -ENOMEM;
-
-	return 0;
-}
-
 static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 				       struct device_node *np)
 {
@@ -3026,19 +3014,13 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 
 	tegra_pmc_reset_sysfs_init(pmc);
 
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		err = tegra_powergate_debugfs_init();
-		if (err < 0)
-			goto cleanup_sysfs;
-	}
-
 	err = tegra_pmc_pinctrl_init(pmc);
 	if (err)
-		goto cleanup_debugfs;
+		goto cleanup_sysfs;
 
 	err = tegra_pmc_regmap_init(pmc);
 	if (err < 0)
-		goto cleanup_debugfs;
+		goto cleanup_sysfs;
 
 	err = tegra_powergate_init(pmc, pdev->dev.of_node);
 	if (err < 0)
@@ -3061,12 +3043,12 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	if (pmc->soc->set_wake_filters)
 		pmc->soc->set_wake_filters(pmc);
 
+	debugfs_create_file("powergate", 0444, NULL, NULL, &powergate_fops);
+
 	return 0;
 
 cleanup_powergates:
 	tegra_powergate_remove_all(pdev->dev.of_node);
-cleanup_debugfs:
-	debugfs_remove(pmc->debugfs);
 cleanup_sysfs:
 	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
 	device_remove_file(&pdev->dev, &dev_attr_reset_level);
-- 
2.40.1

