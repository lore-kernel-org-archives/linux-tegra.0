Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60A8C43219
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiKCNjK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiKCNjJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE25E5D;
        Thu,  3 Nov 2022 06:39:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id v17so3032726edc.8;
        Thu, 03 Nov 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX22cDpWGlUuPxGTLIoQK3Y1p1D3Uxlzij7fXDiiEFw=;
        b=gCwldoBtj07aHAVjZpRaiNAtJQ1xpBdafZG15M/Q3V1MC8wcFh7zyLLFtYXqzeS3QM
         b/+iffDp+4mGfJqqkBCJfApgA4mpiJAmBw5xFhKWkaSkHoqVrPsi1oX3TDAYIDpiQ8MV
         q6hHuEoEEwwW762kdwY9ho8sHTjYuRn97iw441xMfVY8KB0p03uJExrFwLCp0dVnwGgX
         Cj6B5qUSYZQQEWlHRlKdFxRF4wdD1svlRdDwUoGhqme4XJS6/8Ti73PRKQ+YPQVjsf8y
         fb4kyUeL0ZbelUPBatu/Ah0ksNFlMOgJxpJaIbIP5Gd3KokT+hTGfFQ4tYRiTJPTVonI
         bCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uX22cDpWGlUuPxGTLIoQK3Y1p1D3Uxlzij7fXDiiEFw=;
        b=cidKcyyGTwrnCcVgGz3QXP68nZRra7R48ik9416kdBSog2Ai7THrpqSdJYT4bPMwt2
         k3AQpt1yAi6ojiAiEbB/rMThmU7YcbeOsjTzTKa+tUtZ8oIbgpWCayQkYe01Rdk4dyvw
         Q3zz2Wi5XpiOsBrXAmfT3zupAA/no67FwyzhxqbugS56I/xlGs9txcHBzadbOltDEkVa
         ppzp+2yN3EiMovTJF+gPR24dsytkQJvZnZYxnyCyEDJR3qjcwVwcyQJzG/UMaDgN6nM4
         yYyp3dg7kDnkrV+FkrD6vyLUL5VWExHXsqBKA/sYjLN3MYRYMZz9p7gZqRlL8fAKrfMN
         tcoA==
X-Gm-Message-State: ACrzQf200WHn7ihJ2ffjUXq1x58DpJl9dbMmthDCT8NiNGjWPOw28C5S
        gt5udBB7VRUAVgeRdUhKCuM=
X-Google-Smtp-Source: AMsMyM6jDCSoXipugN3unbx1tOvfIW9T5HX7oiqQN2D4iLqyGC7syC2gfpyaEgdiggi/2ppymGLyGQ==
X-Received: by 2002:a05:6402:42c7:b0:461:bea2:8a70 with SMTP id i7-20020a05640242c700b00461bea28a70mr31280033edc.261.1667482746439;
        Thu, 03 Nov 2022 06:39:06 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906259400b0077d6f628e14sm516444ejb.83.2022.11.03.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:05 -0700 (PDT)
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
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v10 1/5] of: Introduce of_translate_dma_region()
Date:   Thu,  3 Nov 2022 14:38:56 +0100
Message-Id: <20221103133900.1473855-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function is similar to of_translate_dma_address() but also reads a
length in addition to an address from a device tree property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v10:
- new patch

 drivers/of/address.c       | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/of_address.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c34ac33b7338..14f137a21b0c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -626,6 +626,47 @@ u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
 }
 EXPORT_SYMBOL(of_translate_dma_address);
 
+/**
+ * of_translate_dma_region - Translate device tree address and size tuple
+ * @dev: device tree node for which to translate
+ * @prop: pointer into array of cells
+ * @start: return value for the start of the DMA range
+ * @length: return value for the length of the DMA range
+ *
+ * Returns a pointer to the cell immediately following the translated DMA region.
+ */
+const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *prop,
+				      phys_addr_t *start, size_t *length)
+{
+	struct device_node *parent;
+	u64 address, size;
+	int na, ns;
+
+	parent = __of_get_dma_parent(dev);
+	if (!parent)
+		return NULL;
+
+	na = of_bus_n_addr_cells(parent);
+	ns = of_bus_n_size_cells(parent);
+
+	of_node_put(parent);
+
+	address = of_translate_dma_address(dev, prop);
+	if (address == OF_BAD_ADDR)
+		return NULL;
+
+	size = of_read_number(prop + na, ns);
+
+	if (start)
+		*start = address;
+
+	if (length)
+		*length = size;
+
+	return prop + na + ns;
+}
+EXPORT_SYMBOL(of_translate_dma_region);
+
 const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 			       u64 *size, unsigned int *flags)
 {
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 265f26eeaf6b..376671594746 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -38,6 +38,8 @@ struct of_pci_range {
 /* Translate a DMA address from device space to CPU space */
 extern u64 of_translate_dma_address(struct device_node *dev,
 				    const __be32 *in_addr);
+extern const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *addr,
+					     phys_addr_t *start, size_t *length);
 
 #ifdef CONFIG_OF_ADDRESS
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
-- 
2.38.1

