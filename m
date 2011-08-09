From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Tegra pinmux Device Tree support
Date: Tue, 9 Aug 2011 11:33:05 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04A0687334@HQMAIL01.nvidia.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E@HQMAIL01.nvidia.com>
 <CAOesGMgONkY2i+1H+zZ2MJSDnPmFT8AnSjDQxJGaQZvVCExm2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgONkY2i+1H+zZ2MJSDnPmFT8AnSjDQxJGaQZvVCExm2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Tuesday, August 09, 2011 11:35 AM:
> On Mon, Aug 8, 2011 at 2:42 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> > Grant, Linus, & all,
> >
> > I was thinking of adding some Device Tree support to Tegra's existi=
ng
> > pinmux driver. This would remove the dependence of mach-tegra/board=
-dt.c
> > on board-{harmony,seaboard}-pinmux.c, and make the DT board stand o=
n its
> > own.
> >
> > My thoughts were:
> >
> > a) Every Tegra board currently has a board-$name-pinmux.c which con=
tains
> > a table like:
> >
> > static struct tegra_pingroup_config harmony_pinmux[] =3D {
> > =A0 =A0 =A0 =A0{TEGRA_PINGROUP_ATA, =A0 TEGRA_MUX_IDE, =A0 =A0 =A0 =
=A0 =A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> >
> > I'd just move that table into the Device Tree, keeping logically th=
e same
> > structure, but just changing the syntax as appropriate for DT.
> >
> > (I'm slightly worried that DT wants me to encode all that using an
> > unformatted table consistent of integers without any pre-processor =
macros
> > or named constants though...)
=2E..
> > c) I think the DT binding would not be affected by Linus W's work o=
n a
> > pinctrl API; I see this table as platform data that sets up the ini=
tial
> > state of the SoC at boot-time, whereas the pinmux driver is more ab=
out
> > drivers dynamically altering the pinmux at run-time. Is this a reas=
onable
> > assertion? The alternative would be that once the new pinctrl API i=
s
> > available, it would have an associated DT binding that represented =
this
> > data in a completely cross-SoC manner. Hence, any work on Tegra's p=
inmux
> > right now would be throwaway. I'm interested in people's thoughts h=
ere.
> >
> > Finally, I was thinking that a similar thing could be done for the =
Tegra
> > GPIO driver, to replace gpio_table[] also in board-*-pinmux.c.
> >
> > If this isn't useful right now, is there anything else that would h=
elp
> > out on Tegra?
=2E..
> Some devices/drivers might need to make references to a pinmux (what
> comes to mind is the i2c driver that has two virtual busses on two
> separate multiplexed outputs on some boards). So having a tegra-pinmu=
x
> node with a sub-node for every pin group might get verbose but
> definitely most flexible.

My previous thinking was that:

* We'd invent a new I2C bus mux driver for this purpose, rather than
  building the muxing functionality solely into the Tegra I2C driver
  like it is now.

* The new mux driver would use Linus W's pinctrl API to perform the
  muxing, and hence be generic across SoCs.

* The mux driver would need to be configured based on the pinctrl
  API's (well, the SoC's pinctrl driver's) names for pin groups and
  functions, rather than with something from Device Tree. This would
  allow the mux driver to work on systems that used the pinctrl API,
  but not Device Tree.

However, hooking Device Tree phandles and the pinctrl API together
sounds like it'd be a good idea; allowing the above points to still be
valid, and encompassing your idea. I'm not totally sure how that'd end
up working though; the original pinctrl idea was that the drivers
themselves would drive the names/numbers of the exposed pin groups,
whereas we're talking about driving that all from Device Tree data. Tha=
t
would require each pingroup to contain e.g. a register address and bit
for each group. And Tegra's pinctrl driver would have all the drive
strength groups too, which are different groups in different registers,
and since all that data is encoded in the SoC HW rather than board-
specific, it seems like there's little benefit putting it into Device
Tree.

> Each sub-node could encode the mux type with separate properties, for
> example for the ata case above:
>=20
> .../pinmux/ata:
>     nvidia,pingroup-number =3D <>
>     nvidia,tristate-normal
>     nvidia,mux-mode =3D <>   (this should probably be an integer, see=
ms
> appropriate since the TRM uses integers as well)
>     nvidia,pull-up-down-normal

That's pretty verbose. However, it certainly addresses the problems wit=
h
a huge table of apparently meaningless numbers. It's probably workable.

> (It could be argued that the 'normal' properties could just be omitte=
d
> and assumed)
>=20
> 'reg' could be used to specify the pingroup-number, I suppose -- but
> omitting that means that you can have two entries for the same
> pingroup, and mark one as inactive, so it can also be referenced with
> a phandle.
>=20
> This way the i2c virtual busses could just refer to the pingroup by
> phandle for the mux flipping, with one of them being enabled by
> default and the others inactive.
>=20
>=20
> Thoughts?
>=20
> -Olof

--=20
nvpublic
