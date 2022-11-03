Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E48C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Nov 2022 13:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbiKCNjM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Nov 2022 09:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiKCNjL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Nov 2022 09:39:11 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2476E8;
        Thu,  3 Nov 2022 06:39:09 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id bj12so5211814ejb.13;
        Thu, 03 Nov 2022 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NnOfijHjUvtXCrilqy+549X3EinDks/twGQ/XggbeA=;
        b=Cqb7iTCbh5rQE6XEWdfiIJJEoIGa1/Cy1GM68QnayvrMkQDkpoEEKIpVySFgspFJin
         6uvCYQx3zU9nIC6ROea7saAqZhrzwGaeuSsShLRjmdxtHS6mZhsbcfH0U2yyRcCg5NPX
         j8mpmphBHV+UAiZpGvF5ON7iwlLAlmqK8BCjJvm8R9//PUR+BDilyZ9ceSHZKjDMfGbE
         /8DQ2fu4HXfuVHJ37GeqqrCje9NAfs0W/C6y9NwXnWAvtdNb1vkUTZgNdGZXtmQ7Oarf
         AapxoFf2nHmgj8NqTuIbbhViAVhlckokku1Byh0/ND5KNPUmVps3R3zoIUSLWXxyfTv3
         7KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NnOfijHjUvtXCrilqy+549X3EinDks/twGQ/XggbeA=;
        b=AfOiWaBaEs4OckYOw7Fc4BT5Lyl4NWmYFcMhIYsmh4fm0TXOLH/43DSd95ACUObI2O
         dmPCuh8mzlCmi1Z62keEN05U7MIkFiDzjAyAFwLRVNqvm5Jq5XR6MB2MfLRowKsfJ3PH
         0/pDzCs06CjCzzQPqGsu1xAgyyfN2+3cDkkKwzJwCQUO3ebyq5KwQC7fJbWplIdhdJmi
         Wthu/5oFCHZGzI6zYMfhH5u9kF5M8/6QJ+3j5yCy9ED+4nHYxyirVpCJlT7uihPQet7V
         /g+RaGg8tfSlsPs7Fy8S130RbBlsEKQzQqK6ZsvpYD21pNVFKrE8Hyp+u47sydxzcUp8
         JRLw==
X-Gm-Message-State: ACrzQf1rJSkTeFCIb+ke1AjExYTlXXrnPj4RNJCY4BqUAaZvDYem8KUY
        7JgWsrMq+pPM6RhwJyfsOuU=
X-Google-Smtp-Source: AMsMyM6fFngtcxcSSIDcjhql5lkdx2zn1ZEZs6gVeRqUpZKUZq72sZX/kvDbAInx+TfAQucR+uOmdg==
X-Received: by 2002:a17:907:7fa5:b0:791:9a5f:101a with SMTP id qk37-20020a1709077fa500b007919a5f101amr29198866ejc.453.1667482748262;
        Thu, 03 Nov 2022 06:39:08 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fg10-20020a056402548a00b0046146c730easm517745edb.75.2022.11.03.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:07 -0700 (PDT)
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
Subject: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
Date:   Thu,  3 Nov 2022 14:38:57 +0100
Message-Id: <20221103133900.1473855-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103133900.1473855-1-thierry.reding@gmail.com>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

DMA parent devices can define separate DMA busses via the "dma-ranges"
and "#address-cells" and "#size-cells" properties. If the DMA bus has
different cell counts than its parent, this can cause the translation
of DMA address to fails (e.g. truncation from 2 to 1 address cells).

Avoid this by stopping to search for DMA parents when a parent without
a "dma-ranges" property is encountered. Also, since it is the DMA parent
that defines the DMA bus, use the bus' cell counts instead of its parent
cell counts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v10:
- new patch to avoid address truncation when traversing a bus hierarchy
  with mismatching #address-cells properties

Example from Tegra194 (redacted for clarity):

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		framebuffer@0,0 {
			compatible = "framebuffer";
			reg = <0x2 0x57320000 0x0 0x00800000>;
			iommu-addresses = <&dc0 0x2 0x57320000 0x0 0x00800000>;
		};
	};

	bus@0 {
		/* truncation happens here */
		#address-cells = <1>;
		#size-cells = <1>;
		ranges = <0x0 0x0 0x0 0x40000000>;

		mc: memory-controller@2c00000 {
			#address-cells = <2>;
			#size-cells = <2>;

			/*
			 * memory controller provides access to 512 GiB
			 * of system RAM (root of the DMA bus)
			 */
			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
		};

		host1x@13e00000 {
			display-hub@15200000 {
				display@15200000 {
					interconnect-names = "dma-mem", ...;
					interconnects = <&mc ...>;
					memory-region = <&fb>;
				};
			};
		};
	};

During DMA address translation, the framebuffer address (0x257320000)
will first be translated to the DMA parent's DMA bus, which yields the
same value. After that, the current translation code will switch to the
control bus of bus@0 and then the address will be truncated to
0x57320000 due to #address-cells = <1>.

The idea of this patch is to interrupt DMA address translation at &mc
because it is the root of the DMA bus (i.e. its parent does not have a
dma-ranges property) so that the control bus' #address-cells doesn't
truncate the DMA address.

 drivers/of/address.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 14f137a21b0c..e2f45bdbc41a 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -475,6 +475,7 @@ static u64 __of_translate_address(struct device_node *dev,
 				  const __be32 *in_addr, const char *rprop,
 				  struct device_node **host)
 {
+	bool dma = rprop && !strcmp(rprop, "dma-ranges");
 	struct device_node *parent = NULL;
 	struct of_bus *bus, *pbus;
 	__be32 addr[OF_MAX_ADDR_CELLS];
@@ -494,7 +495,12 @@ static u64 __of_translate_address(struct device_node *dev,
 	bus = of_match_bus(parent);
 
 	/* Count address cells & copy address locally */
-	bus->count_cells(dev, &na, &ns);
+	if (dma) {
+		na = of_bus_n_addr_cells(parent);
+		ns = of_bus_n_size_cells(parent);
+	} else {
+		bus->count_cells(dev, &na, &ns);
+	}
 	if (!OF_CHECK_COUNTS(na, ns)) {
 		pr_debug("Bad cell count for %pOF\n", dev);
 		goto bail;
@@ -515,7 +521,7 @@ static u64 __of_translate_address(struct device_node *dev,
 		parent = get_parent(dev);
 
 		/* If root, we have finished */
-		if (parent == NULL) {
+		if (parent == NULL || (dma && !of_get_property(parent, "dma-ranges", NULL))) {
 			pr_debug("reached root node\n");
 			result = of_read_number(addr, na);
 			break;
@@ -536,7 +542,12 @@ static u64 __of_translate_address(struct device_node *dev,
 
 		/* Get new parent bus and counts */
 		pbus = of_match_bus(parent);
-		pbus->count_cells(dev, &pna, &pns);
+		if (dma) {
+			pna = of_bus_n_addr_cells(parent);
+			pns = of_bus_n_size_cells(parent);
+		} else {
+			pbus->count_cells(dev, &pna, &pns);
+		}
 		if (!OF_CHECK_COUNTS(pna, pns)) {
 			pr_err("Bad cell count for %pOF\n", dev);
 			break;
-- 
2.38.1

