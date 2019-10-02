From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/6] arm64: tegra: Add XUSB and pad controller on Tegra194
Date: Wed, 2 Oct 2019 12:11:02 +0200
Message-ID: <20191002101102.GG3716706@ulmo>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-6-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002080051.11142-6-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 04:00:50PM +0800, JC Kuo wrote:
> Adds the XUSB pad and XUSB controllers on Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 130 +++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 3c0cf54f0aab..4d3371d3a407 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1599,4 +1599,134 @@
>  		interrupt-parent =3D <&gic>;
>  		always-on;
>  	};
> +
> +	xusb_padctl: padctl@3520000 {

I also noticed that this is outside of the /cbb bus node. It really
belongs inside /cbb. Same for the XHCI controller node.

Thierry

> +		compatible =3D "nvidia,tegra194-xusb-padctl";
> +		reg =3D <0x0 0x03520000 0x0 0x1000>,
> +			<0x0 0x03540000 0x0 0x1000>;
> +		reg-names =3D "padctl", "ao";
> +
> +		resets =3D <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
> +		reset-names =3D "padctl";
> +
> +		status =3D "disabled";
> +
> +		pads {
> +			usb2 {
> +				clocks =3D <&bpmp TEGRA194_CLK_USB2_TRK>;
> +				clock-names =3D "trk";
> +
> +				lanes {
> +					usb2-0 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb2-1 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb2-2 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb2-3 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +				};
> +			};
> +			usb3 {
> +				lanes {
> +					usb3-0 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb3-1 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb3-2 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +					usb3-3 {
> +						nvidia,function =3D "xusb";
> +						status =3D "disabled";
> +						#phy-cells =3D <0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		ports {
> +			usb2-0 {
> +				status =3D "disabled";
> +			};
> +			usb2-1 {
> +				status =3D "disabled";
> +			};
> +			usb2-2 {
> +				status =3D "disabled";
> +			};
> +			usb2-3 {
> +				status =3D "disabled";
> +			};
> +			usb3-0 {
> +				status =3D "disabled";
> +			};
> +			usb3-1 {
> +				status =3D "disabled";
> +			};
> +			usb3-2 {
> +				status =3D "disabled";
> +			};
> +			usb3-3 {
> +				status =3D "disabled";
> +			};
> +		};
> +	};
> +
> +	tegra_xhci: xhci@3610000 {
> +		compatible =3D "nvidia,tegra194-xusb";
> +		reg =3D <0x0 0x03610000 0x0 0x40000>,
> +			<0x0 0x03600000 0x0 0x10000>;
> +		reg-names =3D "hcd", "fpci";
> +
> +		interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		clocks =3D <&bpmp TEGRA194_CLK_XUSB_CORE_MUX>,
> +			<&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
> +			<&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
> +			<&bpmp TEGRA194_CLK_XUSB_FALCON>,
> +			<&bpmp TEGRA194_CLK_XUSB_FALCON_HOST>,
> +			<&bpmp TEGRA194_CLK_XUSB_FALCON_SS>,
> +			<&bpmp TEGRA194_CLK_XUSB_FS>,
> +			<&bpmp TEGRA194_CLK_XUSB_FS_HOST>,
> +			<&bpmp TEGRA194_CLK_XUSB_SS>,
> +			<&bpmp TEGRA194_CLK_XUSB_SS_SUPERSPEED>,
> +			<&bpmp TEGRA194_CLK_UTMIPLL>,
> +			<&bpmp TEGRA194_CLK_CLK_M>,
> +			<&bpmp TEGRA194_CLK_PLLE>;
> +		clock-names =3D "xusb_hs_src", "xusb_host",
> +			"xusb_core_superspeed_clk", "xusb_falcon_src",
> +			"xusb_falcon_host_clk", "xusb_falcon_superspeed_clk",
> +			"xusb_fs_src", "xusb_fs_host_clk", "xusb_ss_src",
> +			"xusb_ss", "pll_u_480m", "clk_m", "pll_e";
> +
> +		power-domains =3D <&bpmp TEGRA194_POWER_DOMAIN_XUSBC>,
> +				<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
> +		power-domain-names =3D "xusb_host", "xusb_ss";
> +
> +		nvidia,xusb-padctl =3D <&xusb_padctl>;
> +		status =3D "disabled";
> +	};
>  };
> --=20
> 2.17.1
>=20

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ud7YACgkQ3SOs138+
s6Fc4g//doxqb6jUWGiWBzZ1ER+mEG+TxHEsnsZJ/r1205w9wyN+WLLEKkrDVwKN
yaB/7/4TlwCg8HEs6pDMwn4puU8kiRoMLQM6jekI4NtExurKLV9JhkAnA0l7J+nJ
bKDeewgv04CqzYIeGg+NeveI8nheTlbg2qFXrQxbjZHqUYouRBUJhaUB9yH+8+qo
Mg6phXNr6e63bqy8lE0cNDi3QFNKn1tRdYJ/1/Cmd+UiZzFy2JJr6Df0ca9xIU/8
zHpvUO5Gft4lof1wbTgRuJT93O/Tpul431noSIA2FJbUWfWdMeHoq9iO0RsQ2jrW
9BKWV966H2mFyt4RZtRehlcE9T4R8z7VkV63hrCK39ggLywmARIgUdYXtl9bjn1K
/OCbCPsthITfuXBCOhrfeNCysrCHwOA5VeAtISI0xnCPAogAdTplmpWPJY9XZDz1
XkzE0UZG59YF5x1+JRwbamJ0WP28NUXemhD3MX5fbWwBRcK3B5roTnQHxyYcyCOS
/DVknEU893JRCqi70kB67zZu2nGICC6peiTdJZMHovaXQHOi/2YK7F/qRli3DCkd
aakqavcDQt1AGgEry9wg0NEyBG9ltPIZThnUCTveu+9oBtMGutRBsNNu8kT6bIww
4+7VyitnJWyw0lFGu7C4n8+Y0pWqeTxI++yOnuosM+q0wz2g7LM=
=l7N3
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
