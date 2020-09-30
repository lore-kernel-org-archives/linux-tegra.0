Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C29DC47420
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 00:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B90A72071E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 00:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Czv7lJP2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgI3Aft (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 20:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgI3Afr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 20:35:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB22C0613D0;
        Tue, 29 Sep 2020 17:35:47 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 7so5378317pgm.11;
        Tue, 29 Sep 2020 17:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T6RkMef4n6SDIVMgJJ8cgrOCjBvonOscs59BNDVkkmE=;
        b=Czv7lJP2qKVAK/tsi9LxL5aMg7VImOQMCk30SvUz+hHVdh9QKVXkuaaoy6+rcTHyoh
         we9uAPnlcF6UDiDXAXO36DSEtA5ZoQ0dJQSN8GIlkmLY9RW1/NB5NKVT4wLR8+fOuVpg
         RqLMOmg5LqVDw9lEycOl2OxZ7zqbn/7Alcd03KhWPVLAscLsHtSb9S90cTAdBP040wUK
         umSF4jHx4sWI6dTprEYB4r1cVhYYkmwxJxFzeAe/4gw1XDvNiexZghSJ4MeGE0pK6k0j
         7Dd9CWl0B97PFhy3TcC4M3AB/59Wog+qhILI8nAB7L0n+FLU4uo2aGHZfSpy6WsTmO24
         GIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T6RkMef4n6SDIVMgJJ8cgrOCjBvonOscs59BNDVkkmE=;
        b=D1NG+bcv/VmgphhSdr6qtQh2Cp5wjEem+oULAjpckb+dyt54pgouLOzjOp+TtFgByl
         R/bI0iU4MgL46JS/g8ZTdGqAx7kFBy5WqeqIUsj0EyInVejh0fGS0BAdelewArK4Jw/U
         f1y8xLtyH+mo2eDSwKAThOwWW6wPMnjtrzGKaJ0E20mxzsxTURBKyspW8i+kqExN9SGl
         +ns6RE9x90HtO4i1LjmKndIfnxpo9oTWLpnfUrkuduLa/wpzIpenpoD65iFECgYALw0T
         A2E9CI6FGGbc3Mo8piWHvqipmuZcAoR7pKs91JU+IpSJXKfl60SaaI+C+OVKn6K1O7GK
         GCTg==
X-Gm-Message-State: AOAM532vnLk5yHSI7oxlaYBDLgjarwu2WU93XLWYESUld51MaAHBHnBB
        G9Fya6v3RVbxpTE9DJWD1tA=
X-Google-Smtp-Source: ABdhPJx3OjYAAoX2wmhV2QVQyvwp3Xov47Mvenoy4exyCMLCnbfuteJNwE361RmUZHOZ1/YYW3fMAA==
X-Received: by 2002:a63:de56:: with SMTP id y22mr152276pgi.166.1601426147352;
        Tue, 29 Sep 2020 17:35:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id x185sm6904738pfc.188.2020.09.29.17.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 17:35:46 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Date:   Tue, 29 Sep 2020 17:30:13 -0700
Message-Id: <20200930003013.31289-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930003013.31289-1-nicoleotsuka@gmail.com>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices. Also reverses
bus_set_iommu in tegra_smmu_remove().

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v1->v2
 * Added error-out labels in tegra_smmu_probe()
 * Dropped pci_request_acs() since IOMMU core would call it.

 drivers/iommu/tegra-smmu.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index cf4981369828..74d84908679e 100644
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
@@ -856,6 +857,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	const struct tegra_smmu_group_soc *soc;
 	unsigned int swgroup = fwspec->ids[0];
 	struct tegra_smmu_group *group;
+	bool pci = dev_is_pci(dev);
 	struct iommu_group *grp;
 
 	/* Find group_soc associating with swgroup */
@@ -882,7 +884,7 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 	group->smmu = smmu;
 	group->soc = soc;
 
-	group->group = iommu_group_alloc();
+	group->group = pci ? pci_device_group(dev) : iommu_group_alloc();
 	if (IS_ERR(group->group)) {
 		devm_kfree(smmu->dev, group);
 		mutex_unlock(&smmu->lock);
@@ -1079,26 +1081,39 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
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
+	if (err < 0)
+		goto err_unregister;
+
+#ifdef CONFIG_PCI
+	if (!iommu_present(&pci_bus_type)) {
+		err = bus_set_iommu(&pci_bus_type, &tegra_smmu_ops);
+		if (err < 0)
+			goto err_bus_set;
 	}
+#endif
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		tegra_smmu_debugfs_init(smmu);
 
 	return smmu;
+
+err_bus_set:
+	bus_set_iommu(&platform_bus_type, NULL);
+err_unregister:
+	iommu_device_unregister(&smmu->iommu);
+err_sysfs:
+	iommu_device_sysfs_remove(&smmu->iommu);
+
+	return ERR_PTR(err);
 }
 
 void tegra_smmu_remove(struct tegra_smmu *smmu)
 {
+	bus_set_iommu(&platform_bus_type, NULL);
 	iommu_device_unregister(&smmu->iommu);
 	iommu_device_sysfs_remove(&smmu->iommu);
 
-- 
2.17.1

