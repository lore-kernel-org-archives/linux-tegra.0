Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A459C4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC06123772
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="ES84HOtf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgIXKcl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgIXKcl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:32:41 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DD1C0613CE
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2020 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ttARta9FUbXQAC/UGu+urDO/nsRto92uhviXd0C8eSY=; b=ES84HOtflE4sNPnIm02zSLKub5
        eVKqDKhqC2O1eCRTGjvH357YXwshiqfhdBnYAKPZ9kQcU/5JR2Y4iVBGo3KXH/wonXjcuJFOra5us
        PDOFXUFgvDlGGQCGO8+XeUzWb66ZOkuB+sZc7pnTCsxWPC5PicDb9lXtSA3KAAWMhDwY7DYdndmXP
        /t/ItgqvFu4HOw2ZuCS8QJ/VZTH4hageBwKkmeRZQI4Z8RnMSpsnSTCAxGHF3sXARnPjSV+nkj9AJ
        b2r72srMlPopeBllJbagrb8x1M6roKJtEe5XoR3tKkfw4u0iyXrFkf/INNvsQa5WjSRylS81IQwR3
        6/hDCkfQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kLOYI-0006cz-BO; Thu, 24 Sep 2020 13:32:38 +0300
Subject: Re: [PATCH v2 14/14] arm64: tegra: Initial Tegra234 VDK support
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
 <20200917100752.3516153-15-thierry.reding@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <06d34868-7c99-0c05-ea38-b2202b05baa6@kapsi.fi>
