From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
Date: Thu, 19 Mar 2020 22:35:46 +0530
Message-ID: <f3e56f49-2105-6514-f5a5-c1137569d083@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> Add support for Tegra SoC generations to specify a list of pin ranges
> that map GPIOs to ranges of pins in the pin controller.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpio/gpio-tegra186.c | 56 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index de241263d4be..1086c1fcaf49 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -58,11 +58,20 @@ struct tegra_gpio_port {
>          unsigned int pins;
>   };
> 
> +struct tegra186_pin_range {
> +       unsigned int offset;
> +       const char *group;
> +};
> +
>   struct tegra_gpio_soc {
>          const struct tegra_gpio_port *ports;
>          unsigned int num_ports;
>          const char *name;
>          unsigned int instance;
> +
> +       const struct tegra186_pin_range *pin_ranges;
> +       unsigned int num_pin_ranges;
> +       const char *pinmux;
>   };
> 
>   struct tegra_gpio {
> @@ -254,6 +263,50 @@ static int tegra186_gpio_set_config(struct gpio_chip *chip,
>          return 0;
>   }
> 
> +static int tegra186_gpio_add_pin_ranges(struct gpio_chip *chip)
> +{
> +       struct tegra_gpio *gpio = gpiochip_get_data(chip);
> +       struct pinctrl_dev *pctldev;
> +       struct device_node *np;
> +       unsigned int i, j;
> +       int err;
> +
> +       if (!gpio->soc->pinmux || gpio->soc->num_pin_ranges == 0)
> +               return 0;
> +
> +       np = of_find_compatible_node(NULL, NULL, gpio->soc->pinmux);
> +       if (!np)
> +               return -ENODEV;
> +
> +       pctldev = of_pinctrl_get(np);
> +       of_node_put(np);
> +       if (!pctldev)
> +               return -EPROBE_DEFER;
> +
> +       for (i = 0; i < gpio->soc->num_pin_ranges; i++) {
> +               unsigned int pin = gpio->soc->pin_ranges[i].offset, port;
> +               const char *group = gpio->soc->pin_ranges[i].group;
> +
> +               port = pin / 8;
> +               pin = pin % 8;
> +
> +               if (port >= gpio->soc->num_ports) {
> +                       dev_warn(chip->parent, "invalid port %u for %s\n",
> +                                port, group);
> +                       continue;
> +               }
> +
> +               for (j = 0; j < port; j++)
> +                       pin += gpio->soc->ports[j].pins;
> +
> +               err = gpiochip_add_pingroup_range(chip, pctldev, pin, group);
> +               if (err < 0)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
>   static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
>                                    const struct of_phandle_args *spec,
>                                    u32 *flags)
> @@ -578,12 +631,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>          gpio->gpio.label = gpio->soc->name;
>          gpio->gpio.parent = &pdev->dev;
> 
> +       gpio->gpio.request = gpiochip_generic_request;
> +       gpio->gpio.free = gpiochip_generic_free;
>          gpio->gpio.get_direction = tegra186_gpio_get_direction;
>          gpio->gpio.direction_input = tegra186_gpio_direction_input;
>          gpio->gpio.direction_output = tegra186_gpio_direction_output;
>          gpio->gpio.get = tegra186_gpio_get,
>          gpio->gpio.set = tegra186_gpio_set;
>          gpio->gpio.set_config = tegra186_gpio_set_config;
> +       gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
> 
>          gpio->gpio.base = -1;
> 
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
