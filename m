From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: fix erroneous address in dts
Date: Fri, 15 Jul 2016 00:02:21 +0200
Message-ID: <20160714220218.GB4205@mithrandir.ba.sec>
References: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468514937-23250-1-git-send-email-ralf@ramses-pyramidenbau.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 06:48:57PM +0200, Ralf Ramsauer wrote:
> c90bb7b enabled the high speed UARTs of the Jetson TK1. The address
> specification inside the dts is wrong. Fix it and use the correct
> address.
>=20
> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device=
 tree")
> Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
> ---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

These addresses are correct. The 0, prefix was dropped from the unit
address in commit b5896f67ab3c ("ARM: tegra: Remove commas from unit
addresses on Tegra124").

What's the problem that you're seeing? What's not working for you?

Thierry

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXiAvnAAoJEN0jrNd/PrOhXaAQALITZx+57pNYpPiyMuE5h9Ki
icW8OmJnGrGTp5wLT/OCC3ZdgjQTmBLYz/2Ul93Q8d2d+kI+eULysHRr1c8zBKrM
wADktAx6FsTJ//FqdDlilyexKaskN6abvZXE/KImiEr8ALDO/5LojI2H7YlVz4ZP
zFvEBMPQB4DDN3AZ5x3JVQPvJ0/h66WOcmj6IrOVCdueXQYSq+PNAuWaM8B4Iht/
xyWEVtZPNtMYqxeBZXii1VeIsu0m9jod+z6+0wswtgmK/gevNnYQa/2+9vh0kayY
7kcmYYZxsCC6q9JISvfEocUqh01brSRLlW2KvqTaSBdMAlbOd1pnB/JngbzphGfb
qOsjEzd1Fqyh7mffwg93u1ObfOgStxdqiny1zArN1IzbMsGqbuLL7IUZGFrMruVW
FLc3uBTvauJiSAyjvHYtksL0wJ0BkqARb01reus9IVYAF2IWetQM03IaL83Yx7vB
/2iF72RzOwpMw+FV0cZqZqDUpXwtGJnTHRnC3RfieRYx5gbtHmcRb0fI3V/qyX+A
AhTzTAVdxS0KzNLdJSoEfuWEFUexnM0yWz4K7VwnificY9TQD/ls3yA3iwPELBST
mtTACBfwIhev6e7VxEwJQ7u266ZPgK8FEvoZrX6AbV3Ou1uT2x3x9sYRMp26t69p
0OkcvQHHD4eachJz7aiB
=+02h
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
