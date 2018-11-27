From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: Add stmpe-adc driver to relevant
 devicetrees
Date: Tue, 27 Nov 2018 15:21:03 +0100
Message-ID: <20181127142103.GC10560@ulmo>
References: <20181123142411.8921-1-dev@pschenker.ch>
 <20181123142411.8921-4-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181123142411.8921-4-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>
Cc: jic23@kernel.org, marcel.ziswiler@toradex.com, stefan@agner.ch, Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: linux-tegra@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 03:24:11PM +0100, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
>=20
> Activate the stmpe-adc driver as found on Apalis/Colibri iMX6/T30 modules
>=20
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
>=20
> Changes in v3:
>  - None
>=20
> Changes in v2:
>  - Put common ADC settings in mfd
>=20
>  arch/arm/boot/dts/imx6qdl-apalis.dtsi  | 22 ++++++++++++++--------
>  arch/arm/boot/dts/imx6qdl-colibri.dtsi | 23 +++++++++++++++--------
>  arch/arm/boot/dts/tegra30-apalis.dtsi  | 22 ++++++++++++++--------
>  arch/arm/boot/dts/tegra30-colibri.dtsi | 22 ++++++++++++++--------
>  4 files changed, 57 insertions(+), 32 deletions(-)

You might want to split this up into two patches, one for i.MX and the
other for Tegra so that the respective maintainers can apply them
separately.

Also, where are patches 1-3?

Thierry

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv9Us8ACgkQ3SOs138+
s6ETBA//Sl4B61jfINf/TIIt678gt5+o7XKrFo7tvvTS9EcK8S8IwwGc7quphlNy
D4abPfA03egiEbiqLIceasyZX+LG6ZgoMpWNvUlJdMQN3DqODplrNxUeqB8NoFP5
TsQ7EToOdvIYRS3fA1j9UlKKU2Q7armFZZ3a23aFaF/p5dNYzsFh/ZQ9QNTh3kdP
dOoonVZcx79Zx67d3M0Po9Xq8cqiUL8wZ60FJODNaqt0D2Gkk3n0sVO8cZiQMMcW
obmf2KmFRWZAVFGd7rcGqRJCjirwHiRRECf+yAMn3JTLfBnf/MG53P9aKMnyJowI
7mPAUvzLatqbcjpJKW1Q/VW7+rB8DAGJ94i0/mdWrg1xhnXmq3eiidjtZrruVS/k
o92dcAw2UsewYerTMbSdSWFFbmp92iJAtXgcKxOlJIncfYbvZJCzm3+uA6IWC2I0
jBiaIxferVHLPfdgGpCebBbor0HHTPq9Yt1RMkUXPkEw32musaw/PjBJEJP36AtE
UH/97cOBZDvBLx+/yX0stCok0hi9rUzm8+/ERyV/kYl3dc4cMtjA3QHtNT4Hw35N
rBnZXruqAngl3PQlRsGykVo2Fve76DWTDxOmkBw4NtDtbVptxWHnVOTE/O1Acn1n
MlQSfriTGswAtcVbjO162MT1jyYNn4jketZncIQJImGivBs99Gc=
=yx3m
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
