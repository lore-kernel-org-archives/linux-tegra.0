From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
Date: Thu, 9 Jul 2020 13:38:26 +0300
Message-ID: <ff7985a4-58be-b466-62c2-abce9ae1c0f0@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-4-digetx@gmail.com>
 <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com>
 <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
 <CAHp75Vd89QpwaGvkpzG+pxnLd8S2guPCARLW5xPwhxXL8ZRfFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vd89QpwaGvkpzG+pxnLd8S2guPCARLW5xPwhxXL8ZRfFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

09.07.2020 12:07, Andy Shevchenko пишет:
> On Thu, Jul 9, 2020 at 12:44 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> 08.07.2020 23:57, Andy Shevchenko пишет:
>>> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>>> <mailto:digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
> 
> ...
> 
>>> I gave a second look and I think my suggestion is wrong. Here is an
>>> interesting propagation of the parent device node to its grand son,
>>> leaving son’s one untouched. Original code has intentions to do that way.
>>
>> The [1] says that gpio_chip.parent should point at the "device providing
>> the GPIOs".
> 
> Yes, physical device I believe.
> 
>> That's the pdev->dev.parent in the case of this driver.
>> MAX77620 is an MFD PMIC device that has virtual sub-devices like GPIO
>> controller, PINCTRL and RTC. The MFD is the parent device that provides
>> the GPIOs [2].
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L276
>>
>> [2]
>> https://elixir.bootlin.com/linux/v5.8-rc3/source/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi#L48
>>
>> I think the old code was wrong and this patch is correct, please correct
>> me if I'm missing something.
> 
> Hmm... I have checked through GPIO drivers I have knowledge of / care
> about and PMIC ones do like you suggested in this patch, the rest
> (which are instantiated from MFD) take a virtual platform device.
> 
> Looking at DT excerpt I think you're rather right than wrong, so I
> leave it to you and maintainers.
> Thanks!

Okay, waiting for the maintainers then :)

Thank you very much for the review!
