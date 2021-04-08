Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FACC433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 09:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8577061041
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 09:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDHJot (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 05:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbhDHJot (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 05:44:49 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C70CC061760;
        Thu,  8 Apr 2021 02:44:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so2832957pji.5;
        Thu, 08 Apr 2021 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w0yqOdK8TBIxTW5Ne7zhHMEvG5YRSgyD3ci2CbuX1Ko=;
        b=pHOLGF3r/chGXK0P6mFv3kNaPTdxQbCMF1E4ZKSOPtLEIAP7yDW7n1MZsex/JMuAsA
         sW84iwhTNe023cGfCYgknO68RlmliNDx1GtLrBJ0TjDJsd9f4aFOHnqDvKELaMSZd6mZ
         Bsj3LYpvL/EJk9c7eUIgYNC5Urk16VI+jb8XgaFwiOw2zodMCGcia+kSm5eA5Bu4w2+d
         lzZ2sc/jfJ24ccdSucWLBtd9NNAkRbNA3yMvWKEEy8X23G+8FVl9Xn551rmMO8uKBnaX
         e5kb9MChPY29OHIhd33YHpkKwPU4k7PwJHsot1vrkz4gTHrBKySEUKNtZVcPCjORZreH
         zokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w0yqOdK8TBIxTW5Ne7zhHMEvG5YRSgyD3ci2CbuX1Ko=;
        b=swIF80RSesPlcsXn+JD+IPyC//6dC/3Af+u5x4/1/p/ywzeApC+y/mlJKu0n3yYfDq
         si+/UW+aRIL3whMkYVTzCJVL0kH2oITGLmTFupLUCQhQDjO7z+0ZLT5yoWG4gw5TTIrB
         0SFhTwMDcXZBvDsIodIHV+2W2Ld8vEcR3mRJYhh/SxQUqdFSegATzVeYkYIAHu7shdla
         CIzDiZ6KygoTqpp5GPx6XhvEe0o4QYDuYeTIoE2oq3bND+H6ZAe58kg7DibP3FWJXSb1
         FBD3faGvdmHbLXzCTJljynzOPlqLZBljwL5k8CLNyvPwUGESMg3UnB2xIEG/q4YSEZRd
         nz4A==
X-Gm-Message-State: AOAM530oFIQ8zGmI47MFVm4v6f9zPOEyezcojFa3PkBfKE6NCyDTwDac
        HjVnfT4LMftaaY0DHqcg29CK4lBjG9Y8Rg==
X-Google-Smtp-Source: ABdhPJyThhKs3YsHYUCK2VFV5t62Dyf3WEmdRWyX2YlXwLsJGlE7MZkHGU/FUqEkoU00wPLzrjBP7g==
X-Received: by 2002:a17:90a:8813:: with SMTP id s19mr7340659pjn.94.1617875077668;
        Thu, 08 Apr 2021 02:44:37 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id q2sm4269469pfh.65.2021.04.08.02.44.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 02:44:37 -0700 (PDT)
Date:   Thu, 8 Apr 2021 02:42:42 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
Message-ID: <20210408094241.GA31714@Asurada-Nvidia>
References: <20210328233256.20494-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20210328233256.20494-1-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 29, 2021 at 02:32:55AM +0300, Dmitry Osipenko wrote:
> All consumer-grade Android and Chromebook devices show a splash screen
> on boot and then display is left enabled when kernel is booted. This
> behaviour is unacceptable in a case of implicit IOMMU domains to which
> devices are attached during kernel boot since devices, like display
> controller, may perform DMA at that time. We can work around this problem
> by deferring the enable of SMMU translation for a specific devices,
> like a display controller, until the first IOMMU mapping is created,
> which works good enough in practice because by that time h/w is already
> stopped.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

For both patches:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>

The WAR looks good to me. Perhaps Thierry would give some input.

Another topic:
I think this may help work around the mc-errors, which we have
been facing on Tegra210 also when we enable IOMMU_DOMAIN_DMA.
(attached a test patch rebasing on these two)

However, GPU would also report errors using DMA domain:

 nouveau 57000000.gpu: acr: firmware unavailable
 nouveau 57000000.gpu: pmu: firmware unavailable
 nouveau 57000000.gpu: gr: firmware unavailable
 tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffbe200: Security violation (TrustZone violation)
 nouveau 57000000.gpu: DRM: failed to create kernel channel, -22
 tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffad000: Security violation (TrustZone violation)
 nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []
 nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []

Looking at the address, seems that GPU allocated memory in 32-bit
physical address space behind SMMU, so a violation happened after
turning on DMA domain I guess... 

--OgqxwSJOaUobr8KG
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="dma_domain.patch"

From 20b58a74fee0c7b961b92f9118ad69a12199e6a5 Mon Sep 17 00:00:00 2001
From: Nicolin Chen <nicolinc@nvidia.com>
Date: Thu, 12 Dec 2019 17:46:50 -0800
Subject: [PATCH 6/7] iommu/tegra-smmu: Add IOMMU_DOMAIN_DMA

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 39 ++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 8104f001e679..eff10d1ec568 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-iommu.h>
 
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
@@ -297,35 +298,29 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
 	if (!as)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&as->domain))
+		goto free_as;
+
 	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
 
 	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
-	if (!as->pd) {
-		kfree(as);
-		return NULL;
-	}
+	if (!as->pd)
+		goto put_dma_cookie;
 
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
 
@@ -335,6 +330,17 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->attached_devices_need_sync = true;
 
 	return &as->domain;
+
+free_pts:
+	kfree(as->pts);
+free_pd_range:
+	__free_page(as->pd);
+put_dma_cookie:
+	iommu_put_dma_cookie(&as->domain);
+free_as:
+	kfree(as);
+
+	return NULL;
 }
 
 static void tegra_smmu_domain_free(struct iommu_domain *domain)
@@ -346,6 +352,7 @@ static void tegra_smmu_domain_free(struct iommu_domain *domain)
 	WARN_ON_ONCE(as->use_count);
 	kfree(as->count);
 	kfree(as->pts);
+	iommu_put_dma_cookie(domain);
 	kfree(as);
 }
 
-- 
2.17.1


--OgqxwSJOaUobr8KG--
