Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7972C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 06:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FC46206E3
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 06:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tbbxizGz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgJBGPA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 02:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBGO7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 02:14:59 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34847C0613E2;
        Thu,  1 Oct 2020 23:14:59 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so150902pgl.10;
        Thu, 01 Oct 2020 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qXGNqQhVeWRXwkLxWO9NE32gvOp7FRxlv449PGRmjRE=;
        b=tbbxizGzyYFtEdkzs4ZhGsQfqdyil04FfDQWafr5IUghUdQh1JrSMv80UBgF91tLlp
         YGiRUA4QV07rT+oo8zMtVYMVCJo9PPrLeW8x5gBQ9QywFffChttS7ZPYxNwqVu+Sineh
         N4SeBNSIIls3mN8gckW/ay1r6YJMUcquuc/w1Jr4rBkbYXwLKZ0/RTcjyMLHLGr3Ysl9
         k5rfK6gUwA+Ga34MSF/28ccCyGYD2k92trgOT7MQbKEa+RJQVI5tCQwjvFOEZ2/bVSC1
         PUKkESd2Ul5A5a15HZ5iT/Ocn7/zM6mBmYeoex7E8rlhODvXEaM69BpF7xKQaAphm+T7
         yzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qXGNqQhVeWRXwkLxWO9NE32gvOp7FRxlv449PGRmjRE=;
        b=pfaHEhXHVMoA5k1gr8wB7kdRo5X/9wmjXmbnp7HvASaIL4eswZkqeD2ZC+YV/H+ZIf
         67C0mjg0eC+Z7RRTj/Fz7Dq6yMmPAQqq1GAcxtxss54Z53G3h8hRZqr8n5dTyhYjj8UN
         HzeGYHAaRsk72S6WfzYiek8LsA5gmbeT4k4uFfLpuX4pse0KxQWmw+mgLdhB+F5y4lJA
         jSjImDuTjnIvqQSzw9CSk7kFz7JEGDKndwOJp8/IiIJqV3DlgeXtmETS8Bn7YtJ1tA/t
         nVaIvDyZA32rRYsBiwSLwvq/DkIdl0Yw0aVGbx2iBM4P9v96X+EeiHLVInAvazAhGb02
         w2TQ==
X-Gm-Message-State: AOAM530O/WFiBdTxd5rs93aaKZJjm9WrJWx+uNTotQyb0+j55/WhcZat
        l6RQwCd6OplGU1OxBc6MHDFeXODhlB0=
X-Google-Smtp-Source: ABdhPJx7kP/IGJVxHPL9VMKDuHXuk9JMWkPkvbYeBcoIWDrtVw6kM5DcsnrPAnjzWnhKGye+xjddow==
X-Received: by 2002:a63:24c2:: with SMTP id k185mr611501pgk.421.1601619298768;
        Thu, 01 Oct 2020 23:14:58 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id x4sm577429pfm.86.2020.10.01.23.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:14:58 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] iommu/tegra-smmu: Add PCI support
Date:   Thu,  1 Oct 2020 23:08:07 -0700
Message-Id: <20201002060807.32138-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002060807.32138-1-nicoleotsuka@gmail.com>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v3->v4
 * Dropped !iommu_present() check
 * Added CONFIG_PCI check in the exit path
v2->v3
 * Replaced ternary conditional operator with if-else in .device_group()
 * Dropped change in tegra_smmu_remove()
v1->v2
 * Added error-out labels in tegra_smmu_probe()
 * Dropped pci_request_acs() since IOMMU core would call it.

 drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 02d02b0c55c4..b701a7b55e84 100644
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
@@ -1069,22 +1074,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
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

