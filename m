From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 4/5] mfd: palmas: support IRQ inversion at the board
 level
Date: Thu, 10 Apr 2014 08:25:56 +0100
Message-ID: <20140410072556.GB4214@lee--X1>
References: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org>
 <1393876300-3061-4-git-send-email-swarren@wwwdotorg.org>
 <CAAVeFuJY67zdoHiZufxDbkaw=xt8YwxyDAwHW_T7UZeSOt35NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuJY67zdoHiZufxDbkaw=xt8YwxyDAwHW_T7UZeSOt35NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> Stephen, any news about this patch? I'm waiting for it to be merged i=
n
> order to resend some Tegra DTs, but still cannot see it in -next.

I doubt it's been applied.

No one got back to me with reference to how to deal with the set [1],
so I certainly didn't apply it.

[1] http://www.spinics.net/lists/arm-kernel/msg312694.html

> On Tue, Mar 4, 2014 at 4:51 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> > From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Implement the new DT property ti,irq-externally-inverted, and add a=
n
> > equivalent platform data field to match. This allows the driver to
> > correctly automatically configure the IRQ output polarity when the =
board
> > or SoC contains an inverter between the Palmas IRQ output and IRQ
> > controller input.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > v3:
> > * Use an IRQD flag to represent the data, rather than a custom DT p=
roperty.
> > v2:
> > * Split V1's patch 1/2 into separate patches 1/3 and 2/3.
> > ---
> >  drivers/mfd/palmas.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
> > index d280d789e55a..3281d4103e9d 100644
> > --- a/drivers/mfd/palmas.c
> > +++ b/drivers/mfd/palmas.c
> > @@ -292,7 +292,8 @@ static int palmas_set_pdata_irq_flag(struct i2c=
_client *i2c,
> >                 return -EINVAL;
> >         }
> >
> > -       pdata->irq_flags =3D irqd_get_trigger_type(irq_data);
> > +       pdata->irq_flags =3D irqd_get_trigger_type(irq_data) |
> > +                          irqd_get_src_dst_inverted(irq_data);
> >         dev_info(&i2c->dev, "Irq flag is 0x%08x\n", pdata->irq_flag=
s);
> >         return 0;
> >  }
> > @@ -447,6 +448,8 @@ static int palmas_i2c_probe(struct i2c_client *=
i2c,
> >                 reg =3D PALMAS_POLARITY_CTRL_INT_POLARITY;
> >         else
> >                 reg =3D 0;
> > +       if (pdata->irq_flags & IRQ_SRC_DST_INVERTED)
> > +               reg ^=3D PALMAS_POLARITY_CTRL_INT_POLARITY;
> >         ret =3D palmas_update_bits(palmas, PALMAS_PU_PD_OD_BASE,
> >                         PALMAS_POLARITY_CTRL, PALMAS_POLARITY_CTRL_=
INT_POLARITY,
> >                         reg);
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
