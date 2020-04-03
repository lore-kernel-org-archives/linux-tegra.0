From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 23:51:57 +0300
Message-ID: <eb2a848f-9a4f-7c06-aff0-86d5087fe053@gmail.com>
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
> +static irqreturn_t tegra186_timer_irq(int irq, void *data)
> +{
> +	struct tegra186_timer *tegra = data;
> +
> +	if (watchdog_active(&tegra->wdt->base)) {
> +		tegra186_wdt_disable(tegra->wdt);
> +		tegra186_wdt_enable(tegra->wdt);
> +	}

Shouldn't this return IRQ_NONE if watchdog is inactive?

> +	return IRQ_HANDLED;
> +}
