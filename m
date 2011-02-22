From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: tegra: Fix typo in TEGRA_IRQ_TO_GPIO
Date: Tue, 22 Feb 2011 11:58:26 -0800
Message-ID: <AANLkTikdM8mQX2vmJT62f1zK5Ztfrj3wcASxwSQFff0j@mail.gmail.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
	<1298173137-9242-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298173137-9242-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 7:38 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/include/mach/gpio.h | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/include/mach/gpio.h b/arch/arm/mach-=
tegra/include/mach/gpio.h
> index e31f486..12a7cf6 100644
> --- a/arch/arm/mach-tegra/include/mach/gpio.h
> +++ b/arch/arm/mach-tegra/include/mach/gpio.h
> @@ -31,7 +31,7 @@
> =A0#define gpio_cansleep =A0 =A0 =A0 =A0 =A0__gpio_cansleep
>
> =A0#define TEGRA_GPIO_TO_IRQ(gpio) (INT_GPIO_BASE + (gpio))
> -#define TEGRA_IRQ_TO_GPIO(irq) ((gpio) - INT_GPIO_BASE)
> +#define TEGRA_IRQ_TO_GPIO(irq) ((irq) - INT_GPIO_BASE)
>
> =A0static inline int gpio_to_irq(unsigned int gpio)
> =A0{
> --
> 1.7.1
>
>

Pushed to for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
