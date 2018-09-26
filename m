From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/37] ARM: dts: tegra: colibri_t20: major revamp
 incl. eval board support
Date: Wed, 26 Sep 2018 16:56:46 +0200
Message-ID: <20180926145646.GG12980@ulmo>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 02, 2018 at 12:08:29PM +0200, Marcel Ziswiler wrote:
> This series is a major overhaul and adds support for the Colibri
> Evaluation Board device tree.
>=20
> Changes in v2:
> - Fix commit message which was mixed up between "[PATCH 03/31] ARM:
>   tegra: colibri_t20: iris: annotate i2c busses" and "[PATCH 04/31] ARM:
>   tegra: colibri_t20: iris: add missing aliases".
> - Also replace underscores in node names with dashes.
> - Also reflect this change in the Iris device tree.
> - Also reflect this change in the device tree bindings documentation.
> - New patch as suggested by Rob.
> - New patch.
> - Get rid of fake clocks simple bus as suggested by Rob.
> - Updated evaluation board device tree with all applicable previous
>   fixes.
> - Also reflect this addition in the device tree bindings documentation.
>=20
> Marcel Ziswiler (37):
>   ARM: tegra: colibri_t20: move aliases from module to carrier board
>   ARM: tegra: colibri_t20: iris: integrate i2c real time clock support
>   ARM: tegra: colibri_t20: iris: add missing aliases
>   ARM: tegra: colibri_t20: iris: annotate i2c busses
>   ARM: tegra: colibri_t20: add local-mac-address property
>   ARM: tegra: colibri_t20: reorder host1x/hdmi properties
>   ARM: tegra: colibri_t20: iris: use no-1-8-v
>   ARM: tegra: colibri_t20: regulator clean-up
>   ARM: tegra: colibri_t20: add missing regulators
>   ARM: tegra: colibri_t20: annotate usb ehci instances
>   ARM: tegra: colibri_t20: remove phy-reset-gpio from controller node
>   ARM: tegra: colibri_t20: indentation/line-feed/white-space clean-up
>   ARM: tegra: colibri_t20: update sound nvidia,model
>   ARM: tegra: colibri_t20: pinmux clean-up
>   ARM: tegra: colibri_t20: add missing pinmux
>   ARM: tegra: colibri_t20: iris: display controller rgb panel support
>   ARM: tegra: colibri_t20: iris: annotate uarts
>   ARM: tegra: colibri_t20: iris: add uart-c
>   ARM: tegra: colibri_t20: use high speed uart driver
>   ARM: tegra: colibri_t20: iris: add gpio wakeup key
>   ARM: tegra: colibri_t20: iris: add dr_mode property
>   ARM: tegra: colibri_t20: annotate/rename lm95245 temperature sensor
>   ARM: tegra: colibri_t20: add i2c-thermtrip
>   ARM: tegra: colibri_t20: add gpio hog to unreset usb ethernet chip
>   ARM: tegra: colibri_t20: add gpio hogs for gmi_wr_n buffers
>   ARM: tegra: colibri_t20: annotate/move sd card detect
>   ARM: tegra: colibri_t20: add compatibility comment
>   ARM: tegra: colibri_t20: simplify model and compatible properties
>   ARM: tegra: colibri_t20: iris: simplify model and compatible
>     properties
>   ARM: tegra: colibri_t20: iris: add colibri ssp support
>   ARM: tegra: colibri_t20: drop module level model and compatible
>   ARM: tegra: colibri_t20: rename i2c_ddc to hdmi_ddc
>   ARM: tegra: colibri_t20: iris: drop unused i2c_ddc label
>   ARM: tegra: colibri_t20: rename tps6586x@34 and drop unused pmic label
>   ARM: tegra: colibri_t20: get rid of fake clocks simple bus
>   ARM: tegra: colibri_t20: rename ac97 label to tegra_ac97
>   ARM: tegra: colibri_t20: add eval board device tree
>=20
>  Documentation/devicetree/bindings/arm/tegra.txt |   5 +-
>  arch/arm/boot/dts/Makefile                      |   1 +
>  arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   | 262 ++++++++++
>  arch/arm/boot/dts/tegra20-colibri-iris.dts      | 200 ++++++--
>  arch/arm/boot/dts/tegra20-colibri.dtsi          | 655 ++++++++++++++++--=
------
>  5 files changed, 866 insertions(+), 257 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts

Applied, thanks. All of these series together have got to be some kind
of a record.

Thierry

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurni4ACgkQ3SOs138+
s6ET2RAAsam+ERwqoS+mt3Uq24gI1WE8T1QZTaHFCsKhRcaRxR9g1CEAySYuJjAO
KYGoZhOk9DWZAX/dmcUHQFUyiVOXN+ump0rLiVVhxTLZ8bMCXZQBtAbvxuAk6JFF
qVaC55+h1OC5fMhEyU2TZm960GXOij+iMaZiCfIXMCferM/Kaz+rvxf7KJ3DPsf1
TgAbc80xFabjOtOnG29nwwxRj53tEwVPVfnYku77zu8h+0NOblucp6AcyyaaEdVm
s3P1XiLwqFTBlzD7z2r+P7HN+khzpUICgcwx/JNYiyevMhHTks78XukAiFhZ80m5
Cz9jQwBVR2m/csHswxSPBBG8dp85tdM5BcvLj23nja7fxwOtJvdvA+4FP/hC5Uf9
gRvVuJQ6ppzjvVri9/ZvUy0md33qTKwil6XqNROjz7u2zK0T8RNN1SK0mAAXgsoR
wOyNU9ZyCOSNUD2zeHay8DNmpxqa7DkzrquJyWxpD1GcLiVVDemijlNEFz9f308H
fgmnfaHKqpt0H39Oju3Jxm6O6/DLK+QIQM27iOeC+lOajBsATXrNX4dM55hUaNNN
LSAdAWiH45EAR3lIIZU59ziLMmxKXbegYF5dF8qRCDlbUVMoHay1/Ki6qSxhYr6r
8jQdvhR8GbJyXWtCKH3RdfUcTHbGKGab5oBqPkuWDHTLUHVIkLY=
=ftqN
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--
