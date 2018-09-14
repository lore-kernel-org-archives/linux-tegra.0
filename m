From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Multi-parent IRQ domains
Date: Fri, 14 Sep 2018 10:10:23 +0200
Message-ID: <20180914081023.GA22750@ulmo>
References: <20180913155945.GA19903@ulmo>
 <ea9261a9-2c4d-7ca4-6dca-73f385aa46d5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ea9261a9-2c4d-7ca4-6dca-73f385aa46d5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2018 at 02:50:21PM -0700, Florian Fainelli wrote:
>=20
>=20
> On 09/13/18 08:59, Thierry Reding wrote:
> > Hi everyone,
> >=20
> > I've been trying to implement a feature on recent Tegra chips that's
> > called "wake events". These wake events are implemented as part of the
> > power management controller (PMC) and they control which events can be
> > used to wake the system from suspend. Events include things like an
> > alarm interrupt from an RTC, or the GPIO interrupt hooked up to a
> > power button for example.
> >=20
> > We already have a driver for a couple of other things that the PMC does,
> > so I thought it'd be natural to implement this functionality as an IRQ
> > chip in the PMC driver. The way that this would work is that for all the
> > devices that are wakeup sources, we'd end up specifying the PMC as the
> > interrupt parent and the PMC would then itself have the main GIC as its
> > parent. That way, the hierarchical IRQ domain infrastructure would take
> > care of pretty much everything.
> >=20
> > Unfortunately I've run into some issues here. One problem that I'm
> > facing is that PMC could have more than one parent. For example, the RTC
> > alarm interrupt goes straight to the GIC, but the power button GPIO goes
> > through the GPIO controller first and then to the GIC. This doesn't seem
> > to be something that's currently possible.
> >=20
> > The way I imagine this to work from a DT perspective is as follows:
>=20
> There is an interrupts-extended property which as a first cell takes a
> phandle to the parent interrupt controller, e.g:
>=20
> interrupts-extended =3D <&gic 73 GIPC_SPI IRQ_TYPE_LEVEL_HIGH>,
> 			<&pmc 10>;
>=20
> (provided that I understood your problem and example correctly). We have
> a similar use case on our STB chips where we have "main" interrupts
> wired to the ARM GIC and wake-up interrupts wired to a specific wake-up
> interrupt controller in an always-on domain. The two controllers have a
> different #interrupt-cells specifier.
>=20
> The interrupt infrastructure in Linux already knows how to deal with
> that and whether you use of_get_irq() or platform_get_irq() you should
> obtain the correct virtual interrupt numbers that you expected, parented
> to the appropriate interrupt controller.

Yeah, I had looked at the interrupts-extended property as well, but
while I think it might work, one issue with that is that we'd be
modelling the regular IRQ and wakeup IRQ as two different IRQs. On
Tegra, however, the wakeup interrupt is the same as the regular
interrupt, except that the bits to enable the wake logic is in a
different hardware block. So the PMC acts more like an additional
mux for a subset of the interrupts in the system.

In addition to that, if I were to model the interrupts separately, I'd
also have to modify existing drivers for all the wakeup-able devices to
deal with two separate interrupts, which is rather undesirable.

Thierry

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlubbO0ACgkQ3SOs138+
s6Eo4w/8CFdu6waD5JsOQH7TrFv98Q/Fsq9TLrsUvPHL/wEacrne8/PLtbidu4pv
RohmWSf4br1GhN8+3D/U3gFw/uI5I8oD3lqHXHHRxCc297gK5t+tXXhNOZeuaZ0l
NyuRqZ8o47EPxAkOrDsu+ZfBc1u2m9l4zYMA1OB0X3NIjT2w3Rt7msPZQapZrxlV
mp9Iw/d6ArOegaukW0l98YtmZnSmpg4tbqB6pGzoCMfAtRsf3jf+DUuhdn36t0VD
eBUqhRo6MVqECi3NiELGpZ+ya3rrgKn94PzU65aVDX/6K9AquOz5GdNaYR++/UsK
zHfppn31Ecr6Y9LW9mrP8yj2k7hMAbMnlKcYcS0G23xUf++N9dc7d8aR/RWP74Q5
CxmiIGhLttnFyTcEhU2p07+dKZOTzkNpd3ZVpNNp0OV3e43IpjUL4QpCK+IaWlWp
zFDFtbhrCL3A2FVAW+bQcozzC2vtMalBMuiwVRIOBExSd/yLg5vZdHlJVXWU5jgT
Xc7KBPDbGCG42im7nzF6Bt7bW/af8pLG0d+U88OKShX3drQFxRJWY5hmfTrjoq4v
7JBJD25vDgACnHoWVwUuiiOuui5RD1WdMQQqqoe3HyHaINMjn4iroKpDWFeQ64EK
cW2Wu5eOCizrvPxOM3C87outtt3n0OTJmlZQWFmhEp6D5Xj04yU=
=Y+K7
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
