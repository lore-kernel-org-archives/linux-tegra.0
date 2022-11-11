Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39FDC4321E
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 16:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbiKKQSS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 11:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbiKKQSR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 11:18:17 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDCB66CBC;
        Fri, 11 Nov 2022 08:18:16 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bs21so7080886wrb.4;
        Fri, 11 Nov 2022 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duNVBr4NS95zPWW8bT1x22oGyyVhM7a86TUcTxHp1y8=;
        b=IjVK3t9whScIPg9Wgf+fiup2cfWge0XRfQ6JysT8I2NheyXRpuxsur9CNWORmBHRHW
         EsfkaAf3f0c/oWHiy1rRDLMeYULqVnyWhVErSyktYz3+sFBVlRSnCa85CmGO0QPIIX/K
         UEBJqrgEdOFLfs0PuIAYa3lJLBqcYl8WFoqH8tcTH1XLvNyFa2pVrQ0xejkTAox0VV4S
         MsgLIgnCgGyukR3iqFsNTBMU7sNBRcFpEbGxK7W50Sf2yXZn6VzTZDM6UHbPAU+EQ/sV
         zAEHigkUVacz8yGeiHrxp2Sr0r3ci16B3hAGpab6XrUgNQ6bAlM1N6E1Sp6sfj6aounO
         YnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duNVBr4NS95zPWW8bT1x22oGyyVhM7a86TUcTxHp1y8=;
        b=jDmswe5Li5+P7e6DODAiFuo5t65iyk7gWEFFrXEuBDsr5zX26xVnYxiKbiV9eE/WD7
         /67xsW9qRbNUpu/mo2Gyg6IyP5iAliOMQh9F9495A3nSt8Cz0TzjxqMOqAus26NEHxfg
         6ATJQS6HD+o1IzO9T1VzWmM4iwmhVbzstrqx5b9t21Tj++0zPyZ0eXEd58L+XFBusfHY
         l2Z8bJ9bQZ9H1ezCcy1P7TQri4VLxA4REccm84leiCCHm7pGHUZUOVMTnaucT9+QdbC6
         VoHmhkBWfYk6AA1W8JiUXoY5yGtkwrmw0NREEm0rdJD6gGyQF1dtVkXa+pewWaoL7cgh
         U3mw==
X-Gm-Message-State: ANoB5pmhuoKebha/pHLWPMEfvDAC6+6O1FaA2ScGpuG/0Nq86qs31wHy
        lX8qQv+7a05KYa4+hHPIMcc=
X-Google-Smtp-Source: AA0mqf6R1nsyuduS+VIYfMfnl+022+/a6/3avlF870xD13VBBi+2XA4Y6EdCfqlEi1YIpt8t8p623g==
X-Received: by 2002:adf:e78c:0:b0:236:704f:29f4 with SMTP id n12-20020adfe78c000000b00236704f29f4mr1754320wrm.11.1668183494645;
        Fri, 11 Nov 2022 08:18:14 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d6243000000b0023660f6cecfsm2269975wrv.80.2022.11.11.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:13 -0800 (PST)
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
Subject: [PATCH v11 2/5] of: Introduce of_translate_dma_region()
Date:   Fri, 11 Nov 2022 17:18:03 +0100
Message-Id: <20221111161806.630527-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111161806.630527-1-thierry.reding@gmail.com>
References: <20221111161806.630527-1-thierry.reding@gmail.com>
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
Changes in v11:
- updated to use #dma-{address,size}-cells

Changes in v10:
- new patch

 drivers/of/address.c       | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/of_address.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index db59bc60226c..89b9f4fbad8f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -627,6 +627,47 @@ u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
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
+	na = of_bus_addr_cells(parent, OF_CELLS_DMA);
+	ns = of_bus_size_cells(parent, OF_CELLS_DMA);
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
index 15354085ea35..a05c35b40295 100644
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

