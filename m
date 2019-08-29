From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: PCI: tegra: Add PCIe slot supplies
 regulator entries
Date: Thu, 29 Aug 2019 18:41:15 +0200
Message-ID: <20190829164115.GD19842@ulmo>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-3-vidyas@nvidia.com>
 <20190829120329.GC13187@ulmo>
 <cd106d64-e06c-e7a2-d807-f5f080625363@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cd106d64-e06c-e7a2-d807-f5f080625363@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 08:48:39PM +0530, Vidya Sagar wrote:
> On 8/29/2019 5:33 PM, Thierry Reding wrote:
> > On Wed, Aug 28, 2019 at 10:58:46PM +0530, Vidya Sagar wrote:
> > > Add optional bindings "vpcie3v3-supply" and "vpcie12v-supply" to desc=
ribe
> > > regulators of a PCIe slot's supplies 3.3V and 12V provided the platfo=
rm
> > > is designed to have regulator controlled slot supplies.
> > >=20
> > > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > > ---
> > > V3:
> > > * None
> > >=20
> > > V2:
> > > * None
> > >=20
> > >   .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 +++++=
+++
> > >   1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pc=
ie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> > > index 0ac1b867ac24..b739f92da58e 100644
> > > --- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> > > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.txt
> > > @@ -104,6 +104,12 @@ Optional properties:
> > >      specified in microseconds
> > >   - nvidia,aspm-l0s-entrance-latency-us: ASPM L0s entrance latency to=
 be
> > >      specified in microseconds
> > > +- vpcie3v3-supply: A phandle to the regulator node that supplies 3.3=
V to the slot
> > > +  if the platform has one such slot. (Ex:- x16 slot owned by C5 cont=
roller
> > > +  in p2972-0000 platform).
> > > +- vpcie12v-supply: A phandle to the regulator node that supplies 12V=
 to the slot
> > > +  if the platform has one such slot. (Ex:- x16 slot owned by C5 cont=
roller
> > > +  in p2972-0000 platform).
> >=20
> > There's an ongoing discussion regarding the use of optional power
> > supplies and I'm wondering if we're not abusing this here. Why exactly
> > are these regulators optional?
> I made them optional because, the number and type of supplies typically d=
epend on the
> kind of slot the controller is owning. If it is a CEM slot, then, it need=
s 3.3V & 12V
> supplies and if it is an M.2 Key-E/M slot, it needs only 3.3V supply. Als=
o, if there are
> on-board PCIe endpoint devices, supplies may vary again from vendor to ve=
ndor.
> Considering all these, I made them optional instead of mandatory.
> Also, I agree that regulator framework supplies a dummy regulator if we m=
ake them mandatory
> but doesn't supply one, but it does so with a warning print in the log wh=
ich I feel is
> an unwanted alert and to avoid that one has to supply dummy/fixed regulat=
ors which again
> seems an overkill when all of this can be addressed by making slot regula=
tors optional.

Okay. That sounds like a good reason to make these optional indeed.
There is no way for the PCI controller to know exactly which regulators
will be needed. The only case where it is known is that of the regular
PCIe slot where the 3.3 V and 12 V are mandatory. But since it isn't
always a standard PCIe slot that the controller drives, I think optional
is okay in this case.

Thierry

> > The distinction is somewhat subtle, but the other way to look at
> > modelling this in DT is that the supplies are in fact required, but may
> > be connected to an always-on regulator with a fixed voltage. Or in some
> > cases they may also be shorted to ground. In both cases the PCI
> > controller, or rather the slot that the controller connects to, actually
> > "requires" the supplies, it's just that we can get away without
> > describing them because they can't be controlled anyway.
> >=20
> > Looking at the PCI connector pinout for PCI Express, I do see a bunch of
> > +3.3 V and +12 V pins. To me that indicates that the 3.3 V and 12 V
> > supplies are indeed required for PCI slots. I'm not sure about devices
> > that are directly connected to the PCI controller, though. I'll need to
> > go look at some schematics to get a better understanding of these.
> >=20
> > Bottom line: I'm wondering if we shouldn't really make these supplies
> > mandatory and in case where we don't care either just leave them away
> > (the regulator framework will supply a dummy regulator in that case) or
> > hook them up to a fixed regulator if that matches the hardware design.
> >=20
> > Any thoughts?
> >=20
> > Thierry
> >=20
> > >   Examples:
> > >   =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > @@ -156,6 +162,8 @@ Tegra194:
> > >   			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x4 0x00000000>;  /=
* prefetchable memory (16GB) */
> > >   		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> > > +		vpcie3v3-supply =3D <&vdd_3v3_pcie>;
> > > +		vpcie12v-supply =3D <&vdd_12v_pcie>;
> > >   		phys =3D <&p2u_hsio_2>, <&p2u_hsio_3>, <&p2u_hsio_4>,
> > >   		       <&p2u_hsio_5>;
> > > --=20
> > > 2.17.1
> > >=20
>=20

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1oACkACgkQ3SOs138+
s6EGvw//aC8g/p1/uH6bQaFYayqHbvSXJkcs+qLM1pXP6sQs+Y78dkyd0bFY5d3I
eWq7JMsg5syZh6vKYm8rYUQoOvmhKvgGJ2ICfXTe5Jj9F3pS2pK6PCcF3OpZIopk
N9rsnpwUm/N5966NBkZyikA9iQat2EPJXSJA917kV8bAhs2uu4/xxBO2joG9GLPb
hWD6EtgywvtYlRhpJ7irFlVjJ8VOj5j3zUi6ZpedMrtU8Bx/llbz+1bnrvyVlMjY
HtcN2ndkRacf4nwu8/nB5GIzucOAE6jiKmwjpfv0PwV1GHkj8QggDZ6U8YEK98i3
cYBL2iGlQw+k3dJgPl5poUrHmyHxvphHt3eEnrbOqXwe3jFtC/z4cKtc0d2h0omo
5OQzeXZ9DNP26b2NvCkz/JCQlSGzlCp6M/MiJQu4Iu53DTAR9S2T650QG4s/hMVF
cBujoyFuAc9rXwB+uxrkHHcHZZFNXDTawC8LQJgWIAfa5v8bhgfWKdaHbjhb0Bee
R7fHHclqVSU2J1K6cRJ1d1daqme8VloCxg+eClg72UxXXnEPqRPP/PJS7tyX9Dzp
uJMC4JfgRu+xShFywcXH9oif3ufSqHBnfIUiWNnKefLu5w6Y3Fg10nj5Shj0k0UL
Jjk6JzRLE/h8QkgmNs49r3r7NkjzFfm4GZ5xBC0n/VAeVRxxW/8=
=RTQ7
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
