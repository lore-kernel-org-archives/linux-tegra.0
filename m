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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAC8C47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECA4D613BD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhFASAF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFASAE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:04 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD408C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o5so18526957edc.5
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLUwMZ8cXW+ZV2O4K6QW5w4GpTfuO7LtA/jzPMmwU9s=;
        b=hJOAqReB8FfgB1TRlVAodrpFCvMlqt6Iex0TdBim/D/iA2V9D5e+v1dKdt0SKUJc1D
         lSfhIhNZmkX/xwQJWHpbDrNiij+nwBcGPgrRrgwZz2J0ssZDsgHz1kG72/lFlo/mpBvw
         5OTeUz9DX8vgdHpO+s1oQsBAoRK4O6DckR4LWHTYHsL/v6gFxJIHmHhxDVqq/rIdhiE1
         N7iUXMaHR9ewT/2aIqzZ9G+Dyez84Jmf2LbeM1s6VLNryCXW4ZwchjdLi98og6bZkoUv
         yj1YnANwxj2/wxkqebREC1K79VfgTPkNhak1gHxEOafPJeA9FV3V7+BUr/2ZI+Q3zQky
         35kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLUwMZ8cXW+ZV2O4K6QW5w4GpTfuO7LtA/jzPMmwU9s=;
        b=lRZv4+kwzvKmqcn9E8fDvCRiZa05HlEOZ6TcKjibOQKNNK8o6smd4AGNOXm9Z5msaf
         pTSnRpQ2yMj7hUlhfg6avN7UU5cxbAaPaFimv9M/dZ9eBwGlyIBkkRNpTiP7dDALvzEw
         EZ5zIxeyIia9Ta4/yKHsMG7pf6D+BcvAf+s5YoZtS/zaXGqKUr54+WijXdrK7XXkBsaP
         BXiFd6G69eCrrxoT7XPsfY+zQIdG8mfAyl301BXozp1/YlgVtNobLK39YnhmRT1HBEKo
         ksemM630lvcaYW/SnaweV/c9j7fwuumB0l5u4yWfSt0nuLZZKsVdGrMwnFWTs8H3CvSZ
         2Ljw==
X-Gm-Message-State: AOAM532e4A1XV8UZf5Sye662y8kpCaQoVp9Xs5bq4O6zicPwOLkig+8/
        h4nQXldgpsZO6fzYIB1xPEs=
X-Google-Smtp-Source: ABdhPJw3cc+g2zdKPxMWIrc7cyytj4noF4TSqAU6vLGqLE+/rPsNDiAYSBqVT+fCQYfl7KymZ220DA==
X-Received: by 2002:aa7:da94:: with SMTP id q20mr32817336eds.316.1622570300423;
        Tue, 01 Jun 2021 10:58:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v23sm935333eds.25.2021.06.01.10.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/12] memory: tegra: Push suspend/resume into SoC drivers
Date:   Tue,  1 Jun 2021 19:59:34 +0200
Message-Id: <20210601175942.1920588-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Continuing the scheme of unification, push suspend/resume callbacks into
per-SoC driver so that they can be properly parameterized.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- split ->init callback hunk into separate patch (Krzysztof)
- use SET_SYSTEM_SLEEP_PM_OPS (Dmitry)

 drivers/memory/tegra/mc.c       | 23 +++++++----------------
 drivers/memory/tegra/tegra186.c | 27 +++++++++++++++++++++++----
 drivers/memory/tegra/tegra20.c  | 28 ++++++++++++++++++++++++++++
 include/soc/tegra/mc.h          |  2 ++
 4 files changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 559ae1ef5633..a3b7ba33b7f9 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -867,37 +867,28 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_mc_suspend(struct device *dev)
+static int __maybe_unused tegra_mc_suspend(struct device *dev)
 {
 	struct tegra_mc *mc = dev_get_drvdata(dev);
-	int err;
 
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
-		err = tegra_gart_suspend(mc->gart);
-		if (err)
-			return err;
-	}
+	if (mc->soc->ops && mc->soc->ops->suspend)
+		return mc->soc->ops->suspend(mc);
 
 	return 0;
 }
 
-static int tegra_mc_resume(struct device *dev)
+static int __maybe_unused tegra_mc_resume(struct device *dev)
 {
 	struct tegra_mc *mc = dev_get_drvdata(dev);
-	int err;
 
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
-		err = tegra_gart_resume(mc->gart);
-		if (err)
-			return err;
-	}
+	if (mc->soc->ops && mc->soc->ops->resume)
+		return mc->soc->ops->resume(mc);
 
 	return 0;
 }
 
 static const struct dev_pm_ops tegra_mc_pm_ops = {
-	.suspend = tegra_mc_suspend,
-	.resume = tegra_mc_resume,
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
 };
 
 static struct platform_driver tegra_mc_driver = {
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 8e77567d1378..9d3fdb609d55 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -45,6 +45,17 @@ static void tegra186_mc_program_sid(struct tegra_mc *mc)
 	}
 }
 
+static int tegra186_mc_resume(struct tegra_mc *mc)
+{
+	tegra186_mc_program_sid(mc);
+
+	return 0;
+}
+
+static const struct tegra_mc_ops tegra186_mc_ops = {
+	.resume = tegra186_mc_resume,
+};
+
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 static const struct tegra_mc_client tegra186_mc_clients[] = {
 	{
@@ -701,6 +712,7 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 static const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
+	.ops = &tegra186_mc_ops,
 };
 #endif
 
@@ -1909,6 +1921,7 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 static const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
+	.ops = &tegra186_mc_ops,
 };
 #endif
 
@@ -1961,22 +1974,28 @@ static const struct of_device_id tegra186_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
 
-static int __maybe_unused tegra186_mc_suspend(struct device *dev)
+static int __maybe_unused tegra_mc_suspend(struct device *dev)
 {
+	struct tegra_mc *mc = dev_get_drvdata(dev);
+
+	if (mc->soc->ops && mc->soc->ops->suspend)
+		return mc->soc->ops->suspend(mc);
+
 	return 0;
 }
 
-static int __maybe_unused tegra186_mc_resume(struct device *dev)
+static int __maybe_unused tegra_mc_resume(struct device *dev)
 {
 	struct tegra_mc *mc = dev_get_drvdata(dev);
 
-	tegra186_mc_program_sid(mc);
+	if (mc->soc->ops && mc->soc->ops->resume)
+		return mc->soc->ops->resume(mc);
 
 	return 0;
 }
 
 static const struct dev_pm_ops tegra186_mc_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra186_mc_suspend, tegra186_mc_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
 };
 
 static struct platform_driver tegra186_mc_driver = {
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 3b7b93b96480..a3335ad20f4d 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -687,8 +687,36 @@ static int tegra20_mc_init(struct tegra_mc *mc)
 	return 0;
 }
 
+static int tegra20_mc_suspend(struct tegra_mc *mc)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
+		err = tegra_gart_suspend(mc->gart);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tegra20_mc_resume(struct tegra_mc *mc)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_GART) && mc->gart) {
+		err = tegra_gart_resume(mc->gart);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.init = tegra20_mc_init,
+	.suspend = tegra20_mc_suspend,
+	.resume = tegra20_mc_resume,
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 4f88da907a02..7c49f75087c3 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -171,6 +171,8 @@ struct tegra_mc_icc_ops {
 
 struct tegra_mc_ops {
 	int (*init)(struct tegra_mc *mc);
+	int (*suspend)(struct tegra_mc *mc);
+	int (*resume)(struct tegra_mc *mc);
 };
 
 struct tegra_mc_soc {
-- 
2.31.1

