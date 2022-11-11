Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D33C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 16:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbiKKQSQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiKKQSQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 11:18:16 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8526B66C88;
        Fri, 11 Nov 2022 08:18:14 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a14so7083042wru.5;
        Fri, 11 Nov 2022 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAUhf4MJRKNbzytAGca4xi3AunM2s7jfDRQYu2UW+oU=;
        b=CFWi4NePLtu/N/htOcwXEUYoX6pWEegGbDkt8ILHUttiVbqhdiXnZGOCiUx7+aFSxE
         OadIbmAAmqGLiSPSjdSXz/ZPF/Dvv9iR/KF6XzG8/h63rjBlD6jla0sgIhDuhu+DN8Ct
         u/DTkbzejjWevn7RrcNWnWtKRudtcmTCO/58QK3/BWqvSzCOgHzPbVgkjxNbjbW6GB81
         CGzlqvUPgm46nbJJMWx8SILcgPRps3waBPiaP9zdSsKESoMTbDZyEZ0V1vZ9WxPUaA6N
         F2nyx/eZVdOyKFD2ETH1YbVLfj5H33TcYboTi6v4A73ZNUmidQANqnqi4llQbI8XyH9J
         5HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAUhf4MJRKNbzytAGca4xi3AunM2s7jfDRQYu2UW+oU=;
        b=c49CLeGWEpSTPwM/TSl/A00UfjTyi9bPhr98uM0BIuYyL/SUPc6UhssHESrWGJmvqT
         CIaInl7Q3iy5V/RuRNxa2h1ukVbMrDVXJ27m254PwkbTMuoF7RP+NjxCo3if0ziSE+fB
         VICgnHcQGx9RbAFjZ2kvC89H5BoMxU8juHYY+yiBNuprGEVf67PqGPezGVGeLscwzPPF
         TOwKV4Wdt+pBfnDQrBr9mxf1oRrnrym/AUfGZ48kd3o4xnM8ZzzVzkqBCkW1dpPmqU7z
         VFKmFPYq6X+hP57mewk9j4EUxoccZNuNw/r7L0kH8j8AaVg1Uu7m2/S1ZkkcM+MtTZ3S
         Gx+g==
X-Gm-Message-State: ANoB5pnfnBUhi30/uUXRtVkrJEcwk0Ys/+JJekFeY3v9v15a6Cg6JO1A
        YzcS/xdFA8Qqsdnhy8fXh5Q=
X-Google-Smtp-Source: AA0mqf4VmR30SdqAMpY399GmoRCcA04wtMyf6Av4ZQ5sGpq9XXe2ubMSpT9jDY/MElnBZnq98r0lwg==
X-Received: by 2002:adf:fa11:0:b0:22e:34b4:411d with SMTP id m17-20020adffa11000000b0022e34b4411dmr1677811wrr.95.1668183492997;
        Fri, 11 Nov 2022 08:18:12 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm10971448wmg.46.2022.11.11.08.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:12 -0800 (PST)
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
Subject: [PATCH v11 1/5] of: Introduce support for #dma-{address,size}-cells
Date:   Fri, 11 Nov 2022 17:18:02 +0100
Message-Id: <20221111161806.630527-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The control and DMA busses of a system can have differing addressing
requirements. One common case of this is SoCs with CPUs that can address
more than 32 bits of system memory, but for simplicity want to describe
the control busses using #address-cells = <1> and #size-cells = <1>. In
this case, DMA address translation will fail because > 32-bit addresses
will be truncated to 32-bit addresses.

