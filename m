Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FC4C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EFE613F3
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhFCQrS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhFCQrS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:47:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A507C061760
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f5so2895094eds.0
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2z89MxdxvGWhUJU/SEJ4QU2zKbMDk6xwIYV6O3cHbw=;
        b=DnVc3eGpHw8uTgSt7cOpizBr/x6zHc6dY5npOOIj0aW7DwrTYmk2iu9MlKBcq1EdPC
         eU/0BhqS3ZTvMzlZ1RgNaO3qIplnQhbJm4aOBmMcv8eurVhLJMDqtFUPgBR4U4m+ktyr
         gCu7AJq5n4UoJAGvcyVzYwNu6Y2PEAh4E9qhLNt5W5s8JyWp315B1EQMuI772Eiz/Rj0
         /AeRrVNqyGQcD53ZsA8gYcFth9XW7svrwVeEQMX8GVdOyfFT8EYG1N37bLF0n3NXeDNw
         gf07B4BZKWQvUoRpYjcA2u5znH87BxqfDXmvykM5UAKP8OniCoSdIeWWi4eUPgNHECTQ
         GSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2z89MxdxvGWhUJU/SEJ4QU2zKbMDk6xwIYV6O3cHbw=;
        b=PYJhiworssA3EzbIF72xgWwDJU/OPEdl0D7oXkb0AtTlgIAItQ+OJB9D27MSkfH5xT
         0O3wMqdCzqHnE3h8lhp9qpmfLVMSfJC3fHumHHFd5DL5A6HeHRrGUpcF3CtMXNYeBc8/
         F/v15c3NwS2PH5in2iQCJ5wGC88wxZYqH9snxznavYU3H/HvZjZtK5Fkvs/8aWyMQWuO
         9NJe1F/VQftLjLkph5JkRILSVWy0gQK/V4XX9AwZo/rkVrdkxHONwwcIAIw44asAt4HE
         o55rD1s8EjJU6M6l9P2USDzGAqQ/wkDz0jbJ0ooV89qW6j3b0ML1F/8fHr0K+AGnQ8i6
         m52A==
X-Gm-Message-State: AOAM532bgJrOiOZZ0POghNRW8EaB0GJc5zhsXEwBPUFvWk8d7BpDztPl
        cC2EfSZJqUBtlR0eELaCFP0=
X-Google-Smtp-Source: ABdhPJxnUDf8q5rYtZky60JkpGjvO01nPDdEy3yO1dQIOKvNDd/qUnT8hBVfgtEX1JIEnP/krtSlaw==
X-Received: by 2002:a05:6402:416:: with SMTP id q22mr424114edv.204.1622738718619;
        Thu, 03 Jun 2021 09:45:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y25sm1987038edt.17.2021.06.03.09.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 9/9] arm64: tegra: Enable SMMU support on Tegra194
Date:   Thu,  3 Jun 2021 18:46:32 +0200
Message-Id: <20210603164632.1000458-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the device tree node for the dual-SMMU found on Tegra194 and hook up
peripherals such as host1x, BPMP, HDA, SDMMC, EQOS and VIC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ee71e0d9f895..94e1d8f1a79f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -62,6 +62,7 @@ ethernet@2490000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
 			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_EQOS>;
 			status = "disabled";
 
 			snps,write-requests = <1>;
@@ -733,6 +734,7 @@ sdmmc1: mmc@3400000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
 			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_SDMMC1>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -759,6 +761,7 @@ sdmmc3: mmc@3440000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
 			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_SDMMC3>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -790,6 +793,7 @@ sdmmc4: mmc@3460000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB &emc>;
 			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_SDMMC4>;
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
@@ -821,6 +825,7 @@ hda@3510000 {
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
 			interconnect-names = "dma-mem", "write";
+			iommus = <&smmu TEGRA194_SID_HDA>;
 			status = "disabled";
 		};
 
@@ -1300,6 +1305,84 @@ pmc: pmc@c360000 {
 			interrupt-controller;
 		};
 
+		smmu: iommu@12000000 {
+			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
+			reg = <0x12000000 0x800000>,
+			      <0x11000000 0x800000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			stream-match-mask = <0x7f80>;
+			#global-interrupts = <2>;
+			#iommu-cells = <1>;
+
+			nvidia,memory-controller = <&mc>;
+			status = "okay";
+		};
+
 		host1x@13e00000 {
 			compatible = "nvidia,tegra194-host1x";
 			reg = <0x13e00000 0x10000>,
@@ -1319,6 +1402,7 @@ host1x@13e00000 {
 			ranges = <0x15000000 0x15000000 0x01000000>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
 			interconnect-names = "dma-mem";
+			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display";
@@ -1430,6 +1514,7 @@ vic@15340000 {
 				interconnects = <&mc TEGRA194_MEMORY_CLIENT_VICSRD &emc>,
 						<&mc TEGRA194_MEMORY_CLIENT_VICSWR &emc>;
 				interconnect-names = "dma-mem", "write";
+				iommus = <&smmu TEGRA194_SID_VIC>;
 			};
 
 			dpaux0: dpaux@155c0000 {
@@ -2136,6 +2221,7 @@ bpmp: bpmp {
 				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAR &emc>,
 				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAW &emc>;
 		interconnect-names = "read", "write", "dma-mem", "dma-write";
+		iommus = <&smmu TEGRA194_SID_BPMP>;
 
 		bpmp_i2c: i2c {
 			compatible = "nvidia,tegra186-bpmp-i2c";
-- 
2.31.1

