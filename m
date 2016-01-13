From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 8/9] clk: tegra: pll: Fix PLLE SS config
Date: Wed, 13 Jan 2016 15:00:13 +0100
Message-ID: <20160113140013.GA15782@ulmo>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
 <1452278714-10751-9-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452278714-10751-9-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 01:45:13PM -0500, Rhyland Klein wrote:
> From: Mark Kuo <mkuo@nvidia.com>
>=20
> Fix PLLE spread spectrum configuration so it aligns with downstream
> kernel.
>=20
> Signed-off-by: Mark Kuo <mkuo@nvidia.com>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Can we have a better description for this. Merely saying that this is
meant to align things with downstream isn't really helpful for anyone
who doesn't have the downstream kernel to check against.

I also see some potential for splitting this up into several logical
changes, since for example it seems to fix a typo (?) where some bits
were being set that should really be cleared, and in other hunks it
splits up the SS coefficients by SoC generation. Splitting it up into
logical changes might make it easier to write accurate commit
descriptions rather than this kind of blanket commit message.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWllhrAAoJEN0jrNd/PrOheQUQAINeqKI44/qaYw125AoiNJVM
QTPHzlqsYVXTFVsBXDxNpPA6PKFPO3NAbQxAhVzkCL7/ahww74Py4o9SQJO02XWm
1V+OXPFIZEX8NivF85J7SsszPiRrVOgeSPODAlLirRZcAW+uzJAD5fvjylTurdUq
uNdYxtyt10Pp6Grr4Sc7URFibqLXzJ9ggUFe1+LgH53wBRKRJuUdGDhOqeo+oiKy
klWlNjCabISOdb5nNTwPfO2C4inUbY9Eox9ENsqMbbSrZ/A1FIBtW4U+OPIihM63
iyqFyfPgYJ6SWHl2mRhvCW6IrrZHZhiNw88BZ+VBCcY9+LIPWQEqNBW+ZXk1GjGy
Uv4DCxoYgNqz9ErizadS7RQF0KnuxMMCQ0/l8/CJY2P+BNMH73o2KL4gnJ4cdlEt
A7iMdEvDMvPpFU/92E6rG+lsi1fB4GT3YYDk19shL2+ihnFvwyoR1vOttTeaNssx
aPRQlZ5ZKa/LLa0wYym2pNvM3JV53HDKJ1U5PdqsUCrylQB4MXij/zl27JGs+5li
KJzSDoImnBKN+XozrlVJ2vL8Fsy3MCHnGCggKMabHxRvy8qBFiCkS8YbXQsKmROI
o0XO81w3IHImHd0wTCuQTa0LwJXubNTwH1sDk0PCklEkat0Lq02RSI9H0mvW7aAM
fPXEwsuoQTCdim7GJgKX
=BpQQ
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
