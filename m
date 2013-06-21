From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM:tegra20-colibri-512.dts: Change tristate status for
 i2c pinmux
Date: Fri, 21 Jun 2013 19:05:06 +0200
Message-ID: <1371834306.1524.7.camel@tellur>
References: <alpine.DEB.2.02.1306202302210.11096@dionysos>
	 <51C47E41.6050609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51C47E41.6050609-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Anna-Maria Gleixner <anna-maria-WyZXDcvM26CzQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 21.06.2013, 10:24 -0600 schrieb Stephen Warren:
> On 06/20/2013 03:08 PM, Anna-Maria Gleixner wrote:
> > The nvidia,tristate entry for the pinmux of i2c1 an i2c3 was set to
> > tristate. This results in non working i2c, because the i2c pins are
> > not actively driven. Set the entries to "driven".
> 
> Lucas, can you please comment on this patch? It sounds correct to me,
> but I would have assumed you'd tested I2C already when you wrote the
> original DT?
> 
This is a NACK from me. For robustness reasons all pins/busses not
actually used on the Colibri module itself are tristated in order to
avoid any invalid configurations when placed on a baseboard.

Baseboards using particular busses should untristate those pins in their
respective dts. So if this change is about iris, I would be ok with
enabling i2c1, as this is actually routed on this baseboard, but not
i2c3.

Regards,
Lucas

> Oh actually, now that I look further, I see that tegra20-iris-512.dts
> includes this file, and overrides some of the tristate values there.
> What's the thinking behind that, and does this patch fit into it?
> 
> > diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> 
> >                  nvidia,pins = "rm";
> >                  nvidia,function = "i2c1";
> >                  nvidia,pull = <0>;
> > -                nvidia,tristate = <1>;
> > +                nvidia,tristate = <0>;
> >              };
> >              i2c3 {
> >                  nvidia,pins = "dtf";
> >                  nvidia,function = "i2c3";
> >                  nvidia,pull = <0>;
> > -                nvidia,tristate = <1>;
> > +                nvidia,tristate = <0>;
> >              };
> >              i2cddc {
> >                  nvidia,pins = "ddc";
> 
