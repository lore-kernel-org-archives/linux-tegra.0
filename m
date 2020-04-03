From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 23:45:04 +0300
Message-ID: <82a08b57-c151-daf8-0719-1034be07538c@gmail.com>
References: <20200403202209.299823-1-thierry.reding@gmail.com>
 <20200403202209.299823-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200403202209.299823-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

03.04.2020 23:22, Thierry Reding пишет:
...
> +config TEGRA186_TIMER
> +	tristate "NVIDIA Tegra186 timer driver"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	depends on WATCHDOG && WATCHDOG_CORE
> +	help
> +	  Enables support for the timers and watchdogs found on NVIDIA
> +	  Tegra186 and later SoCs.

Personally, I'd like to see this in drivers/watchdog/ because I've seen
cases where subsys maintainers are doing bulk-changes to drivers and
missing those that reside outside of the subsys directory.

But, that's not to me to decide, so I don't really mind.

...
> +static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
> +{
> +	struct tegra186_timer *tegra = wdt->tmr->parent;
> +	u32 value;
> +
> +	/* unmask hardware IRQ, this may have been lost across powergate */
> +	value = TKEIE_WDT_MASK(wdt->index, 1);
> +	writel(value, tegra->regs + TKEIE(wdt->tmr->hwirq));

Perhaps this one also could be relaxed, for consistency. Sorry for
missing it in v2 :)
