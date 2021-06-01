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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A909C47092
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E76A46023E
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbhFASAU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhFASAT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:19 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3674C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:36 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id k7so13532443ejv.12
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3v3kq/uSr8IRWzglaWNE2WhfN2DYcE7MjLRhE6SSfg=;
        b=WgWIl8/nx/5/7XABwn4EwY0D+fQAxfulxtoYPL7qWiBMP2R38PgFZ4TrZffpOCECK2
         gulQLW9uujitg3LXDqqpu8s4ARBjIhUJ5RshfSM9ZZyx7B20nAjeVIKk+VYtygz6Tzkn
         mvt5IdBG2y7NqkujZTFRlOY6IXAOOZCEO/2/VDtAfADw2cqflVyn8ln39kLkCagKG8p1
         bb20so5mti1+87ctzEXstVroIlDmSNSSkxU+GgR4C2C8pdNcZoPIr8cvEYdItNol6bxe
         /gCD5GV5/AY6P9ywOt3SmFna+BLjsmEvFQxqLYcQ7/krN0VFch6ppPy/HiB0Y4A3vaob
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3v3kq/uSr8IRWzglaWNE2WhfN2DYcE7MjLRhE6SSfg=;
        b=c/3dtQv/3gdeSnSGNxH4kgPubQFgxWHLNhH0PcH0yU+D8GjBotpR7wzn5miEffSMYn
         i5sf3/dHDGRD6YwmzJI3Mw8TPjvv3szajugtwQenPgdd9WzcovpK+I185VG1AHo0PkEr
         yLyGfcfQSrpwSeWXWI43oyFRCZ8ulrgvrf8lmE4odqLSphv5Fl2RbKtqc5L1vw5F7v/4
         qiJ5hqWTsAqpBNLkSf23VzMGH/PgO9HiCNrVde9bUuyCAiOXr21RuLk/KyKfv6nxG5pS
         LyVnOamy8j63yR5Pazbp448r1FS10mBXdY78te+uTBQt2O73x0mbM/UAygMDHLw3+JUo
         wJmw==
X-Gm-Message-State: AOAM531T23er+bLelgQ9WYjWyoAjKCQHmqTrcVp/rZrm5/Yrfk9BLtRu
        lFTwpd4AcHhXw8FrHITNm+4=
X-Google-Smtp-Source: ABdhPJzGGNTYHprXhud0vfsPUk2SuQl7mI384bK7cP7gwwVrHRGKEm885cunEvH4kpWxSSBYBS+VhQ==
X-Received: by 2002:a17:906:ca4c:: with SMTP id jx12mr20531366ejb.155.1622570315299;
        Tue, 01 Jun 2021 10:58:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i2sm8477238edc.96.2021.06.01.10.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/12] memory: tegra: Unify drivers
Date:   Tue,  1 Jun 2021 19:59:40 +0200
Message-Id: <20210601175942.1920588-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra210 (and earlier) driver now supports all the functionality
that the Tegra186 (and later) driver does, so they can be unified.

Note that previously the Tegra186 (and later) driver could be unloaded,
even if that was perhaps not very useful. Older chips don't support that
yet, but once they do this code can be reenabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- remove commented-out code for partial driver removal support

 drivers/memory/tegra/Makefile   |   6 +-
 drivers/memory/tegra/mc.c       |   8 ++-
 drivers/memory/tegra/mc.h       |   8 +++
 drivers/memory/tegra/tegra186.c | 117 +++++++-------------------------
 include/soc/tegra/mc.h          |   1 +
 5 files changed, 45 insertions(+), 95 deletions(-)

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6c1a2ecc6628..1af0fefacdda 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -7,6 +7,8 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_114_SOC) += tegra114.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
@@ -15,7 +17,7 @@ obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
 obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
 obj-$(CONFIG_TEGRA210_EMC_TABLE) += tegra210-emc-table.o
 obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
-obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o tegra186-emc.o
-obj-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra186-emc.o
+obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-emc.o
+obj-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186-emc.o
 
 tegra210-emc-y := tegra210-emc-core.o tegra210-emc-cc-r21021.o
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 7ae3d8faae38..f28c41cb0ba7 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -39,7 +39,13 @@ static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_210_SOC
 	{ .compatible = "nvidia,tegra210-mc", .data = &tegra210_mc_soc },
 #endif
