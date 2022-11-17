Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35865C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 08:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239064AbiKQI7j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 03:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbiKQI7g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 03:59:36 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245605914E
        for <linux-tegra@vger.kernel.org>; Thu, 17 Nov 2022 00:59:30 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id f27so3470867eje.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Nov 2022 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InJVcfBpBEQvzBUsRE0tLsLJTXhnqBOUlXUUd/ZxL1A=;
        b=XBOknt1bnmZG89wO45uMaKa/X9CDVxmDybQNcEehTa2tEbUuHpLjVGAccURt4hiuRy
         43jsBPAor1pWQfLQzvE7GlZoJ1H0dxbBD+BRQndRg+wPFuRCkq5foik1kbn5dSRSpqNw
         EwArl1u8Vw/PgqZ1jcTrOCK7lLsoczAQiqYcukhVUmrWTPxXyspwhnu2EpuoCIVwY+4j
         ClR8Dt2mOz4M50MB6SL/YMhhN5QnVBypWkBDBa18tjFnhsZB591GrA6s6PnTBq7Yhiyi
         S2hQYyV4vRthVjIZ4/1p45I+mdq7rVnhbmLCbi6knxUbaC916KCh4hi9Nhft6Km5KNhQ
         5RLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InJVcfBpBEQvzBUsRE0tLsLJTXhnqBOUlXUUd/ZxL1A=;
        b=b811XbQbeZyAfMWQGXXktyaNFB4zWkD7vG5K876nbGiCwNQn1hxgr87a/m8+qSro5m
         +qCzrCcVCMG7n1kxpyg2IB/Vtr5P4Yo0J+midTY7tPDDwlW4OLcloSMPvg0V4jSpwOYv
         UVEtzE26GT8OvOUJZ0cIujBvz2/5wVZwrOCsqH69LqCyJbvVdrzRxy+IDHt+XUQox3a7
         wmniKyqRArNYoSoaot7UxMwuXsAszEmaBf6MtNZeyMyOzD7Mz1y8+cS1Xc+210z3esU3
         4stfFOb06M42x6RthBnbQ90ksOXVvXrtzrnskJ40zvJUPhoB/ti57+PMEB+d/zW/NYn1
         3OtA==
X-Gm-Message-State: ANoB5pmM+P57HqNj2MR1cQNvLlOPnkC+fLO/Ejsi8l9NUmymfduKjPLs
        XZkgNa9YxEu4DOU5xZ3ZbWQ=
X-Google-Smtp-Source: AA0mqf6rvQC2RV9CMos4TGG6MjgNTrZnnOFJ4m5PrYfhR5sqXUihoJpEq5SmkLMuqFwVeTlCWj1LGg==
X-Received: by 2002:a17:907:b606:b0:7af:ecf4:61c0 with SMTP id vl6-20020a170907b60600b007afecf461c0mr1393508ejc.178.1668675568659;
        Thu, 17 Nov 2022 00:59:28 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q7-20020a170906b28700b0073de0506745sm73364ejz.197.2022.11.17.00.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:59:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Bump #address-cells and #size-cells
Date:   Thu, 17 Nov 2022 09:59:24 +0100
Message-Id: <20221117085924.1804681-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The #address-cells and #size-cells properties for the top-level bus were
set to 1 because that was enough to represent the register ranges of all
the IP blocks on that bus. However, most of these devices can do DMA to
a larger address space, so translation of DMA addresses needs to happen
in a 64-bit address space.

Partially this was already done by the memory controller increasing that
address space by setting #address-cells and #size-cells to 2, but a full
DMA address translation would still cause truncation when traversing to
the top-level bus.

Fix this by setting #address-cells = <2> and #size-cells = <2> on the
top-level bus and adjusting all "reg" and "ranges" properties of its
children.

While at it, also move the PCI and GPU nodes back under the top-level
bus where they belong. The were put outside of it to work around this
same problem.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Rob, just Cc'ing you on this for visibility, no need to take a closer
look or anything. This looks slightly intrusive at first, but it's
really not that big a deal after all. Interestingly it also allows us
to move back PCI and GPU nodes (which I had all but forgotten about)
back under bus@0 where they really belong. I don't recall exactly why
they were moved outside of it, but in retrospect I suspect it was for
the same DMA address translation reason.

 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |   84 +-
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  |   54 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      | 1116 ++++++++---------
 3 files changed, 627 insertions(+), 627 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index bc1041d11f6d..f018fc4c0f70 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2184,67 +2184,67 @@ sor@15b80000 {
 							 GPIO_ACTIVE_LOW>;
 			};
 		};
-	};
 
-	pcie@14100000 {
-		status = "okay";
+		pcie@14100000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		phys = <&p2u_hsio_0>;
-		phy-names = "p2u-0";
-	};
+			phys = <&p2u_hsio_0>;
+			phy-names = "p2u-0";
+		};
 
-	pcie@14140000 {
-		status = "okay";
+		pcie@14140000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		phys = <&p2u_hsio_7>;
-		phy-names = "p2u-0";
-	};
+			phys = <&p2u_hsio_7>;
+			phy-names = "p2u-0";
+		};
 
-	pcie@14180000 {
-		status = "okay";
+		pcie@14180000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		phys = <&p2u_hsio_2>, <&p2u_hsio_3>, <&p2u_hsio_4>,
-		       <&p2u_hsio_5>;
-		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
-	};
+			phys = <&p2u_hsio_2>, <&p2u_hsio_3>, <&p2u_hsio_4>,
+			       <&p2u_hsio_5>;
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3";
+		};
 
-	pcie@141a0000 {
-		status = "okay";
+		pcie@141a0000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
-		vpcie3v3-supply = <&vdd_3v3_pcie>;
-		vpcie12v-supply = <&vdd_12v_pcie>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vpcie3v3-supply = <&vdd_3v3_pcie>;
+			vpcie12v-supply = <&vdd_12v_pcie>;
 
-		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
 
-		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
-	};
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
 
-	pcie-ep@141a0000 {
-		status = "disabled";
+		pcie-ep@141a0000 {
+			status = "disabled";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
 
-		nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
-					      GPIO_ACTIVE_HIGH>;
+			nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+						      GPIO_ACTIVE_HIGH>;
 
-		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
 
-		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
 	};
 
 	fan: pwm-fan {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index f212f6aced04..617fbfaaf02f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2209,46 +2209,46 @@ sor@15b40000 {
 							 GPIO_ACTIVE_LOW>;
 			};
 		};
-	};
 
-	pcie@14160000 {
-		status = "okay";
+		pcie@14160000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		phys = <&p2u_hsio_11>;
-		phy-names = "p2u-0";
-	};
+			phys = <&p2u_hsio_11>;
+			phy-names = "p2u-0";
+		};
 
