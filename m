From: David Cohen <david.a.cohen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: use new gpio_lock_as_irq() API
Date: Wed, 16 Oct 2013 20:45:45 -0700
Message-ID: <525F5D69.60906@linux.intel.com>
References: <1381951533-18179-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381951533-18179-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On 10/16/2013 12:25 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Whenever an IRQ is claimed or freed, call gpio_lock_as_irq() or
> gpio_unlock_as_irq() on the associated GPIO, to prevent that GPIO from
> being configured in a manner incompatible with an interrupt.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/gpio-tegra.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 9a62672..cfd3b90 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -75,6 +75,7 @@ struct tegra_gpio_bank {
>   #endif
>   };
>
> +static struct device *dev;
>   static struct irq_domain *irq_domain;
>   static void __iomem *regs;
>   static u32 tegra_gpio_bank_count;
> @@ -205,6 +206,7 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   	int lvl_type;
>   	int val;
>   	unsigned long flags;
> +	int ret;
>
>   	switch (type & IRQ_TYPE_SENSE_MASK) {
>   	case IRQ_TYPE_EDGE_RISING:
> @@ -231,6 +233,12 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>   		return -EINVAL;
>   	}
>
> +	ret = gpio_lock_as_irq(&tegra_gpio_chip, gpio);
> +	if (ret) {
> +		dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);

As a suggestion, you could add a pointer to dev on tegra gpio priv data
and recover it using ira_data_get_irq_chip_data(), instead of using
static file-scope variable.

Br, David Cohen
