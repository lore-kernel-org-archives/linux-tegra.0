From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 2/9] ARM: tegra: irq: add wake up handling
Date: Tue, 19 Mar 2013 10:55:38 -0600
Message-ID: <5148988A.4020409@wwwdotorg.org>
References: <1363594400-11663-1-git-send-email-josephl@nvidia.com> <1363594400-11663-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594400-11663-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 02:13 AM, Joseph Lo wrote:
> Add the wake up handling for legacy irq controller, and using
> IRQCHIP_MASK_ON_SUSPEND for wake irq handling.

> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c

> +static int tegra_set_wake(struct irq_data *d, unsigned int enable)
> +{
> +	u32 irq = d->irq;
> +	u32 index, mask;
> +
> +	BUG_ON(irq < FIRST_LEGACY_IRQ ||
> +	       irq >= FIRST_LEGACY_IRQ + num_ictlrs * 32);

Perhaps that should be:

	if (irq < FIRST_LEGACY_IRQ ||
		irq >= FIRST_LEGACY_IRQ + num_ictlrs * 32)
	return -EINVAL;
