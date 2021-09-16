Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE51C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 14:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1B906120C
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 14:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238578AbhIPOfA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238504AbhIPOeu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 10:34:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D44C0613DF;
        Thu, 16 Sep 2021 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=+ThgXGeye/3cxF8A92VFU0/2uOH++TjGaY5XAwvi7Yg=; b=OSp2cKdOjZUKUt3M3aPOn32lSd
        6nx0TJtR7h+sJe/wo9/Jqv2X5dk3JqIMkQwMf7HGm2BjBZeQcYQnRMON0GenxLw1tiNK4maCzxQpk
        gIWO6CQlCdLJ/5tmQLxtp9n4emCTSTr79tKbNoKFCSboc+FSbociVySkylUfjM8s6FeuWTH7Pzg7h
        Ewn5kKQjOV3d5NQg3kSvG8WtQotVLFlbAvHhZ5wz+/8EmzJOnOM9jSTOwEbkTxH1pdCOJIXY7z6P1
        NMux9NRQtrXhN5WKzRyJSgUwAh9icNzXUm0CqJyPCjRNPwKuYTQqfPXkGXluDi5Jpayfz/CqaD1F1
        6VFiSFRw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mQsRw-0005Xx-6G; Thu, 16 Sep 2021 17:33:16 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 5/8] arm64: tegra: Add Host1x context stream IDs on Tegra186+
Date:   Thu, 16 Sep 2021 17:32:59 +0300
Message-Id: <20210916143302.2024933-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916143302.2024933-1-mperttunen@nvidia.com>
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add Host1x context stream IDs on systems that support Host1x context
isolation. Host1x and attached engines can use these stream IDs to
allow isolation between memory used by different processes.

The specified stream IDs must match those configured by the hypervisor,
if one is present.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
* Added context devices on T194.
* Use iommu-map instead of custom property.
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 065185bd65ed..71571c29c7ae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1270,6 +1270,18 @@ host1x@13e00000 {
 
 		iommus = <&smmu TEGRA186_SID_HOST1X>;
 
+		memory-contexts {
+			iommu-map = <
+				0 &smmu TEGRA186_SID_HOST1X_CTX0 1
+				1 &smmu TEGRA186_SID_HOST1X_CTX1 1
+				2 &smmu TEGRA186_SID_HOST1X_CTX2 1
+				3 &smmu TEGRA186_SID_HOST1X_CTX3 1
+				4 &smmu TEGRA186_SID_HOST1X_CTX4 1
+				5 &smmu TEGRA186_SID_HOST1X_CTX5 1
+				6 &smmu TEGRA186_SID_HOST1X_CTX6 1
+				7 &smmu TEGRA186_SID_HOST1X_CTX7 1>;
+		};
+
 		dpaux1: dpaux@15040000 {
 			compatible = "nvidia,tegra186-dpaux";
 			reg = <0x15040000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5788735ef968..abcdc42614a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1412,6 +1412,18 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			memory-contexts {
+				iommu-map = <
+					0 &smmu TEGRA194_SID_HOST1X_CTX0 1
+					1 &smmu TEGRA194_SID_HOST1X_CTX1 1
+					2 &smmu TEGRA194_SID_HOST1X_CTX2 1
+					3 &smmu TEGRA194_SID_HOST1X_CTX3 1
+					4 &smmu TEGRA194_SID_HOST1X_CTX4 1
+					5 &smmu TEGRA194_SID_HOST1X_CTX5 1
+					6 &smmu TEGRA194_SID_HOST1X_CTX6 1
+					7 &smmu TEGRA194_SID_HOST1X_CTX7 1>;
+			};
+
 			nvdec@15140000 {
 				compatible = "nvidia,tegra194-nvdec";
 				reg = <0x15140000 0x00040000>;
-- 
2.32.0

