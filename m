Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F36AC47426
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A9B020708
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSmAL+uu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgI3Isk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 04:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728662AbgI3Isg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 04:48:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 520DAC0613D0;
        Wed, 30 Sep 2020 01:48:36 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s14so607679pju.1;
        Wed, 30 Sep 2020 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vyojCx1R+z/iL8Xt/dqLsO0bSZnbMhzjt6sea10xylU=;
        b=WSmAL+uuRBrBqhY6aSg0a6n68R+6EUbVEd7KHVPEeadOgBRDlwQl7NrWFHFJJFnLCB
         /4N7ul1+3j7PUNEhIVbKQ+schdNZaCR4wKp9YHyeCUwy4bmagSX9uYh9476zMmcGmUR2
         bbuwwEm0r5lyzFKbVUm7kpiOAgsWHqvxzB78R8gGQ8q7paS75IBvX8B55a3zFn7/On92
         uA/raz0ksuGckST24WaUMBCkiKoD2FfRDkhic+J6anV5WFZaPuGu6fGAt01NdfKo/ExK
         QR/xIOqR70bSoqN9AMagi4MqE1F49nQAbMclQVBPAEJF21xJp7FshEUy53l+xBfT33At
         Mq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vyojCx1R+z/iL8Xt/dqLsO0bSZnbMhzjt6sea10xylU=;
        b=t6SaPBOMMp0EDRrHuwufh457QLSdIDy1r8zH+2eHHTbflrwToGxyaaZAXs4PYzzJru
         /aEX/ll/hG203AUF2tZV8KoP6sZO89Gd7GM6VeQqcKmFy0vkuLEjQKxr++Z68bhQDqrQ
         tpAYylB0WmVwE24cV+VwjlIOVjdH6L+yaiOy/vyATXeNytRtFlg1IwgrwcnoqWC4TK7k
         PQfWF0yTsSlFtH1wimZGt15sxUwXnlK2mb1p2Q/E3cs13Jh37aG/CLRPMi7D8AEU0LaO
         FZXERN8283uFncsdmDD+GUFyb2AuIdbG9QcJJh1RnOFul7x87GAb9nPnOWIMg24UKYr9
         a8RA==
X-Gm-Message-State: AOAM532gc+YJDgUDKxkNha5JFes4HZ3yIzrbHa50RlqeDiR1NgygNj3/
        EaXN+oDh5jSNf/BqB/7Ywvw=
X-Google-Smtp-Source: ABdhPJxhDuDBMmsmY43fl1Hx+QRRN1XlKonCCkywZkb1zviPR+Xi+9EOx4fWjXPx8R8oSyE8F/m61Q==
X-Received: by 2002:a17:90b:f09:: with SMTP id br9mr1698101pjb.102.1601455715823;
        Wed, 30 Sep 2020 01:48:35 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d17sm1505830pfq.157.2020.09.30.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:48:35 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] iommu/tegra-smmu: Add PCI support
Date:   Wed, 30 Sep 2020 01:42:58 -0700
Message-Id: <20200930084258.25493-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930084258.25493-1-nicoleotsuka@gmail.com>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v2->v3
 * Replaced ternary conditional operator with if-else in .device_group()
 * Dropped change in tegra_smmu_remove()
v1->v2
 * Added error-out labels in tegra_smmu_probe()
 * Dropped pci_request_acs() since IOMMU core would call it.

 drivers/iommu/tegra-smmu.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 636dc3b89545..db98ca334eae 100644
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
@@ -882,7 +883,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
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
@@ -1079,22 +1084,34 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
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
-- 
2.17.1

