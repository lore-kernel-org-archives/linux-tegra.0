From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] memory: tegra: Drop <linux/clk-provider.h>
Date: Mon, 15 Jun 2020 10:39:21 +0200
Message-ID: <CAMuHMdUkNiVU3Df-VvGbSxEx-R29=OtLzrqjb0+mbt6gYYCfhw@mail.gmail.com>
References: <20200506123236.7463-1-geert+renesas@glider.be>
 <20200506123236.7463-3-geert+renesas@glider.be> <20200507200410.GB2981633@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200507200410.GB2981633@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Thu, May 7, 2020 at 10:04 PM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, May 06, 2020 at 02:32:36PM +0200, Geert Uytterhoeven wrote:
> > The Tegra EMC scaling support code is not a clock provider, but merely a
> > clock consumer, and thus does not need to include
> > <linux/clk-provider.h>.
> >
> > Fixes: ec37a9a17afbfad5 ("memory: tegra: Add EMC scaling support code for Tegra210")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > ---
> >  drivers/memory/tegra/tegra210-emc-core.c | 1 -
> >  drivers/memory/tegra/tegra210-emc.h      | 1 -
> >  2 files changed, 2 deletions(-)
>
> Applied to for-5.8/memory, thanks.

Which hasn't made it into v5.8-rc1, and was rebased.
New fixes tag is
Fixes: 01218c59f9bcf067 ("memory: tegra: Add EMC scaling support code
for Tegra210")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
