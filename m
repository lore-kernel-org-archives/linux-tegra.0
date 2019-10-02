From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/6] arm64: tegra: Add XUSB and pad controller on Tegra194
Date: Wed, 2 Oct 2019 12:10:01 +0200
Message-ID: <20191002101001.GF3716706@ulmo>
References: <20191002080051.11142-1-jckuo@nvidia.com>
 <20191002080051.11142-6-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002080051.11142-6-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: gregkh@linuxfoundation.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--kR3zbvD4cgoYnS/6
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
> +		compatible =3D "nvidia,tegra194-xusb-padctl";
> +		reg =3D <0x0 0x03520000 0x0 0x1000>,
> +			<0x0 0x03540000 0x0 0x1000>;

These should generally be aligned. Use tabs first and then spaces to
make the opening < on subsequent lines align with the opening < on the
first line. There are a couple more like this below.

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

I prefer blank lines to visually separate blocks here and below.

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

The tegra_xhci is unused, so I don't think we need to add it. Also, the
name of this node should be usb@3610000 since it's the compatible string
that defines (together with the bindings) that this is XHCI capable. But
it is fundamentally a USB controller, so the name should reflect that.

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

Some of these clocks are not defined in the bindings. Many of them are
also not used by the driver. Are all of these really needed? If they
are, please add the required ones to the bindings.

Also, for new ones, drop the _clk suffix. The fact that these are clocks
is already conveyed by the property name.

Thierry

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

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ud3kACgkQ3SOs138+
s6HHxA//f2bNm7UQ7wJ81PQ6k1PUe7yCIbYVt0DW5uP1acBlo6n4rVB4qTER2wxc
BMWH4a029oQoMabQj6zUsYnTfEKTJUs1D06BakN7x1uP3+daQOg2SqyM1VshqsyF
lryvzMF3d0uHUTF2TTbsAWj2xV/0KGgRd1WfSgfcLW6beKL8WHa95R3fgRnscmZZ
gTnS4Bl6Uo3yrTc9u02RCiSKH8cDzaqtFYqlgrRRTj3mK301NipEvGKumz2OM4cg
zlWk9tAO2hqsAkz1rxAjGdpZ9IyWWwx95k5PnO2aCSdP4TyZ3fzAWlxH/smzd6/f
K/c0hT/+Slo4JW4klly41fKu/Fi6N0Gk2OKpnsCmc65bD3US2pHD/6ytjMY2LN0i
5upasZ6IyG3/9jBuH62i3sT+9anw9rGkIRGI0FZSWZynYEt+BLimW8pisf6iUAMm
1i7sUit/6nvouFR03k4Vvya8URbv2uyp8+rtHNJseeYBsuRvxdwNrK20TPHeeX+Y
xAE5pXavpFOqhlx+NuqU+wwjH3HoYuOuKZYDnMUtY2PjhBaOUs0tOBkDLsBzp8Nw
8QQy6oQ0RGKDCvjRYdJDEk7qgDa4oDE3/qtmjsamf1m37LmQnYS0YDzQbNtWZp0B
UNtr5wJ5Vo5cSNnOCgDNlh3kI+gdTxhI9ooWqPlgnXWdZw9/4lQ=
=a/8b
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
