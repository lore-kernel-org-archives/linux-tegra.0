Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AD1C2BA1A
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2A8C64DD8
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378840AbhCCDbk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447182AbhCBMvJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:51:09 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6342CC061221;
        Tue,  2 Mar 2021 04:25:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v5so30926597lft.13;
        Tue, 02 Mar 2021 04:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pc/JIwLF1jTooRzJMl7xkBvvmDEMkX/CR3zJ+KXqlEc=;
        b=KgC7m/hIfv14N4QI8u5/CE3DNvP+QWKLUw5KmJYZt1jmjHYECfq18e+gHQkMe+MAjl
         EYCgfsUC/+ad7I/FxnNcvVA0hSLg+TiBIxxjkCtTa0vfvUahMu952q+WV19bfYVIfphc
         leoV6gvgWFEhPpanG1EyG60aRfXrynpfcMo+E1If3LHT1vWp/9bQzWgnA1921VAk7Zh0
         sdKx4Aa+J9T1lq0SeeTkNh5LER9o8Fyoj5ZgvlQKFNKY+4x4XaHmMHnkaIbTU6TzFB8O
         Hgc0o/dxjWSFFwlicqoF/1Oa7AqBGOhzf4yu8FR39pObbfLEnewZsSILNKDmmGBCWsdh
         Pe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pc/JIwLF1jTooRzJMl7xkBvvmDEMkX/CR3zJ+KXqlEc=;
        b=OO/Hsgc17QE42LnPZWX+PkpkOZV1AAGgv85y4/kdmrL9kFZEJdRgpF3Nnmnyue99ld
         QUIaMwylOaBgPGAzbglfnFS3yArJebCkuhueTULzQtPyaCF9r7fNHy6qzPQUyFCWYRUz
         441CbpED4HT+D7cJWgKCMqwhBYNeZdv8h0DVFzpD2Gn2CWTL9pwH6h1/r+u9T3P1YVdf
         KaVioKCIqdl+JsKo2P5qcIGAdzdwOQzpWF3qGNckKK6ddWqsXPiZV/k0FXiXu4H6JsyS
         qRJ402VHps7m/tqV2i1/kPQE749li+lT53v9o8MlatJz7v4OJI7m8A+aKpuTkmWgZ5Z0
         6V+A==
X-Gm-Message-State: AOAM531FS9gYB1KYigK6y8iAx2KtOo4CbdBkitzj/m3nQhtYXtvg5cZ0
        d+0P2rT9IzHvdZv+wkJmaz4=
X-Google-Smtp-Source: ABdhPJx45N7qVYWSZidbin9B/id4HAWyLKJltRXG85UYFFhAD8knndegMcKmWnZ9l4gq1qtlBHv6Dw==
X-Received: by 2002:ac2:42ce:: with SMTP id n14mr6297692lfl.353.1614687913918;
        Tue, 02 Mar 2021 04:25:13 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id u4sm2602126lfs.61.2021.03.02.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:25:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] soc/tegra: pmc: Ensure that clock rates aren't too high
Date:   Tue,  2 Mar 2021 15:25:00 +0300
Message-Id: <20210302122502.20874-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302122502.20874-1-digetx@gmail.com>
References: <20210302122502.20874-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Switch all clocks of a power domain to a safe rate which is suitable
for all possible voltages in order to ensure that hardware constraints
aren't violated when power domain state toggles.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 92 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f970b615ee27..a87645fac735 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -237,6 +237,7 @@ struct tegra_powergate {
 	unsigned int id;
 	struct clk **clks;
 	unsigned int num_clks;
+	unsigned long *clk_rates;
 	struct reset_control *reset;
 };
 
@@ -641,6 +642,57 @@ static int __tegra_powergate_remove_clamping(struct tegra_pmc *pmc,
 	return 0;
 }
 
