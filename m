Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD2AC6FA82
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiIWMgO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiIWMgN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 08:36:13 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD39112BDA4;
        Fri, 23 Sep 2022 05:36:11 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b35so104659edf.0;
        Fri, 23 Sep 2022 05:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d/yUuWWWXl5ESaI6tj/y3SDZ6qLNIH1D9CJraoESCUk=;
        b=mZYMTlY53jZxyCxt6S2/Cc47i7NGZuMBASDB9iBcHIAvNm32EHSV1NTrvFPVpNSviw
         xI1fxz1kruoVzVIvbpOgNfpWmydt3Fm9/jaCI55EhT8qEtcLsPwxpaZTiZpFhGcF7L0H
         u4pB8X9WX2re7Qk28suZ5vv9Xncb1IwpISGsWIGoO3TRSho5uzwHxlra5Ctqb7O4B823
         KOeePgO2i6gDO3JC6LX/H3TJXIWTrTVM1c4ZIBdEpnBQoI7CqEup39qRH4cdWe2IJyI6
         OsuT5xGnNMuQUCxGtV2eKjMJI3Afel/UbAu9n6jtd9oUPePa0ctmoPmcLf3B9ecw2tiG
         XqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d/yUuWWWXl5ESaI6tj/y3SDZ6qLNIH1D9CJraoESCUk=;
        b=P2b3hBDZiUYWS+4Is8u56sEUIYfsbcV+O83BT+scSTF1KWiyIITNEz2TgMrRquo05q
         1hKZP6SqZXzhEqcRdKkyNMMhFdBp3zLlREVD9Ps+j7FycwIsJZXyHrcM8zWDAFXrv/Oo
         Xqrs7XHWSuH8arr2w5dqDKTTPn7DvlF06HfYYgUVKAJ134IGGHkj42xriDf1bvnKHqrK
         NU3syUn2U7YKvZvHBjrzr9hjk3Pvfq68OCLyS1f+b/07GD6XfIwXkncQORUDBJ5I75Rl
         aVzK2ZRGQgfLGFPLB/BTgXN7Efm54vRpsp5Oi0oxezHDV1rNZpCKqwziR6lcIf923qhZ
         pgDw==
X-Gm-Message-State: ACrzQf2wfnjDzJxuGwEanSOHk3EwUkxzkmKMm2zv22lL0TMITDgBsoKt
        BJAYT8yCVCbA9CMYPHBbglw=
X-Google-Smtp-Source: AMsMyM4NSEv1rO6MuysjMbNIPIJCT28Pneqsw81YD2o382aJzYAXQ6uJFboa6Xb+hC1QGpITgFcvZg==
X-Received: by 2002:a05:6402:11c8:b0:451:7220:6343 with SMTP id j8-20020a05640211c800b0045172206343mr8052630edw.184.1663936569926;
        Fri, 23 Sep 2022 05:36:09 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s18-20020a05640217d200b00451319a43dasm5511848edy.2.2022.09.23.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:08 -0700 (PDT)
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
Subject: [PATCH v9 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Fri, 23 Sep 2022 14:35:55 +0200
Message-Id: <20220923123557.866972-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
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
2.37.3

