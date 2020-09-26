Return-Path: <SRS0=NmuO=DD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FF9C47425
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 916422177B
	for <linux-tegra@archiver.kernel.org>; Sat, 26 Sep 2020 08:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsMf55c7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgIZIMi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 26 Sep 2020 04:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729225AbgIZIMd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 26 Sep 2020 04:12:33 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBD6C0613CE;
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d19so550478pld.0;
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4N2RU9Ug7heB8a6NcMVwTlvvnh89jdIRun82jXeq3G8=;
        b=TsMf55c7ja55kZb8XRYBn19eKpbGNQUAiN6GDEdfxyh/MeijTAdLF1J82dBA5m+kik
         j0KlgcvcvtfminbRImgiomnQaQKZDrqPqt5m+v/axnh1cIW7z44+B3vVWBURr+91G/v5
         OvRfulPc5r/km0NLdYrJMNktEnDA63LI7fZEdrC/Xg5KsnNsjwvKxztlSDLxy21ChhZI
         pBt1yvaiT3rB0xwl5P7eCiul5FhvPKe96fBisMwe63KtwFCC3452B7ibydP9GE5xM96d
         t1D3/epKaiORAwbUG/cu2fMlXbOdk8ypg5RLmcyOx3HVXQ/wY8Iz44RPO/qj2qA1gwp3
         njAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4N2RU9Ug7heB8a6NcMVwTlvvnh89jdIRun82jXeq3G8=;
        b=P1RHMjJShWfw7rCGLLe8mWPYuY2ol1F0CNoP1OyQX6UGpBYSbzdw+JyvPBi5r0fdWo
         enYLL0f+quYH9f/yQCX4tODrbw5k7JVAbrUJUgicDD5L2Xq5TbgJY1x/MyyWXXqGFxE1
         BPSRGP1ukNSjeqiOFizYFkcegDKsUOWkJ+4mhrzegPOS0vJ4Mi6Pk+heIfAECneBYalP
         I6qKWhlksnbHre6f5bvMaYPQiqcJJoYx1EG3Zhsux927Oq0X2RfZKBr7hFxzeTLofEQx
         bpSZM/a/EmRoLwnpv7luisvAfluDJiIg1vBAtcoIRZ8/hGZjCBKd94cAeI5ZRnUEHlSX
         3iMQ==
X-Gm-Message-State: AOAM532nUZQZXOTBPm907p6s+N9gA9TNaQRadPQyZGItnN5hPxYZWpbb
        yINd2SRvirYlJO4Lsxi6COk=
X-Google-Smtp-Source: ABdhPJwEPdNila3vp3a63sOLkMJAbK9eU0IlCNDn4Y5WBmWj6jjkznuUsugSZPjO284NVlXgV/QGww==
X-Received: by 2002:a17:90a:d512:: with SMTP id t18mr1205484pju.106.1601107952502;
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id i1sm4833497pfk.21.2020.09.26.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 01:12:32 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] iommu/tegra-smmu: Add PCI support
Date:   Sat, 26 Sep 2020 01:07:18 -0700
Message-Id: <20200926080719.6822-5-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200926080719.6822-1-nicoleotsuka@gmail.com>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 97a7185b4578..9dbc5d7183cc 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -15,6 +15,7 @@
 #include <linux/spinlock.h>
 #include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
+#include <linux/pci.h>
 
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
@@ -935,6 +936,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	const struct tegra_smmu_group_soc *soc;
 	struct tegra_smmu_group *group;
 	int swgroup = fwspec->ids[0];
+	bool pci = dev_is_pci(dev);
 	struct iommu_group *grp;
 
 	/* Find group_soc associating with swgroup */
@@ -961,7 +963,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->smmu = smmu;
 	group->soc = soc;
 
-	group->group = iommu_group_alloc();
+	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();
 	if (IS_ERR(group->group)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
@@ -1180,6 +1182,19 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 		return ERR_PTR(err);
 	}
 
+#ifdef CONFIG_PCI
+	if (!iommu_present(&pci_bus_type)) {
+		pci_request_acs();
+		err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
+		if (err < 0) {
+			bus_set_iommu(&platform_bus_type, NULL);
+			iommu_device_unregister(&smmu->iommu);
+			iommu_device_sysfs_remove(&smmu->iommu);
+			return ERR_PTR(err);
+		}
+	}
+#endif
+
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_smmu_debugfs_init(smmu);
 
-- 
2.17.1

