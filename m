From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: Re: [PATCH] spi: tegra20-slink: Fix runtime PM imbalance on error
Date: Sat, 23 May 2020 14:52:33 +0300
Message-ID: <CAHp75VcfcE63KHbyokoBuBKDdTHiB8QiauL8XU=rRo0-=NL-Kg@mail.gmail.com>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com>
 <5a8a6e7b.bef25.1723b588c7f.Coremail.dinghao.liu@zju.edu.cn>
 <CAHp75Vem1kQviLrobJ65aVOb_VCmLkAv=5U_iXAdWPNe7n0+Ng@mail.gmail.com>
 <CAHp75VexCBc6iCrd_VLj5jXE8cxxdzUUf6pMG6O8LjtNj0J1Aw@mail.gmail.com> <53722a45.c204d.172414e8ed8.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53722a45.c204d.172414e8ed8.Coremail.dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, May 23, 2020 at 2:32 PM <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org> wrote:
>
> > On Fri, May 22, 2020 at 6:20 PM Andy Shevchenko
> > <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > On Fri, May 22, 2020 at 10:46 AM <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org> wrote:

...

> I also checked many other implementation of probe in drivers.
> It seems that using pm_runtime_put() is ok.

In *error path* or normal path?

> If I misunderstood
> your opinion, please point it out, thanks.

Bottom line is (for the *error path* case):
pm_runtime_put_noidle() has no side effects
pm_runtime_put() (potentially) might have side effects.

You should choose one which is clearer about what it does.

-- 
With Best Regards,
Andy Shevchenko
