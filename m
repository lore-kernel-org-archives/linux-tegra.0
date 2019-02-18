From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 04/12] of: Add bindings of gpu hw throttle for Tegra
 soctherm
Date: Mon, 18 Feb 2019 14:29:39 -0600
Message-ID: <20190218202939.GA7473@bogus>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
 <1545118484-23641-6-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545118484-23641-6-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 18, 2018 at 03:34:36PM +0800, Wei Ni wrote:
> Add "nvidia,gpu-throt-level" property to set gpu hw
> throttle level.
> 
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  .../bindings/thermal/nvidia,tegra124-soctherm.txt  | 17 +++++++++++++++--
>  include/dt-bindings/thermal/tegra124-soctherm.h    | 22 ++++++++++++++++++----
>  2 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
> index ab66d6feab4b..cf6d0be56b7a 100644
> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
> @@ -52,6 +52,15 @@ Required properties :
>          Must set as following values:
>          TEGRA_SOCTHERM_THROT_LEVEL_LOW, TEGRA_SOCTHERM_THROT_LEVEL_MED
>          TEGRA_SOCTHERM_THROT_LEVEL_HIGH, TEGRA_SOCTHERM_THROT_LEVEL_NONE
> +      - nvidia,gpu-throt-level: This property is for Tegra124 and Tegra210.
> +        It is the level of pulse skippers, which used to throttle clock
> +        frequencies. It indicates gpu clock throttling depth and can be
> +        programmed to any of the following values which represent a throttling
> +        percentage:
> +        TEGRA_SOCTHERM_THROT_LEVEL_NONE (0%)
> +        TEGRA_SOCTHERM_THROT_LEVEL_LOW (50%),
> +        TEGRA_SOCTHERM_THROT_LEVEL_MED (75%),
> +        TEGRA_SOCTHERM_THROT_LEVEL_HIGH (85%).
>        - #cooling-cells: Should be 1. This cooling device only support on/off state.
>          See ./thermal.txt for a description of this property.
>  
> @@ -96,22 +105,26 @@ Example :
>  		throttle-cfgs {
>  			/*
>  			 * When the "heavy" cooling device triggered,
> -			 * the HW will skip cpu clock's pulse in 85% depth
> +			 * the HW will skip cpu clock's pulse in 85% depth,
> +			 * skip gpu clock's pulse in 85% level
>  			 */
>  			throttle_heavy: heavy {
>  				nvidia,priority = <100>;
>  				nvidia,cpu-throt-percent = <85>;
> +				nvidia,gpu-throt-level = <TEGRA_SOCTHERM_THROT_LEVEL_HIGH>;
>  
>  				#cooling-cells = <1>;
>  			};
>  
>  			/*
>  			 * When the "light" cooling device triggered,
> -			 * the HW will skip cpu clock's pulse in 50% depth
> +			 * the HW will skip cpu clock's pulse in 50% depth,
> +			 * skip gpu clock's pulse in 50% level
>  			 */
>  			throttle_light: light {
>  				nvidia,priority = <80>;
>  				nvidia,cpu-throt-percent = <50>;
> +				nvidia,gpu-throt-level = <TEGRA_SOCTHERM_THROT_LEVEL_LOW>;
>  
>  				#cooling-cells = <1>;
>  			};
> diff --git a/include/dt-bindings/thermal/tegra124-soctherm.h b/include/dt-bindings/thermal/tegra124-soctherm.h
> index c15e8b709a0d..75853df1c609 100644
> --- a/include/dt-bindings/thermal/tegra124-soctherm.h
> +++ b/include/dt-bindings/thermal/tegra124-soctherm.h
> @@ -1,5 +1,19 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> + * Copyright (c) 2014 - 2018, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * Author:
> + *      Mikko Perttunen <mperttunen@nvidia.com>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *

Why are you adding this?

>   * This header provides constants for binding nvidia,tegra124-soctherm.
>   */
>  
> @@ -12,9 +26,9 @@
>  #define TEGRA124_SOCTHERM_SENSOR_PLLX 3
>  #define TEGRA124_SOCTHERM_SENSOR_NUM 4
>  
> -#define TEGRA_SOCTHERM_THROT_LEVEL_LOW  0
> -#define TEGRA_SOCTHERM_THROT_LEVEL_MED  1
> -#define TEGRA_SOCTHERM_THROT_LEVEL_HIGH 2
> -#define TEGRA_SOCTHERM_THROT_LEVEL_NONE -1
> +#define TEGRA_SOCTHERM_THROT_LEVEL_NONE 0
> +#define TEGRA_SOCTHERM_THROT_LEVEL_LOW  1
> +#define TEGRA_SOCTHERM_THROT_LEVEL_MED  2
> +#define TEGRA_SOCTHERM_THROT_LEVEL_HIGH 3

You are breaking an ABI.

Rob
