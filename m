From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Date: Wed, 22 Apr 2020 17:25:29 +0200
Message-ID: <CACRpkdZ2OBmejaGwjdpmJpZ0=30W2aoUgXrrX8xkmwps=MX3kQ@mail.gmail.com>
References: <20200415122427.111769-1-linus.walleij@linaro.org> <20200421221503.GA3445172@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200421221503.GA3445172@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 22, 2020 at 12:15 AM Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> > The Tegra DRM drivers includes the legacy GPIO headers
> > <linux/gpio.h> and <linux/of_gpio.h> but what it really
> > uses is <linux/gpio/consumer.h> since only gpio_desc
> > structs are ever referenced.
> >
> > Include the right header on the top level tegra/drm.h
> > file and drop all the surplus includes.
> >
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 2 --
> >  drivers/gpu/drm/tegra/drm.h   | 2 +-
> >  drivers/gpu/drm/tegra/hdmi.c  | 1 -
> >  drivers/gpu/drm/tegra/sor.c   | 1 -
> >  4 files changed, 1 insertion(+), 5 deletions(-)
>
> Applied, thanks.

I think I already applied it to the drm misc tree the other day,
sorry if that wasn't clear. If tegra has a separate tree I suppose
git will figure it all out in the end.

Yours,
Linus Walleij
