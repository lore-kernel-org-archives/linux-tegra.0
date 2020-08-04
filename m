Return-Path: <SRS0=3r2u=BO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8441C433DF
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 07:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A67A2076E
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Aug 2020 07:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="AQhEyqfX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgHDHxM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Aug 2020 03:53:12 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17401 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgHDHxM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Aug 2020 03:53:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2913b70000>; Tue, 04 Aug 2020 00:52:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Aug 2020 00:53:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Aug 2020 00:53:11 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Aug
 2020 07:53:11 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 4 Aug 2020 07:53:11 +0000
Received: from amhetre.nvidia.com (Not Verified[10.40.136.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2913e40000>; Tue, 04 Aug 2020 00:53:11 -0700
From:   Ashish Mhetre <amhetre@nvidia.com>
To:     <vdumpa@nvidia.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
        <swarren@nvidia.com>, <Snikam@nvidia.com>
CC:     <SW-Mobile-Linux-Upstreaming@exchange.nvidia.com>,
        <SW-Mobile-Memory-Core@exchange.nvidia.com>,
        <linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH] iommu/dma: Add support for mapping memory as device memory
Date:   Tue, 4 Aug 2020 13:22:38 +0530
Message-ID: <1596527558-22566-1-git-send-email-amhetre@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596527543; bh=GKfXmJWpyHbe++ETkC578LGd6aoYwhr4yuRFYgrseTM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=AQhEyqfXD7BD5EcUOFfro46xqobPFxwK7fGn59DVT81QjaaAXMXhzJJ4wgTyD4fy5
         PPkZMP2OQUP1Nt5tbMo1XJhP1UoJv5ymC6H3NW+y1M1Dpqc/ACyAmufwSeGlcNKtKN
         bNSv+z4W3st9R+7k4WNyXTH53KbeH7fy77P17AN5aX7XMRTjdw3sEIA+lI98E9mrM3
         Z/Xn1TVzoN1faH7YHmLphOMUhQ9BBlh06MTCXvrXZsIssWkRjB3NPClqUnOGx1kDAv
         Q+MUsv9qnejsgP5lv9Dws2OudcnA91jHa2vuc51KHwdxCCHo1E6wWNrxDpNxXWvFuM
         Mvc5vWCF1aQmA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add DMA_ATTRS_DEVICE_MAP attribute to support mapping memory as device
memory.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/dma-iommu.c   | 3 +++
 include/linux/dma-mapping.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 65ac889..0e411ef 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -388,6 +388,9 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 	if (attrs & DMA_ATTR_PRIVILEGED)
 		prot |= IOMMU_PRIV;
 
+	if (attrs & DMA_ATTR_DEVICE_MAP)
+		prot |= IOMMU_MMIO;
+
 	switch (dir) {
 	case DMA_BIDIRECTIONAL:
 		return prot | IOMMU_READ | IOMMU_WRITE;
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58..b0cb1b3 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -68,6 +68,12 @@
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
 
 /*
+ * DMA_ATTR_DEVICE_MAP: This specifies DMA-mapping subsystem to map memory
+ * as device memory.
+ */
+#define DMA_ATTR_DEVICE_MAP		(1UL << 10)
+
+/*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.
  * It can be given to a device to use as a DMA source or target.  A CPU cannot
  * reference a dma_addr_t directly because there may be translation between
-- 
2.7.4

