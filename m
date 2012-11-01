From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: add suspend/resume support
Date: Thu, 01 Nov 2012 11:23:19 -0600
Message-ID: <5092B007.7050609@wwwdotorg.org>
References: <1351785186-11431-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351785186-11431-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/01/2012 09:53 AM, Dmitry Osipenko wrote:
> Added suspend/resume pm ops. We need to store current regs vals on suspend and
> restore them on resume.

Interesting. Just literally a couple days ago, I was reviewing a patch
to our internal kernel tree that implemented the same thing for the
pinctrl driver, in almost the same way!

> ---
> Tested on my tablet.

I'm curious how; in what environment. As far as I know, the Tegra
support in the mainline kernel doesn't actually support suspend/resume.
I assume you cherry-picked this pinctrl driver into some other kernel,
and tested this patch there?

> +#ifdef CONFIG_PM_SLEEP
> +static int tegra_pinctrl_suspend_noirq(struct device *dev)

The one major different between this patch and the downstream patch I
reviewed is how suspend/resume is triggered. This uses suspend_noirq,
whereas the downstream patch registers the callbacks using
register_syscore_ops(). Apparently the latter is required (at least in
our downstream kernel) in order to ensure that pinctrl gets suspended
after all other drivers.

I Cc'd Pritesh to comment on this.

Still, perhaps device probe ordering should ensure this upstream so
using register_syscore_ops() might not be necessary, although that
relies on drivers probing in the correct order, which they may not
without explicitly pinctrl_get() calls... back to that same problem again!

...
> +static const struct dev_pm_ops tegra_pinctrl_pm_ops = {
> +	.suspend_noirq = tegra_pinctrl_suspend_noirq,
> +	.resume_noirq = tegra_pinctrl_resume_noirq,
> +};
> +#define TEGRA_PINCTRL_PM	(&tegra_pinctrl_pm_ops)
> +#else
> +#define TEGRA_PINCTRL_PM	NULL
> +#endif

I was going to suggest using something like SET_SYSTEM_SLEEP_PM_OPS, but
I guess there's no equivalent for the _noirq variants.

> @@ -752,6 +838,8 @@ int __devinit tegra_pinctrl_probe(struct platform_device *pdev,
>  
>  	platform_set_drvdata(pdev, pmx);
>  
> +	pdev->dev.driver->pm = TEGRA_PINCTRL_PM;

That might be better done in the struct platform_driver initialization
in pinctrl-tegra*.c?
