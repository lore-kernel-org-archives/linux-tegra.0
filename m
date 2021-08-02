Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D99C43214
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A573961029
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhHBWOB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbhHBWOB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 18:14:01 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4FFC06175F;
        Mon,  2 Aug 2021 15:13:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m9so25781171ljp.7;
        Mon, 02 Aug 2021 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWDQ/oQ+F5/HwJrzhjalYg0o564TWde1kW73fPkVwC0=;
        b=gGkrPaQ/wwaRu30EMPrNYwugGzY1BcFEoObvHmna8ZrNWqIrQcngOpxxh7nO4chSSo
         hjgyZ+vg3gT+NusZzgntC1TVl6RtzmaTPjHFnSFZICnOV68OcjwSglaGerqws3B1uOLT
         3RgA8mLi21kexfNK0rcgY0p9tpNoRuJHG3OR7R/iUjvX1eYBCEf1DzxATyPMyHg9+38y
         3qAylUN4rMoYSKx7ezU3u5vSxsKpADY4Pom8AuDGSqFBZSZPH0j4wR1nKyCsT1+JwNR+
         NKa0eChOCiGaIXw883huy38YOp8fVYA7ebW1vhOZGYNm3PF2EYi8EGJXOony48oHS8vF
         29FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWDQ/oQ+F5/HwJrzhjalYg0o564TWde1kW73fPkVwC0=;
        b=mufkxXKeTjnnEZWPnqbfyC2XCGwjgxPvUmGB0LIImMBKO9NngMI+I6E795Z/IDdf61
         z8ur8y2TpYeiKJ5ify3ijisyIaPn0PfilpMr528Hls47obO0BMr7rvlTerwzSUquxOe9
         qWkWi4GZ7LZipRIzv4me3L3Jv+q4xSGffFAPtGNaUzkMIBrmi+Up6MYlBCYinczPiCic
         zVNvA6/uVrES1xmhdR3pDL/MlnRrcwsLvFJkuADHTG9lREk8ENQQJvOgvLnKnPWSadxa
         pcdE9Y7fnZGj9oJPCrC3uiu4CkiPrTh104LdRViqPc1a5oexyat9NiB9lZTnsG8RzVeH
         K7Rg==
X-Gm-Message-State: AOAM532kZhK1ajv+kIS1caI0NqOPGziDW22EizQBQ6gCne820CLj1Fkv
        qnYQkjz465x19Bl0dhO36JQ=
X-Google-Smtp-Source: ABdhPJz/1/unfd12b3K26oPUeLacBTM0qTmWvXbIqHFlDGZwIFjp1KCQVkhXP4HHL6lFlIiSgo/Xpg==
X-Received: by 2002:a05:651c:906:: with SMTP id e6mr12212506ljq.160.1627942429230;
        Mon, 02 Aug 2021 15:13:49 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id c10sm960167ljn.11.2021.08.02.15.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:13:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] soc/tegra: fuse: Add runtime PM support
Date:   Tue,  3 Aug 2021 01:13:34 +0300
Message-Id: <20210802221336.32016-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802221336.32016-1-digetx@gmail.com>
References: <20210802221336.32016-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra FUSE belongs to the core power domain and we're going to enable
GENPD support for the core domain. Now FUSE device must be resumed using
runtime PM API in order to initialize the FUSE power state. Add runtime PM
support to the FUSE driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c   | 30 +++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse-tegra20.c | 10 +++++----
 drivers/soc/tegra/fuse/fuse-tegra30.c |  9 ++++----
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 2434c570b53c..747237865aff 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 
@@ -210,6 +211,8 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fuse);
 	fuse->dev = &pdev->dev;
 
+	pm_runtime_enable(&pdev->dev);
+
 	if (fuse->soc->probe) {
 		err = fuse->soc->probe(fuse);
 		if (err < 0)
@@ -248,13 +251,40 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 restore:
 	fuse->clk = NULL;
 	fuse->base = base;
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
+static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
+{
+	int err;
+
+	err = clk_prepare_enable(fuse->clk);
+	if (err < 0) {
+		dev_err(dev, "failed to enable FUSE clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
+{
+	clk_disable_unprepare(fuse->clk);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_fuse_pm = {
+	SET_RUNTIME_PM_OPS(tegra_fuse_runtime_suspend, tegra_fuse_runtime_resume,
+			   NULL)
+};
+
 static struct platform_driver tegra_fuse_driver = {
 	.driver = {
 		.name = "tegra-fuse",
 		.of_match_table = tegra_fuse_match,
+		.pm = &tegra_fuse_pm,
 		.suppress_bind_attrs = true,
 	},
 	.probe = tegra_fuse_probe,
diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 16aaa28573ac..cd6a273707fe 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -16,6 +16,7 @@
 #include <linux/kobject.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/random.h>
 
 #include <soc/tegra/fuse.h>
@@ -46,6 +47,10 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	u32 value = 0;
 	int err;
 
+	err = pm_runtime_resume_and_get(fuse->dev);
+	if (err)
+		return err;
+
 	mutex_lock(&fuse->apbdma.lock);
 
 	fuse->apbdma.config.src_addr = fuse->phys + FUSE_BEGIN + offset;
@@ -66,8 +71,6 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 
 	reinit_completion(&fuse->apbdma.wait);
 
-	clk_prepare_enable(fuse->clk);
-
 	dmaengine_submit(dma_desc);
 	dma_async_issue_pending(fuse->apbdma.chan);
 	time_left = wait_for_completion_timeout(&fuse->apbdma.wait,
@@ -78,10 +81,9 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	else
 		value = *fuse->apbdma.virt;
 
-	clk_disable_unprepare(fuse->clk);
-
 out:
 	mutex_unlock(&fuse->apbdma.lock);
+	pm_runtime_put(fuse->dev);
 	return value;
 }
 
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index c1aa7815bd6e..dd03565a39a4 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/random.h>
 
 #include <soc/tegra/fuse.h>
@@ -52,15 +53,13 @@ static u32 tegra30_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	u32 value;
 	int err;
 
-	err = clk_prepare_enable(fuse->clk);
-	if (err < 0) {
-		dev_err(fuse->dev, "failed to enable FUSE clock: %d\n", err);
+	err = pm_runtime_resume_and_get(fuse->dev);
+	if (err)
 		return 0;
-	}
 
 	value = readl_relaxed(fuse->base + FUSE_BEGIN + offset);
 
-	clk_disable_unprepare(fuse->clk);
+	pm_runtime_put(fuse->dev);
 
 	return value;
 }
-- 
2.32.0

