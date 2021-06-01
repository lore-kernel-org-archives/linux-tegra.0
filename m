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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0153FC47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEA6B6023E
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhFASAG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFASAG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7910C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id df21so18489061edb.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8NN+TALDvwE5yh3o3XqidnPVUfejMnnEQTWZAWw/3tY=;
        b=Pamp4Obxnic+gJj1sGqJLMCM24zp5tA7UCFNs9WUURUUzHN/kz5F2SfA8AW5V1mEUG
         yQeQ0u+VpBuSnUJKK/RF0H8kT7HOyR3yala5Z14TgEGOXNV3n4KKJ42tJUrDDLAu1Izj
         EIxNI42Doa2W1DB10xVDGUaDRGpmAMcOPJTD0A0fT5yK1EWPRT4v71bvyKRjgNqvjPQY
         WS/YV3CVP8WytcNt1PW4USbOMWS9XLPP3IJI4NTNX94/Rew4LhhJOMELVYOahU/SIHUz
         dOOfx+dXDeMLNqGupVdiLx38HB3YcT4Jh8kbAfGOV7GeueWl0h3iihAMYEsows12WMzF
         qTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8NN+TALDvwE5yh3o3XqidnPVUfejMnnEQTWZAWw/3tY=;
        b=N/TZEEfZ4uj1usqX3jiI3QZqUoV7zJbNUBr0oSLPMUPLRR84QmrstlpWjIvzxO8WSg
         gGjYkL5BGJewhXIhdKmNHiqU/P1ZkNDNeQy1/DmNMJHpWx5evFKms1dBeWM5aIXg5v+s
         6FoYURH5NbHOZgubpRE2dn71t0ZwNTli44jtBhy1PP0b55aay5IKTUFOhNf5hya9YERL
         IcnpmTLTNTXuyt+DXHe3LCDiVAfOFNVrMfzjytJmOdJtaGV2rufG5jFI+7AHQzFDvE1M
         L/VjeAnqBPiCtvNRE3vNslNLnl/BIuV38Z5mN9q14TqZKOE7+tNVHcPJhWfOFHDYVUi4
         lmVQ==
X-Gm-Message-State: AOAM532YPcwWWR89fF+YICBMRiST8sHZs5eYEJjbD5U/QIEgyeGVVXeN
        tvcMYpVk1ruVUh/8sR6AY+M=
X-Google-Smtp-Source: ABdhPJyqtmYr3VUv4afBK6eULdpaJqCDD/i5MlZ0hyan+Ufclwjg+ESQVVJGKNRKtH2DfTZ/TiFSow==
X-Received: by 2002:aa7:d853:: with SMTP id f19mr34207054eds.371.1622570302600;
        Tue, 01 Jun 2021 10:58:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d24sm3352294edp.7.2021.06.01.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/12] memory: tegra: Make per-SoC setup more generic
Date:   Tue,  1 Jun 2021 19:59:35 +0200
Message-Id: <20210601175942.1920588-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
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

