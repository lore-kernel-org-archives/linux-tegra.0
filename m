Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA3AC6FA8B
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 17:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbiIERJF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 13:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238062AbiIERIw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 13:08:52 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AF55E652;
        Mon,  5 Sep 2022 10:08:49 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 29so7016229edv.2;
        Mon, 05 Sep 2022 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OIzfbeKkuSpcRYDEd+SQTeXMoHIzrBZJTi3h23ZKlu0=;
        b=XVKyZflqVfrs15zdL2hhETqdGup8rp41IrQyRAUGdRX00PGkeD6TCUp3WLbkHbj+I3
         jRitrscyMD8lAiGeHglIOb1J6RK4UnwMMKsL7s5WriTpt18SqobhS2THerUKHGtjHqjb
         2xvxsFCz3QG1qGv6JMzHxRYxVia0JEV26Ev4UNxBhaMFd0s63sZqsQxyYMcyXO7tIeNa
         iWaVrwKe8L+miBY8uzKUsxs83exxItZucF6QsiHB5MPm7ZH1Ajt4+zrKaD0ykubENclS
         XC1mqr8FyqznoWaDRjDzo3F9TocJK27oVmrFWoojRRipyEd6RhYw0LaJb+UCeNcQ7UVO
         pvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OIzfbeKkuSpcRYDEd+SQTeXMoHIzrBZJTi3h23ZKlu0=;
        b=Eag0EFM3hkqvGldT6Az5xAdrzpEfmX+zOcn4XyJ4k8KSpREZ2vath2xyvQYjDkgZbU
         OSeaGJBQTCDICDG+3bvjGSRt6/yFq8fW9q973dd+3bPnV6zvBGQNaVVHZAZ7Xkb2gkdr
         /qDClLSk5UTJV+mxIWtevT2TkiZZPLAGZhSTDSQLp0I2JUhw17DU/734jzOTT3D2gS2W
         Lv08qpqV8mLv6O5Bpq9+YgMVHbig/OuxjQhuDqnHEOpD8yt97D7ms/d/p1SJhidygSUe
         nB4jF4CiDMzObgMQg0NEhxvu9j+PEi5WKXycZjyHIyutDMKT4iVKdZnmve+Of5+MoYL+
         klSg==
X-Gm-Message-State: ACgBeo2+PURzwMdj+TsLkZOtDpK69UVf+S+L5Om+QcRLhwCZlcHdebxx
        iKDCTeK53H+gllyigCiWbbpGw1OxTSs=
X-Google-Smtp-Source: AA6agR4BJeVSHdIKU8fPpclWQuHcx6wSFGZ4rwRJeK+3KuAkZRbZe8qxFdyZtZ0N7vvL+BxWw7VCbg==
X-Received: by 2002:a05:6402:278d:b0:448:c51e:3378 with SMTP id b13-20020a056402278d00b00448c51e3378mr26510631ede.224.1662397727756;
        Mon, 05 Sep 2022 10:08:47 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090623e200b0073d638a7a89sm5356295ejg.99.2022.09.05.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:46 -0700 (PDT)
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
Subject: [PATCH v8 5/5] iommu/tegra-smmu: Support managed domains
Date:   Mon,  5 Sep 2022 19:08:33 +0200
Message-Id: <20220905170833.396892-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905170833.396892-1-thierry.reding@gmail.com>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
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
index d3b73842218c..2a39df21f9ef 100644
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
@@ -1012,7 +1015,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.probe_device = tegra_smmu_probe_device,
 	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
-	.get_resv_regions = of_iommu_get_resv_regions,
+	.get_resv_regions = iommu_dma_get_resv_regions,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.37.2

