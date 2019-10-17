From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: tegra: Add Tegra194 support
Date: Thu, 17 Oct 2019 14:01:28 +0200
Message-ID: <20191017120128.GE3122066@ulmo>
References: <20191009024343.30218-1-jckuo@nvidia.com>
 <20191009024343.30218-4-jckuo@nvidia.com>
 <20191009233900.GA9109@bogus>
 <20191014131752.GF422231@ulmo>
 <CAL_Jsq+aKxfAir3skanfqmM+nFFzXPFL4eMa-+pq1kH-90YTbg@mail.gmail.com>
 <57692050-8284-a31f-71fd-7441823f3f2b@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57692050-8284-a31f-71fd-7441823f3f2b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-tegra@vger.kernel.org, Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 03:48:52PM +0800, JC Kuo wrote:
> Hi Thierry, Hi Rob, Hi Kishon,
> Please let me know your thoughts of the below implementation.
>=20
> 1. Add a "bool disable_gen2" to "phy->attrs" structure.
> 2. In _of_phy_get() of phy-core.c to add the follow to parse a generic pr=
operty.
>=20
> 	phy->attrs.disable_gen2 =3D of_property_read_bool(args.np,
> 							"usb-disable-gen2");

Regarding this, I'm not sure how Rob imagined the generic properties to
work. Perhaps he was thinking about something like the max-link-speed
property found in the PCI bindings.

We could have something like this:

  - max-link-speed:
      If present this property specifies the USB generation supported on
      the PHY/port. Must be:
        1: for USB 3.1 Gen 1 (a.k.a. USB 3.0)
        2: for USB 3.1 Gen 2

I'm not sure if we need to consider anything prior to USB 3.0. I suppose
we could do a similar mapping to what I proposed for the PHY ->set_mode
callback:

  - max-link-speed:
      If present this property specifies the USB generation supported on
      the PHY/port. Must be:
        0x0100: for USB 1.0 (Low-Speed)
        0x0101: for USB 1.1 (Full-Speed)
        0x0200: for USB 2.0 (Hi-Speed)
        0x0300: for USB 3.0 (SuperSpeed) (a.k.a. USB 3.1 Gen 1)
        0x0301: for USB 3.1 (SuperSpeed 10 Gbit/s) (a.k.a. USB 3.1 Gen 2)
        0x0302: for USB 3.2 (SuperSpeed 20 Gbit/s) (a.k.a. USB 3.2 Gen 2 x =
2)
        ...

Or those could just be sequentially enumerated, like in the above
example.

Rob, any thoughts?

Thierry

> 3. In individual phy driver, to add SOC/PHY specific programming accordin=
gly.
>=20
> Thanks,
> JC
>=20
> On 10/14/19 9:40 PM, Rob Herring wrote:
> > On Mon, Oct 14, 2019 at 8:17 AM Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> >>
> >> On Wed, Oct 09, 2019 at 06:39:00PM -0500, Rob Herring wrote:
> >>> On Wed, Oct 09, 2019 at 10:43:41AM +0800, JC Kuo wrote:
> >>>> Extend the bindings to cover the set of features found in Tegra194.
> >>>> Note that, technically, there are four more supplies connected to the
> >>>> XUSB pad controller (DVDD_PEX, DVDD_PEX_PLL, HVDD_PEX and HVDD_PEX_P=
LL)
> >>>> , but the power sequencing requirements of Tegra194 require these to=
 be
> >>>> under the control of the PMIC.
> >>>>
> >>>> Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it=
 is
> >>>> possible for some platforms have long signal trace that could not
> >>>> provide sufficient electrical environment for Gen 2 speed. To deal w=
ith
> >>>> this, a new device node property "nvidia,disable-gen2" was added to
> >>>> Tegra194 that be used to specifically disable Gen 2 speed for a
> >>>> particular USB 3.0 port so that the port can be limited to Gen 1 spe=
ed
> >>>> and avoid the instability.
> >>>
> >>> I suspect this may be a common issue and we should have a common
> >>> property. Typically, this kind of property is in the controller though
> >>> and supports multiple speed limits. See PCI bindings for inspiration.
> >>
> >> Given that support for gen 2 speeds is dependent on signal trace lengt=
h,
> >> it doesn't really make sense to restrict the whole controller to a giv=
en
> >> speed if only the signal trace for a single port exceeds the limit for
> >> which gen 2 would work.
> >>
> >> Also, the USB PHYs are in a different hardware block than the USB
> >> controller, so this really is a property of the PHY block, not the USB
> >> controller.
> >=20
> > Okay, but still should be common for USB PHYs IMO.
> >=20
> > Rob
> >=20

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2oWBUACgkQ3SOs138+
s6H6Lg//Z16LUbdt8qinrY+mOKkJzVJyY9gk+oxK+7eqnRev93F97H/5xmv+XL4y
WL5gKVxkEzbuca0zrpU/nK0xxNRVQhCXQkCv7ao2dc4M16ZxUUKG6Hskgv1Pa4Ll
nHcmxN6lNmnCH+RVmYM+AoojBUAmaxbga1atV96DBY/6lqxUl3CtkHNFzSyfGw1S
TQ5er1i1HpEuHOqY1Fsx2XTo0x3akWJgtPL/wvnw/exNN+tPXOdgXqJXvU3LF8S1
3bFVF/o23jN6FBnVtzTsaLR5lZyOc5HhvDiwtOUWptck0wmWmeOiL4G5QGj0Cks4
pN5BVm7Of69i5YLWWJWM6VWX8Mo27l+/u/fUkqvyp5QpTpGdrArVbOWhZg+iqpsH
gSeU7Uhw6xdvTrgqnH+5wKH6vdb82W19SQ+xeu01mEiMHsUp0CneAxoafQrH5DIy
TKDfegIEfEGzEbDNYUn1k7ZMjF+5tO1JCOQ6ExLpIknbShWJG7cCi0w0qpeni83F
73H7Sk/32VjO4TJDUe6PbdEBrmGDWHDU3S6cZpgOTujd+tbD+1TNTL3rA40pRXoo
8ikBMJlfKDlnKjhdCtIrtT+OgOlSeA6poK73FfK/I2pvqZuCGNoGuubsvyel1xoK
3egGGoIm5LMurdn4oazcaMcPJt2/YABalS1AYgoJ+6Y+y+oKWnw=
=wH+F
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
