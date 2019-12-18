From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/19] dt-bindings: soc: tegra-pmc: Add Tegra PMC clock
 bindings
Date: Wed, 18 Dec 2019 10:56:11 +0300
Message-ID: <8cd89182-a430-e9f2-bba7-bad23a7960fd@gmail.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576613046-17159-6-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.12.2019 23:03, Sowjanya Komatineni пишет:
> Tegra PMC has 3 clocks clk_out_1, clk_out_2, and clk_out_3.
> 
> This patch documents PMC clock bindings and adds a header defining
> Tegra PMC clock ids.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 37 +++++++++++++++++++++-
>  include/dt-bindings/soc/tegra-pmc.h                | 15 +++++++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/soc/tegra-pmc.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> index cb12f33a247f..80cdcad4ab8c 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
> @@ -21,6 +21,10 @@ Required properties:
>  - clock-names : Must include the following entries:
>    "pclk" (The Tegra clock of that name),
>    "clk32k_in" (The 32KHz clock input to Tegra).
> +- #clock-cells : Should be 1 for Tegra30 and higher.
> +  In clock consumers, this cell represents the PMC clock ID.
> +  The assignments may be found in header file
> +  <dt-bindings/soc/tegra-pmc.h>.
>  
>  Optional properties:
>  - nvidia,invert-interrupt : If present, inverts the PMU interrupt signal.
> @@ -80,11 +84,12 @@ Optional nodes:
>  Example:
>  
>  / SoC dts including file
> -pmc@7000f400 {
> +pmc: pmc@7000f400 {
>  	compatible = "nvidia,tegra20-pmc";
>  	reg = <0x7000e400 0x400>;
>  	clocks = <&tegra_car 110>, <&clk32k_in>;
>  	clock-names = "pclk", "clk32k_in";
> +	#clock-cells = <1>;
>  	nvidia,invert-interrupt;
>  	nvidia,suspend-mode = <1>;
>  	nvidia,cpu-pwr-good-time = <2000>;
> @@ -171,6 +176,7 @@ Example:
>  		reg = <0x0 0x7000e400 0x0 0x400>;
>  		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>  		clock-names = "pclk", "clk32k_in";
> +		#clock-cells = <1>;
>  
>  		powergates {
>  			pd_audio: aud {
> @@ -260,6 +266,7 @@ Pad configuration state example:
>  		reg = <0x0 0x7000e400 0x0 0x400>;
>  		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>  		clock-names = "pclk", "clk32k_in";
> +		#clock-cells = <1>;
>  
>  		...
>  
> @@ -298,3 +305,31 @@ Pinctrl client example:
>  		pinctrl-1 = <&hdmi_on>;
>  		pinctrl-names = "hdmi-on", "hdmi-off";
>  	};
> +
> +== Clock Control ==
> +
> +Tegra PMC has 3 clocks clk_1, clk_2 and clk_3. Each of these clocks has
> +source selection and enable/disable gate.
> +Parent/source for these clocks can be either of osc, osc_div2, osc_div4,
> +or extern clock from Tegra CAR module.
> +
> +Clock configuration example:
> +	pmc: pmc@7000e400 {
> +		compatible = "nvidia,tegra210-pmc";
> +		reg = <0x0 0x7000e400 0x0 0x400>;
> +		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
> +		clock-names = "pclk", "clk32k_in";
> +		#clock-cells = <1>;
> +	};
> +
> +Clock consumer example:
> +	i2c@7000c500 {
> +		cam_sensor {
> +			...
> +			clocks = <&pmc TEGRA_PMC_CLK_OUT_3>;
> +			clock-names = "mclk";
> +			assigned-clocks = <&pmc TEGRA_PMC_CLK_OUT_3>;
> +			assigned-clock-parents = <&tegra_car TEGRA210_CLK_EXTERN3>;
> +			...
> +		};
> +	};
> diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
> new file mode 100644
> index 000000000000..f7c866404456
> --- /dev/null
> +++ b/include/dt-bindings/soc/tegra-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019-2020, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_SOC_TEGRA_PMC_H
> +#define _DT_BINDINGS_SOC_TEGRA_PMC_H
> +
> +#define TEGRA_PMC_CLK_OUT_1		0
> +#define TEGRA_PMC_CLK_OUT_2		1
> +#define TEGRA_PMC_CLK_OUT_3		2
> +
> +#define TEGRA_PMC_CLK_MAX		3
> +
> +#endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
> 

The TXT binding should be removed since you converted it to YAML.
