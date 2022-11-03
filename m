Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF394C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiKCNjR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbiKCNjQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B63B9F;
        Thu,  3 Nov 2022 06:39:15 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id 13so5340719ejn.3;
        Thu, 03 Nov 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=WOIOrTs5wDw45r6z1U4MpbhJq9ZryvRk3zOzSYUmYMec/MQxf3XmaBKYvPOrW9phMZ
         UAswei6GmqvYKULPZKvu4EC06uAQ3oUPdBDaCRnvqBxURM5H8nk3rW7ZwO9vnG+KibgH
         /kthT9vb9jS7RjOfaei8dc5/58TXTJsFwgDhJNGQ0fasmyfpK6C4NtDXrAgdEAvBNbKt
         t2AvI09T0oeHAtBBYcRli8B7NjxKYYktBKvoMLPeardsdEa7xfCz/8ReTq4U8ouZmFP2
         +CxXTIzPpF1A5apjqogM+4+goqbUNtpG4Jj2t8eAG/jProlkpbSvAbr+EnMfNxk+8l7p
         DNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=WTGcB4mfmuYgXsuMexgM7/gTyWIClX5IWrdBnx6nkqk3UEeOEiDdbG8deVeN/ednm5
         SuX5z5at4zWAPf4pyGX658GIirxf9JocyzajrY0PnlL7WiuzLwpMkdXP4wuOOSzRGH/p
         XuvGGuXXEoUHbWIVF9Q9aSnsy8kNBru65/pm2RBFp9WVHS58YR/paXaR/H/JsEMzrDRn
         Re3YELRgV652MzCDXMyFV1LIZ9r5YV8/6pGO6J+HdQksZJR7GAv5b+xdZLOacubcZ1XF
         GgqIrG1VPefQQXl3SasjeZ+7245zbk60SKNwq2VUjGJunZBZLMrrAg987PEZ4uUS+Ab7
         kCqA==
X-Gm-Message-State: ACrzQf3GkLbVF+op4d5q+PsvG7CAtaKbhzKSQGurYvIGw0kjubSGeB5p
        2gdm9nctHtVFkrQMfCsg8bo=
X-Google-Smtp-Source: AMsMyM515jSAgrgtrPv6W8cuyVKGjXoGniUUGUbH7rNavvWKdzFTbZakrYtH2QbWOm5oPcugOCAcuQ==
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id wz5-20020a170906fe4500b0078815a57495mr29363453ejb.633.1667482753890;
        Thu, 03 Nov 2022 06:39:13 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709064a9400b0074136cac2e7sm510618eju.81.2022.11.03.06.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v10 5/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Thu,  3 Nov 2022 14:39:00 +0100
Message-Id: <20221103133900.1473855-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
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
index 9297b741f5e8..709b05d3aad2 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -23,6 +23,7 @@
 #include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -391,6 +392,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.38.1

