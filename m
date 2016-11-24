From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Thu, 24 Nov 2016 20:14:31 +0530
Message-ID: <5836FCCF.1030109@nvidia.com>
References: <20161122173042.GA3239@ulmo.ba.sec> <20161122175539.3897-1-thierry.reding@gmail.com> <58368E84.6040104@nvidia.com> <20161124144411.GA26657@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161124144411.GA26657-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 24 November 2016 08:14 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, Nov 24, 2016 at 12:23:56PM +0530, Laxman Dewangan wrote:
>> On Tuesday 22 November 2016 11:25 PM, Thierry Reding wrote:
>>> +static inline struct tegra_gpio *to_tegra_gpio(struct gpio_chip *chip)
>>> +{
>>> +	return container_of(chip, struct tegra_gpio, gpio);
>>> +}
>> You dont need this as gpiochip_get_data(chip); can provide the required
>> driver specific data.
> It's common practice to embed the struct gpio_chip within a driver-
> specific structure, and it's equally common to use a container_of() to
> get at the embedding structure.

I am saying that you dont need this new APIs, GPIO framework already 
support this via the call gpiochip_get_data(chip); which you provided 
when adding gpiochip().



>
>>> +	gpio->gpio.parent = &pdev->dev;
>>> +
>>> +	gpio->gpio.get_direction = tegra186_gpio_get_direction;
>>> +	gpio->gpio.direction_input = tegra186_gpio_direction_input;
>>> +	gpio->gpio.direction_output = tegra186_gpio_direction_output;
>>> +	gpio->gpio.get = tegra186_gpio_get,
>>> +	gpio->gpio.set = tegra186_gpio_set;
>>> +	gpio->gpio.to_irq = tegra186_gpio_to_irq;
>>> +
>>> +	gpio->gpio.base = -1;
>>> +
>>> +	for (i = 0; i < gpio->soc->num_ports; i++)
>>> +		gpio->gpio.ngpio += gpio->soc->ports[i].pins;
>>> +
>> Our DT binding does not say this. We assume that we have 8 gpios per port.
>> so this will not work at all.
> This has nothing to do with the device tree binding. What the device
> tree binding defines is the indices to use to obtain a given GPIO within
> a given port. What numbering the driver uses internally is completely up
> to the driver implementation.
>
> Oh, and the above works just fine.


Nop, it will not work. The reason is:
include/dt-binding/gpio/tegra186-gpio.h


#define TEGRA_MAIN_GPIO(port, offset) \
         ((TEGRA_MAIN_GPIO_PORT_##port * 8) + offset)


so in your DTS file, if you use this macro for the gpio number then you 
will have pin per port as 8.
And so your total GPIO is 23 *8 (Port CC) but in source code ngpio is 
very less.
