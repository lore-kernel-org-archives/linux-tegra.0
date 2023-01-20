Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FB7C38141
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjATRnE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjATRnD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:43:03 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42FA58645;
        Fri, 20 Jan 2023 09:42:57 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id ud5so15848106ejc.4;
        Fri, 20 Jan 2023 09:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xF3f5wHV+S35suHnmllkaENFgAezZr/q4RI61G5lis=;
        b=EQMVF3SDDdX8L3plLIxJLOmmOOyQZdzuysc9Mj8mrNHfnj3Qpz+ClJTrtYqQd8Li69
         sfif4PpYEZVLcbjNTlOATImOIFno0tORUeLSPypZ5u4yunq4sngIJGOx+j3D2f8lC9KI
         FJoaOgmrLUtQ+T9oQWgfvm5d9RHdi7w3yYDb040v9TWzXFStfLsSghTZEVSZxP182irV
         4nbrq7ND33vaHu/fjY43/n+UAFndp6g18Yuo4FuB2/r7Q2wNb+CZdpCMR5TtvQLcJCw6
         Qolm6Kq/g3DtQVqY2vSFVGxKE8s/W+J+KscordVfuFq/c2yocgzPT3XCIJPAu2veK74Q
         kpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xF3f5wHV+S35suHnmllkaENFgAezZr/q4RI61G5lis=;
        b=ExxmcJpVqnd9ixLFgMFVskjSGSBZYF2RJhmLaKhcAbm6cMwkzo/L4oR8NWooCrC0/M
         3B0BS7A7MktcNFnQ9cAXJCKyoShc2OgvWl4cwswvdFb6b75EyCMCvhHfjwp/OmEsKMwF
         aoSfKab3jQqfqnCmUNpKejR3lQYBlu7KnWetmAesBBakj+pzU3PUxAOw2DVrswxtMP4k
         X9I6+1L1DNF3xDLKEb8XdWMRqbHunhAdxsASy+aprpw+HqIljkBtVSafP55myo3fuwaf
         +hv0YN2iKcWTthXGUrxgWk0N1KvIgt7XQOcAXH+XgoJ3AxRV4l3rN2MmQ4gAB7YORpHi
         1tLg==
X-Gm-Message-State: AFqh2kprqnJk1UWuOlFyQJ4vND2sFC3y/6jiSYLcSpVwERKN6BkWW88v
        hEYLHZUP0bjp/AWCkxDDquo=
X-Google-Smtp-Source: AMrXdXvfVXAglNQb1KVGn5/i/z1k7cQBmEP5ph4w5wk4z3IgOwcwuI1+Hftag/jdccDJ78nsonNdtQ==
X-Received: by 2002:a17:906:4557:b0:84d:3a95:cdf5 with SMTP id s23-20020a170906455700b0084d3a95cdf5mr15136751ejq.10.1674236576177;
        Fri, 20 Jan 2023 09:42:56 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b0086b7ffb3b92sm9936014ejh.205.2023.01.20.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:42:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
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
Subject: [PATCH v13 4/4] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Fri, 20 Jan 2023 18:42:51 +0100
Message-Id: <20230120174251.4004100-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120174251.4004100-1-thierry.reding@gmail.com>
References: <20230120174251.4004100-1-thierry.reding@gmail.com>
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
Acked-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f798c44e0903..8e023f032b76 100644
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
2.39.0

