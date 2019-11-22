From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 6/6] arm64: tegra: Add support for PCIe endpoint mode in
 P2972-0000 platform
Date: Fri, 22 Nov 2019 14:25:33 +0100
Message-ID: <20191122132533.GD1315704@ulmo>
References: <20191122104505.8986-1-vidyas@nvidia.com>
 <20191122104505.8986-7-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191122104505.8986-7-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 04:15:05PM +0530, Vidya Sagar wrote:
> Add endpoint mode support for PCIe C5 controller in P2972-0000 platform
> with information about supplies, PHY, PERST GPIO and GPIO that controls
> PCIe reference clock coming from the host system.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index 7eb64b816e08..58c3a9677bc8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -43,6 +43,19 @@
> =20
>  		gpio@c2f0000 {
>  			status =3D "okay";
> +			/*
> +			 * Change the below node's status to 'okay' when
> +			 * PCIe C5 controller is enabled to operate in endpoint
> +			 * to allow REFCLK from the host system to flow into
> +			 * the controller.
> +			 */
> +			pex-refclk-sel-high {
> +				gpio-hog;
> +				output-high;
> +				gpios =3D <TEGRA194_AON_GPIO(AA, 5) 0>;
> +				label =3D "pex_refclk_sel_high";
> +				status =3D "disabled";
> +			};

Why don't we put this into the PCIe controller's node as a reference to
that GPIO? Seems like the controller would know exactly when this pin
needs to go high or low, so why does it have to be a hog?

Thierry

>  		};
> =20
>  		pwm@c340000 {
> @@ -144,6 +157,22 @@
>  			    "p2u-5", "p2u-6", "p2u-7";
>  	};
> =20
> +	pcie_ep@141a0000 {
> +		status =3D "disabled";
> +
> +		vddio-pex-ctl-supply =3D <&vdd_1v8ao>;
> +
> +		nvidia,pex-rst-gpio =3D <&gpio TEGRA194_MAIN_GPIO(GG, 1)
> +					GPIO_ACTIVE_LOW>;
> +
> +		phys =3D <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
> +		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
> +		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
> +
> +		phy-names =3D "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
> +			    "p2u-5", "p2u-6", "p2u-7";
> +	};
> +
>  	fan: fan {
>  		compatible =3D "pwm-fan";
>  		pwms =3D <&pwm4 0 45334>;
> --=20
> 2.17.1
>=20

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3X4c0ACgkQ3SOs138+
s6ExNQ//WK62BmgmHIoNRd5DoXDTiVMFPJTXYrKK2KEpJs39EqwfkZAYEPlfb5Si
4vAm7OchTFGLzcRQRxYlVS5ZHo9eDkHAE7pKUKkgm3Li6QTvGXlt7oRsiVv1luJx
AoqNX99LtHkgEBSLFnVIgpsstcX1Jx3DDkwjO+IINkJf+Et2GLU0Y1ez932QXf6r
eN343fUsKg5+bcIqk2hLnWCCaPe3YR9sYpRJF6psoHPOHgb4o3k7lGKUqwRHCPAB
qAq3iOral1OmZ+GQ06d3/OZHI33QG2UOqOhTTw+Xw67QernnguTI+jBAiTAZD62Y
jdIJ3X6M2t93o7yTwczq4IaTy46lktLeEXWoIWOPQiIuFWQhylfDGjVPv8Qin9JG
Ru9qCZXi1WWIDZGo99ZPB7iIyPPCB4T0cGR+nNH5i+PC4N5/6EfCXjg9gL33HB9n
brPkgl21YRmVt6JU04pKxCjcrajsR570CwfS5VMa4y6pImJiYP6cdfxdJ9Om0hei
sEmduQY1iRmoYthWXBgb3VIpZdd38nhaId4LbWhFHHObI5VZWvI1rgtkf7eq3mUV
tQEqkdpr7cLPdqjvEMf/0rffGC6UVeyeA2y7jSyHkKjrwMADSTysQz2YPtQenUhn
RRey8lUXMdiZ0XueNYIxYxijYYd1JhnVidJEfEK+FVR+59j0UHA=
=aw/J
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
