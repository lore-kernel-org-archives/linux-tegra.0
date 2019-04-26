From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Tegra194 pinctrl support
Date: Fri, 26 Apr 2019 15:07:48 +0200
Message-ID: <20190426130748.GC16228@ulmo>
References: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556247378-3335-1-git-send-email-kyarlagadda@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com, vidyas@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 08:26:17AM +0530, Krishna Yarlagadda wrote:
> Add new compatible string and other fields used in pinctrl
> driver for Tegra194 in nvidia,tegra210-pinmux.txt
>=20
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    | 43 ++++++++++++++++=
+++---
>  1 file changed, 38 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pi=
nmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux=
=2Etxt
> index 85f2114..c4e802d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> @@ -1,7 +1,7 @@
> -NVIDIA Tegra210 pinmux controller
> +NVIDIA Tegra210/194 pinmux controller
> =20
>  Required properties:
> -- compatible: "nvidia,tegra210-pinmux"
> +- compatible: "nvidia,tegra210-pinmux" or "nvidia,tegra194-pinmux"
>  - reg: Should contain a list of base address and size pairs for:
>    - first entry: The APB_MISC_GP_*_PADCTRL registers (pad control)
>    - second entry: The PINMUX_AUX_* registers (pinmux)
> @@ -83,6 +83,10 @@ Valid values for pin and group names (nvidia,pin) are:
>      These correspond to Tegra PINMUX_AUX_* (pinmux) registers. Any prope=
rty
>      that exists in those registers may be set for the following pin name=
s.
> =20
> +  Tegra194:
> +    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
> +
> +  Tegra210:
>      In Tegra210, many pins also have a dedicated APB_MISC_GP_*_PADCTRL
>      register. Where that is true, and property that exists in that regis=
ter
>      may also be set on the following pin names.
> @@ -127,12 +131,15 @@ Valid values for pin and group names (nvidia,pin) a=
re:
>      registers. Note that where one of these registers controls a single =
pin
>      for which a PINMUX_AUX_* exists, see the list above for the pin name=
 to
>      use when configuring the pinmux.
> -
> +  Tegra210:
>      pa6, pcc7, pe6, pe7, ph6, pk0, pk1, pk2, pk3, pk4, pk5, pk6, pk7, pl=
0, pl1,
>      pz0, pz1, pz2, pz3, pz4, pz5, sdmmc1, sdmmc2, sdmmc3, sdmmc4
> +  Tegra194:
> +    pex_l5_clkreq_n_pgg0, pex_l5_rst_n_pgg1
> =20
>  Valid values for nvidia,functions are:
> =20
> +  Tegra210:
>      aud, bcl, blink, ccla, cec, cldvfs, clk, core, cpu, displaya, displa=
yb,
>      dmic1, dmic2, dmic3, dp, dtv, extperiph3, i2c1, i2c2, i2c3, i2cpmu, =
i2cvi,
>      i2s1, i2s2, i2s3, i2s4a, i2s4b, i2s5a, i2s5b, iqc0, iqc1, jtag, pe, =
pe0,
> @@ -140,9 +147,12 @@ Valid values for nvidia,functions are:
>      sdmmc1, sdmmc3, shutdown, soc, sor0, sor1, spdif, spi1, spi2, spi3, =
spi4,
>      sys, touch, uart, uarta, uartb, uartc, uartd, usb, vgp1, vgp2, vgp3,=
 vgp4,
>      vgp5, vgp6, vimclk, vimclk2
> +  Tegra194:
> +    pe5
> =20
> -Example:
> +Examples:
> =20
> +  Tegra210:
>  	pinmux: pinmux@70000800 {
>  		compatible =3D "nvidia,tegra210-pinmux";
>  		reg =3D <0x0 0x700008d4 0x0 0x2a8>, /* Pad control registers */
> @@ -163,4 +173,27 @@ Example:
>  			};
>  		};
>  	};
> -};
> +
> +  Tegra194:
> +		tegra_pinctrl: pinmux: pinmux@2430000 {
> +			compatible =3D "nvidia,tegra194-pinmux";
> +			reg =3D <0x2430000 0x17000
> +			       0xc300000 0x4000>;
> +			#gpio-range-cells =3D <2>;

This doesn't appear to be documented and we don't use this on any other
chip.

> +			pex_rst_c5_out_state: pex_rst_c5_out {
> +				pex_rst {
> +					nvidia,pins =3D "pex_l5_rst_n_pgg1";
> +					nvidia,schmitt =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,lpdr =3D <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,io-high-voltage =3D <TEGRA_PIN_ENABLE>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;

Should the above not set a nvidia,function property for the pex_rst pin?

Thierry

> +				};
> +			};
> +		};
> +		pinmuxtest@0 {
> +			compatible =3D "nvidia,tegra194-pinmux-test";
> +			pinctrl-names =3D "pex_rst";
> +			pinctrl-0 =3D <&pex_rst_c5_out_state>;
> +		};
> --=20
> 2.7.4
>=20

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDAqQACgkQ3SOs138+
s6H1qg//RWcDJBPuUXv7TZF/CL+BdbTsUBWjBbYxyO2uIWwCpgOB6IPSIbWWHP+D
TMux4TUd0Jdra2AuWfOPQSJXhHlGxSSQWPyPvCX5ZMuMAb0khraFsCcmjcQzEtgi
aUDm3kupODoKbuwV7bwJuuRjhlINM3o7ItB/Z3QQ6kelY8SCMqlkY2yAU2YXZi9Q
t1wFSyP0SkovHHYkz1SMsqejraX91i6VT+3MN4sCrztSquD6QeLWZNfNfLET0Y6G
zTin1D1JHpVaFPOn4WoNDTZUGFgSe6VzZePAuO22yj9uaFZo6bm1q5UJRPk+YWM0
CgsfibQoGLhRxQJhZIREXisQDwJkcuM5Q//PkZlA7OFd3+0gqnzGvHZ4wGnUlcAS
kAlL951+YrRkyhVyalm2X9q7zZ5Az+PdT5OcYQx6fDquk9kHCCYOZbyghU2U7EL6
Fr+Y2wk1praI7Xu29JhHbS4/i5t15MlNeZ2b2csqtG+5Z0QOfRWjOswqnfqNVgqG
yM5ZBsrQk+43rWwXmgiDv89HHn9QXi4lyJF1cbbLToqLlt0FXR4MYGMwGycw0F5z
3d4/0aVXAtn5wsqWIanSmtqyGncRz5bKkx0EeYHLTHEIlY38+LdXWVqgXjAUNiGn
EDrLWVWJn/eG0ITIw9aO3Cm6CquLxktdwV/4mTIHYkCc+kunUcE=
=ibra
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
