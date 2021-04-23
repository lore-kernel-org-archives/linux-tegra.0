Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5D2C4360C
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC6B611C1
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 16:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbhDWQce (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 12:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242153AbhDWQce (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 12:32:34 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAFDC061574;
        Fri, 23 Apr 2021 09:31:57 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r20so25009011ejo.11;
        Fri, 23 Apr 2021 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QcfymhoYhAwy+sqKo+Bx4zKEukw467+NXOcy0hVDFGM=;
        b=FESlPukByffPHu9CvLIV7AnmA2veAujkMJJetMuD+jr+PVzCDlcGJafOAtL1ymwv3F
         Sv1wT2AQN/qfkPKYWqCiG08fjIzdsljqSdAgZyMYuvcLX/78WjHkxD64Y2Gjs+kS9zC5
         jedlkF5hxMPycWay51n4Zr1F7iVkeTmILL72NsBTWhbfQcbIcD/tMcRH4xcr0hnZCdLS
         V+J4oVzzNRRX/8dDMs8gD6+FYhb59ihRfUENXomHxVjM16BmCrE/Ti1IuYPIxyDl+FfU
         xcC8Tw8MAtWMRHvWFUIEJW9jxVV/58cFPJQwtTaB7iT5dUQh0J4j2VUNkvfbJdJIBwvJ
         nMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QcfymhoYhAwy+sqKo+Bx4zKEukw467+NXOcy0hVDFGM=;
        b=JZaStCSmHrtH8deow5YUau35ifBPu481cbfxBzqtvN5H3C+BhCIXU7r4QeOGdyMjMl
         3c6AqRR54anqmFbr0Za/oDcU2vmk1MkEljIZ1smJDK/+7tr05jOtoaHIgKk5piWEZImT
         tzDpWra/0hvAQQ2h1QEomam6SbjYvF5IUppm3VewfIHbl5i4jB2WzZ2MaaotNbpwECZy
         J1PlMyA4wwzjwHfYftvRYKUUwLXqH9RGss7M5uYIzQtCxdkM8I6wx65xKxsTNYJILzYa
         vIRlmp5/nnQUBZUe318TjgqV4Vr90FGAxOA2CaLHP9W+/KHcUrknKueQfIKNC71rJmLv
         FKxg==
X-Gm-Message-State: AOAM531d57nhZbUVpIj0Tn8pqSXFoANxt69TwMR4eEx1h2oWQLrMwCTF
        uyYqUU3vO+YgbfZF7psO8eKjDwcbEc4=
X-Google-Smtp-Source: ABdhPJwoBW+602wRSEps/+5/WYwBNnRe76Ww0Z1tDKz4LgLLc/4LOl5Aj9cVnMsdyWPG6VZDxQS6og==
X-Received: by 2002:a17:907:daa:: with SMTP id go42mr5140586ejc.120.1619195516115;
        Fri, 23 Apr 2021 09:31:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a22sm5064750edu.14.2021.04.23.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:31:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Fri, 23 Apr 2021 18:32:32 +0200
Message-Id: <20210423163234.3651547-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For device tree nodes, use the standard of_iommu_get_resv_regions()
implementation to obtain the reserved memory regions associated with a
device.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7bcdd1205535..52b424176241 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -19,6 +19,7 @@
 #include <linux/irq.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/swiotlb.h>
 #include <linux/scatterlist.h>
@@ -190,6 +191,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_msi_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.30.2

