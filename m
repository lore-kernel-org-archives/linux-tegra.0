Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDB7C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbiKQSym (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:54:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240036AbiKQSyj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:54:39 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C17B86A6C;
        Thu, 17 Nov 2022 10:54:37 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id m22so7342406eji.10;
        Thu, 17 Nov 2022 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=Pn34Z4Yq7xj76XL1qe8LwsuFOPf2PiJM3KTxbSO6azZ4wFcgWLDo987z7RPekJ9xKc
         WP4Cqqo3LpV6/KY977VdYFBWmgqlGfPUBFZIVj38k7VdVpfFV9WeLuV9V1k3xrghaADj
         fPqHvYi0nYPYp7Geh1e0YpDhJBJhuHOC7t+NRrNlQl85KNoh7oVcCGO9ig9CjeG98qzx
         UYo8BoLnfhYYPZ8KPs4JeRnhHY2rLR4WK1NW4BlORj3+m/sUpUyTH763gkIUxA+lKwkT
         TzsvCHgu0r5fChY1CW92qCTp7C8fnRdfzI6GiovPTN5hyNSdjh4uz2P+1cEitAhb5scg
         wuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoiIm8f1+pLkMCMfNs8Z4K3LzZnaZWtse5hncoBXug=;
        b=a/uvjwZXT0e1X+0pfmVBBqomgwzTGNZihdqAOO6cqAW8oL9N2Sl7ddvEMtEKfDQL6n
         c+OV1YEaK12gg1WJeGOLgWA9Irk57mE49UCB1M8YvIPl5Fj+O+jUsknJSEOBWZ8ckMjO
         WHhON+rtJuAO+2th3l9aSKY/umFT0o9Gl7KxN1IwEQmzPTnPLTJIF+aZ0IzpdZVAchj/
         8Ud+iwmTAoqdQVunOEqeH5ljckfUtFgnEOtB6w7eBmVl3U4HfARiqOy/hwqP1hLWHl7E
         Sl/OISmnmD81vziBrFHt0lwxGoAOBPqH1Boc+dSob4A/DkQAfKgfkV9FS3ZPnB/eC3FX
         /keQ==
X-Gm-Message-State: ANoB5pncR9TVsPTlzH+cZz2XswILIhHqGqcuR8L5v2hlHsQcP15Vsibb
        rZEv+0D9kqYTEzjYwZPs5AY=
X-Google-Smtp-Source: AA0mqf5Q1AD/bfVnQCYn13ClNXUBEq2C/u/JUcTsasZu6feu6Aj9rNJFQ47i4b74DYtq3P1vvn5vog==
X-Received: by 2002:a17:906:9e20:b0:7af:206:9327 with SMTP id fp32-20020a1709069e2000b007af02069327mr3283113ejc.154.1668711275820;
        Thu, 17 Nov 2022 10:54:35 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b0078e0973d1f5sm732090ejd.0.2022.11.17.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:34 -0800 (PST)
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
Subject: [PATCH v12 4/4] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Thu, 17 Nov 2022 19:54:24 +0100
Message-Id: <20221117185424.2359687-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
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