Date:   Thu, 24 Sep 2020 13:32:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200917100752.3516153-15-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/17/20 1:07 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
> supports a subset of the peripherals that will be available in the final
> chip and serves as a bootstrapping platform.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop compatible string for BPMP shared memory nodes
> - add fallback compatible string for RTC
> 
>   arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>   .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 189 ++++++++++++++++++
>   drivers/soc/tegra/Kconfig                     |  10 +
>   include/dt-bindings/clock/tegra234-clock.h    |  14 ++
>   include/dt-bindings/reset/tegra234-reset.h    |  10 +
>   6 files changed, 264 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
>   create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
>   create mode 100644 include/dt-bindings/clock/tegra234-clock.h
>   create mode 100644 include/dt-bindings/reset/tegra234-reset.h
> 
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
> index 2273fc5db19c..9296d12d11e9 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
>   dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
>   dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
>   dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> new file mode 100644
> index 000000000000..f6e6a24829af
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "tegra234.dtsi"
> +
> +/ {
> +	model = "NVIDIA Tegra234 VDK";
> +	compatible = "nvidia,tegra234-vdk", "nvidia,tegra234";
> +
> +	aliases {

cbb should be replaced with bus also here

> +		sdhci3 = "/cbb@0/sdhci@3460000";
> +		serial0 = &uarta;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x03100000";
> +		stdout-path = "serial0:115200n8";
> +	};
> +

and here.

Mikko

> +	cbb@0 {
> +		serial@3100000 {
> +			status = "okay";
> +		};
> +
> +		sdhci@3460000 {
> +			status = "okay";
> +			bus-width = <8>;
> +			non-removable;
> +			only-1-8-v;
> +		};
> +
> +		rtc@c2a0000 {
> +			status = "okay";
> +		};
> +
> +		pmc@c360000 {
> +			nvidia,invert-interrupt;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> new file mode 100644
> index 000000000000..f0efb3a62804
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/clock/tegra234-clock.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/tegra186-hsp.h>
> +#include <dt-bindings/reset/tegra234-reset.h>
> +
> +/ {
> +	compatible = "nvidia,tegra234";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	bus@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		ranges = <0x0 0x0 0x0 0x40000000>;
> +
> +		misc@100000 {
> +			compatible = "nvidia,tegra234-misc";
> +			reg = <0x00100000 0xf000>,
> +			      <0x0010f000 0x1000>;
> +			status = "okay";
> +		};
> +
> +		uarta: serial@3100000 {
> +			compatible = "nvidia,tegra234-uart", "nvidia,tegra20-uart";
> +			reg = <0x03100000 0x10000>;
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA234_CLK_UARTA>;
> +			clock-names = "serial";
> +			resets = <&bpmp TEGRA234_RESET_UARTA>;
> +			reset-names = "serial";
> +			status = "disabled";
> +		};
> +
> +		mmc@3460000 {
> +			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
> +			reg = <0x03460000 0x20000>;
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA234_CLK_SDMMC4>;
> +			clock-names = "sdhci";
> +			resets = <&bpmp TEGRA234_RESET_SDMMC4>;
> +			reset-names = "sdhci";
> +			dma-coherent;
> +			status = "disabled";
> +		};
> +
> +		fuse@3810000 {
> +			compatible = "nvidia,tegra234-efuse";
> +			reg = <0x03810000 0x10000>;
> +			clocks = <&bpmp TEGRA234_CLK_FUSE>;
> +			clock-names = "fuse";
> +		};
> +
> +		hsp_top0: hsp@3c00000 {
> +			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
> +			reg = <0x03c00000 0xa0000>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "doorbell", "shared0", "shared1", "shared2",
> +					  "shared3", "shared4", "shared5", "shared6",
> +					  "shared7";
> +			#mbox-cells = <2>;
> +		};
> +
> +		hsp_aon: hsp@c150000 {
> +			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";
> +			reg = <0x0c150000 0x90000>;
> +			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +			/*
> +			 * Shared interrupt 0 is routed only to AON/SPE, so
> +			 * we only have 4 shared interrupts for the CCPLEX.
> +			 */
> +			interrupt-names = "shared1", "shared2", "shared3", "shared4";
> +			#mbox-cells = <2>;
> +		};
> +
> +		rtc@c2a0000 {
> +			compatible = "nvidia,tegra234-rtc", "nvidia,tegra20-rtc";
> +			reg = <0x0c2a0000 0x10000>;
> +			interrupt-parent = <&pmc>;
> +			interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		pmc: pmc@c360000 {
> +			compatible = "nvidia,tegra234-pmc";
> +			reg = <0x0c360000 0x10000>,
> +			      <0x0c370000 0x10000>,
> +			      <0x0c380000 0x10000>,
> +			      <0x0c390000 0x10000>,
> +			      <0x0c3a0000 0x10000>;
> +			reg-names = "pmc", "wake", "aotag", "scratch", "misc";
> +
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +		};
> +
> +		gic: interrupt-controller@f400000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0f400000 0x010000>, /* GICD */
> +			      <0x0f440000 0x200000>; /* GICR */
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +
> +			#redistributor-regions = <1>;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +		};
> +	};
> +
> +	sysram@40000000 {
> +		compatible = "nvidia,tegra234-sysram", "mmio-sram";
> +		reg = <0x0 0x40000000 0x0 0x50000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x40000000 0x50000>;
> +
> +		cpu_bpmp_tx: shmem@4e000 {
> +			reg = <0x4e000 0x1000>;
> +			label = "cpu-bpmp-tx";
> +			pool;
> +		};
> +
> +		cpu_bpmp_rx: shmem@4f000 {
> +			reg = <0x4f000 0x1000>;
> +			label = "cpu-bpmp-rx";
> +			pool;
> +		};
> +	};
> +
> +	bpmp: bpmp {
> +		compatible = "nvidia,tegra234-bpmp", "nvidia,tegra186-bpmp";
> +		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
> +				    TEGRA_HSP_DB_MASTER_BPMP>;
> +		shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +		#power-domain-cells = <1>;
> +
> +		bpmp_i2c: i2c {
> +			compatible = "nvidia,tegra186-bpmp-i2c";
> +			nvidia,bpmp-bus-id = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			reg = <0x000>;
> +
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		status = "okay";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		interrupt-parent = <&gic>;
> +		always-on;
> +	};
> +};
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 6bc603d0b9d9..976dee036470 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -119,6 +119,16 @@ config ARCH_TEGRA_194_SOC
>   	help
>   	  Enable support for the NVIDIA Tegra194 SoC.
>   
> +config ARCH_TEGRA_234_SOC
> +	bool "NVIDIA Tegra234 SoC"
> +	select MAILBOX
> +	select TEGRA_BPMP
> +	select TEGRA_HSP_MBOX
> +	select TEGRA_IVC
> +	select SOC_TEGRA_PMC
> +	help
> +	  Enable support for the NVIDIA Tegra234 SoC.
> +
>   endif
>   endif
>   
> diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
> new file mode 100644
> index 000000000000..2c82072950ee
> --- /dev/null
> +++ b/include/dt-bindings/clock/tegra234-clock.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2018-2019, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef DT_BINDINGS_CLOCK_TEGRA234_CLOCK_H
> +#define DT_BINDINGS_CLOCK_TEGRA234_CLOCK_H
> +
> +/** @brief output of gate CLK_ENB_FUSE */
> +#define TEGRA234_CLK_FUSE			40
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
> +#define TEGRA234_CLK_SDMMC4			123
> +/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
> +#define TEGRA234_CLK_UARTA			155
> +
> +#endif
> diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
> new file mode 100644
> index 000000000000..b3c63be06d2d
> --- /dev/null
> +++ b/include/dt-bindings/reset/tegra234-reset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2018-2020, NVIDIA CORPORATION. All rights reserved. */
> +
> +#ifndef DT_BINDINGS_RESET_TEGRA234_RESET_H
> +#define DT_BINDINGS_RESET_TEGRA234_RESET_H
> +
> +#define TEGRA234_RESET_SDMMC4			85
> +#define TEGRA234_RESET_UARTA			100
> +
> +#endif
> 
