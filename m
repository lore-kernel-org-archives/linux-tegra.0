From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 6/6] arm64: tegra: Add support for PCIe endpoint mode in
 P2972-0000 platform
Date: Mon, 25 Nov 2019 08:25:42 +0100
Message-ID: <20191125072542.GC1409040@ulmo>
References: <20191122104505.8986-1-vidyas@nvidia.com>
 <20191122104505.8986-7-vidyas@nvidia.com>
 <20191122132533.GD1315704@ulmo>
 <e1e44c1c-c1ab-27dd-b3ac-a9ed878411a2@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e1e44c1c-c1ab-27dd-b3ac-a9ed878411a2@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 12:30:53PM +0530, Vidya Sagar wrote:
> On 11/22/2019 6:55 PM, Thierry Reding wrote:
> > On Fri, Nov 22, 2019 at 04:15:05PM +0530, Vidya Sagar wrote:
> > > Add endpoint mode support for PCIe C5 controller in P2972-0000 platfo=
rm
> > > with information about supplies, PHY, PERST GPIO and GPIO that contro=
ls
> > > PCIe reference clock coming from the host system.
> > >=20
> > > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > > ---
> > >   .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 29 ++++++++++++++++=
+++
> > >   1 file changed, 29 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arc=
h/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> > > index 7eb64b816e08..58c3a9677bc8 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> > > @@ -43,6 +43,19 @@
> > >   		gpio@c2f0000 {
> > >   			status =3D "okay";
> > > +			/*
> > > +			 * Change the below node's status to 'okay' when
> > > +			 * PCIe C5 controller is enabled to operate in endpoint
> > > +			 * to allow REFCLK from the host system to flow into
> > > +			 * the controller.
> > > +			 */
> > > +			pex-refclk-sel-high {
> > > +				gpio-hog;
> > > +				output-high;
> > > +				gpios =3D <TEGRA194_AON_GPIO(AA, 5) 0>;
> > > +				label =3D "pex_refclk_sel_high";
> > > +				status =3D "disabled";
> > > +			};
> >=20
> > Why don't we put this into the PCIe controller's node as a reference to
> > that GPIO? Seems like the controller would know exactly when this pin
> > needs to go high or low, so why does it have to be a hog?
> >=20
> > Thierry
> Are you saying something like 'nvidia,enable-refclk-in'?
> I was thinking, since this is like a board level configuration specific t=
o Jetson-Xavier,
> it would suffice to just hog it according to the mode of operation of PCI=
e controller.
> But, I see one advantage of referencing it in the PCIe node (so that the =
driver can configure
> it as and when needed) is that one has to be careful just to enable eithe=
r PCIe RP or EP
> node and not worry about other thing (like this).
> Let me know if I got this right.

Yeah, that's exactly why I think referencing this from the controller
and controlling it in the driver is preferable.

If this is some sort of select signal I think it makes sense to name it
"nvidia,refclk-select-gpios" or something. Does this appear in the
schematic somewhere? Or does the IP have a name for this? Those are
usually good places to look for inspiration on the name because it's
what hardware designers will be familiar with and they are technically
the ones who should write the DT, even if that's rarely the case.

Thierry

>=20
> - Vidya Sagar
>=20
> >=20
> > >   		};
> > >   		pwm@c340000 {
> > > @@ -144,6 +157,22 @@
> > >   			    "p2u-5", "p2u-6", "p2u-7";
> > >   	};
> > > +	pcie_ep@141a0000 {
> > > +		status =3D "disabled";
> > > +
> > > +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> > > +
> > > +		nvidia,pex-rst-gpio =3D <&gpio TEGRA194_MAIN_GPIO(GG, 1)
> > > +					GPIO_ACTIVE_LOW>;
> > > +
> > > +		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
> > > +		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
> > > +		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
> > > +
> > > +		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
> > > +			    "p2u-5", "p2u-6", "p2u-7";
> > > +	};
> > > +
> > >   	fan: fan {
> > >   		compatible =3D "pwm-fan";
> > >   		pwms =3D <&pwm4 0 45334>;
> > > --=20
> > > 2.17.1
> > >=20
>=20

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3bgfMACgkQ3SOs138+
s6EXpA//Vf94QkU0m4v0u3GfWabPSf4ibYaD7lAL17j41siLQqsFsLLqPrezP11W
xE7ZzRyUr/S9+l5WnPFkraFd5omrEmYIx6FYXJ2vdei6AomirGpmPTQYwthEztVB
o0r7qpnpfLrCz1qqOieUdlOTuaWdf6JWwGQOVJK/b8ZafA25DqLJH0vvawlp+8r6
g7GRtbMDk6JRy5OOS01wvybB06m5D7GShlIIqY51S7Mrm5QA8QGARb+c1dShrmag
mzw/HeNJNPH5db3Cl0Vbxhb8qSeJiqxl/b03yKu1RMmNcXmnZENR121LyIb7YsTz
0YmJIu2qAVa4OGrQZXszIfD1tBturQHol55TuVbLxKQQFtuVPmNAFCb9fSA0xGak
+wLO8LLzGPxdKwqq/gBvhebGp2Bpz6d81TiLPaKFGkYhGsBG168EMUYeKsMha9ef
C+q1Ja+3xQvyvPrHyjCb0jEp2+hzocPWgTaT3sqzAdsWNRL6Fmd6okut1UmCTs0C
LfnF5AcUit6p21oz896dSmNSkdk4t9mlLSaZaULF9duBKrhR21305lYfAqJjZ9S0
DikhRMUN+wY0Cp+omFrq59c+XzpA+pU1TndYR2SULHQMlNN0h3twl0v+kfT6EyMd
3zLBPfVMk6zYZpkxYfQxYulzFNds/nJfZlgxrx9XHw/9rl8knMU=
=qGH2
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
