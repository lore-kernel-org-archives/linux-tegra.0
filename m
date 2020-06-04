From: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix pm_runtime_get_sync failure
Date: Thu, 4 Jun 2020 12:48:10 -0500
Message-ID: <CAEkB2ET8+Bo+0xw0TS80tzg0zq0ygPd=GEDsPEnd96k8shMAAg@mail.gmail.com>
References: <20200603184104.4475-1-navid.emamdoost@gmail.com> <900909fe-fa15-fbca-80f7-79aeee721ed9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <900909fe-fa15-fbca-80f7-79aeee721ed9-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Navid Emamdoost <emamd001-OJFnDUYgAso@public.gmane.org>, Qiushi Wu <wu000273-OJFnDUYgAso@public.gmane.org>, Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Stephen McCamant <smccaman-OJFnDUYgAso@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 4, 2020 at 12:45 PM Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 03/06/2020 19:41, Navid Emamdoost wrote:
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put if
> > pm_runtime_get_sync fails.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/dma/tegra210-adma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> > index c4ce5dfb149b..e8c749cd3fe8 100644
> > --- a/drivers/dma/tegra210-adma.c
> > +++ b/drivers/dma/tegra210-adma.c
> > @@ -659,6 +659,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
> >       ret = pm_runtime_get_sync(tdc2dev(tdc));
> >       if (ret < 0) {
> >               free_irq(tdc->irq, tdc);
> > +             pm_runtime_put(tdc2dev(tdc));
> >               return ret;
> >       }
>
>
> Please do not send two patches with the same $subject that are fixing
> two different areas of the driver. In fact, please squash these two
> patches into a single fix and resend because they are fixing the same issue.

Sure, I will prepare a version 2 with your suggestions.

>
> Jon
>
> --
> nvpublic



-- 
Navid.
