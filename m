Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECDEC4727F
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92CF9208A9
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdQNx36G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIZIMc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 04:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbgIZIMc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 04:12:32 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193C9C0613D4;
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s31so102390pga.7;
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vtniy9MQG8g1im7mkourJLoiK6EQaD/OMzZkrwUt7dQ=;
        b=FdQNx36G+PK+XfB5nyM1LE61yYlJaxKqsifAeu182MYWA6ILLnylD2ZiMvaARw7/kZ
         Ugszx8LP0sZJvU69wy0XfbxKUlB/YtLymTg3wLqlROs3LXYgIiTy9Bl4a2XFHUEtbRd9
         ulcnbkLiwWU0KjRfgyHi/CCAZEjpm2lcQN8PfFu/T53+0Tn8l+AieETDqJgpijBY86o3
         jgMYmwwNXMiIEQj4+m8y1FMF6DHAzy2oxHqtdWzza5bT4pVaVSX18o/jJ1FiqaXODCGW
         xZoRtNmxOWOeWfb+kj0AOU2AjzUx+rmYP1M9eYqio4EbK4fsCq5nePwsNaoR0gguzMce
         qtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vtniy9MQG8g1im7mkourJLoiK6EQaD/OMzZkrwUt7dQ=;
        b=Ccehnl/GjIKaZtBNYpUJOPz5JTg3MfO6G8oVSBHSP5PBlQ3LMoNF/wTAFbdIly6G70
         hbM0AxQnts+un9HGOaZBdiPcK+pppW7T1GOCI3ad89DPfvwSZj1CMFgOo1XNrSZX4yOM
         KewnMR/+OW3HTriC5549+h5kH6M/akWoLCxxY7k7AQnLUvHtOYGnWWrg6UOq49BsS9Q3
         diexjXee8uAIJXIm3W+YnYPH5lVoxHOLr/BScPhq78uCcNTUHQsIJQEMTPrLd5XemUEp
         rsUS5F0QReXuXrb+ah38JW/4VGGmLThCzmEi4IBun+MriGIEO23CJIP4orXInwivlibG
         RZBg==
X-Gm-Message-State: AOAM533d11SK4Qt4qiVo3ztfn0tSFtou/GdECnwr6Ya1EJ64yJk0RRC8
        fQO0hYjP7q5/Sx7RSuAJ1MA=
X-Google-Smtp-Source: ABdhPJyvQ9D8aHndKyDkTNn0uJ8eoLdkPzJs+t7e+SGLOnDf2uS7EUHnHg7M8JXlkqpdJtvMiiz3Aw==
X-Received: by 2002:a63:500e:: with SMTP id e14mr2098853pgb.36.1601107951569;
        Sat, 26 Sep 2020 01:12:31 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 01:12:31 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in .probe_/.attach_device()
Date:   Sat, 26 Sep 2020 01:07:17 -0700
Message-Id: <20200926080719.6822-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_smmu_probe_device() function searches in DT for the iommu
phandler to get "smmu" pointer. This works for most of SMMU clients
that exist in the DTB. But a PCI device will not be added to iommu,
since it doesn't have a DT node.

Fortunately, for a client with a DT node, tegra_smmu_probe_device()
calls tegra_smmu_of_xlate() via tegra_smmu_configure(), while for a
PCI device, of_pci_iommu_init() in the IOMMU core calls .of_xlate()
as well, even before running tegra_smmu_probe_device(). And in both
cases, tegra_smmu_of_xlate() prepares a valid iommu_fwspec pointer
that allows us to get the mc->smmu pointer via dev_get_drvdata() by
calling driver_find_device_by_fwnode().

So this patch uses iommu_fwspec in .probe_device() and related code
for a client that does not exist in the DTB, especially a PCI one.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 89 +++++++++++++++++++++++---------------
 drivers/memory/tegra/mc.c  |  2 +-
 include/soc/tegra/mc.h     |  2 +
 3 files changed, 56 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index b10e02073610..97a7185b4578 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 
 #include <soc/tegra/ahb.h>
@@ -61,6 +62,8 @@ struct tegra_smmu_as {
 	u32 attr;
 };
 
+static const struct iommu_ops tegra_smmu_ops;
+
 static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
 {
 	return container_of(dom, struct tegra_smmu_as, domain);
@@ -484,60 +487,49 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-	int err = 0;
-
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
+	int index, err = 0;
 
-		of_node_put(args.np);
+	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
+		return -ENOENT;
 
+	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
-		if (err < 0)
-			return err;
+		if (err)
+			goto err_disable;
 
-		tegra_smmu_enable(smmu, swgroup, as->id);
-		index++;
+		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
 	if (index == 0)
 		return -ENODEV;
 
 	return 0;
+
+err_disable:
+	for (index--; index >= 0; index--) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
+		tegra_smmu_as_unprepare(smmu, as);
+	}
+
+	return err;
 }
 
 static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = as->smmu;
-	struct of_phandle_args args;
 	unsigned int index = 0;
 
-	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					   &args)) {
-		unsigned int swgroup = args.args[0];
-
-		if (args.np != smmu->dev->of_node) {
-			of_node_put(args.np);
-			continue;
-		}
-
-		of_node_put(args.np);
+	if (!fwspec || fwspec->ops != &tegra_smmu_ops)
+		return;
 
-		tegra_smmu_disable(smmu, swgroup, as->id);
+	for (index = 0; index < fwspec->num_ids; index++) {
+		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
-		index++;
 	}
 }
 
@@ -845,10 +837,25 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
 	return 0;
 }
 
+static struct tegra_smmu *tegra_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev = driver_find_device_by_fwnode(&tegra_mc_driver.driver, fwnode);
+	struct tegra_mc *mc;
+
+	if (!dev)
+		return NULL;
+
+	put_device(dev);
+	mc = dev_get_drvdata(dev);
+
+	return mc->smmu;
+}
+
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = NULL;
+	struct iommu_fwspec *fwspec;
 	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err;
@@ -868,8 +875,6 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 			 * supported by the Linux kernel, so abort after the
 			 * first match.
 			 */
-			dev_iommu_priv_set(dev, smmu);
-
 			break;
 		}
 
@@ -877,8 +882,20 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 		index++;
 	}
 
-	if (!smmu)
-		return ERR_PTR(-ENODEV);
+	/* Any device should be able to get smmu pointer using fwspec */
+	if (!smmu) {
+		fwspec = dev_iommu_fwspec_get(dev);
+		if (!fwspec || fwspec->ops != &tegra_smmu_ops)
+			return ERR_PTR(-ENODEV);
+
+		smmu = tegra_smmu_get_by_fwnode(fwspec->iommu_fwnode);
+	}
+
+	/* NULL smmu pointer means that SMMU driver is not probed yet */
+	if (unlikely(!smmu))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	dev_iommu_priv_set(dev, smmu);
 
 	return &smmu->iommu;
 }
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..4e23fd8d8433 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -735,7 +735,7 @@ static const struct dev_pm_ops tegra_mc_pm_ops = {
 	.resume = tegra_mc_resume,
 };
 
-static struct platform_driver tegra_mc_driver = {
+struct platform_driver tegra_mc_driver = {
 	.driver = {
 		.name = "tegra-mc",
 		.of_match_table = tegra_mc_of_match,
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..49a4cf64c4b9 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -184,4 +184,6 @@ struct tegra_mc {
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
+extern struct platform_driver tegra_mc_driver;
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

