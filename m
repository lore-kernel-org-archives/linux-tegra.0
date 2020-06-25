From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks
 on Tegra114
Date: Thu, 25 Jun 2020 17:18:58 +0300
Message-ID: <89c432a9-11ad-8f8c-46b5-9df9779467db@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-13-thierry.reding@gmail.com>
 <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
 <20200625073736.GA2800220@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200625073736.GA2800220@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

25.06.2020 10:37, Thierry Reding пишет:
> On Wed, Jun 24, 2020 at 07:19:26PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 16:51, Thierry Reding пишет:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The parent clocks are determined by the output that will be used, not by
>>> the display controller that drives the output. Drop the parent clocks
>>> from the display controller device tree nodes.
>>>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
...
>> Hello Thierry,
>>
>> Tegra DRM fails to probe after this change using next-20200624 on T20/30
>> (T124 also should be broken):
>>
>>  tegra-dc 54200000.dc: failed to get parent clock
>>  tegra-dc 54200000.dc: failed to probe RGB output: -2
> 
> Indeed. I had completely missed that we used to have this RGB output on
> prior chips and therefore do need the parent clock. As of Tegra124 that
> RGB output is no longer present, so this isn't needed anymore.
> 
>> BTW, the commit's title is misleading since the patch touches all SoCs
>> and not only the T114.
> 
> Good catch. I've replaced this with the following:
> 
> --- >8 ---
> commit afd92390fcaa784a6d064f3b07c8d8124e43e5d1
> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Thu Jun 11 19:09:36 2020 +0200
> 
>     ARM: tegra: Drop display controller parent clocks on Tegra124
>     
>     The parent clocks are determined by the output that will be used, not by
>     the display controller that drives the output. On previous generations a
>     simple RGB output used to be part of the display controller and hence an
>     explicit parent clock needed to be assigned to the display controller to
>     drive the RGB output. Starting with Tegra124, that RGB output has been
>     dropped and the parent clock can therefore be removed from the display
>     controller device tree nodes.
>     
>     Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 1afed8496c95..2c992e8e3594 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -105,9 +105,8 @@ dc@54200000 {
>  			compatible = "nvidia,tegra124-dc";
>  			reg = <0x0 0x54200000 0x0 0x00040000>;
>  			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
> -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA124_CLK_DISP1>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> @@ -120,9 +119,8 @@ dc@54240000 {
>  			compatible = "nvidia,tegra124-dc";
>  			reg = <0x0 0x54240000 0x0 0x00040000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
> -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA124_CLK_DISP2>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
> --- >8 ---

Looks good, thank you!
