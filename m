From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 10 Mar 2020 19:55:39 +0300
Message-ID: <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - major rework and cleanup

...

> +static int tegra210_emc_resume(struct device *dev)
> +{
> +	struct tegra_emc *emc = dev_get_drvdata(dev);
> +
> +	emc->emc_suspend = false;

Looks like the 'emc->emc_suspend' isn't really needed, nothing in kernel
shall touch EMC rate at this point.

Perhaps should be better to make EMC clk exlusive in order to catch
abusers, please see tegra30-emc suspend/resume for an example.

> +	clk_set_rate(emc->emc_clk, emc->emc_resume_rate);
> +
> +	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops tegra210_emc_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
> +};
What about to use the default suspend/resume level?
