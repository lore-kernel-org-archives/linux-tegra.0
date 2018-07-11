From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 6/7] soc/tegra: pmc: Remove public pad voltage APIs
Date: Wed, 11 Jul 2018 16:30:06 +0100
Message-ID: <7a769dbb-c863-8103-16a4-a39395b55ff8@nvidia.com>
References: <1531317693-3520-1-git-send-email-avienamo@nvidia.com>
 <1531317938-4099-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531317938-4099-1-git-send-email-avienamo@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Adding Laxman ...

On 11/07/18 15:05, Aapo Vienamo wrote:
> Make tegra_io_pad_set_voltage() and tegra_io_pad_get_voltage() static
> and remove the prototypes from pmc.h. Remove enum tegra_io_pad_voltage
> and use the defines from <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> instead.
> 
> These functions aren't used outside of the pmc driver and new use cases
> should use the pinctrl interface instead.
> 
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 17 ++++++++---------
>  include/soc/tegra/pmc.h | 13 -------------
>  2 files changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f68dbfa..8926831 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -45,6 +45,8 @@
>  #include <soc/tegra/fuse.h>
>  #include <soc/tegra/pmc.h>
>  
> +#include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
> +
>  #define PMC_CNTRL			0x0
>  #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
>  #define  PMC_CNTRL_CPU_PWRREQ_OE	BIT(16) /* CPU pwr req enable */
> @@ -1093,8 +1095,7 @@ int tegra_io_pad_is_powered(enum tegra_io_pad id)
>  }
>  EXPORT_SYMBOL(tegra_io_pad_is_powered);
>  
> -int tegra_io_pad_set_voltage(enum tegra_io_pad id,
> -			     enum tegra_io_pad_voltage voltage)
> +static int tegra_io_pad_set_voltage(enum tegra_io_pad id, int voltage)
>  {
>  	const struct tegra_io_pad_soc *pad;
>  	u32 value;
> @@ -1110,7 +1111,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
>  
>  	if (pmc->soc->has_impl_33v_pwr) {
>  		value = tegra_pmc_readl(PMC_IMPL_E_33V_PWR);
> -		if (voltage == TEGRA_IO_PAD_1800000UV)
> +		if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8)
>  			value &= ~BIT(pad->voltage);
>  		else
>  			value |= BIT(pad->voltage);
> @@ -1124,7 +1125,7 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
>  		/* update I/O voltage */
>  		value = tegra_pmc_readl(PMC_PWR_DET_VALUE);
>  
> -		if (voltage == TEGRA_IO_PAD_1800000UV)
> +		if (voltage == TEGRA_IO_PAD_VOLTAGE_3V3)
>  			value &= ~BIT(pad->voltage);
>  		else
>  			value |= BIT(pad->voltage);
> @@ -1138,9 +1139,8 @@ int tegra_io_pad_set_voltage(enum tegra_io_pad id,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(tegra_io_pad_set_voltage);
>  
> -int tegra_io_pad_get_voltage(enum tegra_io_pad id)
> +static int tegra_io_pad_get_voltage(enum tegra_io_pad id)
>  {
>  	const struct tegra_io_pad_soc *pad;
>  	u32 value;
> @@ -1158,11 +1158,10 @@ int tegra_io_pad_get_voltage(enum tegra_io_pad id)
>  		value = tegra_pmc_readl(PMC_PWR_DET_VALUE);
>  
>  	if ((value & BIT(pad->voltage)) == 0)
> -		return TEGRA_IO_PAD_1800000UV;
> +		return TEGRA_IO_PAD_VOLTAGE_1V8;
>  
> -	return TEGRA_IO_PAD_3300000UV;
> +	return TEGRA_IO_PAD_VOLTAGE_3V3;
>  }
> -EXPORT_SYMBOL(tegra_io_pad_get_voltage);
>  
>  /**
>   * tegra_io_rail_power_on() - enable power to I/O rail
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index 14206e8..b6294f6 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -141,16 +141,6 @@ enum tegra_io_pad {
>  #define TEGRA_IO_RAIL_HDMI	TEGRA_IO_PAD_HDMI
>  #define TEGRA_IO_RAIL_LVDS	TEGRA_IO_PAD_LVDS
>  
> -/**
> - * enum tegra_io_pad_voltage - voltage level of the I/O pad's source rail
> - * @TEGRA_IO_PAD_1800000UV: 1.8 V
> - * @TEGRA_IO_PAD_3300000UV: 3.3 V
> - */
> -enum tegra_io_pad_voltage {
> -	TEGRA_IO_PAD_1800000UV,
> -	TEGRA_IO_PAD_3300000UV,
> -};
> -
>  #ifdef CONFIG_SOC_TEGRA_PMC
>  int tegra_powergate_is_powered(unsigned int id);
>  int tegra_powergate_power_on(unsigned int id);
> @@ -164,9 +154,6 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
>  int tegra_io_pad_power_enable(enum tegra_io_pad id);
>  int tegra_io_pad_power_disable(enum tegra_io_pad id);
>  int tegra_io_pad_is_powered(enum tegra_io_pad id);
> -int tegra_io_pad_set_voltage(enum tegra_io_pad id,
> -			     enum tegra_io_pad_voltage voltage);
> -int tegra_io_pad_get_voltage(enum tegra_io_pad id);
>  
>  /* deprecated, use tegra_io_pad_power_{enable,disable}() instead */
>  int tegra_io_rail_power_on(unsigned int id);
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
