Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C5DCCA47F
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbiGENhk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbiGENhU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2EE74340;
        Tue,  5 Jul 2022 05:58:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id o25so21504199ejm.3;
        Tue, 05 Jul 2022 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mt2U9a7tnFLCX9wgkrM1HMmN66TcXqkkVi2NC46P4ZM=;
        b=nNuVdrWW+GdYThuwyB/PF+JCo6W0brafNJOZoPms5fDliKEGgqgPz3KAX91npdTZ1B
         fAJzTnuTwDRlQKkq2dmjFO7RF3pL5zTqZrfvz3AZLLbgVFovf8rL49v0KCDay2snnXEV
         GjmLyEip5KtMV5YskNmRfjEFCxLW5lXpF1wBEXS9ZWJI75CLUAy5If1AMcpA29eJF9dF
         8J8rpiZctEMJSz50l4CHpTc9sg4s/zu21eVFx0Fkqu+zQW3xrJhtpFBfy7JMwfl0eDG3
         2636ZN3hZXOqKC//K6X7mw14DsHqL2BkP/GhQW93GYwtiDu0Z4sAfSSEk1VQctpXXTWE
         bOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt2U9a7tnFLCX9wgkrM1HMmN66TcXqkkVi2NC46P4ZM=;
        b=jfyfvY3fapjLumW3WlrKkoChNGC1ubUO/8pSwsKArqNF5PzfknN3PVqrIwUx/yu84Z
         bHBOKN59aZe8SBV0/GydY2GvaRJxS28aEQv7ceLHbZAdaPZc+Wxnm/ApvemLHeIzXBO3
         gwSLDMdWx0b6iaoDzIt4rHHB6EHezRLuNK1r3FHz2jHFKUo1uERVlDN6lTeRZa9LvyJ0
         3hSBTQMq5NotLkzk04TdjPZ8wCSTIEJjTdQD/eXLaGNmpoJv8BLMXz+QhKcqSkGPaHyJ
         c8XT38+Jg3KugMtNWlMJqQIJx3QLGXRpw91kzoVZ0USaF8NXRQUn+6MqAej/XLnhWF5Y
         XSrg==
X-Gm-Message-State: AJIora/g5ATAF89IBTBZfkS+kamCxJHy4GcAdY6KsTAgUaw9C1Cj2Hed
        BJfJxtAH1v1vcLmLGdwdqW8=
X-Google-Smtp-Source: AGRyM1smNxj9DjX4JWeWQaDKC/wlX6qMAURGlLE5EGv8L1+qkZ4epmG66QZpNEqUQqtTXMtmAY/6Ow==
X-Received: by 2002:a17:907:6d1d:b0:726:363e:cca3 with SMTP id sa29-20020a1709076d1d00b00726363ecca3mr33679851ejc.713.1657025928198;
        Tue, 05 Jul 2022 05:58:48 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ch25-20020a0564021bd900b00437e027fad9sm12086140edb.48.2022.07.05.05.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:47 -0700 (PDT)
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
Subject: [PATCH v6 5/5] iommu/tegra-smmu: Support managed domains
Date:   Tue,  5 Jul 2022 14:58:34 +0200
Message-Id: <20220705125834.431711-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Navneet Kumar <navneetk@nvidia.com>

Allow creating identity and DMA API compatible IOMMU domains. When
creating a DMA API compatible domain, make sure to also create the
required cookie.

Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- remove DMA cookie initialization that's now no longer needed

 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 93879c40056c..f8b2b863c111 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-iommu.h>
 
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
@@ -277,7 +278,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED &&
+	    type != IOMMU_DOMAIN_DMA &&
+	    type != IOMMU_DOMAIN_IDENTITY)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -287,25 +290,16 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
 
 	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
-	if (!as->pd) {
-		kfree(as);
-		return NULL;
-	}
+	if (!as->pd)
+		goto free_as;
 
 	as->count = kcalloc(SMMU_NUM_PDE, sizeof(u32), GFP_KERNEL);
-	if (!as->count) {
-		__free_page(as->pd);
-		kfree(as);
-		return NULL;
-	}
+	if (!as->count)
+		goto free_pd_range;
 
 	as->pts = kcalloc(SMMU_NUM_PDE, sizeof(*as->pts), GFP_KERNEL);
-	if (!as->pts) {
-		kfree(as->count);
-		__free_page(as->pd);
-		kfree(as);
-		return NULL;
-	}
+	if (!as->pts)
+		goto free_pts;
 
 	spin_lock_init(&as->lock);
 
@@ -315,6 +309,15 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->domain.geometry.force_aperture = true;
 
 	return &as->domain;
+
+free_pts:
+	kfree(as->pts);
+free_pd_range:
+	__free_page(as->pd);
+free_as:
+	kfree(as);
+
+	return NULL;
 }
 
 static void tegra_smmu_domain_free(struct iommu_domain *domain)
@@ -1009,7 +1012,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.probe_device = tegra_smmu_probe_device,
 	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
-	.get_resv_regions = of_iommu_get_resv_regions,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
-- 
2.36.1

