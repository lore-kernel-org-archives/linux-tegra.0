Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD632CCA482
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Jul 2022 13:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiGENhh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Jul 2022 09:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbiGENhQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Jul 2022 09:37:16 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5577479B;
        Tue,  5 Jul 2022 05:58:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id n8so15228374eda.0;
        Tue, 05 Jul 2022 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCS/UTkATleI46kY+d+Ry97Ig9k9wIcwQdZNrwaHgpM=;
        b=JadRO2davE9HZRu1a2w8V+rwDgA+FRulCfg6dk/lwD24+Mc9YLHMLUaPrkZhsolQ5A
         +RQlApZFGH3nZf7J3Nwtxv2LpaunU60IFQpCmTioXYb27sJBaRjRbF9n2s70LoIi/zGX
         ubI/5bGIfWdhakq6tYOLYiWmR1QZ0Tj/qb0y43WYld84g4VQoL5aQoJ0KFvWT8Ri2o7c
         i2uF8Mm3rqj0r17EfAlBjt3fQbTmFXjd7XyHqYmV0F+o12ZLGZicSpUC03KfS6bL0Xzp
         XMKt+44Zz2B7iB7W/lF83FgfPImlcgcMXxbKgTP0X3/1J1Vx5tzaPcOvoLxSED9HggFG
         RsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCS/UTkATleI46kY+d+Ry97Ig9k9wIcwQdZNrwaHgpM=;
        b=yYnZesS+FBZOaxnX0LPIBK/6zBaLd2bjfs2PYI0iwdUS718SiT/YVv1X6c6z64N1IS
         95VgCXLXet7/R7cboQ+78PHDeZ29Sp8XLWxe09RWCVAD6J0pnF1ju8as5Jci9hMHWM8V
         c5Ok0YP1kjJcPcsBjaDE6ix2m1gX+W7lPm22R91jrWxlqsZHYHk4U59rw2G0VE/quwN0
         O6T0xlSh4os2S/l3qSXEnzRRojrzQK5hs4eFQqMc3DSeRy3PdDj1Ob5oqvfe7FmKbRpb
         RD0Zz17W6YAFQau8KIV4HKsLzLXYwxk2eFBHbwgtC3Dbs0vngwjgxmzezztVjXp/clFa
         8xAA==
X-Gm-Message-State: AJIora/aIctCQSkTv4beU4QDJpZGzqUVkZNHLq3D+roGoctPPFFn2lgx
        jTXvWBMLRTigccStheoCEtA=
X-Google-Smtp-Source: AGRyM1s2xhTwQ+8WrilHKLkENRobG1A+q28m5fpH/FlUM+xi8Fke/LHaw3oMWgCrOd0SRuyLEREiyQ==
X-Received: by 2002:a05:6402:4387:b0:435:94c6:716d with SMTP id o7-20020a056402438700b0043594c6716dmr46827461edc.298.1657025923139;
        Tue, 05 Jul 2022 05:58:43 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kv12-20020a17090778cc00b0072ac3f06615sm3282062ejc.133.2022.07.05.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:58:42 -0700 (PDT)
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
Subject: [PATCH v6 2/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Tue,  5 Jul 2022 14:58:31 +0200
Message-Id: <20220705125834.431711-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-1-thierry.reding@gmail.com>
References: <20220705125834.431711-1-thierry.reding@gmail.com>
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

 drivers/iommu/of_iommu.c | 88 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |  8 ++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 41f4eb005219..c62da41516eb 100644
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
@@ -172,3 +173,90 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
 	return ops;
 }
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
+		struct iommu_resv_region *region;
+		struct resource res;
+		const __be32 *maps;
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
+		if (maps) {
+			const __be32 *end = maps + size / sizeof(__be32);
+			struct device_node *np;
+			unsigned int index = 0;
+			u32 phandle;
+			int na, ns;
+
+			while (maps < end) {
+				phys_addr_t start, end;
+				size_t length;
+
+				phandle = be32_to_cpup(maps++);
+				np = of_find_node_by_phandle(phandle);
+				na = of_n_addr_cells(np);
+				ns = of_n_size_cells(np);
+
+				start = of_translate_dma_address(np, maps);
+				length = of_read_number(maps + na, ns);
+				end = start + length - 1;
+
+				if (np == dev->of_node) {
+					int prot = IOMMU_READ | IOMMU_WRITE;
+					enum iommu_resv_type type;
+
+					/*
+					 * IOMMU regions without an associated physical region
+					 * cannot be mapped and are simply reservations.
+					 */
+					if (res.end > res.start)
+						type = IOMMU_RESV_DIRECT_RELAXABLE;
+					else
+						type = IOMMU_RESV_RESERVED;
+
+					region = iommu_alloc_resv_region(start, length, prot, type);
+					if (region)
+						list_add_tail(&region->list, list);
+				}
+
+				maps += na + ns;
+				index++;
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
2.36.1

