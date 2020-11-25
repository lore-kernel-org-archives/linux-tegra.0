Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A3FC64E7C
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD6BC2083E
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Nov 2020 10:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvMPkn9i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgKYKL4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Nov 2020 05:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbgKYKLz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:55 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBE2C0613D6;
        Wed, 25 Nov 2020 02:11:55 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id l1so878134pld.5;
        Wed, 25 Nov 2020 02:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HoasHv3y6th/yvEKkLA5l4WpDaFfWmVWvaf3/EksU3s=;
        b=EvMPkn9iIXJjwCLoEKVFo7ymURGwzfJq3//6UucjvYZMhdT94vVL3PaXw5KMgtH2HG
         uagBLZTSmlFHKunUzHtH9QcFYVUU05ey9owWvW1hvNv7fkBImHGzgaSSwbWy0yLtMxfc
         N2+uhaUtRnvdgY2GqZ+hBHbezztseKyK+1ovIHrdUBPxS73skE92iEQyekAVXkC5+7gV
         OvwhIyFE6b6LL15TZxIXwgxpy0Qeg5b52qzI2jvUKTfCxK8iVBwtPQcQjsvy2p08YLzT
         GDxTbOFGldJO1Z8z/6VX//56QIOWV1vY56ZPlRHbDUyNXvUJ1kwLeOG8HxBiSErd08E7
         XRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HoasHv3y6th/yvEKkLA5l4WpDaFfWmVWvaf3/EksU3s=;
        b=Q8/5yNjuwVa3J3FuadsidkOt9nhi9ac7FoSEYvpqEwKCSXHB/46HPZpaj/A+znWnvx
         YJeYS1sELVQvaWoaQ+VdtOkxDXz9G7BWKn4k8NkaXd8Sd6FdYpwIMg/NRh0WpbO80jTG
         DF3+d0fT194WwVEVrvH2gdhwoOL7ny7dcYpIGA2ApBWmjaNVDVTWAEG4xXWWGsD6YjKT
         wiyZWXplj+B6P3ni95e1HgZQAzWh8MZh1oSTeDZJLK7fyFRzdcbMbYaMWDDSN9DjaIrz
         N72kX/hiDsPZ5XMpaOe1zMdy+ptLaOjiEjxXfWTlsRMmaYXm0fxr4THN4S1jDgRYRg6p
         V5aw==
X-Gm-Message-State: AOAM530scYzrVoNuSz4fSWZNN9M4B7bdrNzJGAUMYYWOVEo2DRn/yw+M
        DMrmxbMUWA0wlhqH7xQj0a4=
X-Google-Smtp-Source: ABdhPJz3PNXjHZ4o8ksVTnfDjJM/nPQ95qM+ZuFYmYMwrcd6Ee1kfFaIhnNoAxNsf4nZTOLdl69xOw==
X-Received: by 2002:a17:902:26a:b029:d6:caca:620a with SMTP id 97-20020a170902026ab02900d6caca620amr2527900plc.46.1606299115271;
        Wed, 25 Nov 2020 02:11:55 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id r130sm1599496pfc.41.2020.11.25.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:11:54 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     will@kernel.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com, joro@8bytes.org
Subject: [PATCH RESEND v2 5/5] iommu/tegra-smmu: Add PCI support
Date:   Wed, 25 Nov 2020 02:10:13 -0800
Message-Id: <20201125101013.14953-6-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125101013.14953-1-nicoleotsuka@gmail.com>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f45ed43cf8db..4a3f095a1c26 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->smmu = smmu;
 	group->soc = soc;
 
-	group->group = iommu_group_alloc();
+	if (dev_is_pci(dev))
+		group->group = pci_device_group(dev);
+	else
+		group->group = generic_device_group(dev);
+
 	if (IS_ERR(group->group)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
@@ -1075,22 +1080,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
 
 	err = iommu_device_register(&smmu->iommu);
-	if (err) {
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err)
+		goto remove_sysfs;
 
 	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
-	if (err < 0) {
-		iommu_device_unregister(&smmu->iommu);
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err < 0)
+		goto unregister;
+
+#ifdef CONFIG_PCI
+	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
+	if (err < 0)
+		goto unset_platform_bus;
+#endif
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_smmu_debugfs_init(smmu);
 
 	return smmu;
+
+unset_platform_bus: __maybe_unused;
+	bus_set_iommu(&platform_bus_type, NULL);
+unregister:
+	iommu_device_unregister(&smmu->iommu);
+remove_sysfs:
+	iommu_device_sysfs_remove(&smmu->iommu);
+
+	return ERR_PTR(err);
 }
 
 void tegra_smmu_remove(struct tegra_smmu *smmu)
-- 
2.17.1

