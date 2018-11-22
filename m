From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Thu, 22 Nov 2018 16:13:24 +0100
Message-ID: <20181122151324.GB24661@ulmo>
References: <20181122131207.24791-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181122131207.24791-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: jonathanh@nvidia.com, avienamo@nvidia.com, mperttunen@nvidia.com, andy.gross@linaro.org, robh@kernel.org, vivek.gautam@codeaurora.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 08:12:07AM -0500, Yangtao Li wrote:
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Applied, thanks.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv2x5QACgkQ3SOs138+
s6GkzQ//RaryhEBFGRe9jmHJiJ8je0gbceK1g5Xx5OEGU3X04hhnsTUalDoAhc1H
7UeffL49eTwl+69nETWmt2bkQpngtAurDm1IA9kg6NlKCpzOPTXbe+Jk6BMAAqv/
GlMvMFMpABcv7CB1JQpfI84ifucFOYrDKWBhDzJYToCxG1AKzwxvH7qgMXsT9DZE
tvoEvoLRu6EFES0G6sz8vlz5JNJp1JPPs+iT29lkhxoMVKra4hVSCnbQ+xqf+L3+
OkKV6vijIyZpcWntwwh03ZdB+C9xtgOdCccYL2KoiJDq/c1Pj1B+zOhpmwPQG2ey
YFvFdwqPJV43uhbPxwcrp70ykKxMgyUT0idYndZKKjVpTNm/LnxQu1tAtgTRlPTK
xdp610kB1KD8CO14q9iinP2vjK5G0jTrT9Errki0sDgsMaQZXNfIFdUWEms2LMuV
fCyRDgxpwI9u4MEWJb+hUahfHYQxWSznBZTSORMOpu7joWhH1cOKoetV7xri26TM
YZ0xL0bn/XUfsIuBFn9R04YSLknUc0yys+Ogh7/QGlm8PO8vfWXwzTlUHjVgrg6H
h9xunlRJyf2WUaLuK/YoPs/WUh5U/ELF6gWtbJUSyCU3vI+xTF+6yKmoL60XW9pW
5l/ZKVpb3MVUxHTVgZ803lBeeBZAJ0YPn+IH1aQDfDNTr1Z3+mo=
=Gp6n
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
