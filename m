From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: moving stuff away from mach/clk.h
Date: Thu, 29 Nov 2012 11:42:53 +0530
Message-ID: <50B6FCE5.7080003@nvidia.com>
References: <1353999553-5196-1-git-send-email-sivaramn@nvidia.com> <1353999553-5196-2-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353999553-5196-2-git-send-email-sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 27 November 2012 12:29 PM, Sivaram Nair wrote:
> This patch moves some stuff away from mach/clk.h to other mach-tegra
> files. This is part of the efforts to get rid of mach/clk.h which in
> turn will help to enable single zImage.
>
> Signed-off-by: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/mach-tegra/clock.c            |    1 +
>   arch/arm/mach-tegra/clock.h            |   12 ++++++++++--
>   arch/arm/mach-tegra/include/mach/clk.h |   11 -----------
>   3 files changed, 11 insertions(+), 13 deletions(-)

This patch will not add any real value since I have removed clk_cfg_ex 
functionality in clock code rework.
It's just that I will have to rebase my changes on this.

Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.c
> index 867bf8b..4440626 100644
> --- a/arch/arm/mach-tegra/clock.c
> +++ b/arch/arm/mach-tegra/clock.c
> @@ -26,6 +26,7 @@
>   #include <linux/sched.h>
>   #include <linux/seq_file.h>
>   #include <linux/slab.h>
> +#include <mach/clk.h>
>   
>   #include "board.h"
>   #include "clock.h"
> diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
> index 2aa37f5..e6685d4 100644
> --- a/arch/arm/mach-tegra/clock.h
> +++ b/arch/arm/mach-tegra/clock.h
> @@ -25,8 +25,6 @@
>   #include <linux/clkdev.h>
>   #include <linux/list.h>
>   
> -#include <mach/clk.h>
> -
>   #define DIV_BUS			(1 << 0)
>   #define DIV_U71			(1 << 1)
>   #define DIV_U71_FIXED		(1 << 2)
> @@ -70,6 +68,15 @@ struct clk_pll_freq_table {
>   	u8		cpcon;
>   };
>   
> +enum tegra_clk_ex_param {
> +	TEGRA_CLK_VI_INP_SEL,
> +	TEGRA_CLK_DTV_INVERT,
> +	TEGRA_CLK_NAND_PAD_DIV2_ENB,
> +	TEGRA_CLK_PLLD_CSI_OUT_ENB,
> +	TEGRA_CLK_PLLD_DSI_OUT_ENB,
> +	TEGRA_CLK_PLLD_MIPI_MUX_SEL,
> +};
> +
>   enum clk_state {
>   	UNINITIALIZED = 0,
>   	ON,
> @@ -149,5 +156,6 @@ void tegra2_init_clocks(void);
>   void tegra30_init_clocks(void);
>   struct clk *tegra_get_clock_by_name(const char *name);
>   void tegra_clk_init_from_table(struct tegra_clk_init_table *table);
> +int tegra_clk_cfg_ex(struct clk *c, enum tegra_clk_ex_param p, u32 setting);
>   
>   #endif
> diff --git a/arch/arm/mach-tegra/include/mach/clk.h b/arch/arm/mach-tegra/include/mach/clk.h
> index 64d2657..6338652 100644
> --- a/arch/arm/mach-tegra/include/mach/clk.h
> +++ b/arch/arm/mach-tegra/include/mach/clk.h
> @@ -22,18 +22,7 @@
>   
>   struct clk;
>   
> -enum tegra_clk_ex_param {
> -	TEGRA_CLK_VI_INP_SEL,
> -	TEGRA_CLK_DTV_INVERT,
> -	TEGRA_CLK_NAND_PAD_DIV2_ENB,
> -	TEGRA_CLK_PLLD_CSI_OUT_ENB,
> -	TEGRA_CLK_PLLD_DSI_OUT_ENB,
> -	TEGRA_CLK_PLLD_MIPI_MUX_SEL,
> -};
> -
>   void tegra_periph_reset_deassert(struct clk *c);
>   void tegra_periph_reset_assert(struct clk *c);
>   
> -int tegra_clk_cfg_ex(struct clk *c, enum tegra_clk_ex_param p, u32 setting);
> -
>   #endif
