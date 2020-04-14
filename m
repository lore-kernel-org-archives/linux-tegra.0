From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix dtc warnings on reg and ranges in
 examples
Date: Tue, 14 Apr 2020 16:13:03 +0200
Message-ID: <20200414141303.GE3593749@ulmo>
References: <20200409202458.24509-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200409202458.24509-1-robh@kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org, linux-tegra@vger.ker
List-Id: linux-tegra@vger.kernel.org


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 02:24:58PM -0600, Rob Herring wrote:
> A recent update to dtc and changes to the default warnings introduced
> some new warnings in the DT binding examples:
>=20
> Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.exam=
ple.dts:23.13-61:
>  Warning (dma_ranges_format): /example-0/dram-controller@1c01000:dma-rang=
es: "dma-ranges" property has invalid length (12 bytes) (parent #address-ce=
lls =3D=3D 1, child #address-cells =3D=3D 2, #size-cells =3D=3D 1)
> Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.example.dts:1=
7.22-28.11:
>  Warning (unit_address_vs_reg): /example-0/fpga-axi@0: node has a unit na=
me, but no reg or ranges property
> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.e=
xample.dts:34.13-54:
>  Warning (dma_ranges_format): /example-0/memory-controller@2c00000:dma-ra=
nges: "dma-ranges" property has invalid length (24 bytes) (parent #address-=
cells =3D=3D 1, child #address-cells =3D=3D 2, #size-cells =3D=3D 2)
> Documentation/devicetree/bindings/mfd/st,stpmic1.example.dts:19.15-79.11:
>  Warning (unit_address_vs_reg): /example-0/i2c@0: node has a unit name, b=
ut no reg or ranges property
> Documentation/devicetree/bindings/net/qcom,ipq8064-mdio.example.dts:28.23=
-31.15:
>  Warning (unit_address_vs_reg): /example-0/mdio@37000000/switch@10: node =
has a unit name, but no reg or ranges property
> Documentation/devicetree/bindings/rng/brcm,bcm2835.example.dts:17.5-21.11:
>  Warning (unit_address_vs_reg): /example-0/rng: node has a reg or ranges =
property, but no unit name
> Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.example.dts:20.2=
0-43.11:
>  Warning (unit_address_vs_reg): /example-0/soc@0: node has a unit name, b=
ut no reg or ranges property
> Documentation/devicetree/bindings/usb/ingenic,musb.example.dts:18.28-21.1=
1:
>  Warning (unit_address_vs_reg): /example-0/usb-phy@0: node has a unit nam=
e, but no reg or ranges property
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: "Nuno S=C3=A1" <nuno.sa@analog.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Matt Mackall <mpm@selenic.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Will take this via the DT tree.
>=20
> Rob
>=20
>  .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml   |  6 +++
>  .../bindings/hwmon/adi,axi-fan-control.yaml   |  2 +-
>  .../nvidia,tegra186-mc.yaml                   | 41 +++++++++++--------

Acked-by: Thierry Reding <treding@nvidia.com>

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VxO4ACgkQ3SOs138+
s6HPeQ//QZ7J+cY1tUFdjRIyipxkFqqYiAQRkhxlIDOkSlrucVwZtqSD1oa2Cc0z
jSJ7ZBYVJyufJRVY6QTSB+X7cG20IBxXYsuWvdTO3exZ4XfgqhwAib7bnhtXa9Pv
dIDYIL7H+CjxH+tSixKhgCtZEid0tBR1FDkZ0AcMym178Ug1dLSF021pbGME6N8r
bQZfaFDX3j8SBbc+7LpeVUxry/PHbzEVtjIZpmuVUOBrJp0NXH089H61k8CanWoF
DeiY3UFjJQYeX1SQAL02T2Ee6CPwqjb6m1VXXiross/z2IpVasAm7Pz0JkudRGur
wNSWF0+y9QdpOvW3SFmd1nwccfbC52I5M4PtselQOsREZkE6fzfgkeGoLcrLBYWT
LKrOGqqgVdgSJqvW2TEzVPrK0l3X24wONzY7wLLwXClOVNKD+/O/oP7zQ3Yrwua3
BipXTmhEW1sj5bHFeyQaAemZjPybszASHDJi28wWkdLiWhundMfrpfjcpFV3KnBv
iTWwMYYxFxrlOK75l6BNERbASd3xF87PTRoT2U+8QfIuS+PbBxsJ6MTHK7sHBcUJ
fDm0z/KoKtN6ngRbkh8aogrJEj94Bw1jqO/YqwVHR5f+9iZPYMe+2rjRFf7MxLOc
q3WO/SrJwT21tD7WeVHBGzvWneMgkqL0ikFjtlTLMAOZMfu5Lpw=
=8xXE
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
