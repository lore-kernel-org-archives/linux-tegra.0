Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56EDC43219
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiKCNjP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiKCNjP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:15 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A49E8;
        Thu,  3 Nov 2022 06:39:13 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id f27so5355730eje.1;
        Thu, 03 Nov 2022 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BecJ0E2plRH5MxDE40UsMd1VqUugZCh95ceLSHGaoR4=;
        b=RhWQegExPTUv/VcMbdwViIte9vibXTINDoB2s3FK2GFt5KoXIKN6ZwsnaBkg4yw7le
         nrZjQiWw9W8Q+lxGDNxxBQg7ynD3PNcJ68zDH01z7Zd6CORj+fOb5Sv0lkiOvY9h2bXu
         WE3gHu8yGZIywTSY0axnD9Xsi5jRYFptb4WzCuNI+TvG5Z/KCMosli4G3NQYDCIoXNdw
         O9xqgTMQj7y4c4jsjcJpsbJXfqMXpkRPCC+f7wxonuvHSKvjSST8/s2y3VC94fs93bNN
         RtNnCf90J0vM+ZaSUgS9UxJBlVQyejTnabAqr+PVgyoR9cIAzO/OYn7A/nBeVzMnAX45
         rTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BecJ0E2plRH5MxDE40UsMd1VqUugZCh95ceLSHGaoR4=;
        b=NffvD3MwZv1c2MrweZdFhi115TfV2ensRr83/0uKYseLGjYMNbCYUj4Xzw3/Asb9yA
         VjVIbG0eetSCdAlIQNXOS9CmpYjP/nISGIo9UA+8wwT92UDlnllade83K5D6qSX2WSfr
         hndIR0D5DWz211Bf1xqTA+gNG+pkxRf939XEz4sF1zkdmGEpVfTHh2M1Ic7iWoohuQL7
         JRxAX5kZVbkVBSnH2/FDUH6REJJBJK9lnvC+Pk44M8teOxvBdxKw2AGzK0d0/rK0t6Tc
         wp3rxJXydOFyRCV61F1WGbts7hffoWj1wtQEABZFExMxEVBx/5ACNEChxhPAh4C+wOTH
         30BQ==
X-Gm-Message-State: ACrzQf3rNIQNtHe7SfXf56+3SqVMK8CF58H3kTXYm9ttzgkuLYvw00G8
        W0r4vbq6HQMHqiI5+teJQ6k=
X-Google-Smtp-Source: AMsMyM60ciF41ZqstOeqWY/AN37rTgyXw3vOVEdM/yvKGvtIcSJyCiS6B2gGiDSrz4le9GaE22NVkg==
X-Received: by 2002:a17:906:cc5e:b0:7ad:ad3a:b20a with SMTP id mm30-20020a170906cc5e00b007adad3ab20amr28576665ejb.315.1667482752163;
        Thu, 03 Nov 2022 06:39:12 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id u10-20020a1709061daa00b0073cf6ec3276sm477733ejh.207.2022.11.03.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:11 -0700 (PDT)
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
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 4/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Thu,  3 Nov 2022 14:38:59 +0100
Message-Id: <20221103133900.1473855-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
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
Rob,

I've dropped your Reviewed-by: for now since there were some significant
changes since you looked at this. Please take another look to confirm
that it still applies.

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
---
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

