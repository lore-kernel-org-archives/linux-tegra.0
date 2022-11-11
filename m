Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3942C43219
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 16:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbiKKQSX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbiKKQSW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 11:18:22 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E4470185;
        Fri, 11 Nov 2022 08:18:21 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g12so7065893wrs.10;
        Fri, 11 Nov 2022 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=M52kVvCdx0HRD9z9mO1F8e0fzsb2XcgwgybCoobS1hQT8sGGISqPnVCB3+/jzIwjbM
         IcmfSIghOi9oaXPVGtN4FLLVY6yX9AYrfidV5karpgA/1hVM5luKnWGH+vitU2uYCWd6
         5eAIUc99r1DKRSyiUg31h5/pevHaGtpvNrjq4uXCccfWhFGyUeBMHxBg1wEaSS15kwtQ
         Dzol1yom695mWpOamueMBlsyP2In7gaLsfsBFKiI/6d24mt+muHy8ezDFlmhwUnpWJCh
         vswyh+nwYf/nr9Wmg27iqKW1iSuHN8yPfjtTNDldDE1hWCg4Kx68TrM+VQxAwiaLC08E
         0MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=TpRrrBXlTUCGv5dWrk6d4d7ahp8uBVppIGBI3IfuI27VvDDKjhZrUCiSrWEtJSjDpx
         3AOOcV4Isr/bFK8zONnFE2MNRuUlVk979J39flfK7jFOiNx2jEJoFiPAyPO1d+6zX51j
         HsT/ixKBtKcTrOa6Eq+39beSD3wryj36AvfE9hzegb0quOTQ9WXJBgbsZQSljT7BUVCi
         oraotS443VUc4VzQTX1pO4PGFLvPsQMfWcljcJhkUTr+dqFOmgO/WnNKfStu8D+ntBXI
         kieYN4a1Zzuo5aP1EYwmBTbvLMEMQ0e4Wr7v6SfYG2OMASRQcJzqMhI5nPr3MD6JPddW
         sdaA==
X-Gm-Message-State: ANoB5pkzyk6JNV//JHaouJjwWvpglaOPoqCVfixo8J9ylc0FnfOgYjEr
        MP+uVLb0Z3qMmv0U1S0Q9MA=
X-Google-Smtp-Source: AA0mqf66bmefffZKNUwzzvTsT6THe6UE9dqH+ghD/eURunUNMVYZYLIi7Xzlg12UKZcN7BG/l8mFVA==
X-Received: by 2002:adf:f0c2:0:b0:236:7c38:147b with SMTP id x2-20020adff0c2000000b002367c38147bmr1621819wro.569.1668183499650;
        Fri, 11 Nov 2022 08:18:19 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s13-20020adfea8d000000b00228d67db06esm2308030wrm.21.2022.11.11.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v11 5/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Fri, 11 Nov 2022 17:18:06 +0100
Message-Id: <20221111161806.630527-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
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

