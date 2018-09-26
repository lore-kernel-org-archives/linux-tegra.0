From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/34] ARM: dts: tegra: colibri_t30: major revamp
Date: Wed, 26 Sep 2018 16:48:46 +0200
Message-ID: <20180926144846.GE12980@ulmo>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 01, 2018 at 10:12:14AM +0200, Marcel Ziswiler wrote:
> This series is a major overhaul for the Toradex Colibri T30 system on
> module.
>=20
> Changes in v2:
> - Also move serial UART "nvidia,tegra30-hsuart" compatible to module
>   level device trees.
> - Also replace underscores in node names with dashes.
> - Also replace underscores in UART annotations with dashes.
> - When running some more tests I realized that the reg-addr should
>   really be 0x3f. Fix this.
> - Get rid of fake clocks simple bus as suggested by Rob.
> - Drop "[PATCH 01/26] ARM: tegra: colibri_t30: enable broken-hpi on
>   emmc" which should already be handled by the broken-hpi quirk as
>   pointed out by Dmitry. If I would find more eMMC parts which exhibit
>   the issue I will add them to the quirk as a separate patch.
> - New patch as suggested by Rob.
> - New patch.
>=20
> Marcel Ziswiler (34):
>   ARM: tegra: colibri_t30: add local-mac-address property
>   ARM: tegra: colibri_t30: reorder host1x/hdmi properties
>   ARM: tegra: colibri_t30: regulator clean-up
>   ARM: tegra: colibri_t30: add missing regulators
>   ARM: tegra: colibri_t30: annotate uarts and move compatible to board
>   ARM: tegra: colibri_t30: white-space clean-up
>   ARM: tegra: colibri_t30: move dr_mode property from phy to controller
>   ARM: tegra: colibri_t30: reorder backlight properties
>   ARM: tegra: colibri_t30: drop pwmleds
>   ARM: tegra: colibri_t30: pinmux clean-up
>   ARM: tegra: colibri_t30: add missing pinmux
>   ARM: tegra: colibri_t30: use proper irq-gpio for stmpe811
>   ARM: tegra: colibri_t30: further lm95245 temperature sensor annotation
>   ARM: tegra: colibri_t30: add i2c-thermtrip
>   ARM: tegra: colibri_t30: add proper emmc vmmc and vqmmc supplies
>   ARM: tegra: colibri_t30: enable emmc ddr52 mode
>   ARM: tegra: colibri_t30: get rid of fake clocks simple bus
>   ARM: tegra: colibri_t30: line break long compatible property line
>   ARM: tegra: colibri_t30: move input include to carrier board
>   ARM: tegra: colibri_t30: remove unused nvidia,is-wired property
>   ARM: tegra: colibri_t30: add gpio hog to unreset usb ethernet chip
>   ARM: tegra: colibri_t30: enable hda over hdmi
>   ARM: tegra: colibri_t30: annotate sd card detect
>   ARM: tegra: colibri_t30: annotate ehci instance 1
>   ARM: tegra: colibri_t30: update compatibility comment
>   ARM: tegra: colibri_t30: drop module level model and compatible
>   ARM: tegra: colibri_t30: drop obsolete spidev node
>   ARM: tegra: colibri_t30: rename hdmiddc to hdmi_ddc
>   ARM: tegra: colibri_t30: rename tps65911@2d, stmpe811@41 and
>     tps62362@60
>   ARM: tegra: colibri_t30: fix mcp2515 can controller interrupt polarity
>   ARM: tegra: colibri_t30: remove unused mcp2515 can0 label
>   ARM: tegra: colibri_t30: add mcp2515 vdd and xceiver supplies
>   ARM: tegra: colibri_t30: annotate unused i2c busses
>   ARM: tegra: colibri_t30: annotate power I2C being on-module
>=20
>  arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 130 ++---
>  arch/arm/boot/dts/tegra30-colibri.dtsi        | 780 ++++++++++++++++++++=
+-----
>  2 files changed, 706 insertions(+), 204 deletions(-)

Applied, thanks.

Thierry

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurnE4ACgkQ3SOs138+
s6FiRRAAtJaWRYJXqqEhNMed5JnCOQrFf8sOHd+kyv/lRE63Vc58xGIhtgDXI3MF
WVzYu4wrRMeRQdzpSheETpWFUbbH9RK+2u8dkXpgRPVKDNdpTYrWBNhykSvAARDE
ZtuqPz8IAwpr4sKi6CFKI2mqkMCqF2I6YgAN1nAgdgx5lbhohsXFOb6lcEMvNoOq
B9eVC2p/jXAQfNJYaKF8VXrSdWfad2sD7V/4GATRtlMeT/Fb9nVKQPP4f9RwAHnk
+PTD2ROrOUMQoZo4Lx89Pbmp3VwxvnPY9sW1kGNBNVPWX4ivu0G5toV0Sn7EWhZW
nAsG/6XidLnqdqU0Q6RAOM5QYENsmfl16jIQqvYUZCGg35+7XKQ9IqE4+IFFA27w
IiX+8a66AinnGOleZF5L4M+rz1FJLagBUpKw4H88pYrmJbfH5629klbZgJ29czkg
dJ1Ro7znDo7E9UAss+kznnsKLZ2mhy+TpIUUMvR1nHxjm8lE3uDjDF3JI2kg/MrY
ZUOmwakZQzzZwLutQgVEvxE91ULHETwrhnfLBj4WQnMftKfe9Vq2ejLOXtJX5TLs
0YEF9kStpl0/nnXdPUWs/hhlqdJvdHXzWD69BVJqENIw92U1K/Rnu3McjA0tu/j5
VWp5G0kUZjMpnwrB8n/A9SVlyEITbMl4Gh0suwt+kpHmCoybqPY=
=W4g1
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
