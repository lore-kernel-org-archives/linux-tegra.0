Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1729EC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 May 2022 19:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357833AbiELTBW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 May 2022 15:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355699AbiELTBV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 May 2022 15:01:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77A3590AC;
        Thu, 12 May 2022 12:01:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p26so10693692lfh.10;
        Thu, 12 May 2022 12:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mt2U9a7tnFLCX9wgkrM1HMmN66TcXqkkVi2NC46P4ZM=;
        b=Gv0Vwl9woZEQrxqNpxwQhwdxKoqNldJwYczn072anBC7urXp/rB7lJUw6WcauN+MH0
         p0bGBg6cgf/AwYfhwuXjP/0AwzfHfXn5c/gqLlmrOXq/LJ6ptnvHyK2Ska48lxoMZp0U
         2jozZ2fY5+EujB+GJYzyJc2cSDF6h04MQuZNiVxU5IEkW6adR5PUFhbehHxf2awcpHSD
         Wkn+2Ylm8od7qxSYbpPul0v5HXuR4cjvALioAQZwc3L9qylXi9ppAAcKByOOap/hpwZF
         ngLLxHSOJWGez4lyaD6WllzMLlMzt9T/jy1iVgDrSuhBQjjXqQlDxlqoA9h1/xRiY0Vr
         fa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt2U9a7tnFLCX9wgkrM1HMmN66TcXqkkVi2NC46P4ZM=;
        b=dgPtiHZfYRtsbhupaxzGsZVla284FqEQ0G6PzFrpcECxTN/+/peSrRWeLQ+jHF0O5H
         Hzx/PlWRHznrgDGYQEfAq5H2MVMTBNCuL+3GLMUk83NW4EsKDVYPQfV41f0ZPul/Xec3
         eovgerujtNXD+RoHXs5t7/d06QGPOmrUTA93EL6GLRz6gr7VPRu+MW9p1CjBcIoUDOTU
         jW+XzoyfmqucnZ+IihABRGho/BgEptFRKxH80UgBV+QmcAKthy6JQpkNnWUE9DEJ0L/0
         D4xHgXgilExBAOfkXh7vygBQOtyZenz+yIXy/Vr8gtqwO7jzM9nK5+6xdrNMOZq7hpVx
         GysQ==
X-Gm-Message-State: AOAM533+4scPN1LUUMDVjTkD6M+HpeWlXTVOQJ2Ut7DsuiocGbwdRsm5
        q4JzssTnBQquTZDn912x/tM=
X-Google-Smtp-Source: ABdhPJywkioOthRkNJKuhIGBnwy5wL2iI/mmTX+U90oMWFMfZ8hE+LZm8XsnwkIgxjq19/qLP4Hvow==
X-Received: by 2002:a05:6512:33c8:b0:473:9d8f:a01b with SMTP id d8-20020a05651233c800b004739d8fa01bmr805048lfg.619.1652382077969;
        Thu, 12 May 2022 12:01:17 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z25-20020a2e9b99000000b0024f3d1daef2sm39660lji.122.2022.05.12.12.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:01:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 5/5] iommu/tegra-smmu: Support managed domains
Date:   Thu, 12 May 2022 21:00:52 +0200
Message-Id: <20220512190052.1152377-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512190052.1152377-1-thierry.reding@gmail.com>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
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

