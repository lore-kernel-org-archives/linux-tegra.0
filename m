From: Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix nyan-big panel binding
Date: Sun, 19 Jul 2015 17:54:20 -0500
Message-ID: <1437346460.8225.6.camel@gentoo.org>
References: <1437336913-12886-1-git-send-email-steev@gentoo.org>
	 <CAEUnVG6g-0iYexKPXjO167-O6Oay71QXnoVz1Hvs=U8tSOp5uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG6g-0iYexKPXjO167-O6Oay71QXnoVz1Hvs=U8tSOp5uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Steev Klimaszewski <threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 2015-07-19 at 16:43 -0600, Dylan Reid wrote:
> On Sun, Jul 19, 2015 at 2:15 PM, Steev Klimaszewski <
> threeway-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The nyan-big Chromebook uses a 1920x1080 panel, not a 1366x768 
> > panel so correct
> > the binding.
> 
> This isn't incorrect, although it is not complete.  Nyan-big (Acer
> CB5-311) has _both_ a 1920x1080 and 1366x768 variant available.  They
> are referred to as the "Full HD" and "HD" models respectively.
> 

I wasn't aware they had the CB5-311 as a 1366x768 variant.  I guess we
need to split nyan-big up in mainline like ChromeOS does?  Should we do
the same thing that ChromeOS does and have each variant available?  I
noticed mine is actually a rev3_7 according to booting with a chromeos
kernel.  And for whatever reason, if I include both big and blaze in a
fit image using mainline, it always seems to pick the blaze dtb on my
big, so I'm guessing the compatible string is different as well.


> > 
> > Signed-off-by: Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra124-nyan-big.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts 
> > b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > index 2d21253..30d4495 100644
> > --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
> > +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
> > @@ -9,7 +9,7 @@
> >         compatible = "google,nyan-big", "nvidia,tegra124";
> > 
> >         panel: panel {
> > -               compatible = "auo,b133xtn01";
> > +               compatible = "auo,b133htn01";
> > 
> >                 backlight = <&backlight>;
> >                 ddc-i2c-bus = <&dpaux>;
> > --
> > 2.4.6
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux
> > -tegra" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
