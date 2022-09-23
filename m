Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9620C6FA82
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiIWMgS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiIWMgR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 08:36:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886AF128711;
        Fri, 23 Sep 2022 05:36:15 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id z13so371931ejp.6;
        Fri, 23 Sep 2022 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OcVK8cEHIhhrEG5qIUUuL04h8/PHYGVEkTjTLnQzMJQ=;
        b=W0hoFeaq+vvTKk8xQkURwyR5FoOWDM9YzfxcSmsuwvUZNFJp8LsxvGrIYReajbYB/q
         nJc5WR1Y7rUcOqvuB63ERvsE7FyTC0ofl68VdSWcQK/CMkhaZ2eIBCrz0w42Iv/JFzKQ
         Ff4JI5VDoBjunJbUufGNe6ptDEyLZxngst8EODLaUyvDvjfbZ+HVd7CfgOLeF/56RiP0
         T+MVdxi8j96ZAYepS/4Lrbpio+QKWAUnQVhqHQVREAdLx6bKNKaqnHcyrYHm3XI+Ij9U
         MsQCub17q31u37PTitQSEaiL6nsaosJv9Z7fzrZBRxkTE6srHKDiYUcqeQr8GdRUUOfb
         vWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OcVK8cEHIhhrEG5qIUUuL04h8/PHYGVEkTjTLnQzMJQ=;
        b=iIRlccxe5uC7RQuE5eKYYYegcel50Ndsr5N8YfX07qckzOyvn/h68kyJX2+unKjIOI
         0/v6BOl6oj5CrM0KCloRe5KGzlahJlE6S1t/RkUAHFDetkZsxeYck5XZNMlt5w5BBLIP
         5relcxLQdHbLBFCRA71K7GwxdYhnh2Aycum7XUDrZ8QD4AxLNyTt+oxCne4BnwF+Dvdc
         WOJ7P01WxctClvgGN6Kj1eRtWSPGJ/fZMhcQC0KK8Z0TDUwfnHsFCabAcmtreyMx/5R4
         jXiQ8QNey0o7jKsT4tWOtW8NndsUAh1PhRliKnMbLLG5BMmdJNhyMSblo1+GeJnsUHrV
         HCPw==
X-Gm-Message-State: ACrzQf1frqdpIVLnGEtC2742/YQxHo8AHWVYmRKMwpJ4o0fMljCPr7Gg
        LIvx4AgllFGyefENpumizgY=
X-Google-Smtp-Source: AMsMyM6einoHp3XMiUb3xsIMekreEJuo4DUMLfkavQ2Py7A7x2lW5z8YfABIbMRraurdwHhYDB+zPg==
X-Received: by 2002:a17:907:60cf:b0:782:d3ab:55b8 with SMTP id hv15-20020a17090760cf00b00782d3ab55b8mr238302ejc.6.1663936574058;
        Fri, 23 Sep 2022 05:36:14 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ky6-20020a170907778600b00778e3e2830esm4038013ejc.9.2022.09.23.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:12 -0700 (PDT)
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
Subject: [PATCH v9 5/5] iommu/tegra-smmu: Support managed domains
Date:   Fri, 23 Sep 2022 14:35:57 +0200
Message-Id: <20220923123557.866972-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
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

 drivers/iommu/tegra-smmu.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 57b4f2b37447..7ad993330634 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -20,6 +20,8 @@
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
 
+#include "dma-iommu.h"
+
 struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
@@ -277,7 +279,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED &&
+	    type != IOMMU_DOMAIN_DMA &&
+	    type != IOMMU_DOMAIN_IDENTITY)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -287,25 +291,16 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
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
 
@@ -315,6 +310,15 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
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
@@ -1012,7 +1016,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.probe_device = tegra_smmu_probe_device,
 	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
-	.get_resv_regions = of_iommu_get_resv_regions,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.37.3

