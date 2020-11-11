Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA998C388F9
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59C9C2076E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 01:31:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlwsqDqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgKLBbB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 20:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgKKWnF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 17:43:05 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAB5C061A54;
        Wed, 11 Nov 2020 14:34:48 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w4so2399025pgg.13;
        Wed, 11 Nov 2020 14:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/zDY1txU9YKSfZBMxX5zBFPuLz5WqGhiHVEhwalxC/s=;
        b=UlwsqDqzWFZ79M8Fw7RxcklsuwDjf5UXKrNC47sCENdlujbBC5k1ybowNyIA9Y92Uo
         C5icN7prkQNh9nmAUXG5Si8jtnFMMEW/4NO3oKYESc+Bzu9yJcNqLlY+x6wt7nEEZbHt
         HnphqJEFV7i1TerWRZD0IdyY8l0Jzl2qnJIaELzwIph9k9oJ/Iu/MsDm+qoHZKMEzV7c
         ATxMqHuNf1+JiRGfNmf5gLio6+YsfwndcOc0n/Jwfm1U3HjURlEpB8YPJxSYYxh6BC1D
         QXW/+KckNB/eGCnK68Pel26Hk1y1Pvq1bIzKeJ5KqKwiqkmFA8nXFrcSHzvrYkj+vA9l
         QDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/zDY1txU9YKSfZBMxX5zBFPuLz5WqGhiHVEhwalxC/s=;
        b=ajNKNMc2SpZ6gOd7GXFf6X9d7M6x5pV+slBMOjaDdabmW3u5G8TMgo8qOROUVb5bKl
         tzgFCG+CyyVRBzVwQy3TepZju7ZwtQAuMY2nhcH21aWwkSBT+6+3eFhfga+uS4rqBAYC
         i/jj1bNBnsfk5cvRNMtWWu5DJQAasDs7cRwHwUjhOYnAqZ5eLnlU5Ba0mZRO26llHkyy
         A6iq0+Xm4IEfShnVgW1O+ObNbw3lIQN+uhS/KKqvv3W0PBAB8ekPpxV//JwIOkz8yTVa
         S9z6etmBzKtVqZ4chT0380F/45AVdS+4yovfvvfB//5Aq3s3EgPXL38bb3fL30QgJ7im
         bW4A==
X-Gm-Message-State: AOAM532py7NMjRs8rycpRxxaycCfxNz8vaM99seXG6Vl3YjKPvfskQEY
        SAnZWgfxGBR5PDiumQR6b28=
X-Google-Smtp-Source: ABdhPJxd9Q9AnaCOoG+ZhCtsAd/jU8tGhe/KqjdM2axh75mPJwCkLVtJyOJYzZwYVRBhIToy4m9pDA==
X-Received: by 2002:a17:90a:f00a:: with SMTP id bt10mr5693143pjb.91.1605134088440;
        Wed, 11 Nov 2020 14:34:48 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a20sm3605096pff.118.2020.11.11.14.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:34:47 -0800 (PST)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com
Subject: [PATCH RESEND 5/5] iommu/tegra-smmu: Add PCI support
Date:   Wed, 11 Nov 2020 14:21:29 -0800
Message-Id: <20201111222129.15736-6-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111222129.15736-1-nicoleotsuka@gmail.com>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
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

