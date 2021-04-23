Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B72CC433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2152F61350
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242366AbhDWQci (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 12:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhDWQch (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 12:32:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C4CC06175F;
        Fri, 23 Apr 2021 09:32:01 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v6so73421257ejo.6;
        Fri, 23 Apr 2021 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lxQFozX7f08xU1iuPNW5K35e7ba5gFMB/xlfq4TbD+Q=;
        b=kIAvihWG6rHLgWY7kHJN2x8/gBNag0crjXobi6/gdhYM4vY80679I7ZpOKeFGdAgw8
         bauT/RB6YJ7gFUW2QkMRDA5w39Pv2Zyf+jahAHIeX21Dkixj7T901ZHUWseYXXZGQsnG
         TMXDwnv4vk3JLTIjoPsP3dLmvXz3Z1cgEySkCVX8YgISSZebn6EXlP3Fivc/WIJ3H7rU
         b8mdL8QaKIJr+hPOfMAY4U+wjAoGslshpUTa5sN/7ODL2fjBx33ztBFlYIv6QtZbFOYy
         aE5Rlno01OThlxJot/ovWqvY3QC5K7x19+40UNXklQuUpMh4gmBCh5e5PSXd/ng9xpET
         4JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxQFozX7f08xU1iuPNW5K35e7ba5gFMB/xlfq4TbD+Q=;
        b=astcDYtFOxaGoBv8ZRJ1pedAz+2E4JJAooXSZIAgP5p5QAonzlNrkYSpjNamlMtYfd
         bkZ5VhgTL7bxoGiBqU2SDHVxRFGr3v1zBDarE/tYu0SxL/yLqBhrxCEPA8Kusg8QZ4Gi
         xNebqsSSJWG7mh+GzkgXT/TNz4tY21D1R6zm3mZSS4fT9+gJfSBPzSgAU2SrUDYmzZJ4
         aCwmEqJqlV3zIyxX2WVzjGzxuiiPvRPiRTDXAQB9tj4RVP6UiypIQZizIMfMbGRSTe6e
         Ajf0ygcuDmvE3FXTc4Gr+qCg3vjhCh+JkywKx6aWKOtkEX1LGuX/6mzXu40cELt+D58R
         fUGQ==
X-Gm-Message-State: AOAM532yozi70cH/5B+DCJjnHweu5zIgLzZJ7YEtKDUFyJVKehfzviBV
        NefqiPz8CWCuteMT7F1qR6s=
X-Google-Smtp-Source: ABdhPJz4i8Ne8vIi19Wcr9DGugu9QodJTGEBRss/wSWTTTIhQt3eK5qSDEOq3dofD1Tp8doRGKxW/Q==
X-Received: by 2002:a17:907:9485:: with SMTP id dm5mr5186154ejc.194.1619195519944;
        Fri, 23 Apr 2021 09:31:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ca1sm5042934edb.76.2021.04.23.09.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:31:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/5] iommu/tegra-smmu: Support managed domains
Date:   Fri, 23 Apr 2021 18:32:34 +0200
Message-Id: <20210423163234.3651547-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
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
 drivers/iommu/tegra-smmu.c | 47 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6bf7654371c5..40647e1f03ae 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-iommu.h>
 
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
@@ -281,8 +282,11 @@ static bool tegra_smmu_capable(enum iommu_cap cap)
 static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
+	int ret;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED &&
+	    type != IOMMU_DOMAIN_DMA &&
+	    type != IOMMU_DOMAIN_IDENTITY)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -291,26 +295,23 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 
 	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
 
-	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
-	if (!as->pd) {
-		kfree(as);
-		return NULL;
+	if (type == IOMMU_DOMAIN_DMA) {
+		ret = iommu_get_dma_cookie(&as->domain);
+		if (ret)
+			goto free_as;
 	}
 
+	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
+	if (!as->pd)
+		goto put_dma_cookie;
+
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
 
@@ -320,6 +321,18 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->domain.geometry.force_aperture = true;
 
 	return &as->domain;
+
+free_pts:
+	kfree(as->pts);
+free_pd_range:
+	__free_page(as->pd);
+put_dma_cookie:
+	if (type == IOMMU_DOMAIN_DMA)
+		iommu_put_dma_cookie(&as->domain);
+free_as:
+	kfree(as);
+
+	return NULL;
 }
 
 static void tegra_smmu_domain_free(struct iommu_domain *domain)
@@ -1051,7 +1064,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.map = tegra_smmu_map,
 	.unmap = tegra_smmu_unmap,
 	.iova_to_phys = tegra_smmu_iova_to_phys,
-	.get_resv_regions = of_iommu_get_resv_regions,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.apply_resv_region = tegra_smmu_apply_resv_region,
 	.of_xlate = tegra_smmu_of_xlate,
-- 
2.30.2

