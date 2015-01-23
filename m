From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Add initial device tree support for Tegra132
Date: Fri, 23 Jan 2015 13:03:57 +0100
Message-ID: <20150123120355.GA15126@ulmo.nvidia.com>
References: <alpine.DEB.2.02.1501161139180.9776@utopia.booyaka.com>
 <20150121161313.GI5044@leverpostej>
 <alpine.DEB.2.02.1501231038130.5450@utopia.booyaka.com>
 <20150123114423.GG23493@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150123114423.GG23493@leverpostej>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2015 at 11:44:24AM +0000, Mark Rutland wrote:
> On Fri, Jan 23, 2015 at 11:31:24AM +0000, Paul Walmsley wrote:
> > On Wed, 21 Jan 2015, Mark Rutland wrote:
> > > On Fri, Jan 16, 2015 at 11:45:29AM +0000, Paul Walmsley wrote:
[...]
> > > > +
> > > > +               clocks =3D <&tegra_car TEGRA124_CLK_PCIE>,
> > > > +                        <&tegra_car TEGRA124_CLK_AFI>,
> > > > +                        <&tegra_car TEGRA124_CLK_PLL_E>,
> > > > +                        <&tegra_car TEGRA124_CLK_CML0>;
> > > > +               clock-names =3D "pex", "afi", "pll_e", "cml";
> > > > +               resets =3D <&tegra_car 70>,
> > > > +                        <&tegra_car 72>,
> > > > +                        <&tegra_car 74>;
> > > > +               reset-names =3D "pex", "afi", "pcie_x";
> > > > +               status =3D "disabled";
> > > > +
> > > > +               phys =3D <&xusb_padctl TEGRA_XUSB_PADCTL_PCIE>;
> > > > +               phy-names =3D "pcie";
> > > > +
> > > > +               pci@1,0 {
> > > > +                       device_type =3D "pci";
> > > > +                       assigned-addresses =3D <0x82000800 0 0x0100=
0000 0 0x1000>;
> > > > +                       reg =3D <0x000800 0 0 0 0>;
> > > > +                       status =3D "disabled";
> > > > +
> > > > +                       #address-cells =3D <3>;
> > > > +                       #size-cells =3D <2>;
> > > > +                       ranges;
> > >
> > > I'm not sure why these three properties are here. Surely this is a
> > > separate address space (so isn't ranges invalid?), and do we define a=
ny
> > > sub-nodes anywhere?
> >=20
> > Hmm not sure.  This was originally copied from
> > arch/arm/boot/dts/tegra124.dtsi.  Will plan to drop them for now, and t=
hen
> > if the properties (or ones like them) turn out to be needed in the futu=
re,
> > someone else can deal with it :-)
>=20
> That sounds sane to me.

This follows the bindings defined almost two years ago. There was a lot
of discussion back then and this is what we agreed upon. #address-cells
and #size-cells are needed as per the PCI device tree bindings and the
ranges property needed because the PCIe root ports translate addresses
between the host bridge and the PCI endpoint devices.

> > > > +       host1x@0,50000000 {
> > > > +               compatible =3D "nvidia,tegra132-host1x", "nvidia,te=
gra124-host1x", "simple-bus";
> > >
> > > Regarding simple-bus, are the sub-nodes usable if this didn't probe as
> > > "nvidia,tegra124-host1x" or "nvidia,tegra132-host1x"?
> > > Do the subnodes require anything from this node?
> > >
> > > It looks like we expect/require the host1x node to be probed and
> > > initialised before we probe the children. Which would imply the
> > > simple-bus annotation is wrong.
> >=20
> > Haven't tried booting with just simple-bus here.  I believe these devic=
es
> > are accessible without the involvement of host1x.  In other words, host=
1x
> > is not a bus; I believe it might be most accurately described as a type=
 of
> > DMA controller.  So in theory it should be possible for the CPU complex=
 to
> > read and write to these devices directly without the involvement of
> > host1x, although I believe NVIDIA discourages this.
> >=20
> > Under the theory that DT data should be hardware-specific, not
> > software-specific, in an ideal world I think we would list these devices
> > outside the embrace of the host1x node.  However the existing Tegra124 =
DT
> > file listed them together, and I am unsure whether that is required for
> > the host1x code to function correctly.
> >
> > Arto may be able to comment further.
>=20
> Hmm, It would be good to hear from someone familar with that then. I'll
> wait for Arto.

We actually rely on the parent-child relationship in drivers, so we
can't just go and reorganize things at will. This is documented in the
existing binding for host1x, which again, was agreed upon a long time
ago.

As for the simple-bus compatible, I think that was used way back to make
sure of_platform_populate() gets called. I suppose we could drop it and
call of_platform_populate() from the driver if its not there. The reason
why we never considered cases where it would probe as simple-bus is that
it was deemed unreasonable for a driver to bind to simple-bus.

> > > > +       cpus {
> > > > +               #address-cells =3D <2>;
> > > > +               #size-cells =3D <0>;
> > > > +
> > > > +               cpu@0 {
> > > > +                       device_type =3D "cpu";
> > > > +                       compatible =3D "nvidia,denver", "arm,armv8";
> > > > +                       reg =3D <0x0 0x0>;
> > > > +                       enable-method =3D "spin-table";
> > > > +                       cpu-release-addr =3D <0x0 0x80000008>;
> > > > +               };
> > > > +
> > > > +               cpu@1 {
> > > > +                       device_type =3D "cpu";
> > > > +                       compatible =3D "nvidia,denver", "arm,armv8";
> > > > +                       reg =3D <0x0 0x1>;
> > > > +                       enable-method =3D "spin-table";
> > > > +                       cpu-release-addr =3D <0x0 0x80000008>;
> > > > +               };
> > > > +       };
> > >
> > > It would be nice if this were near the top, as in other dts files.
> >=20
> > OK will move.

Actually this follows the rules that we've been following with every DTS
so far. Nodes with a unit address go first, sorted by unit address. They
are followed by nodes without a unit address, sorted alphabetically.

I'd prefer keeping it this way for consistency across Tegra DTS files.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUwjirAAoJEN0jrNd/PrOhEkAQAJNIPfQQg7PMdFwYB9HDc4f1
Kjlxp8XOBRAiJ9FRqq7cXDjHMIEriidrGFEPcUUn5P2DV17rMdZecXyI6XgyEary
7NX8koYlg4AmVwk7ZBa6QMhRO91gjgVi55m1MVIm9R5kETt1ltyjhmLgjcH8TD+B
QqFY9aTyVmKmglqkFdKPmFIOyc3LXTi74m/J4QO8YbPfpNuLnrWhuJVd0xPmQuaH
u1YDxLbFcG9ZDk05O3fvvCea2X26j8JJbJhhs1f2dFMLxbrCitUUT24/tCHAQiWT
Zn4U3+ylCmZPzpC/b+SCcPf0TMbb4WVjbfySVwok/GESv9rU9BrIDrpVOmRIcGrV
pwLFcVjVsHU6erW97OMpg3fdAH1Yimm80AKyclx4S0VsB/Ox8CfmbkuQT1iHMNar
hoqQgrCJf/j+K+RmHahShtFfzhaY8Bposm7aELAYnfuYcbS3UkFRmqi7jJ/o56EU
o7fKhBWZqZk3tRniiUy6on+9T5424Kehv5oh8/2073lxZVq29XaNC3BubTNWVFr0
QIYKLRrUUI6A7NjTmoEHP6U+b9o5kd9YwTJpURCCq/3741QB93wOFyKExnr8IF4G
dJqJxneFiMKGos+nw08T11CAkVsCAnH16ZK2wEvqYmF41HFIQ/Dtt6dU6aPO7HM9
dU6DNqVFIrka1xR4hB38
=M8mX
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
