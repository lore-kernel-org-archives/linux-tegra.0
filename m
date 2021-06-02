Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC91C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C9776195E
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFBQek (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:34:40 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:46760 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFBQej (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:34:39 -0400
Received: by mail-ed1-f44.google.com with SMTP id r11so3631675edt.13
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AkSG2pd+jkF67VxssdQ1P/zh+/VGfT/c+IwO9GhNnXM=;
        b=tb79QFMt9cEEnY8fB27i80UhAKgxTsZWKVCz5kwViOvjIncSaY1B5jiTPLK6pdor8A
         9OfyMIOWJRmc57ZXBbyTqQNY0uYbEe14braI/s5Z3fevw7F9VreiZd4o3s/ZPhjSE2/w
         mzmnfzqIM24eWN1Nolh1Ol1dqOpFfMNi4k2sJTUJlMDDu7Q7RPXn0PrjBwLVbusxTLLs
         2w8H2j8WOPVf+PC57fRAWXS3JhVNplSAgMIWjvEshnhK3Hvcsuwr+jZkYQFv0BBjAP8/
         jP5MRpzI385RtnYfEOtSvhaCr40DMFVk9rKEttGEuTwUfFFz6YaKAnHTl1CiOE2hZv7G
         Se5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AkSG2pd+jkF67VxssdQ1P/zh+/VGfT/c+IwO9GhNnXM=;
        b=CE790DXfeJlVgSkQtx5zUbET0UmykcNz6uiyavQAZMPUSv8Ab2juXufame9vlkVW15
         EP5lOhOfav6jcrnbW/4aglSLfIMrthCDmMVmf57QAQPK2RDju25RJghPnfD7+8Q48DqU
         /R5e4qvwYjTHmLwEgFo2G9PWyQJIX6rgH8fLzBWAWr+CDJ0pB4HNZ6XKdhdfM5/cwz8F
         elvMjkG9/DEkETEFK9sA5h+7QcmlsLB/BNznAYNrMKcVHKd+kQSoeqCQKDMyJWFoh9po
         2vVxGTFEeBLSyGe4q9TP4l98iPaCq4JbW+qFAprfotkMqLNXXdK5n9KSORUlFHDu5oX9
         a7bA==
X-Gm-Message-State: AOAM531ivEYMspD7SnaeBg7aC7OLh226wuwwGADnkPBL4To6CUrtfHaU
        MsoRwoEbbHpZCJ+O7HiBZNo=
X-Google-Smtp-Source: ABdhPJwpY+XrOrZTlJUpLDYh29z7DuI0k4ZQm7NkqmQ/P42al2I9XXT1zU7P9SHr+oD7gcFOEd6UjA==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr19473780edb.108.1622651503008;
        Wed, 02 Jun 2021 09:31:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z17sm256852ejc.69.2021.06.02.09.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 06/12] memory: tegra: Extract setup code into callback
Date:   Wed,  2 Jun 2021 18:32:56 +0200
Message-Id: <20210602163302.120041-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Separate the setup code for Tegra30 and later into a ->setup() callback
and set it for all applicable chips.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 127 ++++++++++++++++++--------------
 drivers/memory/tegra/mc.h       |   9 +++
 drivers/memory/tegra/tegra114.c |   1 +
 drivers/memory/tegra/tegra124.c |   2 +
 drivers/memory/tegra/tegra210.c |   1 +
 drivers/memory/tegra/tegra30.c  |   1 +
 6 files changed, 84 insertions(+), 57 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ea2142ba720a..edb3c4a25365 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -299,38 +299,6 @@ static int tegra_mc_reset_setup(struct tegra_mc *mc)
 	return 0;
 }
 
