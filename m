From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Thu, 24 Nov 2016 12:23:56 +0530
Message-ID: <58368E84.6040104@nvidia.com>
References: <20161122173042.GA3239@ulmo.ba.sec> <20161122175539.3897-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161122175539.3897-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 22 November 2016 11:25 PM, Thierry Reding wrote:
> +static inline struct tegra_gpio *to_tegra_gpio(struct gpio_chip *chip)
> +{
> +	return container_of(chip, struct tegra_gpio, gpio);
> +}

You dont need this as gpiochip_get_data(chip); can provide the required 
driver specific data.

> +
> +static const struct tegra_gpio_port *
> +tegra186_gpio_get_port(struct tegra_gpio *gpio, unsigned int *pin)
> +{
> +	unsigned int start = 0, i;
> +
> +	for (i = 0; i < gpio->soc->num_ports; i++) {
> +		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
> +
> +		if (*pin >= start && *pin < start + port->pins) {
> +			*pin -= start;
> +			return port;
> +		}
> +
> +		start += port->pins;
> +	}
> +
Why not get the port from pins and then calculate with fixed offset.
We will not need the loop if we know the port number.

>
> +
> +static int tegra186_gpio_direction_output(struct gpio_chip *chip,
> +					  unsigned int offset, int level)
> +{
> +	struct tegra_gpio *gpio = to_tegra_gpio(chip);
> +	void __iomem *base;
> +	u32 value;
> +
> +	/* configure output level first */
> +	chip->set(chip, offset, level);
We can directly call the apis instead of function pointer at this point.
>
> +
> +static struct lock_class_key tegra186_gpio_lock_class;
We will have two instance of the driver (normal and AON) and so this 
will be shared between them.
Do we really support multiple instance with same variable?


> +
> +	gpio->gpio.label = "tegra186-gpio";
Two instance will have same name. Better to say tegra186-gpio and 
tegra186-gpio-aon.


> +	gpio->gpio.parent = &pdev->dev;
> +
> +	gpio->gpio.get_direction = tegra186_gpio_get_direction;
> +	gpio->gpio.direction_input = tegra186_gpio_direction_input;
> +	gpio->gpio.direction_output = tegra186_gpio_direction_output;
> +	gpio->gpio.get = tegra186_gpio_get,
> +	gpio->gpio.set = tegra186_gpio_set;
> +	gpio->gpio.to_irq = tegra186_gpio_to_irq;
> +
> +	gpio->gpio.base = -1;
> +
> +	for (i = 0; i < gpio->soc->num_ports; i++)
> +		gpio->gpio.ngpio += gpio->soc->ports[i].pins;
> +

Our DT binding does not say this. We assume that we have 8 gpios per 
port. so this will not work at all.



>
> +
> +static const struct tegra_gpio_port tegra186_main_ports[] = {
> +	[TEGRA_MAIN_GPIO_PORT_A]  = { 0x2000, 7 },
Use C99 style initialization which is like
    .offset =
    .pins =
>

