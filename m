From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: Tegra pinmux Device Tree support
Date: Tue, 9 Aug 2011 10:35:28 -0700
Message-ID: <CAOesGMgONkY2i+1H+zZ2MJSDnPmFT8AnSjDQxJGaQZvVCExm2A@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 8, 2011 at 2:42 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Grant, Linus, & all,
>
> I was thinking of adding some Device Tree support to Tegra's existing
> pinmux driver. This would remove the dependence of mach-tegra/board-d=
t.c
> on board-{harmony,seaboard}-pinmux.c, and make the DT board stand on =
its
> own.
>
> My thoughts were:
>
> a) Every Tegra board currently has a board-$name-pinmux.c which conta=
ins
> a table like:
>
> static struct tegra_pingroup_config harmony_pinmux[] =3D {
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_ATA, =A0 TEGRA_MUX_IDE, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
>
> I'd just move that table into the Device Tree, keeping logically the =
same
> structure, but just changing the syntax as appropriate for DT.
>
> (I'm slightly worried that DT wants me to encode all that using an
> unformatted table consistent of integers without any pre-processor ma=
cros
> or named constants though...)
>
> b) I'd probably need to modify the pinmux driver to be a platform dev=
ice
> in order to simplify integration with DT parsing etc.
>
> c) I think the DT binding would not be affected by Linus W's work on =
a
> pinctrl API; I see this table as platform data that sets up the initi=
al
> state of the SoC at boot-time, whereas the pinmux driver is more abou=
t
> drivers dynamically altering the pinmux at run-time. Is this a reason=
able
> assertion? The alternative would be that once the new pinctrl API is
> available, it would have an associated DT binding that represented th=
is
> data in a completely cross-SoC manner. Hence, any work on Tegra's pin=
mux
> right now would be throwaway. I'm interested in people's thoughts her=
e.
>
> Finally, I was thinking that a similar thing could be done for the Te=
gra
> GPIO driver, to replace gpio_table[] also in board-*-pinmux.c.
>
> If this isn't useful right now, is there anything else that would hel=
p
> out on Tegra?


This sounds similar to what I had in mind to look at when I got back
from vacation (not enough rainy days here to deal with it during :).

Some devices/drivers might need to make references to a pinmux (what
comes to mind is the i2c driver that has two virtual busses on two
separate multiplexed outputs on some boards). So having a tegra-pinmux
node with a sub-node for every pin group might get verbose but
definitely most flexible.

Each sub-node could encode the mux type with separate properties, for
example for the ata case above:

=2E../pinmux/ata:
    nvidia,pingroup-number =3D <>
    nvidia,tristate-normal
    nvidia,mux-mode =3D <>   (this should probably be an integer, seems
appropriate since the TRM uses integers as well)
    nvidia,pull-up-down-normal

(It could be argued that the 'normal' properties could just be omitted
and assumed)

'reg' could be used to specify the pingroup-number, I suppose -- but
omitting that means that you can have two entries for the same
pingroup, and mark one as inactive, so it can also be referenced with
a phandle.

This way the i2c virtual busses could just refer to the pingroup by
phandle for the mux flipping, with one of them being enabled by
default and the others inactive.


Thoughts?

-Olof
