From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 02/10] clk: tegra: Add TEGRA_PLL_BYPASS flag
Date: Mon, 4 Feb 2013 11:43:28 +0530
Message-ID: <510F5188.3010806@nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com> <1359713962-16822-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359713962-16822-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 01 February 2013 03:48 PM, Peter De Schrijver wrote:
> Not all PLLs in Tegra114 have a bypass bit. Adapt the common code to only use
> this bit when available.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Looks good to me.

Reviewed-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

>   drivers/clk/tegra/clk-pll.c |   15 ++++++++++-----
>   drivers/clk/tegra/clk.h     |    8 +++++---
>   2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 912c977..3c3a25e 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -166,7 +166,8 @@ static void _clk_pll_enable(struct clk_hw *hw)
>   	clk_pll_enable_lock(pll);
>   
>   	val = pll_readl_base(pll);
> -	val &= ~PLL_BASE_BYPASS;
> +	if (pll->flags & TEGRA_PLL_BYPASS)
> +		val &= ~PLL_BASE_BYPASS;
>   	val |= PLL_BASE_ENABLE;
>   	pll_writel_base(val, pll);
>   
> @@ -183,7 +184,9 @@ static void _clk_pll_disable(struct clk_hw *hw)
>   	u32 val;
>   
>   	val = pll_readl_base(pll);
> -	val &= ~(PLL_BASE_BYPASS | PLL_BASE_ENABLE);
> +	if (pll->flags & TEGRA_PLL_BYPASS)
> +		val &= ~PLL_BASE_BYPASS;
> +	val &= ~PLL_BASE_ENABLE;
>   	pll_writel_base(val, pll);
>   
>   	if (pll->flags & TEGRA_PLLM) {
> @@ -454,7 +457,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
>   
>   	val = pll_readl_base(pll);
>   
> -	if (val & PLL_BASE_BYPASS)
> +	if ((pll->flags & TEGRA_PLL_BYPASS) && (val & PLL_BASE_BYPASS))
>   		return parent_rate;
>   
>   	if ((pll->flags & TEGRA_PLL_FIXED) && !(val & PLL_BASE_OVERRIDE)) {
> @@ -660,9 +663,10 @@ static struct clk *_tegra_clk_register_pll(const char *name,
>   struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
>   		void __iomem *clk_base, void __iomem *pmc,
>   		unsigned long flags, unsigned long fixed_rate,
> -		struct tegra_clk_pll_params *pll_params, u8 pll_flags,
> +		struct tegra_clk_pll_params *pll_params, u32 pll_flags,
>   		struct tegra_clk_pll_freq_table *freq_table, spinlock_t *lock)
>   {
> +	pll_flags |= TEGRA_PLL_BYPASS;
>   	return _tegra_clk_register_pll(name, parent_name, clk_base, pmc,
>   			flags, fixed_rate, pll_params, pll_flags, freq_table,
>   			lock, &tegra_clk_pll_ops);
> @@ -671,9 +675,10 @@ struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
>   struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
>   		void __iomem *clk_base, void __iomem *pmc,
>   		unsigned long flags, unsigned long fixed_rate,
> -		struct tegra_clk_pll_params *pll_params, u8 pll_flags,
> +		struct tegra_clk_pll_params *pll_params, u32 pll_flags,
>   		struct tegra_clk_pll_freq_table *freq_table, spinlock_t *lock)
>   {
> +	pll_flags |= TEGRA_PLL_BYPASS;
>   	return _tegra_clk_register_pll(name, parent_name, clk_base, pmc,
>   			flags, fixed_rate, pll_params, pll_flags, freq_table,
>   			lock, &tegra_clk_plle_ops);
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index a09d7dc..3cff1df 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -182,12 +182,13 @@ struct tegra_clk_pll_params {
>    * TEGRA_PLL_FIXED - We are not supposed to change output frequency
>    *     of some plls.
>    * TEGRA_PLLE_CONFIGURE - Configure PLLE when enabling.
> + * TEGRA_PLL_BYPASS - PLL has bypass bit
>    */
>   struct tegra_clk_pll {
>   	struct clk_hw	hw;
>   	void __iomem	*clk_base;
>   	void __iomem	*pmc;
> -	u8		flags;
> +	u32		flags;
>   	unsigned long	fixed_rate;
>   	spinlock_t	*lock;
>   	u8		divn_shift;
> @@ -210,18 +211,19 @@ struct tegra_clk_pll {
>   #define TEGRA_PLLM BIT(5)
>   #define TEGRA_PLL_FIXED BIT(6)
>   #define TEGRA_PLLE_CONFIGURE BIT(7)
> +#define TEGRA_PLL_BYPASS BIT(8)
>   
>   extern const struct clk_ops tegra_clk_pll_ops;
>   extern const struct clk_ops tegra_clk_plle_ops;
>   struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
>   		void __iomem *clk_base, void __iomem *pmc,
>   		unsigned long flags, unsigned long fixed_rate,
> -		struct tegra_clk_pll_params *pll_params, u8 pll_flags,
> +		struct tegra_clk_pll_params *pll_params, u32 pll_flags,
>   		struct tegra_clk_pll_freq_table *freq_table, spinlock_t *lock);
>   struct clk *tegra_clk_register_plle(const char *name, const char *parent_name,
>   		void __iomem *clk_base, void __iomem *pmc,
>   		unsigned long flags, unsigned long fixed_rate,
> -		struct tegra_clk_pll_params *pll_params, u8 pll_flags,
> +		struct tegra_clk_pll_params *pll_params, u32 pll_flags,
>   		struct tegra_clk_pll_freq_table *freq_table, spinlock_t *lock);
>   
>   /**
