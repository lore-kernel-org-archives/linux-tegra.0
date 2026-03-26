Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6A385539;
	Thu, 26 Mar 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520300; cv=none; b=Way7nPrkxF4u1T8uTR3U8erVE0HL0BSMqQljCrE2CcazW1JLSPnhVKy/KAxWctNK45WEq+4838n7a5XLW1BmAyhR95ExT0LY9rWwDWi056NA205h3RlA1L8PNUFV8a6j4V0s63ToKecaePpTg8WG4v6enhLwlYHyxXGNesrR1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520300; c=relaxed/simple;
	bh=PIGqGIsomNDMAjVuVIB/dLu23IA1kHR6eyblrERSefc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyCUkzAENbh1PECEP5Uw08pq9Url9EUbZ3wVXpT/yRQyQZVSsXGmmva0jrH5h9aV2eLPj+w3tbJ0QjGNylNVRBhDMw6ipgGCVQ0w0eLoE6/QYG0A1HwZQWSi2589Yz1nSFWspL20iqPp4gy5tVRrUK070JNIDLL3rlHAsxaxhjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB4TZeJ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB4TZeJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE93C116C6;
	Thu, 26 Mar 2026 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520300;
	bh=PIGqGIsomNDMAjVuVIB/dLu23IA1kHR6eyblrERSefc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CB4TZeJ71BJZ0gCgZl+EgA9uQFcTitXLZwS1weM2W3FFvMSruC3ao6NHV8EGQx42o
	 hzBKY9sYeAHCnyciYzAUyh2XlaMblE+9XZ68afEXxs/LfJOuQptVTUljWesmyPCcWv
	 B1AAEhMjIfBvY85uJnuPyt0IZ8n+l3mv7fLj5Q0zOD9Ba1sm/XrgVQwN2EBWFtchLN
	 Q8pjSZWPh2oMDQamUa0yhvOL6owMJwXwCrd+QVuIpQ55x/StLtwrCveP2O+BE7Vp+S
	 XCtGitdbivKpOOVmHGkGweeXtu3q1erg+msVtu00pxJhuWjjFL0R/990/WR7vFXPiQ
	 v4O3YJlBxJGeA==
Date: Thu, 26 Mar 2026 11:18:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chun Ng <chunn@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ankitag@nvidia.com
Subject: Re: [PATCH 4/4] arm64: tegra: add e2426-1099+e2423-1099 support
Message-ID: <20260326-valiant-marmot-of-variation-9df0be@quoll>
References: <20260325212628.1234082-1-chunn@nvidia.com>
 <20260325212628.1234082-5-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325212628.1234082-5-chunn@nvidia.com>

On Wed, Mar 25, 2026 at 09:26:28PM +0000, Chun Ng wrote:
> Add the Tegra238 SoC device tree (tegra238.dtsi) and a minimal device
> tree for the Tegra238 E2426-1099+E2423-1099 engineering reference
> platform. The device-tree is not yet bootable and further enablement

Then drop it. If this cannot be booted then it is pointless in the
kernel, no benefit, no one can ever use it.

> will be added in follow-up patches.
> 
> Signed-off-by: Chun Ng <chunn@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   2 +
>  .../nvidia/tegra238-e2426-1099+e2423-1099.dts |  16 ++
>  arch/arm64/boot/dts/nvidia/tegra238.dtsi      | 190 ++++++++++++++++++
>  3 files changed, 208 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra238.dtsi
> 
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
> index b139cbd14442..a5357809e222 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -13,6 +13,7 @@ DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
>  DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
>  DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
>  DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
> +DTC_FLAGS_tegra238-e2426-1099+e2423-1099 := -@
>  DTC_FLAGS_tegra264-p3971-0089+p3834-0008 := -@
>  
>  dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
> @@ -34,4 +35,5 @@ dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3737-0000+p3701-0008.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3740-0002+p3701-0008.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-p3768-0000+p3767-0005.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra238-e2426-1099+e2423-1099.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra264-p3971-0089+p3834-0008.dtb
> diff --git a/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts b/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
> new file mode 100644
> index 000000000000..d69ea2114e23
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra238-e2426-1099+e2423-1099.dts
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/dts-v1/;
> +
> +#include "tegra238.dtsi"
> +
> +/ {
> +	model = "NVIDIA Tegra238 E2426-1099+E2423-1099";
> +	compatible = "nvidia,e2426-1099+e2423-1099", "nvidia,tegra238";
> +
> +	bus@0 {
> +		uarta: serial@3100000 {
> +			status = "okay";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra238.dtsi b/arch/arm64/boot/dts/nvidia/tegra238.dtsi
> new file mode 100644
> index 000000000000..0570c3b20e62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra238.dtsi
> @@ -0,0 +1,190 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#include <dt-bindings/clock/nvidia,tegra238.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mailbox/tegra186-hsp.h>
> +#include <dt-bindings/reset/nvidia,tegra238.h>
> +
> +/ {
> +	compatible = "nvidia,tegra238";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	bus@0 {
> +		compatible = "simple-bus";
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x0 0x0 0x80000000>;
> +
> +		uarta: serial@3100000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0x3100000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA238_CLK_UARTA>,
> +				 <&bpmp TEGRA238_CLK_PLLP_OUT0>;
> +			clock-names = "uartclk", "apb_pclk";
> +			assigned-clocks = <&bpmp TEGRA238_CLK_UARTA>;
> +			assigned-clock-parents = <&bpmp TEGRA238_CLK_PLLP_OUT0>;
> +			resets = <&bpmp TEGRA238_RESET_UARTA>;
> +			arm,primecell-periphid = <0x00051011>;
> +			status = "disabled";
> +		};
> +
> +		fuse@3810000 {
> +			compatible = "nvidia,tegra234-efuse";
> +			reg = <0x0 0x03810000 0x0 0x19000>;
> +			clocks = <&bpmp TEGRA238_CLK_FUSE>;
> +			clock-names = "fuse";
> +		};
> +
> +		hsp_top0: tegra-hsp@3c00000 {
> +			compatible = "nvidia,tegra234-hsp", "nvidia,tegra194-hsp";

DTSI says 238, compatible says 234.

Best regards,
Krzysztof

