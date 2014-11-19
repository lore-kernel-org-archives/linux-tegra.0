From: Nikolaus Schulz <nikolaus.schulz@avionic-design.de>
Subject: Re: [PATCH v5 12/14] clk: tegra: Add EMC clock driver
Date: Wed, 19 Nov 2014 16:29:53 +0100
Message-ID: <20141119152941.GA26442@avionic-0071.adnet.avionic-design.de>
References: <1416312860-4446-1-git-send-email-tomeu.vizoso@collabora.com>
 <1416312860-4446-13-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416312860-4446-13-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-tegra@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, mikko.perttunen@kapsi.fi, acourbot@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 18, 2014 at 01:13:14PM +0100, Tomeu Vizoso wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> The driver is currently only tested on Tegra124 Jetson TK1, but should
> work with other Tegra124 boards, provided that correct EMC tables are
> provided through the device tree. Older chip models have differing
> timing change sequences, so they are not currently supported.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> 
> ---
> 
> v5:	* Get a pointer to the EMC driver at runtime, to be used when
> 	  calling the EMC API.
> 	* Misc. style fixes
> 	* Fix logic for rounding down to a high rate
> 
> v4:	* Adapt to changes in the OF bindings
> 	* Improve error handling
> 	* Fix comment style
> 	* Make static a few more functions
> 
> v3:	* Add some locking to protect the registers that are shared with the MC
> 	  clock
> 
> v2:	* Make sure that the clock is properly registered
> 	* Bail out early from attempts to set the same rate
> ---
> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> new file mode 100644
> index 0000000..399d945
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-emc.c
> @@ -0,0 +1,532 @@
> +/*
> + * Rounds up unless no higher rate exists, in which case down. This way is
> + * safer since things have EMC rate floors. Also don't touch parent_rate
> + * since we don't want the CCF to play with our parent clocks.
> + */
> +static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +		    unsigned long *parent_rate)
> +{
> +	struct tegra_clk_emc *tegra;
> +	u8 ram_code = tegra_read_ram_code();
> +	struct emc_timing *timing;
> +	int i;
> +
> +	tegra = container_of(hw, struct tegra_clk_emc, hw);
> +
> +	for (i = 0; i < tegra->num_timings; i++) {
> +		timing = tegra->timings + i;
> +		if (timing->ram_code != ram_code)
> +			continue;
> +
> +		if (timing->rate >= rate)
> +			return timing->rate;
> +	}
> +
> +	for (i = tegra->num_timings - 1; i >= 0; i--) {
> +		timing = tegra->timings + i;
> +		if (timing->ram_code != ram_code)
> +			continue;
> +
> +		return timing->rate;
> +	}

While this is technically not wrong, it could be simplified to something
like

        struct emc_timing *timing = NULL;

        for (i = 0; i < tegra->num_timings; i++) {
                if (tegra->timings[i].ram_code != ram_code)
                        continue;
                timing = tegra->timings + i;
                if (timing->rate >= rate)
                        return timing->rate;
        }
        if (timing)
                return timing->rate;

> +
> +	return __clk_get_rate(hw->clk);
> +}