-	{ }
+#ifdef CONFIG_ARCH_TEGRA_186_SOC
+	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
+#endif
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+	{ .compatible = "nvidia,tegra194-mc", .data = &tegra194_mc_soc },
+#endif
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index cff8479e9d90..154c078b4360 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -129,6 +129,14 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
 extern const struct tegra_mc_soc tegra210_mc_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_186_SOC
+extern const struct tegra_mc_soc tegra186_mc_soc;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_194_SOC
+extern const struct tegra_mc_soc tegra194_mc_soc;
+#endif
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 9d3fdb609d55..20efbbea587b 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -45,6 +45,24 @@ static void tegra186_mc_program_sid(struct tegra_mc *mc)
 	}
 }
 
+static int tegra186_mc_probe(struct tegra_mc *mc)
+{
+	int err;
+
+	err = of_platform_populate(mc->dev->of_node, NULL, NULL, mc->dev);
+	if (err < 0)
+		return err;
+
+	tegra186_mc_program_sid(mc);
+
+	return 0;
+}
+
+static void tegra186_mc_remove(struct tegra_mc *mc)
+{
+	of_platform_depopulate(mc->dev);
+}
+
 static int tegra186_mc_resume(struct tegra_mc *mc)
 {
 	tegra186_mc_program_sid(mc);
@@ -53,6 +71,8 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 }
 
 static const struct tegra_mc_ops tegra186_mc_ops = {
+	.probe = tegra186_mc_probe,
+	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 };
 
@@ -709,9 +729,10 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 	},
 };
 
-static const struct tegra_mc_soc tegra186_mc_soc = {
+const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
+	.num_address_bits = 40,
 	.ops = &tegra186_mc_ops,
 };
 #endif
@@ -1918,98 +1939,10 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 	},
 };
 
-static const struct tegra_mc_soc tegra194_mc_soc = {
+const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
+	.num_address_bits = 40,
 	.ops = &tegra186_mc_ops,
 };
 #endif
-
-static int tegra186_mc_probe(struct platform_device *pdev)
-{
-	struct resource *res;
-	struct tegra_mc *mc;
-	int err;
-
-	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
-	if (!mc)
-		return -ENOMEM;
-
-	mc->soc = of_device_get_match_data(&pdev->dev);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mc->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(mc->regs))
-		return PTR_ERR(mc->regs);
-
-	mc->dev = &pdev->dev;
-
-	err = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (err < 0)
-		return err;
-
-	platform_set_drvdata(pdev, mc);
-	tegra186_mc_program_sid(mc);
-
-	return 0;
-}
-
-static int tegra186_mc_remove(struct platform_device *pdev)
-{
-	struct tegra_mc *mc = platform_get_drvdata(pdev);
-
-	of_platform_depopulate(mc->dev);
-
-	return 0;
-}
-
-static const struct of_device_id tegra186_mc_of_match[] = {
-#if defined(CONFIG_ARCH_TEGRA_186_SOC)
-	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
-#endif
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
-	{ .compatible = "nvidia,tegra194-mc", .data = &tegra194_mc_soc },
-#endif
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-
-static int __maybe_unused tegra_mc_suspend(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->suspend)
-		return mc->soc->ops->suspend(mc);
-
-	return 0;
-}
-
-static int __maybe_unused tegra_mc_resume(struct device *dev)
-{
-	struct tegra_mc *mc = dev_get_drvdata(dev);
-
-	if (mc->soc->ops && mc->soc->ops->resume)
-		return mc->soc->ops->resume(mc);
-
-	return 0;
-}
-
-static const struct dev_pm_ops tegra186_mc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
-};
-
-static struct platform_driver tegra186_mc_driver = {
-	.driver = {
-		.name = "tegra186-mc",
-		.of_match_table = tegra186_mc_of_match,
-		.pm = &tegra186_mc_pm_ops,
-		.suppress_bind_attrs = true,
-	},
-	.probe = tegra186_mc_probe,
-	.remove = tegra186_mc_remove,
-};
-module_platform_driver(tegra186_mc_driver);
-
-MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
-MODULE_DESCRIPTION("NVIDIA Tegra186 Memory Controller driver");
-MODULE_LICENSE("GPL v2");
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 87668ebab2a1..1bd5aed81868 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -176,6 +176,7 @@ struct tegra_mc_ops {
 	 * after basic, common set up that is done by the SoC-agnostic bits.
 	 */
 	int (*probe)(struct tegra_mc *mc);
+	void (*remove)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 	irqreturn_t (*handle_irq)(int irq, void *data);
-- 
2.31.1

