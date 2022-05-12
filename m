Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F2CC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 12 May 2022 19:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357839AbiELTBM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 May 2022 15:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357832AbiELTBK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 May 2022 15:01:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97897387B7;
        Thu, 12 May 2022 12:01:08 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l19so7650480ljb.7;
        Thu, 12 May 2022 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33CPDy3+ZrU2TTgGYXum8i/DqhWqy6O2C5PdS7Y5GyY=;
        b=M/ewAeZR96LUwGsZ2xYw3z7LJHfICgSMhfTAovZ1VkhJ4lkqMcfqOr20DqawcbOvJs
         9E57mYip5/m3hvFcSwKuG54j5NC6TL858wXDL3Dc7BYr/8rukvUfBRRvNUMFACjlzi4O
         tYk3jCkeIJMMXaJGCHUQNquUU7U4lS2CY72mcGGK4LLq9xH9oxA1o4OCEpX9Y6AhvMz6
         xGkV0MG+daRfgloMeIe7LJZc+AFz0M+V/VElhpp+BSsrxkSzOMN2LZuW1uYQ5pD5Jnh0
         6ey8lL5zEgCgl6ha5NWDcQCvrb4h0h4HfqcuPPvKM1clSbRCllUH6lDIv1DCFdXb/2VG
         3Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33CPDy3+ZrU2TTgGYXum8i/DqhWqy6O2C5PdS7Y5GyY=;
        b=DAynEof94e+z5El3MK6ZPki04AYC3dsZw9NedLvlaHftjuJlGwokIXqkYr4KdugTRi
         Nb3VRXUUfat3Pg49p5WmGia3uBT7k9nfrhnMdRBexfcKq7Tduk3DfsOMkP6sxmNXJe7J
         AB/7625DhGvc3R6T58ZVTaB80FIu4DZU2R92NGOznNls6ZLK/ZE9cU0TUR7+LBwBon1M
         hxNe5+hRlp7YF/WpamZtjqhpuiV4OUK36Uc6Qtd5R1/xG3u74NsYRoZ0q44Nfe0Hj/ha
         xQS/vrnilo1i03DSF3nE+jfjeaUWhSQr4oFVU9SdFrOloIghmsTbyzgmsQ5UQDXdNvra
         HZ4A==
X-Gm-Message-State: AOAM5306giiA56AjbhTYCstPupPzTEgrtlSwbq2urrRjfKkUNuu8+8eg
        nqTjXNG0mRQDZZoj6kyYpCs=
X-Google-Smtp-Source: ABdhPJw/pbeSEBHsdcBrwHPVxvPjdBMaXUGfQ2vZT0K9hcO0YWZ4Uo2v2itdcwJd+k65A5yIXJbcxw==
X-Received: by 2002:a2e:8502:0:b0:24f:1036:b405 with SMTP id j2-20020a2e8502000000b0024f1036b405mr868240lji.220.1652382066893;
        Thu, 12 May 2022 12:01:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 1-20020a2e0f01000000b0024f3d1daea2sm45801ljp.42.2022.05.12.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:01:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 2/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Thu, 12 May 2022 21:00:49 +0200
Message-Id: <20220512190052.1152377-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512190052.1152377-1-thierry.reding@gmail.com>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
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

 drivers/iommu/of_iommu.c | 90 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |  8 ++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5696314ae69e..9e341b5e307f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -11,12 +11,15 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/fsl/mc.h>
 
+#include <dt-bindings/reserved-memory.h>
+
 #define NO_IOMMU	1
 
 static int of_iommu_xlate(struct device *dev,
@@ -172,3 +175,90 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
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

