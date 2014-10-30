From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND V4 5/9] of: Add NVIDIA Tegra xHCI controller
 binding
Date: Thu, 30 Oct 2014 18:24:35 +0100
Message-ID: <20141030172432.GA8944@ulmo.nvidia.com>
References: <1414535277-15645-1-git-send-email-abrestic@chromium.org>
 <1414535277-15645-6-git-send-email-abrestic@chromium.org>
 <20141029094338.GA28356@ulmo.nvidia.com>
 <CAL1qeaEf0mTQfMgnY8jHGDBvbQ7ivtzAQRWaE9K24TJ86hWYMg@mail.gmail.com>
 <20141030135500.GC19802@ulmo.nvidia.com>
 <CAL1qeaG701hKtcUL5a67b=X38hbcYunUOUBziZMpxemvhhAayA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaG701hKtcUL5a67b=X38hbcYunUOUBziZMpxemvhhAayA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2014 at 10:19:21AM -0700, Andrew Bresticker wrote:
> On Thu, Oct 30, 2014 at 6:55 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Oct 29, 2014 at 09:37:14AM -0700, Andrew Bresticker wrote:
> >> On Wed, Oct 29, 2014 at 2:43 AM, Thierry Reding
> >> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > On Tue, Oct 28, 2014 at 03:27:50PM -0700, Andrew Bresticker wrote:
> >> > [...]
> >> >> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra=
124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegr=
a124-xusb-padctl.txt
> >> > [...]
> >> >> +Optional properties:
> >> >> +-------------------
> >> >> +- vbus-{0,1,2}-supply: VBUS regulator for the corresponding UTMI p=
ad.
> >> >> +- vddio-hsic-supply: VDDIO regulator for the HSIC pads.
> >> >> +- nvidia,usb3-port-{0,1}-lane: PCIe/SATA lane to which the corresp=
onding USB3
> >> >> +  port is mapped.  See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> =
for the list
> >> >> +  of valid values.
> >> >
> >> > I dislike how we now need to provide a list of all pins in the header
> >> > file, where previously we used strings for this. This could become v=
ery
> >> > ugly if the set of pins changes in future generations of this IP blo=
ck.
> >> >
> >> > Could we instead derive this from the pinmux nodes? For example you =
have
> >> > this in the example below:
> >> >
> >> >         usb3p0 {
> >> >                 nvidia,lanes =3D "pcie-0";
> >> >                 ...
> >> >         };
> >> >
> >> > Perhaps what we need is to either key off the node name or add anoth=
er
> >> > property, such as:
> >> >
> >> >         nvidia,usb3-port =3D <0>;
> >> >
> >> > This would match the nvidia,usb2-port property that you've added bel=
ow.
> >>
> >> That is actually how I described the USB3 port to SS lane mapping
> >> originally, but in review of an earlier version of this series,
> >> Stephen suggested that I make it a separate, not pinconfig property
> >> since it wasn't a value written directly to the hardware.  I'm fine
> >> with changing it back as the pinconfig property makes more sense to me
> >> as well.
> >
> > Hmm... I had considered it a mux option of the specific lane. If the
> > function is usb3, it'd still need to be muxed to one of the ports. So
> > it's additional information associated with the usb3 function.
> >
> > I did look through the driver changes and can't really make out which
> > part of the code actually performs this assignment. Can you point me to
> > it?
>=20
> There's not really an assignment.  The property is used to map between
> a lane (e.g. PCIe-0 or SATA) and the USB3.0 port it's mapped to.  For
> an example of where it's used, take a look at usb3_phy_power_on().
> There are certain per-lane registers which need to be programmed in
> addition to the per-USB3.0 port pad registers.  This mapping is used
> to determine which lane needs to be programmed.

Are you saying the mapping of lane to USB port is fixed? That is, PCIe-0
lane is always used for USB port X and SATA always for USB port Y?

If so I'd argue that we don't need this property in DT at all.

Thierry

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUUnRQAAoJEN0jrNd/PrOhe/YP/2mClLN/esxCslbFF7qRnhKt
QccEEJMAMaFYXYAbqbogGtQzJAFyutVqjtnm1LM4ChdD2t232OpkGT24RHfVtckt
aP/2uK7TALPBONF/dVg/TJ9z3+CCsIgfvDpoQwU9MXL3FlcqWZEnlwDuIMOJ7uwO
AHjmfAQrvkVWotqvmlIBXubj0+/gtx1Wfr7afokbIKlNc3p5Kurf3kGQ/3vMgWqm
2T9HPHLwMH+yKX4+jXs/JSyaByPhk57IwGB9l7ycHcipZ1SvSO3J89fF3Eu9yN+6
KkePDC2uaautsvpVdtyzDh1VrmNDkH5R6BmRIFHdYY+OZMUiSZQq+EEbte/mirsg
r/8erGfrWhQZbA8H9E4qWXxnasJBBF+y+I98xvZgP6bnVUiSmI/RqmWEjnef0lDe
lJwJ53MQt7AU/uIPqmyJmDvJ3XFsxNohvjlCi4zz2XTR33PQutegJ/ISzUDBPHaf
LzLKPWYukolwZneQMZevQNAV+JSiBRrW1rc73gsIR+q2Q1MsEOu2KOVnaOhM/bcM
naJkP0YsHyN+dCiWh3uRjOkjh41JnsEt4vwaPPU3Aar2HXeRCjLcdXTAo/j7Oguh
y3m8F7yqjqnsxltIkQpm0qOUYErL/HK+bVglu3yNiTpE+ZPPU+Gl0oZ8T/JqFhE2
ZWOV81HdPRd7WeU6hVUt
=UifO
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
