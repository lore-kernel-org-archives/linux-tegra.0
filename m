From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
Date: Wed, 8 Jul 2020 12:41:46 +0300
Message-ID: <fc3926ec-f8a3-b408-aff6-939f3ce91ce9@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-2-digetx@gmail.com>
 <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 11:51, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> I noticed on Nexus 7 that after rebooting from downstream kernel to
>> upstream, the GPIO interrupt is triggering non-stop despite of interrupts
>> being disabled for all of GPIOs. This happens because Nexus 7 uses a
>> soft-reboot, meaning that bootloader should take care of resetting
>> hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
>> may be left ON at a boot time. Let's mask all GPIO interrupts at the
>> driver's probe time in order to resolve the issue.
> 
> ...
> 
>> +               err = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(i),
>> +                                        MAX77620_CNFG_GPIO_INT_MASK, 0);
>> +               if (err < 0)
> 
> Does ' < 0' meaningful here?

Not really, although [1] explicitly says that regmap_update_bits()
returns either 0 or a negative error code. The positive value will be an
unexpected return code here.

[1]
https://elixir.bootlin.com/linux/v5.8-rc3/source/drivers/base/regmap/regmap.c#L2910

This variant of ' < 0' is consistent with all other similar occurrences
in the driver's code, so should be better to keep it as-is, IMO.

>> +                       dev_err(mgpio->dev, "failed to disable interrupt: %d\n",
>> +                               err);
> 
> One line.

This will make this line inconsistent with the rest of the driver's code.

Secondly, this line won't fit to display using my multi-file view-edit
setup.

I know that 80 chars isn't warned by checkpatch anymore, but still it's
a preferred width for all cases where it doesn't hurt readability, which
is the case here, IMO.
