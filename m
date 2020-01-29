From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 5/5] arm64: tegra: Add Tegra VI CSI suppport in
 device tree
Date: Wed, 29 Jan 2020 10:46:24 +0100
Message-ID: <20200129094624.GD2479935@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1580235801-4129-6-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 10:23:21AM -0800, Sowjanya Komatineni wrote:
> Tegra210 contains VI controller for video input capture from MIPI
> CSI camera sensors and also supports built-in test pattern generator.
>=20
> CSI ports can be one-to-one mapped to VI channels for capturing from
> an external sensor or from built-in test pattern generator.
>=20
> This patch adds support for VI and CSI and enables them in Tegra210
> device tree.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi |  8 +++++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 31 ++++++++++++++++++++=
+++++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210-p2597.dtsi
> index b0095072bc28..ec1b3033fa03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -10,6 +10,14 @@
>  			status =3D "okay";
>  		};
> =20
> +		vi@54080000 {
> +			status =3D "okay";
> +		};
> +
> +		csi@0x54080838 {
> +			status =3D "okay";
> +		};
> +
>  		sor@54580000 {
>  			status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index 48c63256ba7f..c6107ec03ad1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -136,9 +136,38 @@
> =20
>  		vi@54080000 {
>  			compatible =3D "nvidia,tegra210-vi";
> -			reg =3D <0x0 0x54080000 0x0 0x00040000>;
> +			reg =3D <0x0 0x54080000 0x0 0x808>;
>  			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			status =3D "disabled";
> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
> +
> +			clocks =3D <&tegra_car TEGRA210_CLK_VI>;
> +			clock-names =3D "vi";
> +			resets =3D <&tegra_car 20>;
> +			reset-names =3D "vi";
> +		};
> +
> +		csi@0x54080838 {
> +			compatible =3D "nvidia,tegra210-csi";
> +			reg =3D <0x0 0x54080838 0x0 0x2000>;
> +			status =3D "disabled";
> +			assigned-clocks =3D <&tegra_car TEGRA210_CLK_CILAB>,
> +					  <&tegra_car TEGRA210_CLK_CILCD>,
> +					  <&tegra_car TEGRA210_CLK_CILE>;
> +			assigned-clock-parents =3D <&tegra_car TEGRA210_CLK_PLL_P>,
> +						 <&tegra_car TEGRA210_CLK_PLL_P>,
> +						 <&tegra_car TEGRA210_CLK_PLL_P>;
> +			assigned-clock-rates =3D <102000000>,
> +					       <102000000>,
> +					       <102000000>;
> +
> +			clocks =3D <&tegra_car TEGRA210_CLK_CSI>,
> +				 <&tegra_car TEGRA210_CLK_CILAB>,
> +				 <&tegra_car TEGRA210_CLK_CILCD>,
> +				 <&tegra_car TEGRA210_CLK_CILE>;
> +			clock-names =3D "csi", "cilab", "cilcd", "cile";
> +
>  		};

Can this be a child of the vi node? Looking at the register ranges it
seems like these are actually a single IP block. If they have separate
blocks with clearly separate functionality, then it makes sense to have
CSI be a child node of VI, though it may also be okay to merge both and
have a single node with the driver doing all of the differentiation
between what's VI and what's CSI.

Looking at later chips, the split between VI and CSI is more explicit,
so having the split in DT for Tegra210 may make sense for consistency.

I know we've discussed this before, but for some reason I keep coming
back to this. I'll go through the other patches to see if I can get a
clearer picture of how this could all work together.

Thierry

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xVGwACgkQ3SOs138+
s6Htyw/+JrPQnVn82x/J0IALFgng73ubFhAn1ygQEOqCVn2aaRoq4OaGnWpxZRj1
SpQs7FBqzYAkbl8XlAUEc8evI0WmQgk6UYutPXVaqnMNMLAryL7hpgaCOsm/y058
81yVFJ+Me1nOZgJmdqKtJfN41h2WPvwwZDdfWpZ8zJzzG+wiCP4OWd9szMup9nzA
FwjDpR3Nyk32ALJxxKXmw3PtrUfE0VzlWR2/ByMolxjtZ6H66sjPHoyO6QgdmKQo
IqRgtvpucSuUDU1Jvs1AYG47uPqsVuD/i7UqukPWHPEO1I4LdtPgS7wdLekBPNqZ
NmQ13J/CpfaaPak47Inqe1yUy17Fs7jWBIimneQzzhD4wY8gn6i6CgRRgOEMqhZl
4R/lxF32owCYHyeyCU0aBo56osX8xD3Gplt8MRLSDolDpbdsdajPJNBEQcdbyQu8
rUS9rxvcuHWJX7sghguZy54P3aEHiUgHuSw4sFVfbgorZpz0xPX0ZUa6XpIpb0Mp
Gg1SlMsIY16JQEXIikgzxwRTKaN2PDcblDscY6W9QOOzSE87g3Hr6V82murkl5PM
2OjfExlpjSr6Tf50WB0jSm4xWlSerJlozODQo/7TPmCjhBFSB4IE92gtZhvEJuLP
7R6g41M/X2rI6YtE8wxFc7dg4I92twzPnZzxEZhN87lIE6B83CA=
=ccse
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
