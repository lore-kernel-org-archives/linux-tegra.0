From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/9] gpio: Support GPIO controllers without pin-ranges
Date: Thu, 19 Mar 2020 22:35:16 +0530
Message-ID: <dc7a3f0a-2206-1e5a-9255-d0c6a18d1c4c@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Wake gpiochip_generic_request() call into the pinctrl helpers only if a
> GPIO controller had any pin-ranges assigned to it. This allows a driver
> to unconditionally use this helper if it supports multiple devices of
> which only a subset have pin-ranges assigned to them.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/gpiolib.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index f31b1d46599e..12f3c339da78 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2792,7 +2792,10 @@ static inline void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
>    */
>   int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
>   {
> -       return pinctrl_gpio_request(chip->gpiodev->base + offset);
> +       if (!list_empty(&chip->gpiodev->pin_ranges))
> +               return pinctrl_gpio_request(chip->gpiodev->base + offset);
> +
> +       return 0;
>   }
>   EXPORT_SYMBOL_GPL(gpiochip_generic_request);
> 
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
