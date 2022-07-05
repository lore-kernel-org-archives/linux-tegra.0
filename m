Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCECC43334
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiGENhi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbiGENhT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D367479F;
        Tue,  5 Jul 2022 05:58:46 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r6so3747111edd.7;
        Tue, 05 Jul 2022 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8sz6qEujOk4h013kpPVYfRwZBm/BZHYeZBvWv+Q0zw=;
        b=oEUGLjgUVdWwQ8k+Y2aWyvkFjYZ3FREb6j09KGl8Jx14hqcpyFxW6LE9IUy+chauBa
         pottkoAMu9N5SPumEiE1VbDjcFglEgUgHw4KTk5kkFZ06APNckDvsEX/as07RfYHxrjY
         ydbwBesiWVEr49nkouXPKAgE+3LcHXjs9E6OGOMWhb7udusNFp2uWfwu/4tF8hNgX1Hv
         rLGVWnkpyJymnmZf7aq1AcUGx0MkkWjn1YRRoYNWPsrFO1djf3UkjvKocWhEsuodP9Al
         tzNpzhT7WncOiXk+7E/3VhYWsn3jP6orS4gpnkktdt3VlZnSm1MeZc4w79wOV/Bwlljf
         MTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8sz6qEujOk4h013kpPVYfRwZBm/BZHYeZBvWv+Q0zw=;
        b=kCAWURA5Cu/Y/o2SF0yPY02euEGRRTQyJBBiUd6Gm5n1rjbxSC6lN5pmqcMqMrB4Xn
         L0nahSGSp5u7Pa1m87sM4UGvN/Nncs3M0jVbhflCqExN18Waz9QsKuW1d+Fqb7rt72WU
         C5/CVxpOIIbLcoSSYKgYs++g37DlFik9ALd8QDDNSFESNerBBH9+crvrm/y9XqsWG935
         3MT+f+5HJecDuzPv7e7WNlwzk6ZnSKhmxpuVHlFIU8XvDt90uGzhOyGHMjbYWfO3CTRK
         xMGY8B9kl1+kBp/V6WfAC5oXoxyhM6fAZkLGc+BQdKUOT/8xj46rVScB/kLORi/uIgT5
         DaRw==
X-Gm-Message-State: AJIora9Ptrvfb0uKx57HduxXRQlvcpHh1e/et5qOQZmVYWN9TptCIA/K
        fx01cYa5WRg7ORdmm5ZS5wY=
X-Google-Smtp-Source: AGRyM1upns2GtVrLDYg10SyzedcRjRBfIM0zN31nsHmp+MMQ26hybeFXZC6J46sU0RG6V0NzTHIX/w==
X-Received: by 2002:a05:6402:26d6:b0:435:ba41:dbb0 with SMTP id x22-20020a05640226d600b00435ba41dbb0mr46048821edd.242.1657025924863;
        Tue, 05 Jul 2022 05:58:44 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id eg37-20020a05640228a500b0043a587eb95dsm4535515edb.5.2022.07.05.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Tue,  5 Jul 2022 14:58:32 +0200
Message-Id: <20220705125834.431711-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
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
index 1910f4f1612b..84fad59bc789 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -23,6 +23,7 @@
 #include <linux/list_sort.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -389,6 +390,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_msi_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.36.1

