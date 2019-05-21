From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: tegra-xusb: List PLL power supplies
Date: Tue, 21 May 2019 17:00:44 +0200
Message-ID: <20190521150044.GA7098@ulmo>
References: <20190425153444.6281-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425153444.6281-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 05:34:42PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> These power supplies provide power for various PLLs that are set up and
> driven by the XUSB pad controller. These power supplies were previously
> improperly added to the PCIe and XUSB controllers, but depending on the
> driver probe order, power to the PLLs will not be supplied soon enough
> and cause initialization to fail.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This was previously reviewed here:
>=20
>     https://patchwork.ozlabs.org/patch/1077153/
>=20
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Hi Kishon,

do you have any comments on this series. It's fairly straightforward but
is required in order to make XUSB work properly on Jetson Nano for which
support was merged in v5.2-rc1.

Thanks,
Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-p=
adctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padc=
tl.txt
> index daedb15f322e..9fb682e47c29 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.t=
xt
> @@ -42,6 +42,18 @@ Required properties:
>  - reset-names: Must include the following entries:
>    - "padctl"
> =20
> +For Tegra124:
> +- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> +- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.=
05 V.
> +- avdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3=
 V.
> +
> +For Tegra210:
> +- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
> +- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1=
=2E05 V.
> +- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8=
 V.
> +
>  For Tegra186:
>  - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTM=
I PHY
>    power supply. Must supply 1.8 V.
> --=20
> 2.21.0
>=20

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzkEpwACgkQ3SOs138+
s6GifhAAoCiCcvnoALjMNw+bcAVupWuDb+KWFF59YbxHzUKtctPi36CiVZrsdKqO
l3p+Mp23SKd/F/NlNDuU6n0HHSCYCOT/o1Fyy8bF1B056wPomE39k4RxZ/bmdp2D
VHsLW66+WajZf/cYYAY7m8koEL8Nk2h2kJS7rDZ6dKQWxnx0NUNJyxH1HLLsk2d+
egRa8aeaPFvMEFsHDgX+Ux6/kRglG/pXfe+eulrR9DJzKeISBKc3SC43iYisll9t
Z+r28EO1jOWemRr9s0ezjorVw/JApiijSe5B1czBFnGd/1PN7IwPeNjsgFaZ2IS5
QTdP1r5Mot9v3Rkv3nlxApI0YmpeewqNXgUf86MJuu/TTEqGuiZjf4Afse0MNiJx
z7vBiWhESttcvbB4qVVUyC/lEadJuUAADxAdgUQFGb1UoMCHkF7CdPQuhgNFvMi3
tvDv6W/I3s24fZkQ3U9smc5lLYAAR/zqlz3lG3c4mkpBuF1BneiINa4mfusJ6LzB
T0TdAe8AtP6Vk3A4jNG0zEdiXKp66uTHwaBj2AxIJMm623a5WJPesNf5HAvTV4q7
zT3nJxH/KG5iZNPjEK/I7+XWFzpOaD956tojDFQ5qv+MuSKakkp/rUqPoz+BHsJO
99cCv4ObZHJmzVRj7+FjetkLR6euXlUDm2dxu2geowjPKXfAbJU=
=u4HU
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
