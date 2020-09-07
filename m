Return-Path: <SRS0=rvI8=CQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663DBC433E2
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:46:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A142177B
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="MrGMaTt5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgIGTqx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Sep 2020 15:46:53 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10941 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgIGTqv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:46:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568df90004>; Mon, 07 Sep 2020 12:46:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:46:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:46:51 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:46:50 +0000
Subject: Re: [PATCH 9/9] arm64: tegra: Initial Tegra234 VDK support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-10-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3c2f4e9c-28af-d5dc-1daa-40744da32898@nvidia.com>
Date:   Mon, 7 Sep 2020 20:46:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-10-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599507961; bh=NfbdzbDWSK2f9TIVcSseYvz0C+22PNTWcxWId9v0NkQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=MrGMaTt50tv7WbepIwqgeSZ9lE18G7saPrkZhqg3/eGCrKgGs9XXPjwR0cU5JIhpW
         B2H7sqhVWAF4uiAGyky6QeRUKkaGm1GGsCw+UlCh6olzdvnUBdpFqAhYxxk9QGyhep
         leL5Yr+o4JV4Fbobm1SQKvL3Waj4099tzcuTPvw67B5iG4U8fJAjo2Qa9EPuTEITJm
         zUKqvxMcLl4538VrDT6fRHZNJT2V35TMGXfEHuE088b9cPgK0vyNHnNuZIhoH/Fjau
         qrKyKiFJoelT7Gwyt1bj++u6gP5etKVpgFNyKddCHoetRfUrF14USC/o1bTOWpDSUL
         txsb7EttkEG1g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
> supports a subset of the peripherals that will be available in the final
> chip and serves as a bootstrapping platform.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++++
>  drivers/soc/tegra/Kconfig                     |  10 +
>  include/dt-bindings/clock/tegra234-clock.h    |  14 ++
>  include/dt-bindings/reset/tegra234-reset.h    |  10 +
>  6 files changed, 266 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
>  create mode 100644 include/dt-bindings/clock/tegra234-clock.h
>  create mode 100644 include/dt-bindings/reset/tegra234-reset.h
> 
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
> index 2273fc5db19c..9296d12d11e9 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
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
> +		sdhci3 = "/cbb@0/sdhci@3460000";
> +		serial0 = &uarta;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x03100000";
> +		stdout-path = "serial0:115200n8";
> +	};
> +
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
> index 000000000000..3509687441a1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -0,0 +1,191 @@
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


Is there meant to be a fallback option here, because I don't see
anything to match the above compatible string?

Cheers
Jon

-- 
nvpublic
