From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pinctrl: as3722: fix handling of GPIO invert bit
Date: Thu, 17 Apr 2014 09:43:59 -0700
Message-ID: <CAL1qeaG+MBmBZ3dD6LZwV5mh5A=u+0N7Obt43UwhViaBYpXxpw@mail.gmail.com>
References: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
	<534FA35B.6060005@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534FA35B.6060005-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 17, 2014 at 2:48 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Andrew,
>
>
> On Wednesday 16 April 2014 06:55 AM, Andrew Bresticker wrote:
>>
>> diff --git a/drivers/pinctrl/pinctrl-as3722.c
>> b/drivers/pinctrl/pinctrl-as3722.c
>> index 92ed4b2..c862f9c0 100644
>> --- a/drivers/pinctrl/pinctrl-as3722.c
>> +++ b/drivers/pinctrl/pinctrl-as3722.c
>> @@ -64,7 +64,6 @@ struct as3722_pin_function {
>>   };
>>     struct as3722_gpio_pin_control {
>> -       bool enable_gpio_invert;
>>         unsigned mode_prop;
>>         int io_function;
>>   };
>
>
> Instead of removing this flag and  calling read of register on every gpio
> set, better if we update this flag on probe once and use this for entire
> life.

Because of regcache, the reads won't result in any additional I2C
transfers.  I can respin though if you want.

-Andrew

>
> So adding the code in probe() as
>
>         for (i = 0; i < ARRAY_SIZE(as3722_pingroups); ++i) {
>                 int gpio_cntr_reg = AS3722_GPIOn_CONTROL_REG(i);
>                 u32 val;
>
>                 ret = as3722_read(as3722, gpio_cntr_reg, &val);
>                 if (!ret)
> as_pci->gpio_control[i].enable_gpio_invert =
>                                         !!(val & AS3722_GPIO_INV);
>         }
>
>
> Thanks,
> Laxman
