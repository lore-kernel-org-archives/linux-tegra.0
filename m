From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: fix ulpi regression on tegra20
Date: Thu, 8 Mar 2018 15:59:14 +0100
Message-ID: <20180308145914.GA13814@ulmo>
References: <20180222143825.1517-1-marcel@ziswiler.com>
 <20180308141501.GH3529@ulmo>
 <1520519485.23006.6.camel@toradex.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520519485.23006.6.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 08, 2018 at 02:31:26PM +0000, Marcel Ziswiler wrote:
> On Thu, 2018-03-08 at 15:15 +0100, Thierry Reding wrote:
> > On Thu, Feb 22, 2018 at 03:38:25PM +0100, Marcel Ziswiler wrote:
> > > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > Since commit f8f8f1d04494 ("clk: Don't touch hardware when
> > > reparenting
> > > during registration") ULPI has been broken on Tegra20 leading to
> > > the
> > > following error message during boot:
> > >=20
> > > [    1.974698] ulpi_phy_power_on: ulpi write failed
> > > [    1.979384] tegra-ehci c5004000.usb: Failed to power on the phy
> > > [    1.985434] tegra-ehci: probe of c5004000.usb failed with error
> > > -110
> > >=20
> > > Debugging through the changes and finally also consulting the TRM
> > > revealed that rather than the CDEV2 clock off OSC requiring such
> > > pin
> > > muxing actually the PLL_P_OUT4 clock is in use. It looks like so
> > > far it
> > > just worked by chance of that one having been enabled which
> > > Stephen's
> > > commit now changed when reparenting sclk away from pll_p_out4
> > > leaving
> > > that one disabled. Fix this by properly assigning the PLL_P_OUT4
> > > clock
> > > as the ULPI PHY clock.
> > >=20
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >=20
> > > ---
> > >=20
> > > Changes in v2:
> > > - Updated device tree binding documentation as well.
> > > - CCing Dmitry as well.
> > >=20
> > >  Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt |
> > > 4 +++-
> > >  arch/arm/boot/dts/tegra20.dtsi                                   |
> > > 2 +-
> > >  2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > Applied, though I've split this into two separate patches, one going
> > into for-4.17/dt-bindings and the other going into for-4.17/arm/dt.
>=20
> Thanks, Thierry!
>=20
> BTW: Do you know what is happening with my T30 USB patch? Is there
> anything I may do about it?

I just took care of that.

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqhT8IACgkQ3SOs138+
s6HEWQ/+IpurCJ+DLVaLiqdVwkAKVfwuAD0Sf7Ln1ApZ0ZJS+30Ei1nEyq9o9FOJ
zveMml2Oop0LYfhHBtqaHa9LB8T9Uefd/y6Wfg1FbrN/w/rnBLBvCKBVbTiMtj9j
IEdOvDUd5hNDjd4wZ/LJV6TNONfEl+cPJfU5TnfYuhZRyrX3vCOq9nWvzs0s8brp
5LAcYz0QoVM9UGvVFG34nIfR7mGywLkTS03TbY1lpj2xQkqG1DVvt78qe/sWlkjA
g/BipoYe2zfTGLw9wJQoqdZax1RG0Z4MHqaWJtIyYlaxePsXF7l9tMNjt5VJdKh/
kbPBmxlqfmeG1cPIssmSoR9qOQl1ABjB2AIZ3bXF4tFpSHRIKHgD5FeX94rZzZrD
HRnCpmGHblFhfI58LXFUu8HYookINFekP323B+X2DEm1aYszCbNziHqYOlGPkWpy
J800u+1DEzazlUaLVzFwylnSwpBvlsORN1liYzlbF/bpU12n0O+5VJJCE71DA//K
nVsYSP19DDGRlXuFp5ejccwDVuxY3MHMb39cXENV6/gQiTWPM90pJjoIrLGgsUHL
gsrDOqZ0+MxC6qwhuOTz0npFVy3LypQ5B6/1oEW0l2eiN61ch4rhrGFgxoSFMWCq
cBMssn6hSu+PkAusdeNZr33iwbKHuDSb8IH1uEeXClqdyrr4bpA=
=iszK
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
