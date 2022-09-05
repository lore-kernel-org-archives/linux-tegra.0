Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9297ECAAD5
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 17:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237992AbiIERJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 13:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238019AbiIERIs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 13:08:48 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C275E652;
        Mon,  5 Sep 2022 10:08:47 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z8so12094151edb.6;
        Mon, 05 Sep 2022 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mkVMaYH+5G1UH6dyJ4iIn7MpmfKWx9mE5wy4q193/R4=;
        b=XYI92fqZiF4B/5uDnctMDJDRae6yk9tKnOyON0y9MLVIMLjsnoAiP/ok1T5dr5fvBr
         11d5JYruUkRYYApnpcdSfb3Qe3Y+wXVMXoBd2s/Oui/3k9KRPntQ/lVnOpjs8vZMwR82
         pQfE4QnmEpvPWStdEZrqcZ2dYVPCCPbfI/nxHtx1diPA40QqG4OtmCPlhPV8m3/6KRRy
         +V+QidIU76zkHYkbkgaMCFxdQ9vUn5WuBrb2bXWuevsf7pdWJ1G2xx7Fk5UZmHOofjdY
         RKIjUn/pxJ6mDXUK7nKYX4C7lodOuPOrHWOmYHoDi3C5j+pZc5IVul83uhwPS4TVEd2S
         f9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mkVMaYH+5G1UH6dyJ4iIn7MpmfKWx9mE5wy4q193/R4=;
        b=0qsXKfaeN4WmOXQCkUzb/B0mDo+R1xNTgknU892a4/65NirCXv8hcBSiG8W9QzTAbh
         nl5J/hhU7b+YGunwb1L931D2mwNuTclPIM7vKLjnCl0TJhh1zJ9JppSLAG2jt3wgrPtd
         gPp2pjSQOaMiGrlHfRng6CQuzL4cwTdziE2/IcIPe6NFIw+dAo7mF+uSolP2WkS70n0X
         qnK9omoo5hk3UOBZ+p+do1ig3qp9N0DoWHypRekS2eJhFXlp6sDfJzJUhjxxdyiB4i3G
         ZcfHnLQVnVdMUM8BQViT9IWq/iJxO/xKXNq3A4yNEclKh+IL4rL7H8IbldhekGpKd5Dp
         rzFw==
X-Gm-Message-State: ACgBeo09Er2gadiGju+oH3bKIztSlCxjiNjhcy9xs4beXTu9kqg5MC9S
        UBTivx6pGeag8BAq0uYoruA=
X-Google-Smtp-Source: AA6agR782EvL1TExyFQPVeuLxaojRmwoHZdoYSVwCY7pepEeYO6EbvZn1iHz9BjKPeGKzkPMjTd8vQ==
X-Received: by 2002:aa7:d392:0:b0:44e:67f2:c79c with SMTP id x18-20020aa7d392000000b0044e67f2c79cmr6614028edq.278.1662397726018;
        Mon, 05 Sep 2022 10:08:46 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ez19-20020a056402451300b0043df042bfc6sm6662398edb.47.2022.09.05.10.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v8 4/5] iommu/tegra-smmu: Add support for reserved regions
Date:   Mon,  5 Sep 2022 19:08:32 +0200
Message-Id: <20220905170833.396892-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905170833.396892-1-thierry.reding@gmail.com>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra DRM driver currently uses the IOMMU API explicitly. This means
that it has fine-grained control over when exactly the translation
through the IOMMU is enabled. This currently happens after the driver
probes, so the driver is in a DMA quiesced state when the IOMMU
translation is enabled.

During the transition of the Tegra DRM driver to use the DMA API instead
of the IOMMU API explicitly, it was observed that on certain platforms
the display controllers were still actively fetching from memory. When a
DMA IOMMU domain is created as part of the DMA/IOMMU API setup during
boot, the IOMMU translation for the display controllers can be enabled a
significant amount of time before the driver has had a chance to reset
the hardware into a sane state. This causes the SMMU to detect faults on
the addresses that the display controller is trying to fetch.

To avoid this, and as a byproduct paving the way for seamless transition
of display from the bootloader to the kernel, add support for reserved
regions in the Tegra SMMU driver. This is implemented using the standard
reserved memory device tree bindings, which let us describe regions of
memory which the kernel is forbidden from using for regular allocations.
The Tegra SMMU driver will parse the nodes associated with each device
via the "memory-region" property and return reserved regions that the
IOMMU core will then create direct mappings for prior to attaching the
IOMMU domains to the devices. This ensures that a 1:1 mapping is in
place when IOMMU translation starts and prevents the SMMU from detecting
any faults.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 50 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 555ae07ce027..d3b73842218c 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -471,6 +472,7 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 	tegra_smmu_free_asid(smmu, as->id);
 
 	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
+	as->pd_dma = 0;
 
 	as->smmu = NULL;
 
@@ -534,6 +536,38 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 	struct tegra_smmu *smmu = as->smmu;
 	u32 *pd = page_address(as->pd);
 	unsigned long offset = pd_index * sizeof(*pd);
+	bool unmap = false;
+
+	/*
+	 * XXX Move this outside of this function. Perhaps add a struct
+	 * iommu_domain parameter to ->{get,put}_resv_regions() so that
+	 * the mapping can be done there.
+	 *
+	 * The problem here is that as->smmu is only known once we attach
+	 * the domain to a device (because then we look up the right SMMU
+	 * instance via the dev->archdata.iommu pointer). When the direct
+	 * mappings are created for reserved regions, the domain has not
+	 * been attached to a device yet, so we don't know. We currently
+	 * fix that up in ->apply_resv_regions() because that is the first
+	 * time where we have access to a struct device that will be used
+	 * with the IOMMU domain. However, that's asymmetric and doesn't
+	 * take care of the page directory mapping either, so we need to
+	 * come up with something better.
+	 */
+	if (WARN_ON_ONCE(as->pd_dma == 0)) {
+		as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
+					  DMA_TO_DEVICE);
+		if (dma_mapping_error(smmu->dev, as->pd_dma))
+			return;
+
+		if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
+			dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD,
+				       DMA_TO_DEVICE);
+			return;
+		}
+
+		unmap = true;
+	}
 
 	/* Set the page directory entry first */
 	pd[pd_index] = value;
@@ -546,6 +580,12 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 	smmu_flush_ptc(smmu, as->pd_dma, offset);
 	smmu_flush_tlb_section(smmu, as->id, iova);
 	smmu_flush(smmu);
+
+	if (unmap) {
+		dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD,
+			       DMA_TO_DEVICE);
+		as->pd_dma = 0;
+	}
 }
 
 static u32 *tegra_smmu_pte_offset(struct page *pt_page, unsigned long iova)
@@ -846,7 +886,6 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 		smmu = tegra_smmu_find(args.np);
 		if (smmu) {
 			err = tegra_smmu_configure(smmu, dev, &args);
-
 			if (err < 0) {
 				of_node_put(args.np);
 				return ERR_PTR(err);
@@ -864,6 +903,13 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	return &smmu->iommu;
 }
 
+static void tegra_smmu_release_device(struct device *dev)
+{
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
+
+	put_device(smmu->dev);
+}
+
 static const struct tegra_smmu_group_soc *
 tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
 {
@@ -964,7 +1010,9 @@ static int tegra_smmu_of_xlate(struct device *dev,
 static const struct iommu_ops tegra_smmu_ops = {
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
+	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
+	.get_resv_regions = of_iommu_get_resv_regions,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.37.2

