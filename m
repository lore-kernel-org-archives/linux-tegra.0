Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85889ECAAD8
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiIWMgN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbiIWMgL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Sep 2022 08:36:11 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA7712C69D;
        Fri, 23 Sep 2022 05:36:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id lh5so331287ejb.10;
        Fri, 23 Sep 2022 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VxAgfZrGtKMqyWww7/oY0OjO0zC4CiRj830AgLQKw6A=;
        b=IOUD+xaU5E/F7kEvra/WnLic+tO0zmZBLmOqO/FRB4+PmvPbeBf1Kz5yAKPKd8JTTZ
         CiBcERIhyNfqEjKmVNhpMiV/CTnZmtGNznjb0OL20Abgu9u9Xxp7TVabBIFHywSaG667
         5QTjuPOiz+Vkj4/K6AuMAreCbCu1pDeFLOR5OaCG5sXSBszKHPtX/Jcy8+q5M2lC9OtS
         +Twrx5+bT0sfNiBoWo1KWPxpIxuE00vFoVjnS5/Sx1eFOW1yhqJQ+rzt5Ex0ke520TQt
         ILoXGYkZx1770NGapAzMNP7I9N0o+zGg83T5ipYj2AfIHEYkJWjcrbDNIrsy/ki9ghEN
         3auQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VxAgfZrGtKMqyWww7/oY0OjO0zC4CiRj830AgLQKw6A=;
        b=WN+O3YNtOJTCweRQLvGW5izNHI5VVrXt3n6YBRUUGPTBXJrKak7/wiNG2qiaOHgvHA
         lCBkQSsscZKtG/MKpiaf/tPi59eVcWPvtpEZhLF1pnH6VkWIzSFDkCeUtCqy+vVj8W3V
         WDBjrPN4tnXjGS95GC2FkCsS2oYDCamayPjRaTutHGoFdORIotbIA+WmiAWnVmqDIQk1
         RvKzII8A47ag8x4qjNgAmCd0GAw7YiT7yOZ+9ra87wD0NFUCf3f7YLSEsYBjGGlysQed
         OSvV5bwseqFpbU/azNAIIHyihKashAqhvySrYQVYpy1+f3Jf/4zDEgQ3A0eHRI7k4O1c
         N0Sg==
X-Gm-Message-State: ACrzQf2MvqSYEoQSnN8Gj8P9vo2hOjEh3RNysxNSFg1Lc0z+g4fdm8cT
        8gVeq3iMxME2MVeDCPdPLCqB+UG2pYo=
X-Google-Smtp-Source: AMsMyM76XL9JeQ+lbbmH11hJ+XADkKHoxMNwem9w++iHWQt+eyROenbt9lR/BzzNNXTGywSAykatsg==
X-Received: by 2002:a17:907:94d6:b0:782:b10a:7e91 with SMTP id dn22-20020a17090794d600b00782b10a7e91mr1772183ejc.220.1663936567432;
        Fri, 23 Sep 2022 05:36:07 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j18-20020aa7de92000000b0044657ecfbb5sm456417edv.13.2022.09.23.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 05:36:06 -0700 (PDT)
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
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 2/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Fri, 23 Sep 2022 14:35:54 +0200
Message-Id: <20220923123557.866972-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923123557.866972-1-thierry.reding@gmail.com>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
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

 drivers/iommu/of_iommu.c | 104 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |   8 +++
 2 files changed, 112 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5696314ae69e..0bf2b08bca0a 100644
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
@@ -172,3 +173,106 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
 	return ops;
 }
+
+static inline bool check_direct_mapping(struct device *dev, struct resource *phys,
+					phys_addr_t start, phys_addr_t end)
+{
+	if (start != phys->start || end != phys->end) {
+		dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n",
+			 &phys, &start, &end);
+		return false;
+	}
+
+	return true;
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
+		struct resource res;
+		int size;
+
+		memset(&res, 0, sizeof(res));
+
+		/*
+		 * The "reg" property is optional and can be omitted by reserved-memory regions
+		 * that represent reservations in the IOVA space, which are regions that should
+		 * not be mapped.
+		 */
+		if (of_find_property(it.node, "reg", NULL)) {
+			err = of_address_to_resource(it.node, 0, &res);
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
+			int na, ns;
+
+			phandle = be32_to_cpup(maps++);
+			np = of_find_node_by_phandle(phandle);
+			na = of_n_addr_cells(np);
+			ns = of_n_size_cells(np);
+
+			if (np == dev->of_node) {
+				int prot = IOMMU_READ | IOMMU_WRITE;
+				struct iommu_resv_region *region;
+				enum iommu_resv_type type;
+				phys_addr_t start;
+				size_t length;
+
+				start = of_translate_dma_address(np, maps);
+				length = of_read_number(maps + na, ns);
+
+				/*
+				 * IOMMU regions without an associated physical region cannot be
+				 * mapped and are simply reservations.
+				 */
+				if (res.end > res.start) {
+					phys_addr_t end = start + length - 1;
+
+					if (check_direct_mapping(dev, &res, start, end))
+						type = IOMMU_RESV_DIRECT_RELAXABLE;
+					else
+						type = IOMMU_RESV_RESERVED;
+				} else {
+					type = IOMMU_RESV_RESERVED;
+				}
+
+				region = iommu_alloc_resv_region(start, length, prot, type);
+				if (region)
+					list_add_tail(&region->list, list);
+			}
+
+			maps += na + ns;
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
2.37.3

