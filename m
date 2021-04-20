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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E6FC43460
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E3736100B
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 16:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbhDTQwe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbhDTQwd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 12:52:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7338C06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:01 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id d21so25833618edv.9
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M03SL9npGZDU/x0usc4t/49j6FN+y9XTrr7Dk0tnlbE=;
        b=HwOr2RncdX4y044MiKJ80qoXaN1X8RyhVENvlb8y1E5eDe8jxLJZSSdJTGoJmpkVWa
         XI7ihTZMJAH8yQeVnS1zavhOMbiUb+vvahSd0jEa/K4qgpKVuKfSnpC0c3xN7KhHzyiJ
         zM3+3mJXNLGM59FMN4b4Qn0Pbq0k6BYBNjCPFeLo1fplZLbm7/kE/+H8cN0JSGJHdJT+
         VXQKYYcHpcels5+MX3EA5BjGIQ1+0ZceTwabAaCDiU8T7Qscm13xt8DojNzQxT8NtkqF
         MhFjQHzMfAfx4PlBrJP88xjqGHnemrZGPjvIl4+kNMmHSpb135Jj53Okc0AtAdumqfF4
         VkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M03SL9npGZDU/x0usc4t/49j6FN+y9XTrr7Dk0tnlbE=;
        b=jnvx32VdOuXIK6mhR5XYBaBSx0YV9GXcizoaDQxr4AVqBJUqogyQ8zLfoD3TZ7M/vy
         AyPoGv6HI+T5ubUHNWkT5o208+PPkQu1wWTpN9SoDsCRhyWmB9c+Z3SA+OUQkR2pvhtV
         1ZVtYPVBolFZ6I8zQ0yDjJCoW1+z9aPD9Y+BGOYy/1h/xvH6+acj0hEnReAgoMgJkt6E
         F3nuX84jDVD+mAuWIcSze242cYZvnRJx+44vRfwDDm9QId2Z8ivgfTWLycs7pmXCXaLn
         ggJMi9qTHAB+uRG4RMIgUCyPvdkFB/SzUa2FHwjoSb9IY7HwYl8XgKJ77nIGT0xd8NWZ
         qT2A==
X-Gm-Message-State: AOAM5306LgVpfe7Ct3+Imc9KTGDSI8/X6Uz3gUgyUJ5rV8Rsmeu9eNG/
        mha4vLbNrwJBFM0SnzKrZx8=
X-Google-Smtp-Source: ABdhPJwjirjImFFCa4Qc5vbCQBPucWn8Y4E7U5+QI5IVJS/LYrkE/SCAhkWQ08bES6W0prYGpjNcPQ==
X-Received: by 2002:a50:f28e:: with SMTP id f14mr9886233edm.371.1618937520596;
        Tue, 20 Apr 2021 09:52:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bu20sm2004141ejb.76.2021.04.20.09.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:51:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/10] memory: tegra: Push suspend/resume into SoC drivers
Date:   Tue, 20 Apr 2021 18:52:31 +0200
Message-Id: <20210420165237.3523732-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Continuing the scheme of unification, push suspend/resume callbacks into
per-SoC driver so that they can be properly parameterized.

While at it, also move the ->init() callback into the new tegra_mc_ops
structure to keep things clean.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 24 ++++++++---------------
 drivers/memory/tegra/tegra186.c | 27 ++++++++++++++++++++++----
 drivers/memory/tegra/tegra20.c  | 34 ++++++++++++++++++++++++++++++++-
 include/soc/tegra/mc.h          |  9 +++++++--
 4 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index b7e104bf6614..2b21131d779c 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -829,8 +829,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	mc->debugfs.root = debugfs_create_dir("mc", NULL);
 
-	if (mc->soc->init) {
-		err = mc->soc->init(mc);
+	if (mc->soc->ops && mc->soc->ops->init) {
+		err = mc->soc->ops->init(mc);
 		if (err < 0)
 			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
 				err);
@@ -867,30 +867,22 @@ static int tegra_mc_probe(struct platform_device *pdev)
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
index 2db68a913b7a..a3335ad20f4d 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -687,6 +687,38 @@ static int tegra20_mc_init(struct tegra_mc *mc)
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
+static const struct tegra_mc_ops tegra20_mc_ops = {
+	.init = tegra20_mc_init,
+	.suspend = tegra20_mc_suspend,
+	.resume = tegra20_mc_resume,
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -698,5 +730,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.resets = tegra20_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
-	.init = tegra20_mc_init,
+	.ops = &tegra20_mc_ops,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 9da4ef52ce30..7c49f75087c3 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -169,6 +169,12 @@ struct tegra_mc_icc_ops {
 						void *data);
 };
 
+struct tegra_mc_ops {
+	int (*init)(struct tegra_mc *mc);
+	int (*suspend)(struct tegra_mc *mc);
+	int (*resume)(struct tegra_mc *mc);
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -190,8 +196,7 @@ struct tegra_mc_soc {
 	unsigned int num_resets;
 
 	const struct tegra_mc_icc_ops *icc_ops;
-
-	int (*init)(struct tegra_mc *mc);
+	const struct tegra_mc_ops *ops;
 };
 
 struct tegra_mc {
-- 
2.30.2

