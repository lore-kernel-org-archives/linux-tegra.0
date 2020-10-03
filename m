Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEA0C4727E
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD9B9206C3
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 07:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHy0PuL7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgJCHGK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 03:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgJCHGC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 03:06:02 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B87C0613D0;
        Sat,  3 Oct 2020 00:06:02 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nl2so508770pjb.1;
        Sat, 03 Oct 2020 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3PXF6Unc+l1IUCbIelHhHwgXAVYs8b+XwVuG2K0k6GQ=;
        b=pHy0PuL7omLy4ih8GOtsTuICUP772YVVOdNFUWGcvKlHEePtO9aywHJvzn7dP0KXU/
         WEW1S7rZiETjXKak9dkWx8rOlpVgY0YI0XVUy1e1FiKX32NP6scL0KOj+LsJT35ZNe3A
         o3LIdvmcXG8a+8iVS+rEZiMgkKpXy83Ec8rtg+Mr9KUIcHlOvoM+U6iMJvml/YroLfTw
         d/0wM82xgNyWQbgqSiOocgHbhurZytagxazwWX0WKjTphDlEl8ELVyeKqxXPiVBlXiwt
         KF6mh5hIXDVpy5ILIaBflou8TY2akbtboxQjRb1UtAxesPxa1pobS/bzSWnBzuG2K5v9
         nZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3PXF6Unc+l1IUCbIelHhHwgXAVYs8b+XwVuG2K0k6GQ=;
        b=BI2L9WBYxFTIjLZhoK4TuyqtABYL3D+SAyqvH2clTSeMc+hqi65iJgQdf6C3YaVu9L
         LEwjQAJSxVrBlRCO6RUvzAJmH3rUcglMHs56oQHiLADpA8tuZOWnSaT0r21TNQZNUGpx
         KdpZ3mk9clXIEwa/HYreNd5rpnU9Hld248ZagmJOVuB9y2E1aRatc2YZqh+YoEDu6vPn
         aoMbxtytmxp51952fDsft02xG/dzwnRvDkrH4v6xw0gO9JdntT9YBzPnxwU96rlCD2Xx
         yHfCtzs4LUBUpapaov8sY5MrQAA/XBP86/hPgcUY6kOC/3DXps5aiZWGxwhrBY6LAkP8
         8fJQ==
X-Gm-Message-State: AOAM532XL2sRk2D3EFhGvj8ktWcJIs9cfdAGYJZQ0SUzigw64dN4g4XP
        NJKXx7z5i/xWVUJYKbf+hvw=
X-Google-Smtp-Source: ABdhPJxIox5RHrFqR5hJPSA2WIstUsXbf+7RQUNblMWemn+U44s1lGzWruUEJbzhCz5WaeLpa0bHDg==
X-Received: by 2002:a17:90a:6705:: with SMTP id n5mr6422902pjj.72.1601708761858;
        Sat, 03 Oct 2020 00:06:01 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d25sm3854498pgl.23.2020.10.03.00.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 00:06:01 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] iommu/tegra-smmu: Add PCI support
Date:   Fri,  2 Oct 2020 23:59:47 -0700
Message-Id: <20201003065947.18671-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201003065947.18671-1-nicoleotsuka@gmail.com>
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog
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
index 73b091facae0..babab6d51360 100644
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
@@ -1071,22 +1076,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
 
 	err = iommu_device_register(&smmu->iommu);
-	if (err) {
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err)
+		goto err_sysfs;
 
 	err = bus_set_iommu(&platform_bus_type, &tegra_smmu_ops);
-	if (err < 0) {
-		iommu_device_unregister(&smmu->iommu);
-		iommu_device_sysfs_remove(&smmu->iommu);
-		return ERR_PTR(err);
-	}
+	if (err < 0)
+		goto err_unregister;
+
+#ifdef CONFIG_PCI
+	err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
+	if (err < 0)
+		goto err_bus_set;
+#endif
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_smmu_debugfs_init(smmu);
 
 	return smmu;
+
+err_bus_set: __maybe_unused;
+	bus_set_iommu(&platform_bus_type, NULL);
+err_unregister:
+	iommu_device_unregister(&smmu->iommu);
+err_sysfs:
+	iommu_device_sysfs_remove(&smmu->iommu);
+
+	return ERR_PTR(err);
 }
 
 void tegra_smmu_remove(struct tegra_smmu *smmu)
-- 
2.17.1

