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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA2C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E37760FE5
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhDTQwm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhDTQwl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:41 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3A0C06138A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:06 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z5so9419949edr.11
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DU0xqn4krEHyoM683X8j1qZfQFz2ChszFNkhCN9k2/A=;
        b=Ri6nx5OdajxAYEF3IOxQr9YI/+J1dzR2pxZ3svKgSdL0XN2upCwQjkehtq9SMx0gVq
         rfiNAWnJrki2IwJ0GocF91CEWIbbraY3sTt+33sL4eFCwHk7692lDI0CWgAQdEWz2Okk
         /SXNNmXJ2IZriaFlYIwKdg4MAJGzmaUXoeU7hsbuyB1OTN2O3bFc5NV9hvwcd4RnfTvr
         wIouXkJW4n/QTKwbqA4EWdo3/IBiQ73YRfDRdFiu4RgiTd4u8ZTMj06gJ5DX2U3SlBF+
         X1mpn9j2NFBlR5THSpz42emwHSvBxO34awweWmbb++6v9Z+sMtGcFMDhCW+Dcwnfs1YI
         h9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DU0xqn4krEHyoM683X8j1qZfQFz2ChszFNkhCN9k2/A=;
        b=ewR+jSEqONHhMu7PYLFm8STOySa4EVZ5rx0KtjiGpIJloXCPXyRnQGaLf4O9JpSh/O
         s4PU3rpnGYU+u7bLhuaMm5A7bYfEuQMLgH+yKdWY3oOa7uTa4WTqSxI3pCK6u7y6vUOb
         4WSar+fNa2QaCTvKr1fOOekhkd+23EGq+8rEmYxY22Z88ivs9zk1UT7k+u1PDXYQpPVI
         foeBJskUJDBNCbb74+ZjiqPLr4URXes4CTeC0oi8GKhjaiKOHrvO1UYbyLt2WWuybRV6
         RuP93yEVwa9dwZLbLrE+/R02R3WLBoSxzWRybLR/Czzx8Kt2K6Lxp5pvzNZc84CHZBdr
         kAfw==
X-Gm-Message-State: AOAM530bu4eWf0cw0+V9z2DqrcbabB2ipSU32ADToiaNTcwnnzxLSbA0
        PMjc9sF5zZ8vO2yIv6tIXCFZWYdOHl8=
X-Google-Smtp-Source: ABdhPJyermRo3NnjQHw4E19DNfe6wlZbvBS2Ehxhm+eh9nrbfzaNG5MYMone8rjlQ59XFSKzB3Fwqw==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr33042681edj.178.1618937525587;
        Tue, 20 Apr 2021 09:52:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p4sm16488307edr.43.2021.04.20.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:52:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/10] memory: tegra: Extract setup code into callback
Date:   Tue, 20 Apr 2021 18:52:33 +0200
Message-Id: <20210420165237.3523732-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
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
index a800982f4a94..36eac0a0df3c 100644
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
2.30.2

