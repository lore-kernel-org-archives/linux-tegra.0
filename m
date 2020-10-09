Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F0BC4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E45A2227E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 16:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frsXM0EU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389755AbgJIQ04 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 12:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389674AbgJIQ04 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 12:26:56 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9699C0613D6;
        Fri,  9 Oct 2020 09:26:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 144so7296254pfb.4;
        Fri, 09 Oct 2020 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e2ontlidD6EdZ8raA0hQEJD/T47JB7SGf8j+YCwQsds=;
        b=frsXM0EU7dTqXI6MRRBIjk/BetJeA6yGcDp1wrrbIzpbobYXcBVkP1q18NIRbGzH7A
         3zE2Kf/Z2uYteZhZ7xk4d4yi3871gVqbwDCA0VPOGQdgMsBMu1zIxry/+ESB5oJk2BpX
         S9V4wGfcmuy//G6+Bqh42zDjcwfV0ktBJJN+f9OJFzybFvexTCdESXSeEdMxqUJ5B9d9
         RZTF6pq2TSP/5Z7HXCrFeghiDzos0cRst+9K4pVGaYD02WXahq5gOgiHJvOT4JRFkBdZ
         Ut1ERXygUKRXMjMHw0rmRtSUUT8zNAh61UVzLrw7iPBNTZu2D3rdwOWoXFuzOGKmJLVp
         rrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e2ontlidD6EdZ8raA0hQEJD/T47JB7SGf8j+YCwQsds=;
        b=n+7Okf7bqrXKylb0MCLwqViEdxfGDF+YNH2bo3hvyEPeFtzIeRxemXRUDwIUPrGF3h
         e4wdUbA6LnOe6ZEhgEywxd924cRbbRRhA8q5pm7EidR5UVrGtkBhEHZM/6rQOwAkK+Cq
         uBjl1nZIr9LtRiKUTsnYGZVzwQmeYlpS91MvHh7OQvn2iJsTRC4CJkIaz4zsduz55aZS
         487sbTIltEKqyUzl4F4CKd/9tdPMczXjcqD83iThsmSHk/1FvItA3QhDuxtIHZJEuHte
         tlKShRLLHkAMD/HYoCJ0s7dKOpSbWP/YPUwzBuAI6NHiWLnOeR6hA1QhQ7CZAYHsrXC9
         qRMA==
X-Gm-Message-State: AOAM533og3RcCpSIsI64SCCit0+F3Q/szVSrLryg9bls1CmQIqR8iCM8
        0CVzm8b7HLXy+W1aJ/Kkm/k=
X-Google-Smtp-Source: ABdhPJz4W1TQO+OAe1kcSo/OeZxeY2bAfv8aXkkP9TODAbIqPSTwEtOHPYjBpy4gf6v9To5giAGqog==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr3990445pgp.45.1602260815458;
        Fri, 09 Oct 2020 09:26:55 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id q24sm9591229pgb.12.2020.10.09.09.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 09:26:55 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
Date:   Fri,  9 Oct 2020 09:19:36 -0700
Message-Id: <20201009161936.23122-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009161936.23122-1-nicoleotsuka@gmail.com>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v6->v7
 * Renamed goto labels, suggested by Thierry.
v5->v6
 * Added Dmitry's Reviewed-by and Tested-by.
v4->v5
 * Added Dmitry's Reviewed-by
v3->v4
 * Dropped !iommu_present() check
 * Added CONFIG_PCI check in the exit path
v2->v3
 * Replaced ternary conditional operator with if-else in .device_group()
 * Dropped change in tegra_smmu_remove()
v1->v2
 * Added error-out labels in tegra_smmu_probe()
 * Dropped pci_request_acs() since IOMMU core would call it.

 drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index be29f5977145..2941d6459076 100644
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

