From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport
 in device tree
Date: Thu, 30 Jan 2020 13:36:07 +0100
Message-ID: <20200130123607.GB2584455@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
 <20200129094624.GD2479935@ulmo>
 <bd18711d-ce23-cbee-7824-37a8c78908e6@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bd18711d-ce23-cbee-7824-37a8c78908e6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 08:22:48AM -0800, Sowjanya Komatineni wrote:
>=20
> On 1/29/20 1:46 AM, Thierry Reding wrote:
> > On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
> > > Tegra210 contains VI controller for video input capture from MIPI
> > > CSI camera sensors and also supports built-in test pattern generator.
> > >=20
> > > CSI ports can be one-to-one mapped to VI channels for capturing from
> > > an external sensor or from built-in test pattern generator.
> > >=20
> > > This patch adds support for VI and CSI and enables them in Tegra210
> > > device tree.
> > >=20
> > > Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
> > >   arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 +++++++++++++++=
++++++++++-
> > >   2 files changed, 38 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/ar=
m64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > index b0095072bc28..ec1b3033fa03 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > > @@ -10,6 +10,14 @@
> > >   			status =3D "okay";
> > >   		};
> > > +		vi@54080000 {
> > > +			status =3D "okay";
> > > +		};
> > > +
> > > +		csi@0x54080838 {
> > > +			status =3D "okay";
> > > +		};
> > > +
> > >   		sor@54580000 {
> > >   			status =3D "okay";
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210.dtsi
> > > index 48c63256ba7f..c6107ec03ad1 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > @@ -136,9 +136,38 @@
> > >   		vi@54080000 {
> > >   			compatible =3D "nvidia,tegra210-vi";
> > > -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
> > > +			reg =3D <0x0 0x54080000 0x0 0x808>;
> > >   			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> > >   			status =3D "disabled";
> > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> > > +
> > > +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> > > +			clock-names =3D "vi";
> > > +			resets =3D <&tegra_car 20>;
> > > +			reset-names =3D "vi";
> > > +		};
> > > +
> > > +		csi@0x54080838 {
> > > +			compatible =3D "nvidia,tegra210-csi";
> > > +			reg =3D <0x0 0x54080838 0x0 0x2000>;
> > > +			status =3D "disabled";
> > > +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
> > > +					  <&tegra_car TEGRA210_CLK_CILCD>,
> > > +					  <&tegra_car TEGRA210_CLK_CILE>;
> > > +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
> > > +						 <&tegra_car TEGRA210_CLK_PLL_P>,
> > > +						 <&tegra_car TEGRA210_CLK_PLL_P>;
> > > +			assigned-clock-rates =3D <102000000>,
> > > +					       <102000000>,
> > > +					       <102000000>;
> > > +
> > > +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
> > > +				 <&tegra_car TEGRA210_CLK_CILAB>,
> > > +				 <&tegra_car TEGRA210_CLK_CILCD>,
> > > +				 <&tegra_car TEGRA210_CLK_CILE>;
> > > +			clock-names =3D "csi", "cilab", "cilcd", "cile";
> > > +
> > >   		};
> > Can this be a child of the vi node? Looking at the register ranges it
> > seems like these are actually a single IP block. If they have separate
> > blocks with clearly separate functionality, then it makes sense to have
> > CSI be a child node of VI, though it may also be okay to merge both and
> > have a single node with the driver doing all of the differentiation
> > between what's VI and what's CSI.
> >=20
> > Looking at later chips, the split between VI and CSI is more explicit,
> > so having the split in DT for Tegra210 may make sense for consistency.
> >=20
> > I know we've discussed this before, but for some reason I keep coming
> > back to this. I'll go through the other patches to see if I can get a
> > clearer picture of how this could all work together.
> >=20
> > Thierry
>=20
> We can keep it separate as we discussed.
>=20
> But as Tegra186 onwards, CSI is separate device to be all cosistent I kept
> CSI as separate node for Tegra210 as well.

=46rom our discussion, my understanding was that CSI would be a separate
device, but it would still be a subdevice of VI. The address offset of
the CSI registers not being aligned to a power of two is a strong
indication that this is really all part of the same block.

Looking at this again, I'm having second thoughts about even that
suggestion. It wouldn't be technically wrong to have an additional
subdevice for CSI, but I don't think it's really necessary.

Now, given that the DT part is going to be somewhat crucial because it
will be ABI once merged, I'd like to make sure we're not painting
ourselves into a corner. Could you post a few examples of how this
currently looks? In addition to this TPG-only example, do you have a
variant of what it looks with the current proposal? I can only find an
example of the CSI-as-subdevice-of-VI that we had discussed earlier.

Thierry

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4yzbUACgkQ3SOs138+
s6FhFg/9F8psnyuKW3fE7vbe03ixbQo6NLijNej/rSez8byieqCo6vLkrK1xwDs6
OCy5s984O5epGdyuWNE06EY8lKVR8/nCM6ZztTBVct7qECMe29aDUqCLldSszTMy
/4kSsR1zWzTUnV9Uk3NNFcxRf/ZkQqgRDNSPJnqphwwJ0Og9iVSpgdigXph09wGb
YnAiJNMpDBr2phHGVfYAvXyy+V/6DWls5D9ME8k/Yxq275k+OzDhuNQ2K8GVTbFA
iL0CUY7bv6eEcRs/E4xxXIxeqJ+irYWGDX/KgA1VTjJMqla89MiVT1RJGy3zf9Fh
t153fTNON0ga6r51UpTFY4OM6W0O1X0Q6qQrKc+KtbD6/8I2NC8t20x51pqR2Irw
dhLckko4woaD/WynyeC15SwUfi8Tj52/TIEwa/nr0540Z+j0zPSrxQMRdbrhUIiL
wtbaF1r3Kcq+RkTsDSwGd2y/yShmvPkV1Rpn60+OwKMWs1gVG57LXTRBviqhN5YN
4R1S94GJxE5cJoBvcFVEGlmXa3H+pCs9w0e/DNGVn/zJcvnEYbLpSCWP5lD4C8H3
s809Ixy33n4yK31rY7lPQRmTANov/axo4bws/80UUHGVPvAHqpKYdJ3rvFzHzmQU
LSf+0DqunU7xjBKyliPvdKHWUSUiMmgGjAKaLn4KpdLq2gOM6rA=
=Yq0U
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
