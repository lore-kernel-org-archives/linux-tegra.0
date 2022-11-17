Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFDC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239397AbiKQSyi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239986AbiKQSyg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:54:36 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851AC86A48;
        Thu, 17 Nov 2022 10:54:35 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id t25so7371436ejb.8;
        Thu, 17 Nov 2022 10:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFYlmsCB+de1MKykLCFPxeRpHC1cNZyXUBWiz3WJZhE=;
        b=DbuMZ/KsN/EYXE4nhXbUxbjDxuDt66q2ztqJakP81nKzONDQTBQhwTL66oPSilcZIo
         h+ot/rlVyhiUgq+lMLnmRmc5rvBISAV31g4ZUu/NBNVmTIudFoZ/zN4RXKeFMlR3vsb2
         B9n5pmWq+A5xbzoVajzEiV2M+eGkgVtdQ7jR7/phUT0WNUvd0YN9s7xhiDQ5+R5204Tf
         BEWcC3vbHgzkLhS7HEqNBZne7WgSakij6l44woy4yJ10jOCSIFRVYMyoyvYC6bILx5p7
         sMjUIBFAlF73LvDD+bKiCh4G5Ie93+UyIuxejUu8iWymn4CjYsc7q5u1jFLGHmOYDL8b
         NjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFYlmsCB+de1MKykLCFPxeRpHC1cNZyXUBWiz3WJZhE=;
        b=oh5U32VcvEY14gfQNZwEiV4T1TT2WPbX1WB6QU4XRqY3wEbcm1SmWVHXdDebAQh7J+
         ZF+DhWs9RnplOyJ/G5AnIgOjKorP6pxTMDDEteF1IPoH+0KP7pRHf3Xkj0kk54v5S8Sc
         poWtFsv9O5HpgU0QhHl0ZnsAyFBbWkOHqiZpKeSsngyAGuPGYlt0TghzFl19Rs5W0w5u
         szi57KfnAN9dK66r4gEcGDkH5odZ1xQTEn+8DdO0WPdy1ahHcjvPA/8o1vKktg4zGdxR
         +/uzf7QDuoLRm+ZI6Jp7vZvmrmawlLBls/aIg+V50sZoB0dMCdrBoVcHRn2XMNxsBVLt
         gvaA==
X-Gm-Message-State: ANoB5pmUqZKWxrKE/ovdEmkv5K+3Gt1sh8lMf7pscseaqyFSibsTOZVW
        pCP7ABn/ZbIyiL78pSsPyrI=
X-Google-Smtp-Source: AA0mqf5hSUQEOSEC4FEjbZ/QeKoYL0QIfd+QbNdFd2VJ0d5QXc1BBBBlSdVUr5DbBfahRzJ7Lbkabw==
X-Received: by 2002:a17:906:9618:b0:7ae:38a:fd with SMTP id s24-20020a170906961800b007ae038a00fdmr3264602ejx.501.1668711273932;
        Thu, 17 Nov 2022 10:54:33 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b004616b006871sm862421edb.82.2022.11.17.10.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:33 -0800 (PST)
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
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v12 3/4] iommu: Implement of_iommu_get_resv_regions()
Date:   Thu, 17 Nov 2022 19:54:23 +0100
Message-Id: <20221117185424.2359687-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is an implementation that IOMMU drivers can use to obtain reserved
memory regions from a device tree node. It uses the reserved-memory DT
bindings to find the regions associated with a given device. If these
regions are marked accordingly, identity mappings will be created for
them in the IOMMU domain that the devices will be attached to.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v10:
- extract more code into the new iommu_resv_region_get_type() function
- rename variables for physical and I/O virtual addresses for clarity
- default to IOMMU_RESV_DIRECT instead of IOMMU_RESV_DIRECT_RELAXABLE
- use newly introduced of_translate_dma_region()

Changes in v9:
- address review comments by Robin Murphy:
  - warn about non-direct mappings since they are not supported yet
  - cleanup code to require less indentation
  - narrow scope of variables

Changes in v8:
- cleanup set-but-unused variables

Changes in v6:
- remove reference to now unused dt-bindings/reserved-memory.h include

