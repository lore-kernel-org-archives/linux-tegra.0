Return-Path: <SRS0=Zq/d=DL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083B4C4363C
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6FA9206B5
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Oct 2020 22:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrjEUpaO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgJDWpL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Oct 2020 18:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgJDWpJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Oct 2020 18:45:09 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E14C0613CE;
        Sun,  4 Oct 2020 15:45:09 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so4622115pgl.2;
        Sun, 04 Oct 2020 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tH7CH0xERnssTzk2TZ8/B+QGzBaLA6HcrfNelQzPQmk=;
        b=PrjEUpaOD8OzReAH0XqyAEAQ1ebhwlj0dgDQiZCRLSwTNqXTtJvGfEexsHfJfm83i8
         YEn4mxf+HoNF8iuy3+dTFX5hF2BFbZ2ogJYcU3yeQeuMnk2j7sWbXzfngFc57fPTYkIw
         Qm8T/+wbrzn990feUc9ZfEGDYmR9+++i2XX2cja9kbrnFcI91dSHY49bzIn9YrjYaXT9
         EDj9ki2iHJwExh2wXtsfsD8PUiEFkds43lNUR/e1Yjjc0VQ5aSHuubHWpvcoQpXPqfR0
         cuh8nb2SM7GBc3D5OdzzBskLUuUgNUFeleSi2lHvTKvuJbl1YViq+tX3zNsQwsJ/nRTt
         4iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tH7CH0xERnssTzk2TZ8/B+QGzBaLA6HcrfNelQzPQmk=;
        b=Iwf/dI9ZCJXXiAtKA4H3pPDTYmek/nqjQjzHWoHEHL7NZHu3Qrrv+ZShW0qzv8I9Fy
         /NOVUB7/jX0LeKZAbdNat1Yuz1TVEOyOgAGcZNS/PKsste7b8TzG0CZQvKKHZ9Pg4/w3
         95G8iN1Q9m6glFbdtRLnxIIZthqv8Y24EYoCY4y0mDZHVDAhZXGRNYOvSxjlYGNDUIbO
         AE/M8emIdMtVct8Qn84JxcPQEneQFK1p7is+Wh1egnFzXv6EmLeT87tBla8ZDCptaP4n
         WYCfuqjXWELEfyNEnE04iNN4+kGY4859nASG2/pxfPs9nLPI8yHE30YE65HFaGSHiXKm
         rRuA==
X-Gm-Message-State: AOAM532wfgksNOus1/Pt1mdqypIdnBI7rtgbfL5dBY0DIDvFZxcmrKQ5
        wbjO6Jed4Dy1z6nAJm8lvw8=
X-Google-Smtp-Source: ABdhPJxWbzDo+6M2tYfJrFl/Uh9lGBrRAaf/Gz/fMSH3YjwYmxjtZxgWyObigauM21d4CXUxEseKAA==
X-Received: by 2002:a65:628f:: with SMTP id f15mr7670588pgv.168.1601851507460;
        Sun, 04 Oct 2020 15:45:07 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d129sm9073236pfc.161.2020.10.04.15.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 15:45:06 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] iommu/tegra-smmu: Add PCI support
Date:   Sun,  4 Oct 2020 15:38:37 -0700
Message-Id: <20201004223837.15303-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004223837.15303-1-nicoleotsuka@gmail.com>
References: <20201004223837.15303-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch simply adds support for PCI devices.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
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
index c3a3131543c8..e54c006dedd1 100644
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
@@ -1068,22 +1073,32 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
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

