Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE4FC6FA86
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 17:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238019AbiIERJI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 13:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237958AbiIERIp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 13:08:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B455E652;
        Mon,  5 Sep 2022 10:08:44 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qh18so18239251ejb.7;
        Mon, 05 Sep 2022 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=arsiduc6sJIa+xojp1J20696vz1D9BKvyFnTAqu9ZoI=;
        b=XcxSEsrCTHZKvIUfXephYIltJhgoR72sbedd/IYzTfnHMlGr1Xo9Vd5rSnGv+EYg4J
         r8j1Fglz3X9C2z/Beb6NQLThE17I8luHMGI63KufiKgXMXN8BAb3GRgVk6xgUuISBIWi
         9AhFUL3rH+V2EQoXh+0SDO62Pxsmz1D8gWBzHj5JoRnsU1LCOWFln2iqXLhdeI9U88fq
         ytXa3m6XbtIWphBY5wJYTM1y6hLrXSadIczc85sDxAB7jwUjlVu3Pwvb0Mvs6PtsA2Yq
         pz1xBaAJ2f/LcJ+Gx88nc2cxbEnUvBFvPZU3RJck4fuwcs1o8xTi152raDTwmQLBu54f
         MzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=arsiduc6sJIa+xojp1J20696vz1D9BKvyFnTAqu9ZoI=;
        b=MnJYDaKkG+5CKiiQVrQzGqQKjfMaWK/KWTvHZF+uoucKVoi47F3IWqYIp6pDGy8VWZ
         95LXuLZLYfarjL/JcAIV9zjziQqzZtX+ExbAxx3leV+FkM8urQBdKRv3n8QbUQmBOcij
         36CYUJ3Y7SgCz+BG4zy9NsTevo723m4TAsz+RNhgMH+lJknZ2PsJSoCP7+woSFwmEL0l
         IIZ6c59OuNgVBA3znaSlB5rnmMYdjLovv6i4Vil4cQHDJUBF6rgtm6jsQxU0/9itZHJ5
         Ij/oOpp+VMUeqCwEs6q0zEVYDOh1maBozgCjlTa1AQUX2HSnlx7k8XvEz7d+QGBMwncr
         EwCA==
X-Gm-Message-State: ACgBeo1NoSNv3DAErrYJt+LJSbDHwZ0qRH2m2vY1YtY1hyHeilGiIU9P
        67Vtu1lCDXtj4toQqNsixO0=
X-Google-Smtp-Source: AA6agR64ubHA8j4JRCQD1nSnG5ANK8jJxR/k7iS4+Vs1ek+wg4Nj++2r77WdJ2IonpZWv+bVOw8uSA==
X-Received: by 2002:a17:907:9710:b0:731:67b1:dc3b with SMTP id jg16-20020a170907971000b0073167b1dc3bmr37321083ejc.709.1662397722823;
        Mon, 05 Sep 2022 10:08:42 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906305500b0073d6ab5bcaasm5255997ejd.212.2022.09.05.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:41 -0700 (PDT)
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
Subject: [PATCH v8 2/5] iommu: Implement of_iommu_get_resv_regions()
Date:   Mon,  5 Sep 2022 19:08:30 +0200
Message-Id: <20220905170833.396892-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905170833.396892-1-thierry.reding@gmail.com>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
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

 drivers/iommu/of_iommu.c | 85 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h |  8 ++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5696314ae69e..6617096ad15f 100644
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
@@ -172,3 +173,87 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 
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
+			u32 phandle;
+			int na, ns;
+
+			while (maps < end) {
+				phys_addr_t start;
+				size_t length;
+
+				phandle = be32_to_cpup(maps++);
+				np = of_find_node_by_phandle(phandle);
+				na = of_n_addr_cells(np);
+				ns = of_n_size_cells(np);
+
+				start = of_translate_dma_address(np, maps);
+				length = of_read_number(maps + na, ns);
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
2.37.2

