From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 00/19] ARM: dts: tegra: apalis-tk1: minor revamp
Date: Wed, 26 Sep 2018 16:56:02 +0200
Message-ID: <20180926145602.GF12980@ulmo>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 01, 2018 at 03:04:45PM +0200, Marcel Ziswiler wrote:
> This series is a minor overhaul for the Toradex Apalis TK1 system on
> module.
>=20
> Changes in v2:
> - Add Rob's reviewed-by.
> - New patch as suggested by Rob.
> - New patch.
> - Get rid of fake clocks simple bus as suggested by Rob.
> - Change cover-letter subject to indicate minor revamp.
> - Drop "[PATCH 02/15] ARM: tegra: apalis-tk1: reorder pcie properties"
>   as requested by Stefan.
> - Drop "[PATCH 13/15] ARM: tegra: apalis-tk1: fix pcie switch vendor
>   compatible" in favour of the new "[PATCH v2 26/34] dt-bindings: add
>   broadcom (formerly plx technology) vendor prefix" posted earlier as
>   part of the apalis_t30 revamp v2 as suggested by Stefan.
>=20
> Marcel Ziswiler (19):
>   ARM: tegra: apalis-tk1: add local-mac-address property
>   ARM: tegra: apalis-tk1: reorder host1x/hdmi properties
>   ARM: tegra: apalis-tk1: reorder padctl properties
>   ARM: tegra: apalis-tk1: regulator clean-up
>   ARM: tegra: apalis-tk1: add missing regulators
>   ARM: tegra: apalis-tk1: drop unused pinmux label
>   ARM: tegra: apalis-tk1: white-space clean-up
>   ARM: tegra: apalis-tk1: reorder backlight properties
>   ARM: tegra: apalis-tk1: add proper emmc vmmc and vqmmc supplies
>   ARM: tegra: apalis-tk1: enable emmc ddr52 mode
>   ARM: tegra: apalis-tk1: add toradex,apalis-tk1-v1.2 compatible
>   ARM: tegra: apalis-tk1: reorder cpu dfll clock properties
>   ARM: tegra: apalis-tk1: reorder SD card properties
>   ARM: tegra: apalis-tk1: drop module level model and compatible
>   ARM: tegra: apalis-tk1: drop obsolete spidev nodes
>   ARM: tegra: apalis-tk1: replace underscores in node names with dashes
>   ARM: tegra: apalis-tk1: get rid of fake clocks simple bus
>   ARM: tegra: apalis-tk1: shorten temperature-sensor node
>   ARM: tegra: apalis-tk1: drop unused hdmi_ddc label
>=20
>  Documentation/devicetree/bindings/arm/tegra.txt |   2 +
>  arch/arm/boot/dts/tegra124-apalis-eval.dts      |  40 ++-
>  arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts |  43 ++-
>  arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 452 ++++++++++++------=
------
>  arch/arm/boot/dts/tegra124-apalis.dtsi          | 451 +++++++++++-------=
-----
>  5 files changed, 508 insertions(+), 480 deletions(-)

Applied, thanks.

Thierry

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlurngEACgkQ3SOs138+
s6E4YA/+Igpqe3MR/FZa+1S1ez0eA9V8fpZ6QNlHDZQVvgDhFAHiqFFJ2TPORzZU
ORqCWuTaqh+CezOf8UKGh+PHX3U6RuakeSNOauvX2dDo6FfLjJ34XQGrB14zWFwL
EhVvo6huUK0p53ksNPGZ4lDHako5u2T7HSpvxWvgD30B4q4ZIMUrsliC1E6mWsoI
yS4aUuGyH+b5ulI/W8l6GidsTdvJ4xnrmZjk1siJcARaV3v8Bub6J9EgF5kxLzXf
oF1PWDrXKIyq924rZzxFpdHUaBOuJkpNLz2rLLHaG1sYiHqe5vdSrJT4N6OgYQHK
N5KK8wuptP87dUraeE1tnirkz4pqgAlB/VT3PVB9rWKYqxBmkdDffUJgV/JM3OGl
a2LbBQfRhDHHIK5BbP+A4Hqbr9BCX+ocY9RfcrDKAbu8aLjKP5V6J/Vkq7ZycHVi
jYUQJ64md2VF6j+Auu30y5BKZLLxNNCZoK1Y81w0YcHgiqRxYw9CNmln0g7WsfoE
vS0c24BPBTIzOMlLKzv/Fyq85YzzwmACgsmTwCbiC9uqifURH4byywymSPQlHT4k
UJstH3p/J34AdmY0PpVhfjfG2IuWcg1tYJOBu97YR9i2wJHx7+4x9JuOAJaz+PPB
6lf8eQCO3VvrnxCvOhDSspjYGPTQPjs7tCIcYifAPB6vi+B0NWw=
=QMGR
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
