From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 19:24:55 +0300
Message-ID: <edf08b18-ad19-7191-020d-a06d57747c45@gmail.com>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331221914.2966407-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.04.2020 01:19, Thierry Reding пишет:
...
> +static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
> +				    unsigned int timeout)
> +{
> +	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
> +
> +	tegra186_wdt_disable(wdt);
> +	wdt->base.timeout = timeout;
> +	tegra186_wdt_enable(wdt);

Why changing timeout enables the watchdog?

> +	return 0;
> +}
> +
> +static const struct watchdog_ops tegra186_wdt_ops = {
> +	.owner = THIS_MODULE,
> +	.start = tegra186_wdt_start,
> +	.stop = tegra186_wdt_stop,
> +	.ping = tegra186_wdt_ping,
> +	.set_timeout = tegra186_wdt_set_timeout,
> +};

...
> +static int __maybe_unused tegra186_timer_suspend(struct device *dev)
> +{
> +	struct tegra186_timer *tegra = dev_get_drvdata(dev);
> +
> +	if (tegra->wdt)
> +		tegra186_wdt_disable(tegra->wdt);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused tegra186_timer_resume(struct device *dev)
> +{
> +	struct tegra186_timer *tegra = dev_get_drvdata(dev);
> +
> +	if (tegra->wdt)
> +		tegra186_wdt_enable(tegra->wdt);

What if watchdog is in a stopped state? Why it's enabled unconditionally?

> +	return 0;
> +}
