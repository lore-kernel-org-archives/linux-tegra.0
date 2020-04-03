From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 19:14:33 +0300
Message-ID: <de97ce0c-3fa3-9f13-2b0e-f4369f94e113@gmail.com>
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200331221914.2966407-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

01.04.2020 01:19, Thierry Reding пишет:
...
> +static void tmr_writel(struct tegra186_tmr *tmr, u32 value, unsigned int offset)
> +{
> +	writel(value, tmr->regs + offset);

relaxed?

> +}
> +
> +static void wdt_writel(struct tegra186_wdt *wdt, u32 value, unsigned int offset)
> +{
> +	writel(value, wdt->regs + offset);

relaxed?

> +}
> +
> +static u32 wdt_readl(struct tegra186_wdt *wdt, unsigned int offset)
> +{
> +	return readl(wdt->regs + offset);

relaxed?

> +}

...
> +static irqreturn_t tegra186_timer_irq(int irq, void *data)
> +{
> +	struct tegra186_timer *tegra = data;
> +
> +	if (tegra->wdt) {

Why this check is needed? Please see more below in regards to
devm_request_irq().

> +		tegra186_wdt_disable(tegra->wdt);
> +		tegra186_wdt_enable(tegra->wdt);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int tegra186_timer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tegra186_timer *tegra;
> +	int err;
> +
> +	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
> +	if (!tegra)
> +		return -ENOMEM;
> +
> +	tegra->soc = of_device_get_match_data(dev);
> +	dev_set_drvdata(dev, tegra);
> +	tegra->dev = dev;
> +
> +	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(tegra->regs))
> +		return PTR_ERR(tegra->regs);
> +
> +	err = platform_get_irq(pdev, 0);
> +	if (err < 0) {
> +		dev_err(dev, "failed to get interrupt #0: %d\n", err);

Duplicated error message isn't needed for platform_get_irq().

> +		return err;
> +	}
> +
> +	tegra->irq = err;
> +
> +	err = devm_request_irq(dev, tegra->irq, tegra186_timer_irq,
> +			       IRQF_ONESHOT | IRQF_TRIGGER_HIGH,

Why IRQF_ONESHOT?

And IRQF_TRIGGER_HIGH?.. the interrupt-level should come from the
device-tree.

> +			       "tegra186-timer", tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to request IRQ#%u: %d\n", tegra->irq, err);
> +		return err;
> +	}

Interrupt should be requested at the end of tegra186_timer_probe(),
otherwise probe order isn't correct, leading to a potential race conditions.

> +	/* create a watchdog using a preconfigured timer */
> +	tegra->wdt = tegra186_wdt_create(tegra, 0);
> +	if (IS_ERR(tegra->wdt)) {
> +		err = PTR_ERR(tegra->wdt);
> +		dev_err(dev, "failed to create WDT: %d\n", err);
> +		return err;
> +	}
> +
> +	err = tegra186_timer_tsc_init(tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register TSC counter: %d\n", err);
> +		return err;
> +	}
> +
> +	err = tegra186_timer_osc_init(tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register OSC counter: %d\n", err);
> +		goto unregister_tsc;
> +	}
> +
> +	err = tegra186_timer_usec_init(tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register USEC counter: %d\n", err);
> +		goto unregister_osc;
> +	}
> +
> +	return 0;
> +
> +unregister_osc:
> +	clocksource_unregister(&tegra->osc);
> +unregister_tsc:
> +	clocksource_unregister(&tegra->tsc);

Looks like there is an opportunity for devm_clocksource_register_hz().

> +	return err;
> +}
> +
> +static int tegra186_timer_remove(struct platform_device *pdev)
> +{
> +	struct tegra186_timer *tegra = platform_get_drvdata(pdev);
> +
> +	clocksource_unregister(&tegra->usec);
> +	clocksource_unregister(&tegra->osc);
> +	clocksource_unregister(&tegra->tsc);
> +
> +	return 0;
> +}
> +
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

Could tegra->wdt ever be NULL?

> +		tegra186_wdt_enable(tegra->wdt);
> +
> +	return 0;
> +}
