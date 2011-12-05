From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio/tegra: Dynamically allocate IRQ base, and
 support DT
Date: Mon, 5 Dec 2011 14:55:28 +0800
Message-ID: <20111205065527.GD2980@S2100-06.ap.freescale.net>
References: <1322700336-26866-1-git-send-email-swarren@nvidia.com>
 <1322700336-26866-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322700336-26866-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 30, 2011 at 05:45:36PM -0700, Stephen Warren wrote:
[...]
>  static void tegra_gpio_irq_ack(struct irq_data *d)
>  {
> -	int gpio = d->irq - INT_GPIO_BASE;
> +	int gpio = d->hwirq;
>  
Though it's working right now, I'm not sure it's safe enough.  This
only works when d->hwirq_base is 0, which is true for now.  But I doubt
it will be always true.  I guess hwirq_base was introduced there for
some reason.  When some day irqdomain starts using this field, the
above code starts being broken.  IMO, the way that generic-chip.c is
using to calculate the number, d->irq - gc->irq_base, is much more
safer.

-- 
Regards,
Shawn

>  	tegra_gpio_writel(1 << GPIO_BIT(gpio), GPIO_INT_CLR(gpio));
>  }