Support for the new #dma-address-cells and #dma-size-cells properties is
introduced in this patch. If these are encountered, they will be used
instead of the #address-and #size-cells properties when translating DMA
addresses.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v11:
- new patch

 drivers/of/address.c       | 43 ++++++++++++-----------
 drivers/of/base.c          | 70 ++++++++++++++++++++++++++++++--------
 drivers/of/of_private.h    | 14 ++++++--
 include/linux/of.h         | 17 +++++++--
 include/linux/of_address.h |  2 +-
 5 files changed, 108 insertions(+), 38 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c34ac33b7338..db59bc60226c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -45,8 +45,8 @@ struct of_bus {
 	const char	*name;
 	const char	*addresses;
 	int		(*match)(struct device_node *parent);
-	void		(*count_cells)(struct device_node *child,
-				       int *addrc, int *sizec);
+	void		(*count_cells)(struct device_node *child, int *addrc, int *sizec,
+				       unsigned int flags);
 	u64		(*map)(__be32 *addr, const __be32 *range,
 				int na, int ns, int pna);
 	int		(*translate)(__be32 *addr, u64 offset, int na);
@@ -58,13 +58,13 @@ struct of_bus {
  * Default translator (generic bus)
  */
 
-static void of_bus_default_count_cells(struct device_node *dev,
-				       int *addrc, int *sizec)
+static void of_bus_default_count_cells(struct device_node *dev, int *addrc, int *sizec,
+				       unsigned int flags)
 {
 	if (addrc)
-		*addrc = of_n_addr_cells(dev);
+		*addrc = of_addr_cells(dev, flags);
 	if (sizec)
-		*sizec = of_n_size_cells(dev);
+		*sizec = of_size_cells(dev, flags);
 }
 
 static u64 of_bus_default_map(__be32 *addr, const __be32 *range,
@@ -155,8 +155,8 @@ static int of_bus_pci_match(struct device_node *np)
 		of_node_is_pcie(np);
 }
 
-static void of_bus_pci_count_cells(struct device_node *np,
-				   int *addrc, int *sizec)
+static void of_bus_pci_count_cells(struct device_node *np, int *addrc, int *sizec,
+				   unsigned int flags)
 {
 	if (addrc)
 		*addrc = 3;
@@ -272,8 +272,8 @@ static int of_bus_isa_match(struct device_node *np)
 	return of_node_name_eq(np, "isa");
 }
 
-static void of_bus_isa_count_cells(struct device_node *child,
-				   int *addrc, int *sizec)
+static void of_bus_isa_count_cells(struct device_node *child, int *addrc, int *sizec,
+				   unsigned int flags)
 {
 	if (addrc)
 		*addrc = 2;
@@ -475,6 +475,7 @@ static u64 __of_translate_address(struct device_node *dev,
 				  const __be32 *in_addr, const char *rprop,
 				  struct device_node **host)
 {
+	unsigned int flags = (rprop && !strcmp(rprop, "dma-ranges")) ? OF_CELLS_DMA : 0;
 	struct device_node *parent = NULL;
 	struct of_bus *bus, *pbus;
 	__be32 addr[OF_MAX_ADDR_CELLS];
@@ -494,7 +495,7 @@ static u64 __of_translate_address(struct device_node *dev,
 	bus = of_match_bus(parent);
 
 	/* Count address cells & copy address locally */
-	bus->count_cells(dev, &na, &ns);
+	bus->count_cells(dev, &na, &ns, flags);
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_debug("Bad cell count for %pOF\n", dev);
 		goto bail;
@@ -536,7 +537,7 @@ static u64 __of_translate_address(struct device_node *dev,
 
 		/* Get new parent bus and counts */
 		pbus = of_match_bus(parent);
-		pbus->count_cells(dev, &pna, &pns);
+		pbus->count_cells(dev, &pna, &pns, flags);
 		if (!OF_CHECK_COUNTS(pna, pns)) {
 			pr_err("Bad cell count for %pOF\n", dev);
 			break;
@@ -644,7 +645,7 @@ const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 		of_node_put(parent);
 		return NULL;
 	}
-	bus->count_cells(dev, &na, &ns);
+	bus->count_cells(dev, &na, &ns, false);
 	of_node_put(parent);
 	if (!OF_CHECK_ADDR_COUNT(na))
 		return NULL;
@@ -677,11 +678,15 @@ static int parser_init(struct of_pci_range_parser *parser,
 {
 	int rlen;
 
+	if (strcmp(name, "dma-ranges") == 0)
+		parser->flags = OF_CELLS_DMA;
+	else
+		parser->flags = 0;
+
 	parser->node = node;
-	parser->pna = of_n_addr_cells(node);
-	parser->na = of_bus_n_addr_cells(node);
-	parser->ns = of_bus_n_size_cells(node);
-	parser->dma = !strcmp(name, "dma-ranges");
+	parser->pna = of_addr_cells(node, parser->flags);
+	parser->na = of_bus_addr_cells(node, parser->flags);
+	parser->ns = of_bus_size_cells(node, parser->flags);
 	parser->bus = of_match_bus(node);
 
 	parser->range = of_get_property(node, name, &rlen);
@@ -730,7 +735,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 	range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
 
-	if (parser->dma)
+	if (parser->flags & OF_CELLS_DMA)
 		range->cpu_addr = of_translate_dma_address(parser->node,
 				parser->range + na);
 	else
@@ -747,7 +752,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 		flags = parser->bus->get_flags(parser->range);
 		bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
-		if (parser->dma)
+		if (parser->flags & OF_CELLS_DMA)
 			cpu_addr = of_translate_dma_address(parser->node,
 					parser->range + na);
 		else
diff --git a/drivers/of/base.c b/drivers/of/base.c
index d5a5c35eba72..39556fa7a13b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -86,47 +86,89 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return np && match && type && !strcmp(match, type);
 }
 
-int of_bus_n_addr_cells(struct device_node *np)
+int of_bus_addr_cells(struct device_node *np, unsigned int flags)
 {
+	struct device_node *parent;
 	u32 cells;
 
-	for (; np; np = np->parent)
+	while (np) {
+		if (flags & OF_CELLS_DMA)
+			if (!of_property_read_u32(np, "#dma-address-cells", &cells))
+				return cells;
+
 		if (!of_property_read_u32(np, "#address-cells", &cells))
 			return cells;
 
+		if (flags & OF_CELLS_DMA)
+			parent = __of_get_dma_parent(np);
+		else
+			parent = of_node_get(np->parent);
+
+		of_node_put(np);
+		np = parent;
+	}
+
 	/* No #address-cells property for the root node */
 	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 }
 
-int of_n_addr_cells(struct device_node *np)
+int of_addr_cells(struct device_node *np, unsigned int flags)
 {
-	if (np->parent)
-		np = np->parent;
+	int cells;
+
+	if (flags & OF_CELLS_DMA)
+		np = __of_get_dma_parent(np);
+	else if (np->parent)
+		np = of_node_get(np->parent);
+
+	cells = of_bus_addr_cells(np, flags);
 
-	return of_bus_n_addr_cells(np);
+	of_node_put(np);
+	return cells;
 }
-EXPORT_SYMBOL(of_n_addr_cells);
+EXPORT_SYMBOL(of_addr_cells);
 
-int of_bus_n_size_cells(struct device_node *np)
+int of_bus_size_cells(struct device_node *np, unsigned int flags)
 {
+	struct device_node *parent;
 	u32 cells;
 
-	for (; np; np = np->parent)
+	while (np) {
+		if (flags & OF_CELLS_DMA)
+			if (!of_property_read_u32(np, "#dma-size-cells", &cells))
+				return cells;
+
 		if (!of_property_read_u32(np, "#size-cells", &cells))
 			return cells;
 
+		if (flags & OF_CELLS_DMA)
+			parent = __of_get_dma_parent(np);
+		else
+			parent = of_node_get(np->parent);
+
+		of_node_put(np);
+		np = parent;
+	}
+
 	/* No #size-cells property for the root node */
 	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
 }
 
-int of_n_size_cells(struct device_node *np)
+int of_size_cells(struct device_node *np, unsigned int flags)
 {
-	if (np->parent)
-		np = np->parent;
+	int cells;
+
+	if (flags & OF_CELLS_DMA)
+		np = __of_get_dma_parent(np);
+	else if (np->parent)
+		np = of_node_get(np->parent);
+
+	cells = of_bus_size_cells(np, flags);
 
-	return of_bus_n_size_cells(np);
+	of_node_put(np);
+	return cells;
 }
-EXPORT_SYMBOL(of_n_size_cells);
+EXPORT_SYMBOL(of_size_cells);
 
 #ifdef CONFIG_NUMA
 int __weak of_node_to_nid(struct device_node *np)
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index fb6792d381a6..f57900c3f25c 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -148,8 +148,18 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 #define for_each_transaction_entry_reverse(_oft, _te) \
 	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
 
-extern int of_bus_n_addr_cells(struct device_node *np);
-extern int of_bus_n_size_cells(struct device_node *np);
+extern int of_bus_addr_cells(struct device_node *np, unsigned int flags);
+extern int of_bus_size_cells(struct device_node *np, unsigned int flags);
+
+static inline int of_bus_n_addr_cells(struct device_node *np)
+{
+	return of_bus_addr_cells(np, 0);
+}
+
+static inline int of_bus_n_size_cells(struct device_node *np)
+{
+	return of_bus_size_cells(np, 0);
+}
 
 struct bus_dma_region;
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
diff --git a/include/linux/of.h b/include/linux/of.h
index 8b9f94386dc3..dd4d4b3c8636 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -358,8 +358,21 @@ extern u64 of_get_cpu_hwid(struct device_node *cpun, unsigned int thread);
 #define for_each_property_of_node(dn, pp) \
 	for (pp = dn->properties; pp != NULL; pp = pp->next)
 
-extern int of_n_addr_cells(struct device_node *np);
-extern int of_n_size_cells(struct device_node *np);
+#define OF_CELLS_DMA 0x1
+
+extern int of_addr_cells(struct device_node *np, unsigned int flags);
+extern int of_size_cells(struct device_node *np, unsigned int flags);
+
+static inline int of_n_addr_cells(struct device_node *np)
+{
+	return of_addr_cells(np, 0);
+}
+
+static inline int of_n_size_cells(struct device_node *np)
+{
+	return of_size_cells(np, 0);
+}
+
 extern const struct of_device_id *of_match_node(
 	const struct of_device_id *matches, const struct device_node *node);
 extern int of_modalias_node(struct device_node *node, char *modalias, int len);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 265f26eeaf6b..15354085ea35 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -16,7 +16,7 @@ struct of_pci_range_parser {
 	int na;
 	int ns;
 	int pna;
-	bool dma;
+	unsigned int flags;
 };
 #define of_range_parser of_pci_range_parser
 
-- 
2.38.1

