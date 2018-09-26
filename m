From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/34] ARM: dts: tegra: apalis_t30: major revamp incl.
 v1.1 hardware support
Date: Wed, 26 Sep 2018 16:46:53 +0200
Message-ID: <20180926144653.GD12980@ulmo>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Lechner <david@lechnology.com>, Thierry Reding <treding@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-tegra@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 06:37:42PM +0200, Marcel Ziswiler wrote:
> This series is a major overhaul and adds support for the V1.1 hardware
> revision of the Toradex Apalis T30 system on module.
>=20
> Changes in v2:
> - Clean-up PCIe controller/port status' as well.
> - Also move serial UART "nvidia,tegra30-hsuart" compatible to module
>   level device trees.
> - Also add two missing newlines.
> - Also replace underscores in node names with dashes.
> - Explicitly disable input of BKL1_ON as well.
> - Replace underscores in node names with dashes.
> - When running some more tests I realized that the reg-addr should
>   really be 0x3f. Fix this.
> - Get rid of fake clocks simple bus as suggested by Rob.
> - Replace "[PATCH 27/28] ARM: tegra: apalis_t30: fix pcie switch vendor
>   compatible" with "[PATCH v2 26/34] dt-bindings: add broadcom (formerly
>   plx technology) vendor prefix" as suggested by Stefan.
> - New patch as suggested by Rob.
> - New patch.
> - Drop "[PATCH 01/28] ARM: tegra: apalis_t30: enable broken-hpi on emmc"
>   which should already be handled by the broken-hpi quirk as pointed out
>   by Dmitry. If I would find more eMMC parts which exhibit the issue I
>   will add them to the quirk as a separate patch.
> - Updated V1.1 device trees with all applicable previous fixes.
>=20
> Marcel Ziswiler (34):
>   ARM: tegra: apalis_t30: fix mmc1 cmd pull-up
>   ARM: tegra: apalis_t30: pull-up sd card detect pins
>   ARM: tegra: apalis_t30: add local-mac-address property
>   ARM: tegra: apalis_t30: reorder pcie properties
>   ARM: tegra: apalis_t30: annotate/clean-up pcie controller/port nodes
>   ARM: tegra: apalis_t30: reorder host1x/hdmi properties
>   ARM: tegra: apalis_t30: regulator clean-up
>   ARM: tegra: apalis_t30: add missing regulators
>   ARM: tegra: apalis_t30: annotate uarts and move compatible to board
>   ARM: tegra: apalis_t30: drop unused cami2c label
>   ARM: tegra: apalis_t30: white-space/newline clean-up
>   ARM: tegra: apalis_t30: drop unused mmc1/sd1 labels
>   ARM: tegra: apalis_t30: annotate mmc1/sd1
>   ARM: tegra: apalis_t30: move dr_mode property from phy to controller
>   ARM: tegra: apalis_t30: reorder backlight properties
>   ARM: tegra: apalis_t30: drop pwmleds
>   ARM: tegra: apalis_t30: pinmux clean-up
>   ARM: tegra: apalis_t30: add missing pinmux
>   ARM: tegra: apalis_t30: use proper irq-gpio for stmpe811
>   ARM: tegra: apalis_t30: further lm95245 temperature sensor annotation
>   ARM: tegra: apalis_t30: add i2c-thermtrip
>   ARM: tegra: apalis_t30: add proper emmc vmmc and vqmmc supplies
>   ARM: tegra: apalis_t30: enable emmc ddr52 mode
>   ARM: tegra: apalis_t30: get rid of fake clocks simple bus
>   ARM: tegra: apalis_t30: line break long compatible property line
>   dt-bindings: add broadcom (formerly plx technology) vendor prefix
>   ARM: tegra: apalis_t30: drop module level model and compatible
>   ARM: tegra: apalis_t30: drop obsolete spidev nodes
>   ARM: tegra: apalis_t30: hog group for pcie switch reset gpio
>   ARM: tegra: apalis_t30: rename hdmiddc to hdmi_ddc
>   ARM: tegra: apalis_t30: rename tps65911@2d, stmpe811@41 and
>     tps62362@60
>   ARM: tegra: apalis_t30: fix mcp2515 can controller interrupt polarity
>   ARM: tegra: apalis_t30: move hda node from carrier to module
>   ARM: tegra: apalis_t30: support v1.1 hardware revision
>=20
>  Documentation/devicetree/bindings/arm/tegra.txt    |    2 +
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  arch/arm/boot/dts/Makefile                         |    1 +
>  arch/arm/boot/dts/tegra30-apalis-eval.dts          |  148 +--
>  arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |  266 +++++
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         | 1189 ++++++++++++++=
++++++
>  arch/arm/boot/dts/tegra30-apalis.dtsi              |  705 +++++++++---
>  7 files changed, 2064 insertions(+), 248 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
>  create mode 100644 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi

Applied, thanks.

Thierry

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurm9wACgkQ3SOs138+
s6HSCQ//R45gdNTX6DyNyNx6lx8nCarb1h634iBzL2MrJHbtfFzfkv6AyTTqig9Q
aDCp4Rq3j2CrZ9VWdYrOnD/xw00qUKZ8ltZrRz97qhGdYg0x8iv/c4AMXju861e2
72zujUoW/0/HdmUXLEultVPl6Bfvbcby+kTJNPjWMqVRZC49rFUs3q96Xe0wQu4L
2vQ0iO7qq8meNBA2JTq4wBSDibbfOtShzH0kiJ0U614Y/+fbRKBiO+b1Bwdk3PxH
bEN47VGJjsbq6CzKrjIqUW1Pl2XZeMAB6sNj4YAkfkHW61jZ5V0LQPtQqC3i8ziQ
byODReetNX/oboF1hkjPAlHOEunATt6qjPg+jxE4d0dNJLMqaUadwAt0TNJtv3mZ
qATruOQMV2euX3+zFjKzxPjpzL4V+BBSiMbuFQspk180KqBZkIHpzj4KmEo3uAAt
OivWss2NIxIwZHwFxTuC20KTny2dtfKYqfOkTY8f7h7t7TEdox8DAruCSFY1FGqF
Cidxdy+r/JwIj4Qhd6O+aNm5TPtWbdB6Hv+nEQ9ahqIKX2xV3hiFRL99l6vakMS1
IkNODVqPaOXnpsec2UQSUKaOUR6NT5OmyUiEkznQW0PBy9W5fazgtCQVfQa7wsyS
mapVdJPsjPA1pNU2tXpmSSfBA3n3mvuQQ5fr5THhJN/A9jXxiK4=
=OnPT
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
