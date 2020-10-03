Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22CEC41604
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D6C5206B8
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLlTLp40"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgJCHGE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 03:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCHGB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 03:06:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC67C0613D0;
        Sat,  3 Oct 2020 00:06:01 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e10so2454199pfj.1;
        Sat, 03 Oct 2020 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mA2zixD2/Z/VN3LYWv/vUu46e2rY++AbG390RaIxlUU=;
        b=kLlTLp40IXctO3NP0PSYMhXuGQuNps60W0eBr8oKvg9g7d+sdl2WBXPSN4DltrqGIV
         m3mSmnmssNbisgvc7EZaE+4Wooav6te1QpiCCu0PtAqi3d3eQeiHKHrMLbPU7i0m82VP
         1ZoXoyH4R1L8x3WMclQoqGnWjPF5M8f/s4juFDn8euuXcj3oCB0HrIl90GbJD2KKAxSs
         UFb7S1SBJJrfBsZV87f/elPXFpjaI1+WU+eDDt9cgVQmtHFrFYkUaDr2G56ogti9/4FO
         VFnEl4ed095D5mJDwptTsDplDg4/uA9xwjU983uR9qKUfCSD7mJRLSs75rFxkemM7yrF
         DfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mA2zixD2/Z/VN3LYWv/vUu46e2rY++AbG390RaIxlUU=;
        b=X+LwLFzlInJ81OJA0cRdzFoYu5KMvqxT996ILdF77sDgzqJcbNb6FGIF9VuQRCIgv0
         xEeZ3VTGQO6p29nPd/vov3DF/kxsGsI/WZP4t3CQTwNc2BLnSnp47dpeNwDjhVbJM5PV
         L8kHODKIjsxbUFzz9BP85HxUeWHtmQKa4WBgSnD8v45Yc8O97HbS/kIklri6vbC6L0oT
         T54dn3+4B0vXKNWY8TfZGrfqpdcj6rYM/RH4hPFMNoR05TkxemBEBEx6SZcxNF99RD+A
         uSWk5E7Cte2vV1roRWSRR+50JMEumYjirY2XtWa6FyqlZuFiD4IjG9luVtYHcvvqGAuo
         Hobw==
X-Gm-Message-State: AOAM53168KupNoTny8KVOoeGN10EnGV83A3e3UcbXbw/0L2Y2hA24tml
        7JT9LhuVbGQEEY+Kn/ecKdqcGhIUGfo=
X-Google-Smtp-Source: ABdhPJyNo+CzCeyou3pE65NPGj8/9PxJzf1nwsOubHrZmJ4R9WjQpGm/IooElChcocOWkFr5gzjQqQ==
X-Received: by 2002:a65:580c:: with SMTP id g12mr5660101pgr.257.1601708760433;
        Sat, 03 Oct 2020 00:06:00 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d25sm3854498pgl.23.2020.10.03.00.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 00:05:59 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Date:   Fri,  2 Oct 2020 23:59:46 -0700
Message-Id: <20201003065947.18671-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201003065947.18671-1-nicoleotsuka@gmail.com>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The bus_set_iommu() in tegra_smmu_probe() enumerates all clients
to call in tegra_smmu_probe_device() where each client searches
its DT node for smmu pointer and swgroup ID, so as to configure
an fwspec. But this requires a valid smmu pointer even before mc
and smmu drivers are probed. So in tegra_smmu_probe() we added a
line of code to fill mc->smmu, marking "a bit of a hack".

This works for most of clients in the DTB, however, doesn't work
for a client that doesn't exist in DTB, a PCI device for example.

Actually, if we return ERR_PTR(-ENODEV) in ->probe_device() when
it's called from bus_set_iommu(), iommu core will let everything
carry on. Then when a client gets probed, of_iommu_configure() in
iommu core will search DTB for swgroup ID and call ->of_xlate()
to prepare an fwspec, similar to tegra_smmu_probe_device() and
tegra_smmu_configure(). Then it'll call tegra_smmu_probe_device()
again, and this time we shall return smmu->iommu pointer properly.

So we can get rid of tegra_smmu_find() and tegra_smmu_configure()
along with DT polling code by letting the iommu core handle every
thing, except a problem that we search iommus property in DTB not
only for swgroup ID but also for mc node to get mc->smmu pointer
to call dev_iommu_priv_set() and return the smmu->iommu pointer.
So we'll need to find another way to get smmu pointer.