+static int tegra_powergate_prepare_clocks(struct tegra_powergate *pg)
+{
+	unsigned long safe_rate = 100 * 1000 * 1000;
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < pg->num_clks; i++) {
+		pg->clk_rates[i] = clk_get_rate(pg->clks[i]);
+
+		if (!pg->clk_rates[i]) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		if (pg->clk_rates[i] <= safe_rate)
+			continue;
+
+		/*
+		 * We don't know whether voltage state is okay for the
+		 * current clock rate, hence it's better to temporally
+		 * switch clock to a safe rate which is suitable for
+		 * all voltages, before enabling the clock.
+		 */
+		err = clk_set_rate(pg->clks[i], safe_rate);
+		if (err)
+			goto out;
+	}
+
+	return 0;
+
+out:
+	while (i--)
+		clk_set_rate(pg->clks[i], pg->clk_rates[i]);
+
+	return err;
+}
+
+static int tegra_powergate_unprepare_clocks(struct tegra_powergate *pg)
+{
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < pg->num_clks; i++) {
+		err = clk_set_rate(pg->clks[i], pg->clk_rates[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static void tegra_powergate_disable_clocks(struct tegra_powergate *pg)
 {
 	unsigned int i;
@@ -691,10 +743,14 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 
 	usleep_range(10, 20);
 
-	err = tegra_powergate_enable_clocks(pg);
+	err = tegra_powergate_prepare_clocks(pg);
 	if (err)
 		goto powergate_off;
 
+	err = tegra_powergate_enable_clocks(pg);
+	if (err)
+		goto unprepare_clks;
+
 	usleep_range(10, 20);
 
 	err = __tegra_powergate_remove_clamping(pg->pmc, pg->id);
@@ -717,12 +773,19 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
 	if (disable_clocks)
 		tegra_powergate_disable_clocks(pg);
 
+	err = tegra_powergate_unprepare_clocks(pg);
+	if (err)
+		return err;
+
 	return 0;
 
 disable_clks:
 	tegra_powergate_disable_clocks(pg);
 	usleep_range(10, 20);
 
+unprepare_clks:
+	tegra_powergate_unprepare_clocks(pg);
+
 powergate_off:
 	tegra_powergate_set(pg->pmc, pg->id, false);
 
@@ -733,10 +796,14 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 {
 	int err;
 
-	err = tegra_powergate_enable_clocks(pg);
+	err = tegra_powergate_prepare_clocks(pg);
 	if (err)
 		return err;
 
+	err = tegra_powergate_enable_clocks(pg);
+	if (err)
+		goto unprepare_clks;
+
 	usleep_range(10, 20);
 
 	err = reset_control_assert(pg->reset);
@@ -753,6 +820,10 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 	if (err)
 		goto assert_resets;
 
+	err = tegra_powergate_unprepare_clocks(pg);
+	if (err)
+		return err;
+
 	return 0;
 
 assert_resets:
@@ -764,6 +835,9 @@ static int tegra_powergate_power_down(struct tegra_powergate *pg)
 disable_clks:
 	tegra_powergate_disable_clocks(pg);
 
+unprepare_clks:
+	tegra_powergate_unprepare_clocks(pg);
+
 	return err;
 }
 
@@ -881,6 +955,12 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 	if (!pg)
 		return -ENOMEM;
 
+	pg->clk_rates = kzalloc(sizeof(*pg->clk_rates), GFP_KERNEL);
+	if (!pg->clk_rates) {
+		kfree(pg->clks);
+		return -ENOMEM;
+	}
+
 	pg->id = id;
 	pg->clks = &clk;
 	pg->num_clks = 1;
@@ -892,6 +972,7 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
 		dev_err(pmc->dev, "failed to turn on partition %d: %d\n", id,
 			err);
 
+	kfree(pg->clk_rates);
 	kfree(pg);
 
 	return err;
@@ -1042,6 +1123,12 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 	if (!pg->clks)
 		return -ENOMEM;
 
+	pg->clk_rates = kcalloc(count, sizeof(*pg->clk_rates), GFP_KERNEL);
+	if (!pg->clk_rates) {
+		kfree(pg->clks);
+		return -ENOMEM;
+	}
+
 	for (i = 0; i < count; i++) {
 		pg->clks[i] = of_clk_get(np, i);
 		if (IS_ERR(pg->clks[i])) {
@@ -1058,6 +1145,7 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 	while (i--)
 		clk_put(pg->clks[i]);
 
+	kfree(pg->clk_rates);
 	kfree(pg->clks);
 
 	return err;
-- 
2.29.2

