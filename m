From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 13/16] arm64: tegra: Enable PCIe slots in P2972-0000
 board
Date: Fri, 3 May 2019 13:27:51 +0200
Message-ID: <20190503112751.GG32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-14-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-14-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:50:01AM +0530, Vidya Sagar wrote:
> Enable PCIe controller nodes to enable respective PCIe slots on
> P2972-0000 board. Following is the ownership of slots by different
> PCIe controllers.
> Controller-0 : M.2 Key-M slot
> Controller-1 : On-board Marvell eSATA controller
> Controller-3 : M.2 Key-E slot
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed P2U label names to reflect new format that includes 'hsio'/'nvh=
s'
>   strings to reflect UPHY brick they belong to
>=20
> Changes since [v1]:
> * Dropped 'pcie-' from phy-names property strings
>=20
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  2 +-
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194-p2888.dtsi
> index 0fd5bd29fbf9..30a83d4c5b69 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -191,7 +191,7 @@
>  						regulator-boot-on;
>  					};
> =20
> -					sd3 {
> +					vdd_1v8ao: sd3 {
>  						regulator-name =3D "VDD_1V8AO";
>  						regulator-min-microvolt =3D <1800000>;
>  						regulator-max-microvolt =3D <1800000>;
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra194-p2972-0000.dts
> index b62e96945846..7411c64e24a6 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
> @@ -169,4 +169,45 @@
>  			};
>  		};
>  	};
> +
> +	pcie@14180000 {
[...]
> +	pcie@14100000 {
[...]

Again, these should be sorted by unit-address.

Thierry

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMJbcACgkQ3SOs138+
s6HqvA/+M9cG4kk4zwslByULuSa3GW5lU3VrIoR10dZx2JrclNuFl6eQDq7V4k+j
deUegnpbG0goInypfsnJjE1+hIea6yuNBfNdJjSlZFh5rQHkUMTQjn3S+N50UHEL
otKt7xqpY963RRujKLQg+E+SUNi9unfKWy3hK2UhaZHVO77bP7hcsV7ViukhPwD3
mPKyhbC5JEFjj4rPCGbLYfc2JhE0Gn7/f6Y9AZtIjIOm6MWSJwQyfcPMRkhlnnxn
J++oHYUprmbOtJ91v8Wm3RFj19UmDDgac2cqxivu+p4JlH3FgJc7LRZsBr46OQcm
hBwpLOQWcyDYx9hHOBbZZl7XuYb1wQQMhQMZzKapkcgNnRGKnN/Yhbm+Ac4ekopZ
UKN/v4MEmHM9DpTgzVG+A3i6iTIvLJsQt3/vwgTfO65FwYUo8wUigUQJIPiSvtOJ
OGtM18DBINzIJVGuPzcAMLiVNJb1p1mECu7fyS+/tgHT2xS55D3Q5QIpFiqvhqAG
Vd81Jim/e2dBO0kJ17wSWbSM77AN0ETMkngiB7Jc3A98R5bNVQvwtGBq0xfRE1Yp
R8KHqW7TP2/Iin6yJywqg6OyK7SBMlP+Mh1pU6rfz94JQ1CKCl6w/9zG0/tzMapP
SQckzgvfGXJrSbBq7K/RQKbNdrC5f9cNKoPCXaqwze6sx5qw7L8=
=/a8a
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
