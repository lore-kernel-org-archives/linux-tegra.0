From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 01/10] clk: tegra: Refactor PLL programming code
Date: Mon, 4 Feb 2013 11:36:47 +0530
Message-ID: <510F4FF7.3050502@nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com>
 <1359713962-16822-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359713962-16822-2-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 01 February 2013 03:48 PM, Peter De Schrijver wrote:
> Refactor the PLL programming code to make it useable by the new PLL types
> introduced by Tegra114.
>
> The following changes were done:
>
> * Split programming the PLL into updating m,n,p and updating cpcon
> * Move locking from _update_pll_cpcon() to clk_pll_set_rate()
> * Introduce _get_pll_mnp() helper
> * Move check for identical m,n,p values to clk_pll_set_rate()
> * struct tegra_clk_pll_freq_table will always contain the values as defined
>    by the hardware.
> * Simplify the arguments to clk_pll_wait_for_lock()
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/clk/tegra/clk-pll.c     |  178 +++++++++++++++++------------
>   drivers/clk/tegra/clk-tegra20.c |  144 ++++++++++++------------
>   drivers/clk/tegra/clk-tegra30.c |  234 +++++++++++++++++++-------------------
>   3 files changed, 294 insertions(+), 262 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 165f247..912c977 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1,5 +1,5 @@
>   /*
> - * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2012, 2013, NVIDIA CORPORATION.  All rights reserved.
>    *
>    * This program is free software; you can redistribute it and/or modify it
>    * under the terms and conditions of the GNU General Public License,
> @@ -113,20 +113,23 @@ static void clk_pll_enable_lock(struct tegra_clk_pll *pll)
>          pll_writel_misc(val, pll);
>   }
>
> -static int clk_pll_wait_for_lock(struct tegra_clk_pll *pll,
> -                                void __iomem *lock_addr, u32 lock_bit_idx)
> +static int clk_pll_wait_for_lock(struct tegra_clk_pll *pll)
>   {
>          int i;
> -       u32 val;
> +       u32 val, lock_bit;
> +       void __iomem *lock_addr;
>
>          if (!(pll->flags & TEGRA_PLL_USE_LOCK)) {
>                  udelay(pll->params->lock_delay);
>                  return 0;
>          }
>
> +       lock_addr = pll->clk_base + pll->params->base_reg;

This will not work for PLLE. Lock bit for PLLE is in misc register.

> +       lock_bit = BIT(pll->params->lock_bit_idx);
> +
>          for (i = 0; i < pll->params->lock_delay; i++) {
>                  val = readl_relaxed(lock_addr);
> -               if (val & BIT(lock_bit_idx)) {
> +               if (val & lock_bit) {

Need to change the lock bit idx parameter for Tegra20 and Tegra30 PLLs 
else this patch will break those.

>                          udelay(PLL_POST_LOCK_DELAY);
>                          return 0;
>                  }
> @@ -155,7 +158,7 @@ static int clk_pll_is_enabled(struct clk_hw *hw)
>          return val & PLL_BASE_ENABLE ? 1 : 0;
>   }

<snip>

> @@ -538,8 +570,8 @@ static int clk_plle_enable(struct clk_hw *hw)
>          val |= (PLL_BASE_BYPASS | PLL_BASE_ENABLE);
>          pll_writel_base(val, pll);
>
> -       clk_pll_wait_for_lock(pll, pll->clk_base + pll->params->misc_reg,
> -                             pll->params->lock_bit_idx);
> +       clk_pll_wait_for_lock(pll);
> +
>          return 0;
>   }

<snip>

>   static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
>          /* 1.7 GHz */
> -       { 12000000, 1700000000, 850,  6,  1, 8},
> -       { 13000000, 1700000000, 915,  7,  1, 8},        /* actual: 1699.2 MHz */
> -       { 16800000, 1700000000, 708,  7,  1, 8},        /* actual: 1699.2 MHz */
> -       { 19200000, 1700000000, 885,  10, 1, 8},        /* actual: 1699.2 MHz */
> -       { 26000000, 1700000000, 850,  13, 1, 8},
> +       { 12000000, 1700000000, 850,  6,  0, 8},
> +       { 13000000, 1700000000, 915,  7,  0, 8},        /* actual: 1699.2 MHz */
> +       { 16800000, 1700000000, 708,  7,  0, 8},        /* actual: 1699.2 MHz */
> +       { 19200000, 1700000000, 885,  10, 0, 8},        /* actual: 1699.2 MHz */
> +       { 26000000, 1700000000, 850,  13, 0, 8},
>
>          /* 1.6 GHz */
> -       { 12000000, 1600000000, 800,  6,  1, 8},
> -       { 13000000, 1600000000, 738,  6,  1, 8},        /* actual: 1599.0 MHz */
> -       { 16800000, 1600000000, 857,  9,  1, 8},        /* actual: 1599.7 MHz */
> -       { 19200000, 1600000000, 500,  6,  1, 8},
> -       { 26000000, 1600000000, 800,  13, 1, 8},
> +       { 12000000, 1600000000, 800,  6,  0, 8},
> +       { 13000000, 1600000000, 738,  6,  0, 8},        /* actual: 1599.0 MHz */
> +       { 16800000, 1600000000, 857,  9,  0, 8},        /* actual: 1599.7 MHz */
> +       { 19200000, 1600000000, 500,  6,  0, 8},
> +       { 26000000, 1600000000, 800,  13, 0, 8},
>
>          /* 1.5 GHz */
> -       { 12000000, 1500000000, 750,  6,  1, 8},
> -       { 13000000, 1500000000, 923,  8,  1, 8},        /* actual: 1499.8 MHz */
> -       { 16800000, 1500000000, 625,  7,  1, 8},
> -       { 19200000, 1500000000, 625,  8,  1, 8},
> -       { 26000000, 1500000000, 750,  13, 1, 8},
> +       { 12000000, 1500000000, 750,  6,  0, 8},
> +       { 13000000, 1500000000, 923,  8,  0, 8},        /* actual: 1499.8 MHz */
> +       { 16800000, 1500000000, 625,  7,  0, 8},
> +       { 19200000, 1500000000, 625,  8,  0, 8},
> +       { 26000000, 1500000000, 750,  13, 0, 8},
>
>          /* 1.4 GHz */
> -       { 12000000, 1400000000, 700,  6,  1, 8},
> -       { 13000000, 1400000000, 969,  9,  1, 8},        /* actual: 1399.7 MHz */
> -       { 16800000, 1400000000, 1000, 12, 1, 8},
> -       { 19200000, 1400000000, 875,  12, 1, 8},
> -       { 26000000, 1400000000, 700,  13, 1, 8},
> +       { 12000000, 1400000000, 700,  6,  0, 8},
> +       { 13000000, 1400000000, 969,  9,  0, 8},        /* actual: 1399.7 MHz */
> +       { 16800000, 1400000000, 1000, 12, 0, 8},
> +       { 19200000, 1400000000, 875,  12, 0, 8},
> +       { 26000000, 1400000000, 700,  13, 0, 8},
>
>          /* 1.3 GHz */
> -       { 12000000, 1300000000, 975,  9,  1, 8},
> -       { 13000000, 1300000000, 1000, 10, 1, 8},
> -       { 16800000, 1300000000, 928,  12, 1, 8},        /* actual: 1299.2 MHz */
> -       { 19200000, 1300000000, 812,  12, 1, 8},        /* actual: 1299.2 MHz */
> -       { 26000000, 1300000000, 650,  13, 1, 8},
> +       { 12000000, 1300000000, 975,  9,  0, 8},
> +       { 13000000, 1300000000, 1000, 10, 0, 8},
> +       { 16800000, 1300000000, 928,  12, 0, 8},        /* actual: 1299.2 MHz */
> +       { 19200000, 1300000000, 812,  12, 0, 8},        /* actual: 1299.2 MHz */
> +       { 26000000, 1300000000, 650,  13, 0, 8},
>
>          /* 1.2 GHz */
> -       { 12000000, 1200000000, 1000, 10, 1, 8},
> -       { 13000000, 1200000000, 923,  10, 1, 8},        /* actual: 1199.9 MHz */
> -       { 16800000, 1200000000, 1000, 14, 1, 8},
> -       { 19200000, 1200000000, 1000, 16, 1, 8},
> -       { 26000000, 1200000000, 600,  13, 1, 8},
> +       { 12000000, 1200000000, 1000, 10, 0, 8},
> +       { 13000000, 1200000000, 923,  10, 0, 8},        /* actual: 1199.9 MHz */
> +       { 16800000, 1200000000, 1000, 14, 0, 8},
> +       { 19200000, 1200000000, 1000, 16, 0, 8},
> +       { 26000000, 1200000000, 600,  13, 0, 8},
>
>          /* 1.1 GHz */
> -       { 12000000, 1100000000, 825,  9,  1, 8},
> -       { 13000000, 1100000000, 846,  10, 1, 8},        /* actual: 1099.8 MHz */
> -       { 16800000, 1100000000, 982,  15, 1, 8},        /* actual: 1099.8 MHz */
> -       { 19200000, 1100000000, 859,  15, 1, 8},        /* actual: 1099.5 MHz */
> -       { 26000000, 1100000000, 550,  13, 1, 8},
> +       { 12000000, 1100000000, 825,  9,  0, 8},
> +       { 13000000, 1100000000, 846,  10, 0, 8},        /* actual: 1099.8 MHz */
> +       { 16800000, 1100000000, 982,  15, 0, 8},        /* actual: 1099.8 MHz */
> +       { 19200000, 1100000000, 859,  15, 0, 8},        /* actual: 1099.5 MHz */
> +       { 26000000, 1100000000, 550,  13, 0, 8},
>
>          /* 1 GHz */
> -       { 12000000, 1000000000, 1000, 12, 1, 8},
> -       { 13000000, 1000000000, 1000, 13, 1, 8},
> -       { 16800000, 1000000000, 833,  14, 1, 8},        /* actual: 999.6 MHz */
> -       { 19200000, 1000000000, 625,  12, 1, 8},
> -       { 26000000, 1000000000, 1000, 26, 1, 8},
> +       { 12000000, 1000000000, 1000, 12, 0, 8},
> +       { 13000000, 1000000000, 1000, 13, 0, 8},
> +       { 16800000, 1000000000, 833,  14, 0, 8},        /* actual: 999.6 MHz */
> +       { 19200000, 1000000000, 625,  12, 0, 8},
> +       { 26000000, 1000000000, 1000, 26, 0, 8},
>
>          { 0, 0, 0, 0, 0, 0 },
>   };
>
