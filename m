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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D26FC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F00560FE5
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhDTQwl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbhDTQwh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CEEC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l4so59269852ejc.10
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7kkMf0tzfVTQj9c0zvmMyyw/HA/qWiUBXAXvW4sV/Ng=;
        b=u1qEHuz9PpdCSAnk3K9sf2R9OoQv7U7j/tkHF9bJZPXaW5RywDQJOqXEpDOHz+Ml33
         9CjDbRUF6bVDP0XTv42XbBEGeYjsH46frvEIr8Il+bQmYoJJdrmnnBsHJWo3S2cZINfG
         U9LbLXsb5uysGpRZqnjMEBZSDCbaeihIQknCuOgYBrfqhFw/x4ZezUIHeUEtBHJ5sa9q
         2xwcyvtg1sDsWKAqvcvLJH8+HGnq8sn3hElRAdnVuRM10cKtNPR7POb3szy+EGyc+QCI
         myLythF5Z78mo/N9HF4fTmZPByBmprlmdD2pM8IpkbIoNaWF+rB/AsqZIORPnnObqzs7
         mRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7kkMf0tzfVTQj9c0zvmMyyw/HA/qWiUBXAXvW4sV/Ng=;
        b=WC5mnN7fmSG9tWyswhNg3ccnnPo2nLF3NNfkmJ+DU4i3xhbwoT3ThajSV59J0+3xTU
         kGPs0Pr47w7H0UDi/8iJLs4xfFEA7h2xCifHle4oEaciak02YX33ru9hjfIdUL80vQqQ
         e1MXYJg1/Pcbozrw+l0qcPcaKemClcMs2uK9UYCZ4Dkie2EieNunpzdvSE6+6JeBX/54
         2kAo7rqhurwMArD+Lq9hocpUZqXObrzBsAfPP/xH3EYJA14t7TFslX3IvwP28yP9TLuU
         dJgRbYo4My7jUNJxE410n4+oJcGgY5EeB/Mg3ptoe2a+1E1JC4VDVW6LSkFyTXD17aTI
         qPOg==
X-Gm-Message-State: AOAM530jGQeO743AX1HhNCQB0AZHaZ7ttaZbW7eTY52y56obArCbPzXa
        0pLhAay+yhxENoKabW3bKXU=
X-Google-Smtp-Source: ABdhPJyd/FvvglM0ppGZ57M+9mteR+3pHQp5FoPClf0njPn0PFZ7wM0eYGkOXC3y7Mr5EwP4AQ63Iw==
X-Received: by 2002:a17:906:9385:: with SMTP id l5mr28699143ejx.32.1618937523652;
        Tue, 20 Apr 2021 09:52:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d14sm9816519edc.11.2021.04.20.09.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:52:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/10] memory: tegra: Make per-SoC setup more generic
Date:   Tue, 20 Apr 2021 18:52:32 +0200
Message-Id: <20210420165237.3523732-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The current per-SoC setup code runs at a fairly arbitrary point during
probe, thereby making it less flexible for other SoC generations. Move
the call around slightly, which will allow it to be used for other
implementations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c      | 17 ++++++++---------
 drivers/memory/tegra/tegra20.c |  4 ++--
 include/soc/tegra/mc.h         |  2 +-
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 2b21131d779c..a800982f4a94 100644
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
index 7c49f75087c3..fd19df3eb529 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -170,7 +170,7 @@ struct tegra_mc_icc_ops {
 };
 
 struct tegra_mc_ops {
-	int (*init)(struct tegra_mc *mc);
+	int (*probe)(struct tegra_mc *mc);
 	int (*suspend)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
 };
-- 
2.30.2

