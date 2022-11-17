Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8722CC43217
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbiKQSyg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbiKQSyd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:54:33 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC1186A55;
        Thu, 17 Nov 2022 10:54:32 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id bj12so7308478ejb.13;
        Thu, 17 Nov 2022 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GSsDEEAblvDk0BE3f5RNtUnRJvadWJGwufM6npt19s=;
        b=l9Rg+JOntyygLlntbTUng7oY2DuAjpOOPzoFApjzl9DaNvM+N1+zkfu2gAkNPozWIO
         ExQolxddYMbpDqqMbFdhJzgnaWuleFSUUdPRK0Df4JTiGycKuK1kNM5fRBjGzfbsHBJT
         pYk0jdGmJ2gMbO/1CiTm4qCuuUHNnP6Xve2slzyzvtmuBBsazlLuUwx/GI7c96E7/M+O
         MYYlqYkB/Ilk8WGaAVAHcVUdz+vq+aLoD0nQ/sIW72KqIrALbm3JNq/0k3LzD+AKNHBS
         dWg63z1DuiEawkprq6AKzlFhb6kvyFf9FFujWnGOc+STde+ffwItRpj6OeS/q31cGoUm
         Mw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GSsDEEAblvDk0BE3f5RNtUnRJvadWJGwufM6npt19s=;
        b=p+LiS4l+BLsn8o4Y6HHGKC6xPlyWwG+5q4bV3sbG55WZZ1y8EvNVF59oA0bXCb1t8/
         2P4uQiZW28+4yQtGxzZYIqdNpwp+Tf7EptCKrcE6zhyiy0bVdh7x9LFKAdZHIvlE/Een
         quOYzH/LIWxbnygruH1chnx251Or5x1mXSuffWPMFy47PBgIEjXehDOU1xnbdb1jgUe6
         RznIQLq2kqFOo72rS5rYMj6lXrN4iDtWXPiWppV5nopQ1OOWxNj6n1VI5C0FSpulz52b
         p1P5OolUuT4R3QjiLXkq12femy76Zlc71cfGVu+COGbRdQ21xqH4LkqZKMSMN/EnsUzP
         Y4gA==
X-Gm-Message-State: ANoB5pngg9gPzt3b3sQamI2Z/uizXMw7rSZyZL1FaklKAemqHaC/3jVz
        M3QK1f0Ak5bWCC/J4gMS25Q=
X-Google-Smtp-Source: AA0mqf7xBx0XwESlU6ITsaU6MsSC8tIPp7jQ6DRqgBcvnRHXWwmZQflJdXW1u3Oz1q7l94CPDRk3Vw==
X-Received: by 2002:a17:906:95c3:b0:78e:975:5e8 with SMTP id n3-20020a17090695c300b0078e097505e8mr3282420ejy.82.1668711270991;
        Thu, 17 Nov 2022 10:54:30 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jp8-20020a170906f74800b007adaca75bd0sm712494ejb.179.2022.11.17.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:30 -0800 (PST)
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
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: [PATCH v12 1/4] of: Introduce of_translate_dma_region()
Date:   Thu, 17 Nov 2022 19:54:21 +0100
Message-Id: <20221117185424.2359687-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
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

