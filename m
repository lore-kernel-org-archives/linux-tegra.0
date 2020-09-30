Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBACC47420
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEBFB20738
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNnGOUGZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI3Isj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 04:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgI3Isg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 04:48:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AF6C061755;
        Wed, 30 Sep 2020 01:48:35 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 5so692844pgf.5;
        Wed, 30 Sep 2020 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iLw5ELAX+q+E1rzUi9gP7bU1W2lzUQwDoXoPLAOAlak=;
        b=JNnGOUGZV7PZBIj6KHv+yMLoQVCmr1vlVLiP9vTbcB6vqES2f+nsP/Hp0dxioVeskM
         FHUJXlK6D72Jn4TzqJIDeDKtEjwax7wFXsUJXnhkIeHr1fS6lbNJapNDLReWoPZw7Dcr
         eQrIDbRjQbOKmA1XHkhd1ZcAEQHrfyEddVSYU10YawoLpTPuFq2LARpFu0y9tzOJIo+K
         XwQK3UYnXMFePbppxeJ+lDx1Rzrjus6zK4A3ByD26Qlv0QEWe51sLLATNITmn1glYqVG
         yG8U3px+5afaNlUnvwGgI48jMq30MOw+2Eh/9i5C9ySl8/vymDNGQvpnge+llOQ6VEGg
         yN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iLw5ELAX+q+E1rzUi9gP7bU1W2lzUQwDoXoPLAOAlak=;
        b=kIFlBoKCV/zmIWq+nXUyp8nmgtOq6jbFuYvEkIHwHPDWX/uGZXVOe27GFLdJHitxjJ
         eBv8GqKMR72sf/If9pp5xrWhduJeL8546JFvyKJ1/+CAqqJ7pPRFdKuwdE/LwuehLW3m
         kqvTJobBIMiULVm3Zl41U0hBbvoijWE9q4oKAWwGuzOGxrQ+FqLiMpL/a03A8nlXm9eK
         v7GHWzOI6hRsUpEt/9Tt03Udh29Qe2w8G3nqeomthOaCShXEjsPnj+j964T+WvtTXIYs
         H8/yDGrfXfAonjxAX3dOnsiIZOmBgg29XsGvLpw0YSV0xJZq3yMyMHv6F3YkBuNbTUfF
         Zc1Q==
X-Gm-Message-State: AOAM531qJs8Sgs4N117ouARn+QuWfb6HZf4mo2cJ/W6nJdNYl36gzOAK
        9wzKPwEWazYrzrB8g3cQdNrE7eS751s=
X-Google-Smtp-Source: ABdhPJx0Gk4V8SBSFF3wo71cX6m0weomIeo1QRTBNnUcBDV+uYHbErkR1hGtbKZ2hUvKc3zgWaYBfA==
X-Received: by 2002:aa7:9f04:0:b029:13e:d13d:a13b with SMTP id g4-20020aa79f040000b029013ed13da13bmr1687485pfr.35.1601455714980;
        Wed, 30 Sep 2020 01:48:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d17sm1505830pfq.157.2020.09.30.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:48:34 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and .attach_dev
Date:   Wed, 30 Sep 2020 01:42:57 -0700
Message-Id: <20200930084258.25493-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930084258.25493-1-nicoleotsuka@gmail.com>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Previously the driver relies on bus_set_iommu() in .probe() to call
in .probe_device() function so each client can poll iommus property
in DTB to configure fwspec via tegra_smmu_configure(). According to
the comments in .probe(), this is a bit of a hack. And this doesn't
work for a client that doesn't exist in DTB, PCI device for example.

Actually when a device/client gets probed, the of_iommu_configure()
will call in .probe_device() function again, with a prepared fwspec
from of_iommu_configure() that reads the SWGROUP id in DTB as we do
in tegra-smmu driver.

Additionally, as a new helper devm_tegra_get_memory_controller() is
introduced, there's no need to poll the iommus property in order to
get mc->smmu pointers or SWGROUP id.

This patch reworks .probe_device() and .attach_dev() by doing:
1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
3) Calling devm_tegra_get_memory_controller() in .probe_device()
4) Also dropping the hack in .probe() that's no longer needed.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v2->v3
 * Used devm_tegra_get_memory_controller() to get mc pointer
 * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
