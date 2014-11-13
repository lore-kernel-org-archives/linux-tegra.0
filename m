From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 11/13] clk: tegra: Add EMC clock driver
Date: Thu, 13 Nov 2014 11:51:43 +0100
Message-ID: <20141113105143.GA26417@zorro.zusammrottung.local>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
 <1415779051-26410-12-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415779051-26410-12-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 12, 2014 at 08:56:34AM +0100, Tomeu Vizoso wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The driver is currently only tested on Tegra124 Jetson TK1, but should
> work with other Tegra124 boards, provided that correct EMC tables are
> provided through the device tree. Older chip models have differing
> timing change sequences, so they are not currently supported.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
[...]
> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> new file mode 100644
> index 0000000..75beacd
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-emc.c
[...]
> +/*
> + * Rounds up unless no higher rate exists, in which case down. This way is
> + * safer since things have EMC rate floors. Also don't touch parent_rate
> + * since we don't want the CCF to play with our parent clocks.
> + */
> +static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +		    unsigned long *parent_rate)
> +{
> +	struct tegra_emc *tegra = container_of(hw, struct tegra_emc, hw);
> +	u8 ram_code = tegra_read_ram_code();
> +	struct emc_timing *timing;
> +	int i;
> +
> +	/*
> +	 * Returning the original rate will lead to a more sensible error
> +	 * message when emc_set_rate fails.
> +	 */
> +	if (tegra->num_timings == 0)
> +		return rate;
> +
> +	for (i = 0; i < tegra->num_timings; ++i) {
> +		timing = tegra->timings + i;
> +		if (timing->ram_code != ram_code)
> +			continue;

Is timing->ram_code != ram_code really something that is allowed?

> +
> +		if (timing->rate >= rate)
> +			return timing->rate;
> +	}
> +
> +	return tegra->timings[tegra->num_timings - 1].rate;

If tegra->timings has timings for different ram_codes, the last timing
might not be for the requested ram_code.

> +}
