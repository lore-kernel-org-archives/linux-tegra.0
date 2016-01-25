From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 7/9] clk: tegra: pll: Do not disable PLLE when under
 HW control
Date: Mon, 25 Jan 2016 13:45:40 +0100
Message-ID: <20160125124540.GJ20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-8-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-8-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:36PM -0500, Rhyland Klein wrote:
> From: Mark Kuo <mkuo@nvidia.com>
>=20
> SW should not disable PLLE if PLLE is already put under HW control.
>=20
> Signed-off-by: Mark Kuo <mkuo@nvidia.com>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphjzAAoJEN0jrNd/PrOhxbcP/1LN+sq5qq7fPFkiF//b5b5n
p8RiljusJi8fHmWjS5wYUOfg58I1r/67X7f85EL5sLcnyvlvjMN9yI5TRwJgYPuo
mH1u+JmRrHmubV6jlZtUydNapLKSedojeoTa4TVdDvJZoXm6aSxQjIZQ2cCF4GKJ
QpzFtRGvTA6RjQyJYSISa3l2rZVqN3Hopt5sPtoeDYFAA0OtGDbUSDAkycz/I3t6
RhTcUkm2RCz4PTtbNWzkN8xKKHIOJvhvM504L6jHaOjoJ9y2FkoVQHtQGjv5emp2
sf6faBI+iHfD930LwYW5RJnRYX1OVpUFU4pom4dr8IJsiWkbwkfS/AKLegwYCj37
SWwXNleIbGwu+gjgvJOZ1Ps2UO6xllG+iOoa8Rpni1fjPAOBN0baSoiwLuttw963
NwlmFhpqnA3qpm+mdyTLQnrcbVwz097NGV7jzpRFVflQvuaoRu8gb5PMrRTK6YRk
mHHy3qqLqSAuCkl8Ehxk++WS1IPrP3IYiX1wJ6x5AgUc/j64miS2CzVo38C3D/dd
3lF8ydNVqTCfAjFHcWb9Aqsu8rgLpqTpMpw5L0GNnzFph/owxisEs4IIpfujGIZ6
kUYtB9WZm1R5ejP2w//QPAE+zNBKJI3UixzkFgJcqwIWYlcrhnr/3UEiB0m4jKF9
gRASrwKjczTRpuJ0B35n
=cNhn
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