v1->v2
 * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
   with tegra_get_memory_controller call.
 * Dropped the hack in tegra_smmu_probe().

 drivers/iommu/tegra-smmu.c | 144 ++++++++++---------------------------
 1 file changed, 36 insertions(+), 108 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6a3ecc334481..636dc3b89545 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -61,6 +61,8 @@ struct tegra_smmu_as {
 	u32 attr;
 };
 
+static const struct iommu_ops tegra_smmu_ops;
+
 static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
 {
 	return container_of(dom, struct tegra_smmu_as, domain);
@@ -484,60 +486,50 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err = 0;
 
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
+		return -ENOENT;
 
+	for (index = 0; index < fwspec->num_ids; index++) {
 		err = tegra_smmu_as_prepare(smmu, as);
-		if (err < 0)
-			return err;
+		if (err)
+			goto disable;
 
-		tegra_smmu_enable(smmu, swgroup, as->id);
-		index++;
+		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
 	if (index == 0)
 		return -ENODEV;
 
 	return 0;
+
+disable:
+	while (index--) {
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
 
@@ -807,80 +799,26 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
-static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
-{
-	struct platform_device *pdev;
-	struct tegra_mc *mc;
-
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return NULL;
-
-	mc = platform_get_drvdata(pdev);
-	if (!mc)
-		return NULL;
-
-	return mc->smmu;
-}
-
-static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
-				struct of_phandle_args *args)
-{
-	const struct iommu_ops *ops = smmu->iommu.ops;
-	int err;
-
-	err = iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
-	if (err < 0) {
-		dev_err(dev, "failed to initialize fwspec: %d\n", err);
-		return err;
-	}
-
-	err = ops->of_xlate(dev, args);
-	if (err < 0) {
-		dev_err(dev, "failed to parse SW group ID: %d\n", err);
-		iommu_fwspec_free(dev);
-		return err;
-	}
-
-	return 0;
-}
-
 static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
-	struct device_node *np = dev->of_node;
-	struct tegra_smmu *smmu = NULL;
-	struct of_phandle_args args;
-	unsigned int index = 0;
-	int err;
-
-	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
-					  &args) == 0) {
-		smmu = tegra_smmu_find(args.np);
-		if (smmu) {
-			err = tegra_smmu_configure(smmu, dev, &args);
-			of_node_put(args.np);
-
-			if (err < 0)
-				return ERR_PTR(err);
-
-			/*
-			 * Only a single IOMMU master interface is currently
-			 * supported by the Linux kernel, so abort after the
-			 * first match.
-			 */
-			dev_iommu_priv_set(dev, smmu);
-
-			break;
-		}
+	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 
-		of_node_put(args.np);
-		index++;
-	}
+	/* An invalid mc pointer means mc and smmu drivers are not ready */
+	if (IS_ERR(mc))
+		return ERR_PTR(-EPROBE_DEFER);
 
-	if (!smmu)
+	/*
+	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
+	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
+	 * call in again via of_iommu_configure when fwspec is prepared.
+	 */
+	if (!mc->smmu || !fwspec || fwspec->ops != &tegra_smmu_ops)
 		return ERR_PTR(-ENODEV);
 
-	return &smmu->iommu;
+	dev_iommu_priv_set(dev, mc->smmu);
+
+	return &mc->smmu->iommu;
 }
 
 static void tegra_smmu_release_device(struct device *dev)
@@ -1089,16 +1027,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	if (!smmu)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * This is a bit of a hack. Ideally we'd want to simply return this
-	 * value. However the IOMMU registration process will attempt to add
-	 * all devices to the IOMMU when bus_set_iommu() is called. In order
-	 * not to rely on global variables to track the IOMMU instance, we
-	 * set it here so that it can be looked up from the .probe_device()
-	 * callback via the IOMMU device's .drvdata field.
-	 */
-	mc->smmu = smmu;
-
 	size = BITS_TO_LONGS(soc->num_asids) * sizeof(long);
 
 	smmu->asids = devm_kzalloc(dev, size, GFP_KERNEL);
-- 
2.17.1