Referencing the implementation of sun50i-iommu driver, of_xlate()
has client's dev pointer, mc node and swgroup ID. This means that
we can call dev_iommu_priv_set() in of_xlate() instead, so we can
simply get smmu pointer in ->probe_device().

This patch reworks tegra_smmu_probe_device() by:
1) Removing mc->smmu hack in tegra_smmu_probe() so as to return
   ERR_PTR(-ENODEV) in tegra_smmu_probe_device() during stage of
   tegra_smmu_probe/tegra_mc_probe().
2) Moving dev_iommu_priv_set() to of_xlate() so we can get smmu
   pointer in tegra_smmu_probe_device() to replace DTB polling.
3) Removing tegra_smmu_configure() accordingly since iommu core
   takes care of it.

This also fixes a problem that previously we added all clients to
iommu groups before iommu core initializes its default domain:
    ubuntu@jetson:~$ dmesg | grep iommu
    platform smmu_benchmark: Adding to iommu group 0
    platform 1003000.pcie: Adding to iommu group 1
    platform 50000000.host1x: Adding to iommu group 2
    platform 57000000.gpu: Adding to iommu group 3
    platform 7000c400.i2c: Adding to iommu group 4
    platform 7000c500.i2c: Adding to iommu group 4
    platform 7000c700.i2c: Adding to iommu group 4
    platform 7000d000.i2c: Adding to iommu group 4
    iommu: Default domain type: Translated

Though it works fine with IOMMU_DOMAIN_UNMANAGED, but will have
warnings if switching to IOMMU_DOMAIN_DMA:
    iommu: Failed to allocate default IOMMU domain of type 0 for
           group (null) - Falling back to IOMMU_DOMAIN_DMA
    iommu: Failed to allocate default IOMMU domain of type 0 for
           group (null) - Falling back to IOMMU_DOMAIN_DMA

Now, bypassing the first probe_device() call from bus_set_iommu()
fixes the sequence:
    ubuntu@jetson:~$ dmesg | grep iommu
    iommu: Default domain type: Translated 
    tegra-i2c 7000c400.i2c: Adding to iommu group 0
    tegra-i2c 7000c500.i2c: Adding to iommu group 0
    tegra-i2c 7000d000.i2c: Adding to iommu group 0
    tegra-pcie 1003000.pcie: Adding to iommu group 1
    ...

Note that dmesg log above is testing with IOMMU_DOMAIN_UNMANAGED.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v4->v5
 * Replaced of_node_put() with put_device() in of_xlate()
 * Added test result in commit message
v3->v4
 * Moved dev_iommu_priv_set() to of_xlate() so we don't need
   to poll DTB for smmu pointer.
 * Removed the hack in tegra_smmu_probe() by returning ERR_PTR(
   -ENODEV) in tegra_smmu_probe_device() to let iommu core call
   in again.
 * Removed tegra_smmu_find() and tegra_smmu_configure() as iommu
   core takes care of fwspec.
v2->v3
 * Used devm_tegra_get_memory_controller() to get mc pointer
 * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
v1->v2
 * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
   with tegra_get_memory_controller call.
 * Dropped the hack in tegra_smmu_probe().

 drivers/iommu/tegra-smmu.c | 92 +++++---------------------------------
 1 file changed, 11 insertions(+), 81 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 297d49f3f80e..73b091facae0 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -797,75 +797,9 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
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
-
-		of_node_put(args.np);
-		index++;
-	}
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 
 	if (!smmu)
 		return ERR_PTR(-ENODEV);
@@ -873,10 +807,7 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	return &smmu->iommu;
 }
 
-static void tegra_smmu_release_device(struct device *dev)
-{
-	dev_iommu_priv_set(dev, NULL);
-}
+static void tegra_smmu_release_device(struct device *dev) {}
 
 static const struct tegra_smmu_group_soc *
 tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
@@ -953,8 +884,17 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 static int tegra_smmu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
+	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
+	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
 	u32 id = args->args[0];
 
+	put_device(&iommu_pdev->dev);
+
+	if (!mc || !mc->smmu)
+		return -EPROBE_DEFER;
+
+	dev_iommu_priv_set(dev, mc->smmu);
+
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
@@ -1079,16 +1019,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
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

