From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Mon, 25 Jul 2016 13:17:35 +0200
Message-ID: <20160725111735.GC21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-2-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468935397-11926-2-git-send-email-mirza.krak@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mirza Krak <mirza.krak@gmail.com>
Cc: swarren@wwwdotorg.org, gnurou@gmail.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@armlinux.org.uk
List-Id: linux-tegra@vger.kernel.org


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 03:36:32PM +0200, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> Add TEGRA20_CLK_NOR to init tabel and set a "sane" default rate.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index 837e5cb..aefc044 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[] __i=
nitdata =3D {
>  	{ TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
>  	{ TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
>  	{ TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
> +	{ TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 86500000, 0 },

Yay for inconsistent naming in the hardware. It would've been nice if
this clock was called GMI. Oh well...

Could you perhaps explain in the commit message why 86.5 MHz is a sane
default? I'm totally unfamiliar with this controller, so maybe it's
self-explanatory, but it seems a rather odd value for a clock frequency.

Thierry

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlfVOAAoJEN0jrNd/PrOhENMP/iNIX9ybtj2fIJlLxn6ECtC3
3KrY/BNZX0I1GOU0FvcwfZpEq4LgoUfhnpLcB5ME1SadXwoYZii6rZofRyJEv0lV
4B8NNTY4EJklvYkBvtQYAmzBrANsaYzUlEQFPApeQY2Ia+VbAF0ecO4FWgGZ8ut5
1NUH90bn12oQQqj9WwEOE8yR2g1surmt/s+zLxuRvLUksmnza/5wmWvavEFCffTT
N2snetfIRM3uEDJO/oc7PFLxRYv5xhDclsA4pwqsjHWhS4ztqj3LUWUM5k1T3ZY2
IQlb87pSrdq4dPgfPO04fAYS7Db7HiSxlACIi656MHbcNotOYxnp1ScUuUw3RXBB
kpNl2OJCOlNG7DxjRpXO6gvb9FeX6l6ojA25FKk52pFxyYuatCsKpTfhaB54i1ys
lzBHFWLBfjWH3XNq+Obt8aaK8L1XwYyNgc0GscSa/WRAAvOc3PPwVpEglT21vHOP
fVnemi6ONHpWIdrIdGyC1uI0L+4RYf6oKqYUPMju1JInzGxS7d3BdcPVDHnL+cv0
hY+L8A7otszgIfBTsh/cUn53mBFvTdEeqKw90p0oXGQx9mw81K9GUnBgeQeAUUIe
t990Dsnv9BSPuANLCphRS41TPOZvFSZp2eHhH1J7GP9osxxAzP8Aj3nEM0GmNTeV
ikOiJWsoeGosDGQ/G8qD
=KCOv
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
