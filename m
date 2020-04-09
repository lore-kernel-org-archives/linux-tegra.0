From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Thu, 9 Apr 2020 22:16:46 +0300
Message-ID: <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-10-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static int tegra210_emc_set_rate(struct device *dev,
> +				 const struct tegra210_clk_emc_config *config)
> +{
> +	struct tegra210_emc *emc = dev_get_drvdata(dev);
> +	struct tegra210_emc_timing *timing = NULL;
> +	unsigned long rate = config->rate;
> +	s64 last_change_delay;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	if (rate == emc->last->rate * 1000UL)
> +		return 0;

Couldn't all the rates be expressed in Hz? Then you won't need all these
multiplications by 1000.

> +	for (i = 0; i < emc->num_timings; i++) {
> +		if (emc->timings[i].rate * 1000UL == rate) {
> +			timing = &emc->timings[i];
> +			break;
> +		}
> +	}
> +
> +	if (!timing)
> +		return -EINVAL;
> +
> +	if (rate > 204000000 && !timing->trained)
> +		return -EINVAL;
> +
> +	emc->next = timing;
> +	last_change_delay = ktime_us_delta(ktime_get(), emc->clkchange_time);
> +
> +	/* XXX use non-busy-looping sleep? */
> +	if ((last_change_delay >= 0) &&
> +	    (last_change_delay < emc->clkchange_delay))
> +		udelay(emc->clkchange_delay - (int)last_change_delay);
> +
> +	spin_lock_irqsave(&emc->lock, flags);
> +	tegra210_emc_set_clock(emc, config->value);
> +	emc->clkchange_time = ktime_get();
> +	emc->last = timing;
> +	spin_unlock_irqrestore(&emc->lock, flags);
> +
> +	return 0;
> +}

I'd suggest to check how much time invocation of ktime_get() takes, at
least it came to a surprise to me in a case of the tegra-cpuidle driver.

It may be well over the emc->clkchange_delay.

...
> +static int tegra210_emc_probe(struct platform_device *pdev)
> +{
...
> +	emc->clkchange_delay = 100;
> +	emc->training_interval = 100;

Not sure why these aren't a constant with the code.. ?
