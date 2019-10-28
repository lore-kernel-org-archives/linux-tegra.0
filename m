From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v1 01/17] clk: tegra: Add custom CCLK implementation
Date: Mon, 28 Oct 2019 16:57:06 +0200
Message-ID: <20191028145706.GF27141@pdeschrijver-desktop.Nvidia.com>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015211618.20758-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 16, 2019 at 12:16:02AM +0300, Dmitry Osipenko wrote:
> CCLK stands for "CPU Clock", CPU core is running off CCLK. CCLK supports
> multiple parents and it has internal clock divider which uses clock
> skipping technique, meaning that CPU's voltage should correspond to the
> parent clock rate and not CCLK. PLLX is the main CCLK parent that provides
> clock rates above 1GHz and it has special property such that the CCLK's
> internal divider is set into bypass mode when PLLX is set as a parent for
> CCLK.
> 
> This patch forks generic Super Clock into CCLK implementation which takes
> into account all CCLK specifics. The proper CCLK implementation is needed
> by the upcoming Tegra20 CPUFreq driver update that will allow to utilize
> the generic cpufreq-dt driver by moving intermediate clock handling into
> the clock driver. Note that technically this all could be squashed into
> clk-super, but result will be messier.
> 
> Note that currently all CCLKLP bits are left in the clk-super.c and only
> CCLKG is supported by clk-tegra-super-cclk. It shouldn't be difficult
> to move the CCLKLP bits, but CCLKLP is not used by anything in kernel
> and thus better not to touch it for now.

..

> +	super->reg = reg;
> +	super->lock = lock;
> +	super->width = 4;
> +	super->flags = clk_super_flags;
> +	super->frac_div.reg = reg + 4;
> +	super->frac_div.shift = 16;
> +	super->frac_div.width = 8;
> +	super->frac_div.frac_width = 1;
> +	super->frac_div.lock = lock;
> +	super->frac_div.flags = TEGRA_DIVIDER_SUPER;
> +	super->div_ops = &tegra_clk_frac_div_ops;
> +

This is not right. The super clock divider is not a divider, it's a
pulse skipper.

> +	/* Data in .init is copied by clk_register(), so stack variable OK */
> +	super->hw.init = &init;
> +
> +	clk = clk_register(NULL, &super->hw);
> +	if (IS_ERR(clk))
> +		kfree(super);
> +
> +	return clk;
> +}
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index f81c10654aa9..095595a5b8a8 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -699,6 +699,10 @@ struct clk *tegra_clk_register_super_clk(const char *name,
>  		const char * const *parent_names, u8 num_parents,
>  		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
>  		spinlock_t *lock);
> +struct clk *tegra_clk_register_super_cclk(const char *name,
> +		const char * const *parent_names, u8 num_parents,
> +		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
> +		spinlock_t *lock);
>  
>  /**
>   * struct tegra_sdmmc_mux - switch divider with Low Jitter inputs for SDMMC
> -- 
> 2.23.0
> 