Changes in v5:
- update for new "iommu-addresses" device tree bindings

Changes in v4:
- fix build failure on !CONFIG_OF_ADDRESS

Changes in v3:
- change "active" property to identity mapping flag that is part of the
  memory region specifier (as defined by #memory-region-cells) to allow
  per-reference flags to be used

Changes in v2:
- use "active" property to determine whether direct mappings are needed

 drivers/iommu/of_iommu.c | 94 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |  8 ++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5696314ae69e..fa7c63a4abbf 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
@@ -172,3 +173,96 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
 	return ops;
 }
+
+static enum iommu_resv_type iommu_resv_region_get_type(struct device *dev, struct resource *phys,
+						       phys_addr_t start, size_t length)
+{
+	phys_addr_t end = start + length - 1;
+
+	/*
+	 * IOMMU regions without an associated physical region cannot be
+	 * mapped and are simply reservations.
+	 */
+	if (phys->start >= phys->end)
+		return IOMMU_RESV_RESERVED;
+
+	/* may be IOMMU_RESV_DIRECT_RELAXABLE for certain cases */
+	if (start == phys->start && end == phys->end)
+		return IOMMU_RESV_DIRECT;
+
+	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", &phys,
+		 &start, &end);
+	return IOMMU_RESV_RESERVED;
+}
+
+/**
+ * of_iommu_get_resv_regions - reserved region driver helper for device tree
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * IOMMU drivers can use this to implement their .get_resv_regions() callback
+ * for memory regions attached to a device tree node. See the reserved-memory
+ * device tree bindings on how to use these:
+ *
+ *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+ */
+void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
+{
+#if IS_ENABLED(CONFIG_OF_ADDRESS)
+	struct of_phandle_iterator it;
+	int err;
+
+	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
+		const __be32 *maps, *end;
+		struct resource phys;
+		int size;
+
+		memset(&phys, 0, sizeof(phys));
+
+		/*
+		 * The "reg" property is optional and can be omitted by reserved-memory regions
+		 * that represent reservations in the IOVA space, which are regions that should
+		 * not be mapped.
+		 */
+		if (of_find_property(it.node, "reg", NULL)) {
+			err = of_address_to_resource(it.node, 0, &phys);
+			if (err < 0) {
+				dev_err(dev, "failed to parse memory region %pOF: %d\n",
+					it.node, err);
+				continue;
+			}
+		}
+
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
+
+		end = maps + size / sizeof(__be32);
+
+		while (maps < end) {
+			struct device_node *np;
+			u32 phandle;
+
+			phandle = be32_to_cpup(maps++);
+			np = of_find_node_by_phandle(phandle);
+
+			if (np == dev->of_node) {
+				int prot = IOMMU_READ | IOMMU_WRITE;
+				struct iommu_resv_region *region;
+				enum iommu_resv_type type;
+				phys_addr_t iova;
+				size_t length;
+
+				maps = of_translate_dma_region(np, maps, &iova, &length);
+				type = iommu_resv_region_get_type(dev, &phys, iova, length);
+
+				region = iommu_alloc_resv_region(iova, length, prot, type,
+								 GFP_KERNEL);
+				if (region)
+					list_add_tail(&region->list, list);
+			}
+		}
+	}
+#endif
+}
+EXPORT_SYMBOL(of_iommu_get_resv_regions);
diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
index 55c1eb300a86..9a5e6b410dd2 100644
--- a/include/linux/of_iommu.h
+++ b/include/linux/of_iommu.h
@@ -12,6 +12,9 @@ extern const struct iommu_ops *of_iommu_configure(struct device *dev,
 					struct device_node *master_np,
 					const u32 *id);
 
+extern void of_iommu_get_resv_regions(struct device *dev,
+				      struct list_head *list);
+
 #else
 
 static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
@@ -21,6 +24,11 @@ static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
 	return NULL;
 }
 
+static inline void of_iommu_get_resv_regions(struct device *dev,
+					     struct list_head *list)
+{
+}
+
 #endif	/* CONFIG_OF_IOMMU */
 
 #endif /* __OF_IOMMU_H */
-- 
2.38.1

