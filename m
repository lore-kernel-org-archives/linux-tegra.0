Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FD9C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiGENhj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiGENhT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:19 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6BB747BB;
        Tue,  5 Jul 2022 05:58:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o25so21504043ejm.3;
        Tue, 05 Jul 2022 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=in4n6yNdl0/TA88lWGR+mLZXfmd4yDMsoLU1LfHbMpA=;
        b=grpi+48diDjTYGHKow0Gt2u8DfPdJltmRBIZW7dq5H3VH2UHzAVdOiBRpZMgfb5PAf
         q3Zjnn+IWdWrQsdlZgUimd1EkaMgRPdqowpOU6YAxEA5U7F7LaX1zNTWbzVL+JoiC9AG
         b62uVsMwqObMyaEkttm+6Ag4hrkhOYlv1iM6NCZpM3wM3jBFrlHjxwY2ZAmLnKX8YTUO
         biP9VP/wGBnUUOqZ153aPS4hEis0IpwtAJI+3fnXWvkVw/Xy/nL5sPOaF67SethsFoCc
         IZbtskmaELnxSJPKH9LqJWSkNwGLqQkeZTeoX5zPN7jrb9ZnVOqb2t058kwVkJelGVif
         6IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=in4n6yNdl0/TA88lWGR+mLZXfmd4yDMsoLU1LfHbMpA=;
        b=VFEVrjj236gb7nJjtfxVlIDBS8p6b9rM0unFZmFty7mJuxGs77B99YcReCqBcyQrMc
         spmSUddGJgy/jqoZH4WO7J3dYmy1bN9Xaq0GwPUXqkUH0YTJO5hBJY+Kw9/fHZB+9/Tv
         y1GxxShuXyLi+g62MhaPZCta3ky/h8V5d2BIzmXdh7a6qpxwIezlYcwNWE1xZZdlGAUz
         KZtpE/At9dzgVHIXJWSw7ThqSQYHwhJXeXOvjRStvmQ5KHNgl008L+NmO2PrqRpLvEI1
         GAvVyHQa7X7t8YdFByXh2bfkk6SrbIpIwEs3ACumZF83wkuU1C2ZGiIgSSwxTrYqqBJs
         B1hA==
X-Gm-Message-State: AJIora9QOhDi0LjiAMr81UWFI9rgoOXqkFO2kAMG3L1eJU6bDF8PPRrU
        6mWtMSLoJpBdc56TfpDnCp8=
X-Google-Smtp-Source: AGRyM1uSehEBjwBM++AaDSBXtoHrMeD73zfA2D9BXquu56tvUBY+H5qT3FPAsszEQhXpMKEx6BJUEg==
X-Received: by 2002:a17:907:a04b:b0:72a:ee53:7d2e with SMTP id gz11-20020a170907a04b00b0072aee537d2emr1000507ejc.764.1657025926433;
        Tue, 05 Jul 2022 05:58:46 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f3-20020a170906138300b0072124df085bsm15844073ejc.15.2022.07.05.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:45 -0700 (PDT)
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
Subject: [PATCH v6 4/5] iommu/tegra-smmu: Add support for reserved regions
Date:   Tue,  5 Jul 2022 14:58:33 +0200
Message-Id: <20220705125834.431711-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
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
 drivers/iommu/tegra-smmu.c | 47 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 2f2b12033618..93879c40056c 100644
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
@@ -864,7 +903,9 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	return &smmu->iommu;
 }
 
-static void tegra_smmu_release_device(struct device *dev) {}
+static void tegra_smmu_release_device(struct device *dev)
+{
+}
 
 static const struct tegra_smmu_group_soc *
 tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
@@ -968,6 +1009,8 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.probe_device = tegra_smmu_probe_device,
 	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
+	.get_resv_regions = of_iommu_get_resv_regions,
+	.put_resv_regions = generic_iommu_put_resv_regions,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.36.1