-static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
-{
-	unsigned long long tick;
-	unsigned int i;
-	u32 value;
-
-	/* compute the number of MC clock cycles per tick */
-	tick = (unsigned long long)mc->tick * clk_get_rate(mc->clk);
-	do_div(tick, NSEC_PER_SEC);
-
-	value = mc_readl(mc, MC_EMEM_ARB_CFG);
-	value &= ~MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK;
-	value |= MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(tick);
-	mc_writel(mc, value, MC_EMEM_ARB_CFG);
-
-	/* write latency allowance defaults */
-	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra_mc_client *client = &mc->soc->clients[i];
-		u32 value;
-
-		value = mc_readl(mc, client->regs.la.reg);
-		value &= ~(client->regs.la.mask << client->regs.la.shift);
-		value |= (client->regs.la.def & client->regs.la.mask) << client->regs.la.shift;
-		mc_writel(mc, value, client->regs.la.reg);
-	}
-
-	/* latch new values */
-	mc_writel(mc, MC_TIMING_UPDATE, MC_TIMING_CONTROL);
-
-	return 0;
-}
-
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
 {
 	unsigned int i;
@@ -368,6 +336,43 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 }
 EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
 
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_114_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_124_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_132_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_210_SOC)
+static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
+{
+	unsigned long long tick;
+	unsigned int i;
+	u32 value;
+
+	/* compute the number of MC clock cycles per tick */
+	tick = (unsigned long long)mc->tick * clk_get_rate(mc->clk);
+	do_div(tick, NSEC_PER_SEC);
+
+	value = mc_readl(mc, MC_EMEM_ARB_CFG);
+	value &= ~MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK;
+	value |= MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(tick);
+	mc_writel(mc, value, MC_EMEM_ARB_CFG);
+
+	/* write latency allowance defaults */
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra_mc_client *client = &mc->soc->clients[i];
+		u32 value;
+
+		value = mc_readl(mc, client->regs.la.reg);
+		value &= ~(client->regs.la.mask << client->regs.la.shift);
+		value |= (client->regs.la.def & client->regs.la.mask) << client->regs.la.shift;
+		mc_writel(mc, value, client->regs.la.reg);
+	}
+
+	/* latch new values */
+	mc_writel(mc, MC_TIMING_UPDATE, MC_TIMING_CONTROL);
+
+	return 0;
+}
+
 static int load_one_timing(struct tegra_mc *mc,
 			   struct tegra_mc_timing *timing,
 			   struct device_node *node)
@@ -459,6 +464,39 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
 	return 0;
 }
 
+int tegra30_mc_probe(struct tegra_mc *mc)
+{
+	int err;
+
+	mc->clk = devm_clk_get_optional(mc->dev, "mc");
+	if (IS_ERR(mc->clk)) {
+		dev_err(mc->dev, "failed to get MC clock: %ld\n", PTR_ERR(mc->clk));
+		return PTR_ERR(mc->clk);
+	}
+
+	/* ensure that debug features are disabled */
+	mc_writel(mc, 0x00000000, MC_TIMING_CONTROL_DBG);
+
+	err = tegra_mc_setup_latency_allowance(mc);
+	if (err < 0) {
+		dev_err(mc->dev, "failed to setup latency allowance: %d\n", err);
+		return err;
+	}
+
+	err = tegra_mc_setup_timings(mc);
+	if (err < 0) {
+		dev_err(mc->dev, "failed to setup timings: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+const struct tegra_mc_ops tegra30_mc_ops = {
+	.probe = tegra30_mc_probe,
+};
+#endif
+
 static const char *const status_names[32] = {
 	[ 1] = "External interrupt",
 	[ 6] = "EMEM address decode error",
@@ -777,13 +815,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->regs))
 		return PTR_ERR(mc->regs);
 
-	mc->clk = devm_clk_get(&pdev->dev, "mc");
-	if (IS_ERR(mc->clk)) {
-		dev_err(&pdev->dev, "failed to get MC clock: %ld\n",
-			PTR_ERR(mc->clk));
-		return PTR_ERR(mc->clk);
-	}
-
 	mc->debugfs.root = debugfs_create_dir("mc", NULL);
 
 	if (mc->soc->ops && mc->soc->ops->probe) {
@@ -798,25 +829,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	} else
 #endif
 	{
-		/* ensure that debug features are disabled */
-		mc_writel(mc, 0x00000000, MC_TIMING_CONTROL_DBG);
-
-		err = tegra_mc_setup_latency_allowance(mc);
-		if (err < 0) {
-			dev_err(&pdev->dev,
-				"failed to setup latency allowance: %d\n",
-				err);
-			return err;
-		}
-
 		isr = tegra_mc_irq;
-
-		err = tegra_mc_setup_timings(mc);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to setup timings: %d\n",
-				err);
-			return err;
-		}
 	}
 
 	mc->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1ee34f0da4f7..731896169cf3 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -129,6 +129,15 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_114_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_124_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_132_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_210_SOC)
+int tegra30_mc_probe(struct tegra_mc *mc);
+extern const struct tegra_mc_ops tegra30_mc_ops;
+#endif
+
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
  * chosen such that they don't conflict with the device-tree ICC node IDs.
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 1f2054d34bf5..41350570c815 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1113,4 +1113,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
+	.ops = &tegra30_mc_ops,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 8a8485ceb789..d780a84241fe 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1274,6 +1274,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
+	.ops = &tegra30_mc_ops,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1305,5 +1306,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
+	.ops = &tegra30_mc_ops,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 08f3a08cd743..8ab6498dbe7d 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1286,4 +1286,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
+	.ops = &tegra30_mc_ops,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 1922ab64e686..84316357513d 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1399,4 +1399,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.resets = tegra30_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
+	.ops = &tegra30_mc_ops,
 };
-- 
2.31.1

