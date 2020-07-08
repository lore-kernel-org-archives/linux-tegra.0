From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
Date: Wed, 8 Jul 2020 12:09:53 +0300
Message-ID: <e9850c2d-43ea-9c07-19c6-f3e2e096e52a@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-2-digetx@gmail.com>
 <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
 <CAHp75VdTw87aOGqnjS-jukiHcMACG7-gDDhDWP6hikSLWpDebQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdTw87aOGqnjS-jukiHcMACG7-gDDhDWP6hikSLWpDebQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 11:53, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:51 AM Andy Shevchenko
> <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> ...
> 
>>> +       max77620_gpio_initialize(mgpio);
>>
>> I guess we have special callback for that, i.e.
>> https://elixir.bootlin.com/linux/v5.8-rc3/C/ident/init_hw.
> 
> Sorry, here is correct link
> 
> https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L212
> 

Indeed, I missed the init_hw(), thank you!
