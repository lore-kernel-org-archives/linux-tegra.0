From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 02/17] pinctrl: tegra: add suspend and resume support
Date: Tue, 18 Jun 2019 12:22:50 +0300
Message-ID: <7706a287-44b7-3ad6-37ff-47e97172a798@gmail.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560843991-24123-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

18.06.2019 10:46, Sowjanya Komatineni пишет:
> This patch adds suspend and resume support for Tegra pinctrl driver
> and registers them to syscore so the pinmux settings are restored
> before the devices resume.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c    | 62 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +++
>  drivers/pinctrl/tegra/pinctrl-tegra114.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra124.c |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra20.c  |  1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 13 +++++++
>  drivers/pinctrl/tegra/pinctrl-tegra30.c  |  1 +
>  7 files changed, 84 insertions(+)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index 34596b246578..ceced30d8bd1 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -20,11 +20,16 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/slab.h>
> +#include <linux/syscore_ops.h>
>  
>  #include "../core.h"
>  #include "../pinctrl-utils.h"
>  #include "pinctrl-tegra.h"
>  
> +#define EMMC2_PAD_CFGPADCTRL_0			0x1c8
> +#define EMMC4_PAD_CFGPADCTRL_0			0x1e0
> +#define EMMC_DPD_PARKING			(0x1fff << 14)
> +
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>  {
>  	return readl(pmx->regs[bank] + reg);
> @@ -619,6 +624,48 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
>  			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
>  		}
>  	}
> +
> +	if (pmx->soc->has_park_padcfg) {
> +		val = pmx_readl(pmx, 0, EMMC2_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC2_PAD_CFGPADCTRL_0);
> +
> +		val = pmx_readl(pmx, 0, EMMC4_PAD_CFGPADCTRL_0);
> +		val &= ~EMMC_DPD_PARKING;
> +		pmx_writel(pmx, val, 0, EMMC4_PAD_CFGPADCTRL_0);
> +	}
> +}

Is there any reason why parked_bit can't be changed to parked_bitmask like I was
asking in a comment to v2?

I suppose that it's more preferable to keep pinctrl-tegra.c platform-agnostic for
consistency when possible, hence adding platform specifics here should be discouraged.
And then the parked_bitmask will also result in a proper hardware description in the code.
