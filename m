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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4239EC47092
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A04A6195D
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhFBQdZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFBQdZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:33:25 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18866C061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 09:31:42 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id c10so4714832eja.11
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8NN+TALDvwE5yh3o3XqidnPVUfejMnnEQTWZAWw/3tY=;
        b=TAGnvEx9aPti0cHL0flhPSm88tOMJPG5DHgGo0uu2RsZlujOe8Hl2qo9eJIxLOZ6mj
         jf216gg/+wa5ExQtfwQ5DBp2NDsCtttIJRP3B8HewTwsd/8BVPvvvoixWwUmQJ51jjoJ
         Zys3m3N0d5UBtu3PUf+77ZMEBNRqWXtz0Cg/CBATDan14vmviHpTTnnX7/ZZpZE9bjD9
         Db4nSk+rmjn9BBg+zTSUFPCVHytwEWYj4iFV38YuKD2tR6ig/xrHMGrdXjHMSjcwc9CB
         c8G9gB50QzWHADLj5M9rBcCbjzOTqR9BbySR4+/jrC/Cc/M/xDoki/4TKYOiWz657bQW
         3R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8NN+TALDvwE5yh3o3XqidnPVUfejMnnEQTWZAWw/3tY=;
        b=AU3tWNejA1YzWxZ2VfYLkG9Mw+Oaiqo6+X8fdoa/QXNs87XP6PlNTgnLlGY4EaMnOG
         K+yiqHiJC0SH1PL3rtJyibdhCPNytjI25q3wvunZ27tEhL6xx3/SucsqXfdDUizxeB3S
         FAgl2SqP95x6tFmxnUKDumIzl1MLzTgj3PtgUKO0vBaSx5IVJjcWBHjH5ZroaqTp9ONO
         8KL9N8hmpe9UnOL1S5KCI9kg4kloLcUGKfCrQlM8MzoCU7ZB15seO38lzobMtg2J1wJa
         EVnWenAkAWiPABblD42Pzj/ng3T/8+hPSv5qJAfzwpjNqwd+PR9gUhxkzBv8UwI2KBgg
         TY8Q==
X-Gm-Message-State: AOAM531iZxn2eLbrkEbxNx499EKFmoRKdAOkvFDNe4UfEgHL78dlQAaR
        fBSFZNWdpfc7Yu2uV7YCKkY=
X-Google-Smtp-Source: ABdhPJwn2nIv+UtVVIsykXrsTzfP4KeySqVPaKwG5yRgbV3V5sceyVLkPRGcW0bjSYImHQMx9b6RdA==
X-Received: by 2002:a17:906:6981:: with SMTP id i1mr34836728ejr.289.1622651500724;
        Wed, 02 Jun 2021 09:31:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r4sm234717ejd.105.2021.06.02.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 05/12] memory: tegra: Make per-SoC setup more generic
Date:   Wed,  2 Jun 2021 18:32:55 +0200
Message-Id: <20210602163302.120041-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The current per-SoC setup code runs at a fairly arbitrary point during
probe, thereby making it less flexible for other SoC generations. Move
the call around slightly (after only the very basic, common setup that
applies to all SoC generations has been performed), which will allow
it to be used for other implementations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add kerneldoc comment to clarify when the per-SoC ->probe() is called
- clarify this in the commit message as well

 drivers/memory/tegra/mc.c      | 17 ++++++++---------
 drivers/memory/tegra/tegra20.c |  4 ++--
 include/soc/tegra/mc.h         |  6 +++++-
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index a3b7ba33b7f9..ea2142ba720a 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -784,6 +784,14 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return PTR_ERR(mc->clk);
 	}
 
+	mc->debugfs.root = debugfs_create_dir("mc", NULL);
+
+	if (mc->soc->ops && mc->soc->ops->probe) {
+		err = mc->soc->ops->probe(mc);
+		if (err < 0)
+			return err;
+	}
+
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	if (mc->soc == &tegra20_mc_soc) {
 		isr = tegra20_mc_irq;
@@ -827,15 +835,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	mc->debugfs.root = debugfs_create_dir("mc", NULL);
-
-	if (mc->soc->ops && mc->soc->ops->init) {
-		err = mc->soc->ops->init(mc);
-		if (err < 0)
-			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
-				err);
-	}
-
 	err = tegra_mc_reset_setup(mc);
 	if (err < 0)
 		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a3335ad20f4d..2c86c0d70d59 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -679,7 +679,7 @@ static int tegra20_mc_stats_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int tegra20_mc_init(struct tegra_mc *mc)
+static int tegra20_mc_probe(struct tegra_mc *mc)
 {
 	debugfs_create_devm_seqfile(mc->dev, "stats", mc->debugfs.root,
 				    tegra20_mc_stats_show);
@@ -714,7 +714,7 @@ static int tegra20_mc_resume(struct tegra_mc *mc)
 }
 
 static const struct tegra_mc_ops tegra20_mc_ops = {
-	.init = tegra20_mc_init,
+	.probe = tegra20_mc_probe,
 	.suspend = tegra20_mc_suspend,
 	.resume = tegra20_mc_resume,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 7c49f75087c3..00d16c356db8 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -170,7 +170,11 @@ struct tegra_mc_icc_ops {
 };
 
 struct tegra_mc_ops {
-	int (*init)(struct tegra_mc *mc);
+	/*
+	 * @probe: Callback to set up SoC-specific bits of the memory controller. This is called
+	 * after basic, common set up that is done by the SoC-agnostic bits.
+	 */
+	int (*probe)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 };
-- 
2.31.1

