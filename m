From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 0/5] Improvements for MAX77620 GPIO driver
Date: Thu, 9 Jul 2020 00:49:56 +0300
Message-ID: <5cfa2209-2d54-c347-cd95-08554213d392@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <CAHp75VcNao84UajMYDJRH2gX7t8n=uo_Th8VVgcxJj3YkiA+pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VcNao84UajMYDJRH2gX7t8n=uo_Th8VVgcxJj3YkiA+pA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

09.07.2020 00:00, Andy Shevchenko пишет:
> 
> 
> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> <mailto:digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
> 
>     Hello!
> 
>     This series addresses a problem that I discovered on Nexus 7 device
>     where
>     GPIO interrupts may be left enabled after bootloader and the driver
>     isn't
>     prepared to this. It also makes a small improvements to the code,
>     fixes the
>     non-released interrupt bug and converts driver to use irqchip template.
> 
> 
> Thanks! I commented on one patch, the rest looks good and you may add my
> Rb tag.

Thank you! :)
