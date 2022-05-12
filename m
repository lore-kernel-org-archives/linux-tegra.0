Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59ADC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 12 May 2022 19:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357836AbiELTBQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 May 2022 15:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357833AbiELTBO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 May 2022 15:01:14 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C5C4705C;
        Thu, 12 May 2022 12:01:12 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id t25so7666787ljd.6;
        Thu, 12 May 2022 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pR4shFXzRu26yKMEBHHOJ50AdyOlvyUzX89NewQfIKw=;
        b=pTgOa8zlPOKkdtQiYwzTqFncYfygTcbEPqQxm68+RTAsTawxZApi6+0x9bhqaFy2pN
         DgOXNDuAXXepOA5Rpn4VK5gA26QAQBKEbp+fON8YDhIrlYmwMCZoPUYW5HD/c2TlCuRy
         LFa2W/n8zf+WfPEDySvAgRJEixD0xqpsbpXMWP2rFhvk3fPNk46Ih1ETQYNY6KGOtsgv
         sBkF8bqdBbUlz/XTbJiyBQf64+eTZVDHL5kccGb21jArMLumAbjVquvYP7GaYRGCp4D3
         dh1P4d8ILL+p0rrr97BT9fi6YdAA9dua6akDdoPjpyg4xpXw6CjTMwTTZlpA1khSLzwJ
         /Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pR4shFXzRu26yKMEBHHOJ50AdyOlvyUzX89NewQfIKw=;
        b=IBVMyXSPXiDUaaFnzQH3v57ERLRMXE4VYIfeXq4mFJp5aODmlzLZiLxQ6+0OR5l1Lr
         tJncRhJXRza2j5z2ySxcvXIfv27YCnGcKFUd/yhKXOPV0nfbI+KWt4wmwdbjtfvhgXIy
         o3xvCzIByfJh8FWLlhwToQuE83fCRWs8I9h7noxLQ35nfG8NSFGo+LRyYCGiz+VUdeRc
         DNTfizk/RjU4m5jhuGnW/UVpFQhHh6LOkUGNlzqM72GbWMy6bW8PzyDHEtiASW9BAE+i
         P0sdM+setq3QZUNKvgsJLANbbqd7ZtnwBUF85/7qBSQ8azQJpM7sHHkpTRvIcUW6i0kH
         4o4g==
X-Gm-Message-State: AOAM531v+QTYsQLcStEOhKKv116ByFMru9P4RuJTpUQ2UYMUErtvco/p
        qyZsdNkWPlZt47wslo4Pq6o=
X-Google-Smtp-Source: ABdhPJxLj3htze1kQcfEsRJlLAzFMNunGIciZgl4tVQ7CLmBTIxETTW+SJa2zDMNBEkQQv1+ttJ4Cw==
X-Received: by 2002:a2e:9b4c:0:b0:250:b98f:942a with SMTP id o12-20020a2e9b4c000000b00250b98f942amr852765ljj.447.1652382070861;
        Thu, 12 May 2022 12:01:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b0047255d211d5sm51045lfo.260.2022.05.12.12.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:01:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Thu, 12 May 2022 21:00:50 +0200
Message-Id: <20220512190052.1152377-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512190052.1152377-1-thierry.reding@gmail.com>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For device tree nodes, use the standard of_iommu_get_resv_regions()
implementation to obtain the reserved memory regions associated with a
device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1ca85d37eeab..3a40ae7a450b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -386,6 +387,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_msi_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.36.1