-	pcie@141a0000 {
-		status = "okay";
+		pcie@141a0000 {
+			status = "okay";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
 
-		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
-	};
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
 
-	pcie-ep@141a0000 {
-		status = "disabled";
+		pcie-ep@141a0000 {
+			status = "disabled";
 
-		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+			vddio-pex-ctl-supply = <&vdd_1v8ao>;
 
-		reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
 
-		nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
-					      GPIO_ACTIVE_HIGH>;
+			nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+						      GPIO_ACTIVE_HIGH>;
 
-		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
-		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
-		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+			phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+			       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+			       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
 
-		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
-			    "p2u-5", "p2u-6", "p2u-7";
+			phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+				    "p2u-5", "p2u-6", "p2u-7";
+		};
 	};
 
 	fan: pwm-fan {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6b38640b3320..e6fe3feae666 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -19,21 +19,21 @@ / {
 	/* control backbone */
 	bus@0 {
 		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x0 0x40000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x0 0x0 0x40000000>;
 
 		apbmisc: misc@100000 {
 			compatible = "nvidia,tegra194-misc";
-			reg = <0x00100000 0xf000>,
-			      <0x0010f000 0x1000>;
+			reg = <0x0 0x00100000 0x0 0xf000>,
+			      <0x0 0x0010f000 0x0 0x1000>;
 		};
 
 		gpio: gpio@2200000 {
 			compatible = "nvidia,tegra194-gpio";
 			reg-names = "security", "gpio";
-			reg = <0x2200000 0x10000>,
-			      <0x2210000 0x10000>;
+			reg = <0x0 0x2200000 0x0 0x10000>,
+			      <0x0 0x2210000 0x0 0x10000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
@@ -91,7 +91,7 @@ gpio: gpio@2200000 {
 
 		cbb-noc@2300000 {
 			compatible = "nvidia,tegra194-cbb-noc";
-			reg = <0x02300000 0x1000>;
+			reg = <0x0 0x02300000 0x0 0x1000>;
 			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
@@ -101,18 +101,18 @@ cbb-noc@2300000 {
 
 		axi2apb: axi2apb@2390000 {
 			compatible = "nvidia,tegra194-axi2apb";
-			reg = <0x2390000 0x1000>,
-			      <0x23a0000 0x1000>,
-			      <0x23b0000 0x1000>,
-			      <0x23c0000 0x1000>,
-			      <0x23d0000 0x1000>,
-			      <0x23e0000 0x1000>;
+			reg = <0x0 0x2390000 0x0 0x1000>,
+			      <0x0 0x23a0000 0x0 0x1000>,
+			      <0x0 0x23b0000 0x0 0x1000>,
+			      <0x0 0x23c0000 0x0 0x1000>,
+			      <0x0 0x23d0000 0x0 0x1000>,
+			      <0x0 0x23e0000 0x0 0x1000>;
 			status = "okay";
 		};
 
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra194-pinmux";
-			reg = <0x2430000 0x17000>;
+			reg = <0x0 0x2430000 0x0 0x17000>;
 			status = "okay";
 
 			pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
@@ -142,7 +142,7 @@ ethernet@2490000 {
 			compatible = "nvidia,tegra194-eqos",
 				     "nvidia,tegra186-eqos",
 				     "snps,dwc-qos-ethernet-4.10";
-			reg = <0x02490000 0x10000>;
+			reg = <0x0 0x02490000 0x0 0x10000>;
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_AXI_CBB>,
 				 <&bpmp TEGRA194_CLK_EQOS_AXI>,
@@ -168,7 +168,7 @@ ethernet@2490000 {
 		gpcdma: dma-controller@2600000 {
 			compatible = "nvidia,tegra194-gpcdma",
 				     "nvidia,tegra186-gpcdma";
-			reg = <0x2600000 0x210000>;
+			reg = <0x0 0x2600000 0x0 0x210000>;
 			resets = <&bpmp TEGRA194_RESET_GPCDMA>;
 			reset-names = "gpcdma";
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
@@ -215,28 +215,28 @@ aconnect@2900000 {
 				 <&bpmp TEGRA194_CLK_APB2APE>;
 			clock-names = "ape", "apb2ape";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_AUD>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x02900000 0x02900000 0x200000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x02900000 0x0 0x02900000 0x0 0x200000>;
 			status = "disabled";
 
 			tegra_ahub: ahub@2900800 {
 				compatible = "nvidia,tegra194-ahub",
 					     "nvidia,tegra186-ahub";
-				reg = <0x02900800 0x800>;
+				reg = <0x0 0x02900800 0x0 0x800>;
 				clocks = <&bpmp TEGRA194_CLK_AHUB>;
 				clock-names = "ahub";
 				assigned-clocks = <&bpmp TEGRA194_CLK_AHUB>;
 				assigned-clock-parents = <&bpmp TEGRA194_CLK_PLLA_OUT0>;
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0x02900800 0x02900800 0x11800>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x02900800 0x0 0x02900800 0x0 0x11800>;
 				status = "disabled";
 
 				tegra_i2s1: i2s@2901000 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901000 0x100>;
+					reg = <0x0 0x2901000 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S1>,
 						 <&bpmp TEGRA194_CLK_I2S1_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -250,7 +250,7 @@ tegra_i2s1: i2s@2901000 {
 				tegra_i2s2: i2s@2901100 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901100 0x100>;
+					reg = <0x0 0x2901100 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S2>,
 						 <&bpmp TEGRA194_CLK_I2S2_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -264,7 +264,7 @@ tegra_i2s2: i2s@2901100 {
 				tegra_i2s3: i2s@2901200 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901200 0x100>;
+					reg = <0x0 0x2901200 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S3>,
 						 <&bpmp TEGRA194_CLK_I2S3_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -278,7 +278,7 @@ tegra_i2s3: i2s@2901200 {
 				tegra_i2s4: i2s@2901300 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901300 0x100>;
+					reg = <0x0 0x2901300 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S4>,
 						 <&bpmp TEGRA194_CLK_I2S4_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -292,7 +292,7 @@ tegra_i2s4: i2s@2901300 {
 				tegra_i2s5: i2s@2901400 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901400 0x100>;
+					reg = <0x0 0x2901400 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S5>,
 						 <&bpmp TEGRA194_CLK_I2S5_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -306,7 +306,7 @@ tegra_i2s5: i2s@2901400 {
 				tegra_i2s6: i2s@2901500 {
 					compatible = "nvidia,tegra194-i2s",
 						     "nvidia,tegra210-i2s";
-					reg = <0x2901500 0x100>;
+					reg = <0x0 0x2901500 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_I2S6>,
 						 <&bpmp TEGRA194_CLK_I2S6_SYNC_INPUT>;
 					clock-names = "i2s", "sync_input";
@@ -320,7 +320,7 @@ tegra_i2s6: i2s@2901500 {
 				tegra_sfc1: sfc@2902000 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x2902000 0x200>;
+					reg = <0x0 0x2902000 0x0 0x200>;
 					sound-name-prefix = "SFC1";
 					status = "disabled";
 				};
@@ -328,7 +328,7 @@ tegra_sfc1: sfc@2902000 {
 				tegra_sfc2: sfc@2902200 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x2902200 0x200>;
+					reg = <0x0 0x2902200 0x0 0x200>;
 					sound-name-prefix = "SFC2";
 					status = "disabled";
 				};
@@ -336,7 +336,7 @@ tegra_sfc2: sfc@2902200 {
 				tegra_sfc3: sfc@2902400 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x2902400 0x200>;
+					reg = <0x0 0x2902400 0x0 0x200>;
 					sound-name-prefix = "SFC3";
 					status = "disabled";
 				};
@@ -344,35 +344,35 @@ tegra_sfc3: sfc@2902400 {
 				tegra_sfc4: sfc@2902600 {
 					compatible = "nvidia,tegra194-sfc",
 						     "nvidia,tegra210-sfc";
-					reg = <0x2902600 0x200>;
+					reg = <0x0 0x2902600 0x0 0x200>;
 					sound-name-prefix = "SFC4";
 					status = "disabled";
 				};
 
 				tegra_amx1: amx@2903000 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x2903000 0x100>;
+					reg = <0x0 0x2903000 0x0 0x100>;
 					sound-name-prefix = "AMX1";
 					status = "disabled";
 				};
 
 				tegra_amx2: amx@2903100 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x2903100 0x100>;
+					reg = <0x0 0x2903100 0x0 0x100>;
 					sound-name-prefix = "AMX2";
 					status = "disabled";
 				};
 
 				tegra_amx3: amx@2903200 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x2903200 0x100>;
+					reg = <0x0 0x2903200 0x0 0x100>;
 					sound-name-prefix = "AMX3";
 					status = "disabled";
 				};
 
 				tegra_amx4: amx@2903300 {
 					compatible = "nvidia,tegra194-amx";
-					reg = <0x2903300 0x100>;
+					reg = <0x0 0x2903300 0x0 0x100>;
 					sound-name-prefix = "AMX4";
 					status = "disabled";
 				};
@@ -380,7 +380,7 @@ tegra_amx4: amx@2903300 {
 				tegra_adx1: adx@2903800 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x2903800 0x100>;
+					reg = <0x0 0x2903800 0x0 0x100>;
 					sound-name-prefix = "ADX1";
 					status = "disabled";
 				};
@@ -388,7 +388,7 @@ tegra_adx1: adx@2903800 {
 				tegra_adx2: adx@2903900 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x2903900 0x100>;
+					reg = <0x0 0x2903900 0x0 0x100>;
 					sound-name-prefix = "ADX2";
 					status = "disabled";
 				};
@@ -396,7 +396,7 @@ tegra_adx2: adx@2903900 {
 				tegra_adx3: adx@2903a00 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x2903a00 0x100>;
+					reg = <0x0 0x2903a00 0x0 0x100>;
 					sound-name-prefix = "ADX3";
 					status = "disabled";
 				};
@@ -404,7 +404,7 @@ tegra_adx3: adx@2903a00 {
 				tegra_adx4: adx@2903b00 {
 					compatible = "nvidia,tegra194-adx",
 						     "nvidia,tegra210-adx";
-					reg = <0x2903b00 0x100>;
+					reg = <0x0 0x2903b00 0x0 0x100>;
 					sound-name-prefix = "ADX4";
 					status = "disabled";
 				};
@@ -412,7 +412,7 @@ tegra_adx4: adx@2903b00 {
 				tegra_dmic1: dmic@2904000 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x2904000 0x100>;
+					reg = <0x0 0x2904000 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC1>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC1>;
@@ -425,7 +425,7 @@ tegra_dmic1: dmic@2904000 {
 				tegra_dmic2: dmic@2904100 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x2904100 0x100>;
+					reg = <0x0 0x2904100 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC2>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC2>;
@@ -438,7 +438,7 @@ tegra_dmic2: dmic@2904100 {
 				tegra_dmic3: dmic@2904200 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x2904200 0x100>;
+					reg = <0x0 0x2904200 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC3>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC3>;
@@ -451,7 +451,7 @@ tegra_dmic3: dmic@2904200 {
 				tegra_dmic4: dmic@2904300 {
 					compatible = "nvidia,tegra194-dmic",
 						     "nvidia,tegra210-dmic";
-					reg = <0x2904300 0x100>;
+					reg = <0x0 0x2904300 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DMIC4>;
 					clock-names = "dmic";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DMIC4>;
@@ -464,7 +464,7 @@ tegra_dmic4: dmic@2904300 {
 				tegra_dspk1: dspk@2905000 {
 					compatible = "nvidia,tegra194-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x2905000 0x100>;
+					reg = <0x0 0x2905000 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DSPK1>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK1>;
@@ -477,7 +477,7 @@ tegra_dspk1: dspk@2905000 {
 				tegra_dspk2: dspk@2905100 {
 					compatible = "nvidia,tegra194-dspk",
 						     "nvidia,tegra186-dspk";
-					reg = <0x2905100 0x100>;
+					reg = <0x0 0x2905100 0x0 0x100>;
 					clocks = <&bpmp TEGRA194_CLK_DSPK2>;
 					clock-names = "dspk";
 					assigned-clocks = <&bpmp TEGRA194_CLK_DSPK2>;
@@ -490,9 +490,9 @@ tegra_dspk2: dspk@2905100 {
 				tegra_ope1: processing-engine@2908000 {
 					compatible = "nvidia,tegra194-ope",
 						     "nvidia,tegra210-ope";
-					reg = <0x2908000 0x100>;
-					#address-cells = <1>;
-					#size-cells = <1>;
+					reg = <0x0 0x2908000 0x0 0x100>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 					ranges;
 					sound-name-prefix = "OPE1";
 					status = "disabled";
@@ -500,20 +500,20 @@ tegra_ope1: processing-engine@2908000 {
 					equalizer@2908100 {
 						compatible = "nvidia,tegra194-peq",
 							     "nvidia,tegra210-peq";
-						reg = <0x2908100 0x100>;
+						reg = <0x0 0x2908100 0x0 0x100>;
 					};
 
 					dynamic-range-compressor@2908200 {
 						compatible = "nvidia,tegra194-mbdrc",
 							     "nvidia,tegra210-mbdrc";
-						reg = <0x2908200 0x200>;
+						reg = <0x0 0x2908200 0x0 0x200>;
 					};
 				};
 
 				tegra_mvc1: mvc@290a000 {
 					compatible = "nvidia,tegra194-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x290a000 0x200>;
+					reg = <0x0 0x290a000 0x0 0x200>;
 					sound-name-prefix = "MVC1";
 					status = "disabled";
 				};
@@ -521,7 +521,7 @@ tegra_mvc1: mvc@290a000 {
 				tegra_mvc2: mvc@290a200 {
 					compatible = "nvidia,tegra194-mvc",
 						     "nvidia,tegra210-mvc";
-					reg = <0x290a200 0x200>;
+					reg = <0x0 0x290a200 0x0 0x200>;
 					sound-name-prefix = "MVC2";
 					status = "disabled";
 				};
@@ -529,7 +529,7 @@ tegra_mvc2: mvc@290a200 {
 				tegra_amixer: amixer@290bb00 {
 					compatible = "nvidia,tegra194-amixer",
 						     "nvidia,tegra210-amixer";
-					reg = <0x290bb00 0x800>;
+					reg = <0x0 0x290bb00 0x0 0x800>;
 					sound-name-prefix = "MIXER1";
 					status = "disabled";
 				};
@@ -537,7 +537,7 @@ tegra_amixer: amixer@290bb00 {
 				tegra_admaif: admaif@290f000 {
 					compatible = "nvidia,tegra194-admaif",
 						     "nvidia,tegra186-admaif";
-					reg = <0x0290f000 0x1000>;
+					reg = <0x0 0x0290f000 0x0 0x1000>;
 					dmas = <&adma 1>, <&adma 1>,
 					       <&adma 2>, <&adma 2>,
 					       <&adma 3>, <&adma 3>,
@@ -588,7 +588,7 @@ tegra_admaif: admaif@290f000 {
 				tegra_asrc: asrc@2910000 {
 					compatible = "nvidia,tegra194-asrc",
 						     "nvidia,tegra186-asrc";
-					reg = <0x2910000 0x2000>;
+					reg = <0x0 0x2910000 0x0 0x2000>;
 					sound-name-prefix = "ASRC1";
 					status = "disabled";
 				};
@@ -597,7 +597,7 @@ tegra_asrc: asrc@2910000 {
 			adma: dma-controller@2930000 {
 				compatible = "nvidia,tegra194-adma",
 					     "nvidia,tegra186-adma";
-				reg = <0x02930000 0x20000>;
+				reg = <0x0 0x02930000 0x0 0x20000>;
 				interrupt-parent = <&agic>;
 				interrupts =  <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 					      <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
@@ -642,8 +642,8 @@ agic: interrupt-controller@2a40000 {
 					     "nvidia,tegra210-agic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-				reg = <0x02a41000 0x1000>,
-				      <0x02a42000 0x2000>;
+				reg = <0x0 0x02a41000 0x0 0x1000>,
+				      <0x0 0x02a42000 0x0 0x2000>;
 				interrupts = <GIC_SPI 145
 					      (GIC_CPU_MASK_SIMPLE(4) |
 					       IRQ_TYPE_LEVEL_HIGH)>;
@@ -655,24 +655,24 @@ agic: interrupt-controller@2a40000 {
 
 		mc: memory-controller@2c00000 {
 			compatible = "nvidia,tegra194-mc";
-			reg = <0x02c00000 0x10000>,   /* MC-SID */
-			      <0x02c10000 0x10000>,   /* MC Broadcast*/
-			      <0x02c20000 0x10000>,   /* MC0 */
-			      <0x02c30000 0x10000>,   /* MC1 */
-			      <0x02c40000 0x10000>,   /* MC2 */
-			      <0x02c50000 0x10000>,   /* MC3 */
-			      <0x02b80000 0x10000>,   /* MC4 */
-			      <0x02b90000 0x10000>,   /* MC5 */
-			      <0x02ba0000 0x10000>,   /* MC6 */
-			      <0x02bb0000 0x10000>,   /* MC7 */
-			      <0x01700000 0x10000>,   /* MC8 */
-			      <0x01710000 0x10000>,   /* MC9 */
-			      <0x01720000 0x10000>,   /* MC10 */
-			      <0x01730000 0x10000>,   /* MC11 */
-			      <0x01740000 0x10000>,   /* MC12 */
-			      <0x01750000 0x10000>,   /* MC13 */
-			      <0x01760000 0x10000>,   /* MC14 */
-			      <0x01770000 0x10000>;   /* MC15 */
+			reg = <0x0 0x02c00000 0x0 0x10000>,   /* MC-SID */
+			      <0x0 0x02c10000 0x0 0x10000>,   /* MC Broadcast*/
+			      <0x0 0x02c20000 0x0 0x10000>,   /* MC0 */
+			      <0x0 0x02c30000 0x0 0x10000>,   /* MC1 */
+			      <0x0 0x02c40000 0x0 0x10000>,   /* MC2 */
+			      <0x0 0x02c50000 0x0 0x10000>,   /* MC3 */
+			      <0x0 0x02b80000 0x0 0x10000>,   /* MC4 */
+			      <0x0 0x02b90000 0x0 0x10000>,   /* MC5 */
+			      <0x0 0x02ba0000 0x0 0x10000>,   /* MC6 */
+			      <0x0 0x02bb0000 0x0 0x10000>,   /* MC7 */
+			      <0x0 0x01700000 0x0 0x10000>,   /* MC8 */
+			      <0x0 0x01710000 0x0 0x10000>,   /* MC9 */
+			      <0x0 0x01720000 0x0 0x10000>,   /* MC10 */
+			      <0x0 0x01730000 0x0 0x10000>,   /* MC11 */
+			      <0x0 0x01740000 0x0 0x10000>,   /* MC12 */
+			      <0x0 0x01750000 0x0 0x10000>,   /* MC13 */
+			      <0x0 0x01760000 0x0 0x10000>,   /* MC14 */
+			      <0x0 0x01770000 0x0 0x10000>;   /* MC15 */
 			reg-names = "sid", "broadcast", "ch0", "ch1", "ch2", "ch3",
 				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9", "ch10",
 				    "ch11", "ch12", "ch13", "ch14", "ch15";
@@ -683,9 +683,9 @@ mc: memory-controller@2c00000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
-			ranges = <0x01700000 0x0 0x01700000 0x0 0x100000>,
-				 <0x02b80000 0x0 0x02b80000 0x0 0x040000>,
-				 <0x02c00000 0x0 0x02c00000 0x0 0x100000>;
+			ranges = <0x0 0x01700000 0x0 0x01700000 0x0 0x100000>,
+				 <0x0 0x02b80000 0x0 0x02b80000 0x0 0x040000>,
+				 <0x0 0x02c00000 0x0 0x02c00000 0x0 0x100000>;
 
 			/*
 			 * Bit 39 of addresses passing through the memory
@@ -702,7 +702,7 @@ mc: memory-controller@2c00000 {
 			 *
 			 * Limit the DMA range for memory clients to [38:0].
 			 */
-			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x80 0x0>;
 
 			emc: external-memory-controller@2c60000 {
 				compatible = "nvidia,tegra194-emc";
@@ -720,7 +720,7 @@ emc: external-memory-controller@2c60000 {
 
 		timer@3010000 {
 			compatible = "nvidia,tegra186-timer";
-			reg = <0x03010000 0x000e0000>;
+			reg = <0x0 0x03010000 0x0 0x000e0000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
@@ -736,7 +736,7 @@ timer@3010000 {
 
 		uarta: serial@3100000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03100000 0x40>;
+			reg = <0x0 0x03100000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTA>;
@@ -748,7 +748,7 @@ uarta: serial@3100000 {
 
 		uartb: serial@3110000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03110000 0x40>;
+			reg = <0x0 0x03110000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTB>;
@@ -760,7 +760,7 @@ uartb: serial@3110000 {
 
 		uartd: serial@3130000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03130000 0x40>;
+			reg = <0x0 0x03130000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTD>;
@@ -772,7 +772,7 @@ uartd: serial@3130000 {
 
 		uarte: serial@3140000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03140000 0x40>;
+			reg = <0x0 0x03140000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTE>;
@@ -784,7 +784,7 @@ uarte: serial@3140000 {
 
 		uartf: serial@3150000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03150000 0x40>;
+			reg = <0x0 0x03150000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTF>;
@@ -796,7 +796,7 @@ uartf: serial@3150000 {
 
 		gen1_i2c: i2c@3160000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x03160000 0x10000>;
+			reg = <0x0 0x03160000 0x0 0x10000>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -811,7 +811,7 @@ gen1_i2c: i2c@3160000 {
 
 		uarth: serial@3170000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x03170000 0x40>;
+			reg = <0x0 0x03170000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTH>;
@@ -823,7 +823,7 @@ uarth: serial@3170000 {
 
 		cam_i2c: i2c@3180000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x03180000 0x10000>;
+			reg = <0x0 0x03180000 0x0 0x10000>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -839,7 +839,7 @@ cam_i2c: i2c@3180000 {
 		/* shares pads with dpaux1 */
 		dp_aux_ch1_i2c: i2c@3190000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x03190000 0x10000>;
+			reg = <0x0 0x03190000 0x0 0x10000>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -858,7 +858,7 @@ dp_aux_ch1_i2c: i2c@3190000 {
 		/* shares pads with dpaux0 */
 		dp_aux_ch0_i2c: i2c@31b0000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x031b0000 0x10000>;
+			reg = <0x0 0x031b0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -877,7 +877,7 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 		/* shares pads with dpaux2 */
 		dp_aux_ch2_i2c: i2c@31c0000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x031c0000 0x10000>;
+			reg = <0x0 0x031c0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -896,7 +896,7 @@ dp_aux_ch2_i2c: i2c@31c0000 {
 		/* shares pads with dpaux3 */
 		dp_aux_ch3_i2c: i2c@31e0000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x031e0000 0x10000>;
+			reg = <0x0 0x031e0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -914,7 +914,7 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 
 		spi@3270000 {
 			compatible = "nvidia,tegra194-qspi";
-			reg = <0x3270000 0x1000>;
+			reg = <0x0 0x3270000 0x0 0x1000>;
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -928,7 +928,7 @@ spi@3270000 {
 		pwm1: pwm@3280000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x3280000 0x10000>;
+			reg = <0x0 0x3280000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM1>;
 			resets = <&bpmp TEGRA194_RESET_PWM1>;
 			reset-names = "pwm";
@@ -939,7 +939,7 @@ pwm1: pwm@3280000 {
 		pwm2: pwm@3290000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x3290000 0x10000>;
+			reg = <0x0 0x3290000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM2>;
 			resets = <&bpmp TEGRA194_RESET_PWM2>;
 			reset-names = "pwm";
@@ -950,7 +950,7 @@ pwm2: pwm@3290000 {
 		pwm3: pwm@32a0000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x32a0000 0x10000>;
+			reg = <0x0 0x32a0000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM3>;
 			resets = <&bpmp TEGRA194_RESET_PWM3>;
 			reset-names = "pwm";
@@ -961,7 +961,7 @@ pwm3: pwm@32a0000 {
 		pwm5: pwm@32c0000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x32c0000 0x10000>;
+			reg = <0x0 0x32c0000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM5>;
 			resets = <&bpmp TEGRA194_RESET_PWM5>;
 			reset-names = "pwm";
@@ -972,7 +972,7 @@ pwm5: pwm@32c0000 {
 		pwm6: pwm@32d0000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x32d0000 0x10000>;
+			reg = <0x0 0x32d0000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM6>;
 			resets = <&bpmp TEGRA194_RESET_PWM6>;
 			reset-names = "pwm";
@@ -983,7 +983,7 @@ pwm6: pwm@32d0000 {
 		pwm7: pwm@32e0000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x32e0000 0x10000>;
+			reg = <0x0 0x32e0000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM7>;
 			resets = <&bpmp TEGRA194_RESET_PWM7>;
 			reset-names = "pwm";
@@ -994,7 +994,7 @@ pwm7: pwm@32e0000 {
 		pwm8: pwm@32f0000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0x32f0000 0x10000>;
+			reg = <0x0 0x32f0000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM8>;
 			resets = <&bpmp TEGRA194_RESET_PWM8>;
 			reset-names = "pwm";
@@ -1004,7 +1004,7 @@ pwm8: pwm@32f0000 {
 
 		spi@3300000 {
 			compatible = "nvidia,tegra194-qspi";
-			reg = <0x3300000 0x1000>;
+			reg = <0x0 0x3300000 0x0 0x1000>;
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1017,7 +1017,7 @@ spi@3300000 {
 
 		sdmmc1: mmc@3400000 {
 			compatible = "nvidia,tegra194-sdhci";
-			reg = <0x03400000 0x10000>;
+			reg = <0x0 0x03400000 0x0 0x10000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC1>,
 				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
@@ -1056,7 +1056,7 @@ sdmmc1: mmc@3400000 {
 
 		sdmmc3: mmc@3440000 {
 			compatible = "nvidia,tegra194-sdhci";
-			reg = <0x03440000 0x10000>;
+			reg = <0x0 0x03440000 0x0 0x10000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC3>,
 				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
@@ -1096,7 +1096,7 @@ sdmmc3: mmc@3440000 {
 
 		sdmmc4: mmc@3460000 {
 			compatible = "nvidia,tegra194-sdhci";
-			reg = <0x03460000 0x10000>;
+			reg = <0x0 0x03460000 0x0 0x10000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC4>,
 				 <&bpmp TEGRA194_CLK_SDMMC_LEGACY_TM>;
@@ -1133,7 +1133,7 @@ sdmmc4: mmc@3460000 {
 
 		hda@3510000 {
 			compatible = "nvidia,tegra194-hda";
-			reg = <0x3510000 0x10000>;
+			reg = <0x0 0x3510000 0x0 0x10000>;
 			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_HDA>,
 				 <&bpmp TEGRA194_CLK_HDA2HDMICODEC>,
@@ -1152,8 +1152,8 @@ hda@3510000 {
 
 		xusb_padctl: padctl@3520000 {
 			compatible = "nvidia,tegra194-xusb-padctl";
-			reg = <0x03520000 0x1000>,
-			      <0x03540000 0x1000>;
+			reg = <0x0 0x03520000 0x0 0x1000>,
+			      <0x0 0x03540000 0x0 0x1000>;
 			reg-names = "padctl", "ao";
 			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -1260,8 +1260,8 @@ usb3-3 {
 
 		usb@3550000 {
 			compatible = "nvidia,tegra194-xudc";
-			reg = <0x03550000 0x8000>,
-			      <0x03558000 0x1000>;
+			reg = <0x0 0x03550000 0x0 0x8000>,
+			      <0x0 0x03558000 0x0 0x1000>;
 			reg-names = "base", "fpci";
 			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_DEV>,
@@ -1282,8 +1282,8 @@ usb@3550000 {
 
 		usb@3610000 {
 			compatible = "nvidia,tegra194-xusb";
-			reg = <0x03610000 0x40000>,
-			      <0x03600000 0x10000>;
+			reg = <0x0 0x03610000 0x0 0x40000>,
+			      <0x0 0x03600000 0x0 0x10000>;
 			reg-names = "hcd", "fpci";
 
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
@@ -1317,7 +1317,7 @@ usb@3610000 {
 
 		fuse@3820000 {
 			compatible = "nvidia,tegra194-efuse";
-			reg = <0x03820000 0x10000>;
+			reg = <0x0 0x03820000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_FUSE>;
 			clock-names = "fuse";
 		};
@@ -1326,10 +1326,10 @@ gic: interrupt-controller@3881000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x03881000 0x1000>,
-			      <0x03882000 0x2000>,
-			      <0x03884000 0x2000>,
-			      <0x03886000 0x2000>;
+			reg = <0x0 0x03881000 0x0 0x1000>,
+			      <0x0 0x03882000 0x0 0x2000>,
+			      <0x0 0x03884000 0x0 0x2000>,
+			      <0x0 0x03886000 0x0 0x2000>;
 			interrupts = <GIC_PPI 9
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 			interrupt-parent = <&gic>;
@@ -1337,7 +1337,7 @@ gic: interrupt-controller@3881000 {
 
 		cec@3960000 {
 			compatible = "nvidia,tegra194-cec";
-			reg = <0x03960000 0x10000>;
+			reg = <0x0 0x03960000 0x0 0x10000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_CEC>;
 			clock-names = "cec";
@@ -1356,7 +1356,7 @@ hte_lic: hardware-timestamp@3aa0000 {
 
 		hsp_top0: hsp@3c00000 {
 			compatible = "nvidia,tegra194-hsp";
-			reg = <0x03c00000 0xa0000>;
+			reg = <0x0 0x03c00000 0x0 0xa0000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
@@ -1374,7 +1374,7 @@ hsp_top0: hsp@3c00000 {
 
 		p2u_hsio_0: phy@3e10000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e10000 0x10000>;
+			reg = <0x0 0x03e10000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1382,7 +1382,7 @@ p2u_hsio_0: phy@3e10000 {
 
 		p2u_hsio_1: phy@3e20000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e20000 0x10000>;
+			reg = <0x0 0x03e20000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1390,7 +1390,7 @@ p2u_hsio_1: phy@3e20000 {
 
 		p2u_hsio_2: phy@3e30000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e30000 0x10000>;
+			reg = <0x0 0x03e30000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1398,7 +1398,7 @@ p2u_hsio_2: phy@3e30000 {
 
 		p2u_hsio_3: phy@3e40000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e40000 0x10000>;
+			reg = <0x0 0x03e40000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1406,7 +1406,7 @@ p2u_hsio_3: phy@3e40000 {
 
 		p2u_hsio_4: phy@3e50000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e50000 0x10000>;
+			reg = <0x0 0x03e50000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1414,7 +1414,7 @@ p2u_hsio_4: phy@3e50000 {
 
 		p2u_hsio_5: phy@3e60000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e60000 0x10000>;
+			reg = <0x0 0x03e60000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1422,7 +1422,7 @@ p2u_hsio_5: phy@3e60000 {
 
 		p2u_hsio_6: phy@3e70000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e70000 0x10000>;
+			reg = <0x0 0x03e70000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1430,7 +1430,7 @@ p2u_hsio_6: phy@3e70000 {
 
 		p2u_hsio_7: phy@3e80000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e80000 0x10000>;
+			reg = <0x0 0x03e80000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1438,7 +1438,7 @@ p2u_hsio_7: phy@3e80000 {
 
 		p2u_hsio_8: phy@3e90000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03e90000 0x10000>;
+			reg = <0x0 0x03e90000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1446,7 +1446,7 @@ p2u_hsio_8: phy@3e90000 {
 
 		p2u_hsio_9: phy@3ea0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03ea0000 0x10000>;
+			reg = <0x0 0x03ea0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1454,7 +1454,7 @@ p2u_hsio_9: phy@3ea0000 {
 
 		p2u_nvhs_0: phy@3eb0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03eb0000 0x10000>;
+			reg = <0x0 0x03eb0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1462,7 +1462,7 @@ p2u_nvhs_0: phy@3eb0000 {
 
 		p2u_nvhs_1: phy@3ec0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03ec0000 0x10000>;
+			reg = <0x0 0x03ec0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1470,7 +1470,7 @@ p2u_nvhs_1: phy@3ec0000 {
 
 		p2u_nvhs_2: phy@3ed0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03ed0000 0x10000>;
+			reg = <0x0 0x03ed0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1478,7 +1478,7 @@ p2u_nvhs_2: phy@3ed0000 {
 
 		p2u_nvhs_3: phy@3ee0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03ee0000 0x10000>;
+			reg = <0x0 0x03ee0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1486,7 +1486,7 @@ p2u_nvhs_3: phy@3ee0000 {
 
 		p2u_nvhs_4: phy@3ef0000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03ef0000 0x10000>;
+			reg = <0x0 0x03ef0000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1494,7 +1494,7 @@ p2u_nvhs_4: phy@3ef0000 {
 
 		p2u_nvhs_5: phy@3f00000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03f00000 0x10000>;
+			reg = <0x0 0x03f00000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1502,7 +1502,7 @@ p2u_nvhs_5: phy@3f00000 {
 
 		p2u_nvhs_6: phy@3f10000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03f10000 0x10000>;
+			reg = <0x0 0x03f10000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1510,7 +1510,7 @@ p2u_nvhs_6: phy@3f10000 {
 
 		p2u_nvhs_7: phy@3f20000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03f20000 0x10000>;
+			reg = <0x0 0x03f20000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1518,7 +1518,7 @@ p2u_nvhs_7: phy@3f20000 {
 
 		p2u_hsio_10: phy@3f30000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03f30000 0x10000>;
+			reg = <0x0 0x03f30000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1526,7 +1526,7 @@ p2u_hsio_10: phy@3f30000 {
 
 		p2u_hsio_11: phy@3f40000 {
 			compatible = "nvidia,tegra194-p2u";
-			reg = <0x03f40000 0x10000>;
+			reg = <0x0 0x03f40000 0x0 0x10000>;
 			reg-names = "ctl";
 
 			#phy-cells = <0>;
@@ -1534,7 +1534,7 @@ p2u_hsio_11: phy@3f40000 {
 
 		sce-noc@b600000 {
 			compatible = "nvidia,tegra194-sce-noc";
-			reg = <0xb600000 0x1000>;
+			reg = <0x0 0xb600000 0x0 0x1000>;
 			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
@@ -1544,7 +1544,7 @@ sce-noc@b600000 {
 
 		rce-noc@be00000 {
 			compatible = "nvidia,tegra194-rce-noc";
-			reg = <0xbe00000 0x1000>;
+			reg = <0x0 0xbe00000 0x0 0x1000>;
 			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
@@ -1554,7 +1554,7 @@ rce-noc@be00000 {
 
 		hsp_aon: hsp@c150000 {
 			compatible = "nvidia,tegra194-hsp";
-			reg = <0x0c150000 0x90000>;
+			reg = <0x0 0x0c150000 0x0 0x90000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
@@ -1579,7 +1579,7 @@ hte_aon: hardware-timestamp@c1e0000 {
 
 		gen2_i2c: i2c@c240000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x0c240000 0x10000>;
+			reg = <0x0 0x0c240000 0x0 0x10000>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1594,7 +1594,7 @@ gen2_i2c: i2c@c240000 {
 
 		gen8_i2c: i2c@c250000 {
 			compatible = "nvidia,tegra194-i2c";
-			reg = <0x0c250000 0x10000>;
+			reg = <0x0 0x0c250000 0x0 0x10000>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1609,7 +1609,7 @@ gen8_i2c: i2c@c250000 {
 
 		uartc: serial@c280000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x0c280000 0x40>;
+			reg = <0x0 0x0c280000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTC>;
@@ -1621,7 +1621,7 @@ uartc: serial@c280000 {
 
 		uartg: serial@c290000 {
 			compatible = "nvidia,tegra194-uart", "nvidia,tegra20-uart";
-			reg = <0x0c290000 0x40>;
+			reg = <0x0 0x0c290000 0x0 0x40>;
 			reg-shift = <2>;
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_UARTG>;
@@ -1633,7 +1633,7 @@ uartg: serial@c290000 {
 
 		rtc: rtc@c2a0000 {
 			compatible = "nvidia,tegra194-rtc", "nvidia,tegra20-rtc";
-			reg = <0x0c2a0000 0x10000>;
+			reg = <0x0 0x0c2a0000 0x0 0x10000>;
 			interrupt-parent = <&pmc>;
 			interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_CLK_32K>;
@@ -1644,8 +1644,8 @@ rtc: rtc@c2a0000 {
 		gpio_aon: gpio@c2f0000 {
 			compatible = "nvidia,tegra194-gpio-aon";
 			reg-names = "security", "gpio";
-			reg = <0xc2f0000 0x1000>,
-			      <0xc2f1000 0x1000>;
+			reg = <0x0 0xc2f0000 0x0 0x1000>,
+			      <0x0 0xc2f1000 0x0 0x1000>;
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
@@ -1659,7 +1659,7 @@ gpio_aon: gpio@c2f0000 {
 
 		pinmux_aon: pinmux@c300000 {
 			compatible = "nvidia,tegra194-pinmux-aon";
-			reg = <0xc300000 0x4000>;
+			reg = <0x0 0xc300000 0x0 0x4000>;
 
 			status = "okay";
 		};
@@ -1667,7 +1667,7 @@ pinmux_aon: pinmux@c300000 {
 		pwm4: pwm@c340000 {
 			compatible = "nvidia,tegra194-pwm",
 				     "nvidia,tegra186-pwm";
-			reg = <0xc340000 0x10000>;
+			reg = <0x0 0xc340000 0x0 0x10000>;
 			clocks = <&bpmp TEGRA194_CLK_PWM4>;
 			resets = <&bpmp TEGRA194_RESET_PWM4>;
 			reset-names = "pwm";
@@ -1677,11 +1677,11 @@ pwm4: pwm@c340000 {
 
 		pmc: pmc@c360000 {
 			compatible = "nvidia,tegra194-pmc";
-			reg = <0x0c360000 0x10000>,
-			      <0x0c370000 0x10000>,
-			      <0x0c380000 0x10000>,
-			      <0x0c390000 0x10000>,
-			      <0x0c3a0000 0x10000>;
+			reg = <0x0 0x0c360000 0x0 0x10000>,
+			      <0x0 0x0c370000 0x0 0x10000>,
+			      <0x0 0x0c380000 0x0 0x10000>,
+			      <0x0 0x0c390000 0x0 0x10000>,
+			      <0x0 0x0c3a0000 0x0 0x10000>;
 			reg-names = "pmc", "wake", "aotag", "scratch", "misc";
 
 			#interrupt-cells = <2>;
@@ -1709,7 +1709,7 @@ sdmmc3_1v8: sdmmc3-1v8 {
 
 		aon-noc@c600000 {
 			compatible = "nvidia,tegra194-aon-noc";
-			reg = <0xc600000 0x1000>;
+			reg = <0x0 0xc600000 0x0 0x1000>;
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,apbmisc = <&apbmisc>;
@@ -1718,7 +1718,7 @@ aon-noc@c600000 {
 
 		bpmp-noc@d600000 {
 			compatible = "nvidia,tegra194-bpmp-noc";
-			reg = <0xd600000 0x1000>;
+			reg = <0x0 0xd600000 0x0 0x1000>;
 			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
@@ -1728,7 +1728,7 @@ bpmp-noc@d600000 {
 
 		smmu_iso: iommu@10000000 {
 			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
-			reg = <0x10000000 0x800000>;
+			reg = <0x0 0x10000000 0x0 0x800000>;
 			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
@@ -1804,8 +1804,8 @@ smmu_iso: iommu@10000000 {
 
 		smmu: iommu@12000000 {
 			compatible = "nvidia,tegra194-smmu", "nvidia,smmu-500";
-			reg = <0x12000000 0x800000>,
-			      <0x11000000 0x800000>;
+			reg = <0x0 0x12000000 0x0 0x800000>,
+			      <0x0 0x11000000 0x0 0x800000>;
 			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
@@ -1882,8 +1882,8 @@ smmu: iommu@12000000 {
 
 		host1x@13e00000 {
 			compatible = "nvidia,tegra194-host1x";
-			reg = <0x13e00000 0x10000>,
-			      <0x13e10000 0x10000>;
+			reg = <0x0 0x13e00000 0x0 0x10000>,
+			      <0x0 0x13e10000 0x0 0x10000>;
 			reg-names = "hypervisor", "vm";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
@@ -1893,10 +1893,10 @@ host1x@13e00000 {
 			resets = <&bpmp TEGRA194_RESET_HOST1X>;
 			reset-names = "host1x";
 
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 
-			ranges = <0x14800000 0x14800000 0x02800000>;
+			ranges = <0x0 0x14800000 0x0 0x14800000 0x0 0x02800000>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
@@ -1913,7 +1913,7 @@ host1x@13e00000 {
 
 			nvdec@15140000 {
 				compatible = "nvidia,tegra194-nvdec";
-				reg = <0x15140000 0x00040000>;
+				reg = <0x0 0x15140000 0x0 0x00040000>;
 				clocks = <&bpmp TEGRA194_CLK_NVDEC1>;
 				clock-names = "nvdec";
 				resets = <&bpmp TEGRA194_RESET_NVDEC1>;
@@ -1932,7 +1932,7 @@ nvdec@15140000 {
 
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display";
-				reg = <0x15200000 0x00040000>;
+				reg = <0x0 0x15200000 0x0 0x00040000>;
 				resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
 					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
 					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP1>,
@@ -1949,14 +1949,14 @@ display-hub@15200000 {
 
 				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
 
-				#address-cells = <1>;
-				#size-cells = <1>;
+				#address-cells = <2>;
+				#size-cells = <2>;
 
-				ranges = <0x15200000 0x15200000 0x40000>;
+				ranges = <0x0 0x15200000 0x0 0x15200000 0x0 0x40000>;
 
 				dc0: display@15200000 {
 					compatible = "nvidia,tegra194-dc";
-					reg = <0x15200000 0x10000>;
+					reg = <0x0 0x15200000 0x0 0x10000>;
 					interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P0>;
 					clock-names = "dc";
@@ -1975,7 +1975,7 @@ dc0: display@15200000 {
 
 				display@15210000 {
 					compatible = "nvidia,tegra194-dc";
-					reg = <0x15210000 0x10000>;
+					reg = <0x0 0x15210000 0x0 0x10000>;
 					interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P1>;
 					clock-names = "dc";
@@ -1994,7 +1994,7 @@ display@15210000 {
 
 				display@15220000 {
 					compatible = "nvidia,tegra194-dc";
-					reg = <0x15220000 0x10000>;
+					reg = <0x0 0x15220000 0x0 0x10000>;
 					interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P2>;
 					clock-names = "dc";
@@ -2013,7 +2013,7 @@ display@15220000 {
 
 				display@15230000 {
 					compatible = "nvidia,tegra194-dc";
-					reg = <0x15230000 0x10000>;
+					reg = <0x0 0x15230000 0x0 0x10000>;
 					interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&bpmp TEGRA194_CLK_NVDISPLAY_P3>;
 					clock-names = "dc";
@@ -2033,7 +2033,7 @@ display@15230000 {
 
 			vic@15340000 {
 				compatible = "nvidia,tegra194-vic";
-				reg = <0x15340000 0x00040000>;
+				reg = <0x0 0x15340000 0x0 0x00040000>;
 				interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_VIC>;
 				clock-names = "vic";
@@ -2050,7 +2050,7 @@ vic@15340000 {
 
 			nvjpg@15380000 {
 				compatible = "nvidia,tegra194-nvjpg";
-				reg = <0x15380000 0x40000>;
+				reg = <0x0 0x15380000 0x0 0x40000>;
 				clocks = <&bpmp TEGRA194_CLK_NVJPG>;
 				clock-names = "nvjpg";
 				resets = <&bpmp TEGRA194_RESET_NVJPG>;
@@ -2066,7 +2066,7 @@ nvjpg@15380000 {
 
 			nvdec@15480000 {
 				compatible = "nvidia,tegra194-nvdec";
-				reg = <0x15480000 0x00040000>;
+				reg = <0x0 0x15480000 0x0 0x00040000>;
 				clocks = <&bpmp TEGRA194_CLK_NVDEC>;
 				clock-names = "nvdec";
 				resets = <&bpmp TEGRA194_RESET_NVDEC>;
@@ -2085,7 +2085,7 @@ nvdec@15480000 {
 
 			nvenc@154c0000 {
 				compatible = "nvidia,tegra194-nvenc";
-				reg = <0x154c0000 0x40000>;
+				reg = <0x0 0x154c0000 0x0 0x40000>;
 				clocks = <&bpmp TEGRA194_CLK_NVENC>;
 				clock-names = "nvenc";
 				resets = <&bpmp TEGRA194_RESET_NVENC>;
@@ -2104,7 +2104,7 @@ nvenc@154c0000 {
 
 			dpaux0: dpaux@155c0000 {
 				compatible = "nvidia,tegra194-dpaux";
-				reg = <0x155c0000 0x10000>;
+				reg = <0x0 0x155c0000 0x0 0x10000>;
 				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_DPAUX>,
 					 <&bpmp TEGRA194_CLK_PLLDP>;
@@ -2138,7 +2138,7 @@ i2c-bus {
 
 			dpaux1: dpaux@155d0000 {
 				compatible = "nvidia,tegra194-dpaux";
-				reg = <0x155d0000 0x10000>;
+				reg = <0x0 0x155d0000 0x0 0x10000>;
 				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_DPAUX1>,
 					 <&bpmp TEGRA194_CLK_PLLDP>;
@@ -2172,7 +2172,7 @@ i2c-bus {
 
 			dpaux2: dpaux@155e0000 {
 				compatible = "nvidia,tegra194-dpaux";
-				reg = <0x155e0000 0x10000>;
+				reg = <0x0 0x155e0000 0x0 0x10000>;
 				interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_DPAUX2>,
 					 <&bpmp TEGRA194_CLK_PLLDP>;
@@ -2206,7 +2206,7 @@ i2c-bus {
 
 			dpaux3: dpaux@155f0000 {
 				compatible = "nvidia,tegra194-dpaux";
-				reg = <0x155f0000 0x10000>;
+				reg = <0x0 0x155f0000 0x0 0x10000>;
 				interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_DPAUX3>,
 					 <&bpmp TEGRA194_CLK_PLLDP>;
@@ -2240,7 +2240,7 @@ i2c-bus {
 
 			nvenc@15a80000 {
 				compatible = "nvidia,tegra194-nvenc";
-				reg = <0x15a80000 0x00040000>;
+				reg = <0x0 0x15a80000 0x0 0x00040000>;
 				clocks = <&bpmp TEGRA194_CLK_NVENC1>;
 				clock-names = "nvenc";
 				resets = <&bpmp TEGRA194_RESET_NVENC1>;
@@ -2259,7 +2259,7 @@ nvenc@15a80000 {
 
 			sor0: sor@15b00000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x15b00000 0x40000>;
+				reg = <0x0 0x15b00000 0x0 0x40000>;
 				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR0_REF>,
 					 <&bpmp TEGRA194_CLK_SOR0_OUT>,
@@ -2283,7 +2283,7 @@ sor0: sor@15b00000 {
 
 			sor1: sor@15b40000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x15b40000 0x40000>;
+				reg = <0x0 0x15b40000 0x0 0x40000>;
 				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
 					 <&bpmp TEGRA194_CLK_SOR1_OUT>,
@@ -2307,7 +2307,7 @@ sor1: sor@15b40000 {
 
 			sor2: sor@15b80000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x15b80000 0x40000>;
+				reg = <0x0 0x15b80000 0x0 0x40000>;
 				interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR2_REF>,
 					 <&bpmp TEGRA194_CLK_SOR2_OUT>,
@@ -2331,7 +2331,7 @@ sor2: sor@15b80000 {
 
 			sor3: sor@15bc0000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x15bc0000 0x40000>;
+				reg = <0x0 0x15bc0000 0x0 0x40000>;
 				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR3_REF>,
 					 <&bpmp TEGRA194_CLK_SOR3_OUT>,
@@ -2354,475 +2354,475 @@ sor3: sor@15bc0000 {
 			};
 		};
 
-		gpu@17000000 {
-			compatible = "nvidia,gv11b";
-			reg = <0x17000000 0x1000000>,
-			      <0x18000000 0x1000000>;
-			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "stall", "nonstall";
-			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
-				 <&bpmp TEGRA194_CLK_GPU_PWR>,
-				 <&bpmp TEGRA194_CLK_FUSE>;
-			clock-names = "gpu", "pwr", "fuse";
-			resets = <&bpmp TEGRA194_RESET_GPU>;
-			reset-names = "gpu";
-			dma-coherent;
+		pcie@14100000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+			reg = <0x0 0x14100000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x0 0x30000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x0 0x30040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x0 0x30080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
-			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
-					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
-			interconnect-names = "dma-mem", "read-0-hp", "write-0",
-					     "read-1", "read-1-hp", "write-1",
-					     "read-2", "read-2-hp", "write-2",
-					     "read-3", "read-3-hp", "write-3";
-			iommus = <&smmu TEGRA194_SID_GPU>;
-		};
-	};
+			status = "disabled";
 
-	pcie@14100000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14100000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x30000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x30040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x30080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <1>;
+			linux,pci-domain = <1>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_1>;
+			clock-names = "core";
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <1>;
-		linux,pci-domain = <1>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_1_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_1>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_1>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_1_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_1>;
-		reset-names = "apb", "core";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 
-		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			nvidia,bpmp = <&bpmp 1>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 1>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
+				 <0x02000000 0x0  0x40000000 0x12 0x30000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB - 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x12 0x3fff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE1 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
-			 <0x02000000 0x0  0x40000000 0x12 0x30000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB - 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x12 0x3fff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie@14120000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+			reg = <0x00 0x14120000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x32000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x00 0x32040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x32080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE1 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie@14120000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14120000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x32000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x32040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x32080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <1>;
+			linux,pci-domain = <2>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_2>;
+			clock-names = "core";
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <1>;
-		linux,pci-domain = <2>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_2_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_2>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_2>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_2_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_2>;
-		reset-names = "apb", "core";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 
-		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			nvidia,bpmp = <&bpmp 2>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 2>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
+				 <0x02000000 0x0  0x40000000 0x12 0x70000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB - 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x12 0x7fff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE2 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
-			 <0x02000000 0x0  0x40000000 0x12 0x70000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB - 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x12 0x7fff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie@14140000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
+			reg = <0x00 0x14140000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x34000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x00 0x34040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x34080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE2 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie@14140000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX1A>;
-		reg = <0x00 0x14140000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x34000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x34040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x34080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <1>;
+			linux,pci-domain = <3>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_3>;
+			clock-names = "core";
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <1>;
-		linux,pci-domain = <3>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_3_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_3>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_3>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_3_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_3>;
-		reset-names = "apb", "core";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 
-		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			nvidia,bpmp = <&bpmp 3>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 3>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
+				 <0x02000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB + 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x12 0xbfff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE3 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000>, /* prefetchable memory (768 MiB) */
-			 <0x02000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x0fff0000>, /* non-prefetchable memory (256 MiB + 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x12 0xbfff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie@14160000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
+			reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x36000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x36080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE3 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie@14160000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
-		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x36000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x36080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <4>;
+			linux,pci-domain = <4>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
+			clock-names = "core";
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <4>;
-		linux,pci-domain = <4>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_4_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_4>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_4_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_4>;
-		reset-names = "apb", "core";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 
-		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			nvidia,bpmp = <&bpmp 4>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 4>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
+				 <0x02000000 0x0  0x40000000 0x17 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x17 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
-			 <0x02000000 0x0  0x40000000 0x17 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x17 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie-ep@14160000 {
+			compatible = "nvidia,tegra194-pcie-ep";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
+			reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x36080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+			      <0x14 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+			reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie-ep@14160000 {
-		compatible = "nvidia,tegra194-pcie-ep";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX4A>;
-		reg = <0x00 0x14160000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x36040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x36080000 0x0 0x00040000>, /* DBI reg space (256K)       */
-		      <0x14 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
-		reg-names = "appl", "atu_dma", "dbi", "addr_space";
+			num-lanes = <4>;
+			num-ib-windows = <2>;
+			num-ob-windows = <8>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
+			clock-names = "core";
 
-		num-lanes = <4>;
-		num-ib-windows = <2>;
-		num-ob-windows = <8>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_4_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_4>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_4>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
+			interrupt-names = "intr";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_4_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_4>;
-		reset-names = "apb", "core";
+			nvidia,bpmp = <&bpmp 4>;
 
-		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
-		interrupt-names = "intr";
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 4>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+		pcie@14180000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
+			reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x38000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x38080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE4 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie@14180000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
-		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x38000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x38080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <8>;
+			linux,pci-domain = <0>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
+			clock-names = "core";
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <8>;
-		linux,pci-domain = <0>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
-		reset-names = "apb", "core";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
-		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			nvidia,bpmp = <&bpmp 0>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 0>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
+				 <0x02000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x1b 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
-			 <0x02000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x1b 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie-ep@14180000 {
+			compatible = "nvidia,tegra194-pcie-ep";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
+			reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x38080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+			      <0x18 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+			reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie-ep@14180000 {
-		compatible = "nvidia,tegra194-pcie-ep";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
-		reg = <0x00 0x14180000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x38040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x38080000 0x0 0x00040000>, /* DBI reg space (256K)       */
-		      <0x18 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
-		reg-names = "appl", "atu_dma", "dbi", "addr_space";
+			num-lanes = <8>;
+			num-ib-windows = <2>;
+			num-ob-windows = <8>;
 
-		status = "disabled";
+			clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
+			clock-names = "core";
 
-		num-lanes = <8>;
-		num-ib-windows = <2>;
-		num-ob-windows = <8>;
+			resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
+				 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
+			interrupt-names = "intr";
 
-		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
-			 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
-		reset-names = "apb", "core";
+			nvidia,bpmp = <&bpmp 0>;
 
-		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
-		interrupt-names = "intr";
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 0>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+		pcie@141a0000 {
+			compatible = "nvidia,tegra194-pcie";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
+			reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x3a000000 0x0 0x00040000>, /* configuration space (256K) */
+			      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x3a080000 0x0 0x00040000>; /* DBI reg space (256K)       */
+			reg-names = "appl", "config", "atu_dma", "dbi";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE0 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie@141a0000 {
-		compatible = "nvidia,tegra194-pcie";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
-		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x3a000000 0x0 0x00040000>, /* configuration space (256K) */
-		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x3a080000 0x0 0x00040000>; /* DBI reg space (256K)       */
-		reg-names = "appl", "config", "atu_dma", "dbi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			num-lanes = <8>;
+			linux,pci-domain = <5>;
 
-		status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pex_rst_c5_out_state>, <&clkreq_c5_bi_dir_state>;
 
-		#address-cells = <3>;
-		#size-cells = <2>;
-		device_type = "pci";
-		num-lanes = <8>;
-		linux,pci-domain = <5>;
+			clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>;
+			clock-names = "core";
 
-		pinctrl-names = "default";
-		pinctrl-0 = <&pex_rst_c5_out_state>, <&clkreq_c5_bi_dir_state>;
+			resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
+				 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
+				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
+			interrupt-names = "intr", "msi";
 
-		resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
-			 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
-		reset-names = "apb", "core";
+			nvidia,bpmp = <&bpmp 5>;
 
-		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0 0 0 0 &gic GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 
-		nvidia,bpmp = <&bpmp 5>;
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x0 0xff>;
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+			ranges = <0x43000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
+				 <0x02000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
+				 <0x01000000 0x0  0x00000000 0x1f 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
 
-		bus-range = <0x0 0xff>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		ranges = <0x43000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000>, /* prefetchable memory (13 GiB) */
-			 <0x02000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xbfff0000>, /* non-prefetchable memory (3 GiB - 64 KiB) */
-			 <0x01000000 0x0  0x00000000 0x1f 0xffff0000 0x0 0x00010000>; /* downstream I/O (64 KiB) */
+		pcie-ep@141a0000 {
+			compatible = "nvidia,tegra194-pcie-ep";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
+			reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
+			      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
+			      <0x00 0x3a080000 0x0 0x00040000>, /* DBI reg space (256K)       */
+			      <0x1c 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
+			reg-names = "appl", "atu_dma", "dbi", "addr_space";
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
-	};
+			status = "disabled";
 
-	pcie-ep@141a0000 {
-		compatible = "nvidia,tegra194-pcie-ep";
-		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8A>;
-		reg = <0x00 0x141a0000 0x0 0x00020000>, /* appl registers (128K)      */
-		      <0x00 0x3a040000 0x0 0x00040000>, /* iATU_DMA reg space (256K)  */
-		      <0x00 0x3a080000 0x0 0x00040000>, /* DBI reg space (256K)       */
-		      <0x1c 0x00000000 0x4 0x00000000>; /* Address Space (16G)        */
-		reg-names = "appl", "atu_dma", "dbi", "addr_space";
+			num-lanes = <8>;
+			num-ib-windows = <2>;
+			num-ob-windows = <8>;
 
-		status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&clkreq_c5_bi_dir_state>;
 
-		num-lanes = <8>;
-		num-ib-windows = <2>;
-		num-ob-windows = <8>;
+			clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>;
+			clock-names = "core";
 
-		pinctrl-names = "default";
-		pinctrl-0 = <&clkreq_c5_bi_dir_state>;
+			resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
+				 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
+			reset-names = "apb", "core";
 
-		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>;
-		clock-names = "core";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
+			interrupt-names = "intr";
 
-		resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
-			 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
-		reset-names = "apb", "core";
+			nvidia,bpmp = <&bpmp 5>;
 
-		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;	/* controller interrupt */
-		interrupt-names = "intr";
+			nvidia,aspm-cmrt-us = <60>;
+			nvidia,aspm-pwr-on-t-us = <20>;
+			nvidia,aspm-l0s-entrance-latency-us = <3>;
 
-		nvidia,bpmp = <&bpmp 5>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
+			interconnect-names = "dma-mem", "write";
+			iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
+			iommu-map-mask = <0x0>;
+			dma-coherent;
+		};
 
-		nvidia,aspm-cmrt-us = <60>;
-		nvidia,aspm-pwr-on-t-us = <20>;
-		nvidia,aspm-l0s-entrance-latency-us = <3>;
+		gpu@17000000 {
+			compatible = "nvidia,gv11b";
+			reg = <0x0 0x17000000 0x0 0x1000000>,
+			      <0x0 0x18000000 0x0 0x1000000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "stall", "nonstall";
+			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+				 <&bpmp TEGRA194_CLK_GPU_PWR>,
+				 <&bpmp TEGRA194_CLK_FUSE>;
+			clock-names = "gpu", "pwr", "fuse";
+			resets = <&bpmp TEGRA194_RESET_GPU>;
+			reset-names = "gpu";
+			dma-coherent;
 
-		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
-				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
-		interconnect-names = "dma-mem", "write";
-		iommu-map = <0x0 &smmu TEGRA194_SID_PCIE5 0x1000>;
-		iommu-map-mask = <0x0>;
-		dma-coherent;
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
+			interconnect-names = "dma-mem", "read-0-hp", "write-0",
+					     "read-1", "read-1-hp", "write-1",
+					     "read-2", "read-2-hp", "write-2",
+					     "read-3", "read-3-hp", "write-3";
+			iommus = <&smmu TEGRA194_SID_GPU>;
+		};
 	};
 
 	sram@40000000 {
-- 
2.38.1

