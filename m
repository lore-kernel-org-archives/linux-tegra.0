From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Fri, 25 Nov 2016 17:40:47 +0530
Message-ID: <58382A47.2040205@nvidia.com>
References: <20161122173042.GA3239@ulmo.ba.sec> <20161122175539.3897-1-thierry.reding@gmail.com> <58368E84.6040104@nvidia.com> <20161124144411.GA26657@ulmo.ba.sec> <5836FCCF.1030109@nvidia.com> <20161124150841.GC26657@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161124150841.GC26657-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 24 November 2016 08:38 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, Nov 24, 2016 at 08:14:31PM +0530, Laxman Dewangan wrote:
>>>
>>> This has nothing to do with the device tree binding. What the device
>>> tree binding defines is the indices to use to obtain a given GPIO within
>>> a given port. What numbering the driver uses internally is completely up
>>> to the driver implementation.
>>>
>>> Oh, and the above works just fine.
>>
>> Nop, it will not work. The reason is:
>> include/dt-binding/gpio/tegra186-gpio.h
>>
>>
>> #define TEGRA_MAIN_GPIO(port, offset) \
>>          ((TEGRA_MAIN_GPIO_PORT_##port * 8) + offset)
>>
>>
>> so in your DTS file, if you use this macro for the gpio number then you will
>> have pin per port as 8.
>> And so your total GPIO is 23 *8 (Port CC) but in source code ngpio is very
>> less.
> Yes, within the source code, ngpio will be the exact number of pins that
> the GPIO controller physically exposes. But that still works fine, feel
> free to test the driver if you don't believe me. The translation from
> one numberspace to the other is done in tegra186_gpio_of_xlate().

OK, so you are mapping the DT gpio number to new number using xlate.

This method is fine but it complicate the driver and always it needs to 
calculate the base for the port.
If we have one to one mapping then probably, we can have fixed lookup table.

I am just incline to make stuff simple so that we can have better 
maintainability and debugging. This is very common driver and almost all 
BSPS engineer debug here so want to make this driver extremely simple.
