From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH] spi: tegra20-slink: Fix runtime PM imbalance on error
Date: Fri, 22 May 2020 18:20:55 +0300
Message-ID: <CAHp75Vem1kQviLrobJ65aVOb_VCmLkAv=5U_iXAdWPNe7n0+Ng@mail.gmail.com>
References: <20200521074946.21799-1-dinghao.liu@zju.edu.cn>
 <CAHp75VfOeUaqRW2vRwyWaz3JJw41hX5jTgE+kZ8pB8E_HtHwqw@mail.gmail.com> <5a8a6e7b.bef25.1723b588c7f.Coremail.dinghao.liu@zju.edu.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5a8a6e7b.bef25.1723b588c7f.Coremail.dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>
Cc: Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 22, 2020 at 10:46 AM <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org> wrote:
>
> Hi Andy,
>
> Thank you for your advice!

You are welcome, but please, stop top-posting.

> Your suggestion is to use pm_runtime_put_noidle(), right?
> The only difference between pm_runtime_put() and this function
> is that pm_runtime_put() will run an extra pm_request_idle().
>
> I checked this patched function again and found there is a
> pm_runtime_put() in the normal branch of pm_runtime_get_sync().
> Does this mean the original program logic need to execute idle
> callback?
>
> According to runtime PM's doc, the pm_runtime_get_sync() call
> paired with a pm_runtime_put() call will be appropriate to ensure
> that the device is not put back to sleep during the probe.

Correct.

> Therefore
> I think pm_runtime_put() is more appropriate here.

How come to wrong conclusion? We are considering error path. What does
documentation say about this?

> Do you have
> more detailed suggestion for why we should use _put_noidle()?

Because in error case there is no need to go through all code patch to
be sure that the device is idling. Moreover, consider below case

CPU1: ...somewhere in the code...
pm_runtime_get() // with success!
...see below...
pm_runtime_put()

CPU2: ...on parallel thread...
ret = pm_runtime_get_sync() // failed!
if (ret)
  pm_runtime_put() // oi vei, we put device into sleep

So, there is a potential issue.

> > > pm_runtime_get_sync() increments the runtime PM usage counter even
> > > when it returns an error code. Thus a pairing decrement is needed on
> > > the error handling path to keep the counter balanced.
> >
> > ...
> >
> > >         ret = pm_runtime_get_sync(&pdev->dev);
> > >         if (ret < 0) {
> > >                 dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
> >
> > > +               pm_runtime_put(&pdev->dev);
> >
> > For all your patches, please, double check what you are proposing.
> >
> > Here, I believe, the correct one will be _put_noidle().
> >
> > AFAIU you are not supposed to actually suspend the device in case of error.
> > But I might be mistaken, thus see above.
> >
> > >                 goto exit_pm_disable;
> > >         }


-- 
With Best Regards,
Andy Shevchenko
