From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
Date: Fri, 3 Apr 2020 19:33:24 +0300
Message-ID: <a982d831-fc59-f705-8f8a-9370b897adb8@gmail.com>
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
> +		return err;
> +	}
> +
> +	tegra->irq = err;
> +
> +	err = devm_request_irq(dev, tegra->irq, tegra186_timer_irq,
> +			       IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +			       "tegra186-timer", tegra);

Looks like there is no need to store tegra->irq in the struct
tegra186_timer.
