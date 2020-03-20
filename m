From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 20 Mar 2020 17:39:01 +0300
Message-ID: <df532fef-1533-9da7-d676-f4671746fde3@gmail.com>
References: <20200320133452.3705040-1-thierry.reding@gmail.com>
 <20200320133452.3705040-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200320133452.3705040-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.03.2020 16:34, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Currently this only supports a single watchdog, which uses a timer in
> the background for countdown. Eventually the timers could be used for
> various time-keeping tasks, but by default the architected timer will
> already provide that functionality.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clocksource/Kconfig          |   8 +
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-tegra186.c | 377 +++++++++++++++++++++++++++
>  3 files changed, 386 insertions(+)
>  create mode 100644 drivers/clocksource/timer-tegra186.c
Hello Thierry,

Shouldn't this driver reside in drivers/watchdog/? Like it's done in a
case of the T30+ driver.

...

> +static int __maybe_unused tegra186_timer_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int __maybe_unused tegra186_timer_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(tegra186_timer_pm_ops, tegra186_timer_suspend,
> +			 tegra186_timer_resume);

Perhaps will be better to remove these OPS for now?
