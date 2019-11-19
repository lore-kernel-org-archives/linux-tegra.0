From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 11/29] ARM: tegra: Add interconnect properties to
 Tegra124 device-tree
Date: Tue, 19 Nov 2019 07:27:15 +0100
Message-ID: <20191119062715.GD2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1082343727=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191118200247.3567-12-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--===============1082343727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:29PM +0300, Dmitry Osipenko wrote:
> Add interconnect properties to the memory controller, external memory
> controller and the display controller nodes to describe interconnection
> of these nodes.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124=
=2Edtsi
> index 413bfb981de8..5069af3011cc 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/gpio/tegra-gpio.h>
>  #include <dt-bindings/memory/tegra124-mc.h>
>  #include <dt-bindings/pinctrl/pinctrl-tegra.h>
> +#include <dt-bindings/interconnect/tegra-icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/tegra124-car.h>
>  #include <dt-bindings/thermal/tegra124-soctherm.h>
> @@ -111,6 +112,9 @@
>  			iommus =3D <&mc TEGRA_SWGROUP_DC>;
> =20
>  			nvidia,head =3D <0>;
> +
> +			interconnects =3D <&mc TEGRA_ICC_MC_DC &emc TEGRA_ICC_EMEM>;
> +			interconnect-names =3D "dma-mem";

I don't think this is quite correct. The display controller is not
connected to the EMC. Instead, requests go to the MC which then forwards
them to the EMC. So I think we really only need the one connection here.
There are some clients that are read/write and they may need extra
entries, but all connections from memory clients should be to the MC,
not the EMC.

Thierry

>  		};
> =20
>  		dc@54240000 {
> @@ -126,6 +130,9 @@
>  			iommus =3D <&mc TEGRA_SWGROUP_DCB>;
> =20
>  			nvidia,head =3D <1>;
> +
> +			interconnects =3D <&mc TEGRA_ICC_MC_DCB &emc TEGRA_ICC_EMEM>;
> +			interconnect-names =3D "dma-mem";
>  		};
> =20
>  		hdmi: hdmi@54280000 {
> @@ -620,6 +627,7 @@
>  		interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> =20
>  		#iommu-cells =3D <1>;
> +		#interconnect-cells =3D <1>;
>  	};
> =20
>  	emc: emc@7001b000 {
> @@ -627,6 +635,8 @@
>  		reg =3D <0x0 0x7001b000 0x0 0x1000>;
> =20
>  		nvidia,memory-controller =3D <&mc>;
> +
> +		#interconnect-cells =3D <1>;
>  	};
> =20
>  	sata@70020000 {
> --=20
> 2.23.0
>=20

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Ti0MACgkQ3SOs138+
s6Hg9xAApJU8FlgxLpB/IXKidtprmMk8vhh02ZMQqOhROMwyOmbLTvhH/q9SYso0
z+dc7koPVCuOxG+yWy69RlSK+7YoYPR2hEq+SoEwtfFQd2pzLz7wMaNNjlofr3zB
PFxTm1Dd/PKlju/uGF9n+Tpc5Ar3BVyVJE9Sh3NTwkD+KKf4PKvaGKroC5efguXV
trB8vap+Z6QnnE10smpRue/ohdmhwEEN5Fov/DRWF391QcPqPbDnAlvI3jTgcuIO
XMXSUHAxKhE34vW7hCx3tu/la7qIwdVIwG35ZVAZvTRNV1Neu+YwdN0dAYsicNH9
KJ9BTZCD6McAfk9/ngtq43dzrGeUNE35dnwB7vMIoknA+6wqmilKTpLdY1t7SWAc
uekdPYUFCwz3p70Q4V1dxNzZ8bJsJPLUisiyoKwjLS9TmIQ6FKTOAj7uUNvFUPG1
etwyvln6H1E2ErFYEm+7A5oLhu7f44YU+rztJTCCuix2dz8umbrnA2xeFZ9ORgaV
PRrwQVtjW4Vnw6eqxjP1rE02Fv5/6W3G+Ic0Fb6oj4mNV1bhcVAACSrGRcGTHGFL
IPPmaXJ/mBQfjH4IQKtWDXCUCwbJJjquBiN7VKhWRH39R1FdCIASG9T9RF4/Dnfu
rzksgamzMrrieI08R6GnglLTCe84RepCSN9oqzKGQji469xyeaI=
=B4p+
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

--===============1082343727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1082343727==--
