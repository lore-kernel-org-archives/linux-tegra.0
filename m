From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 10/11] clk: Show CRITICAL clks in clk_summary output
Date: Wed, 22 Jun 2016 14:24:19 +0200
Message-ID: <20160622122419.GC26943@ulmo.ba.sec>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
 <1464381494-27096-11-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464381494-27096-11-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 04:38:13PM -0400, Rhyland Klein wrote:
> Add a '^' character to the beginning of clk entries that are for
> CRITICAL clks.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/clk.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 874c7dd8ef66..22dd0ca1e491 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1948,8 +1948,9 @@ static void clk_summary_show_one(struct seq_file *s=
, struct clk_core *c,
>  	if (!c)
>  		return;
> =20
> -	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
> -		   level * 3 + 1, "",
> +	seq_printf(s, "%s%*s%-*s %11d %12d %11lu %10lu %-3d\n",
> +		   (c->flags & CLK_IS_CRITICAL ? "^" : ""),
> +		   level * 3 + (c->flags & CLK_IS_CRITICAL ? 0 : 1), "",

Maybe output " " instead of "" for CLK_IS_CRITICAL, that way you can
omit the second conditional.

I wonder if it might be easier to read if this flag was at the end of
the line. There's also the fact that someone may have written a script
that expects the clock name as the first word on the line and may get
confused by this change. If you put it at the very end of the line the
likelihood of upsetting scripts will be reduced.

Thierry

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaoNyAAoJEN0jrNd/PrOh1TMP/26DIkFgay/otqSUNTccCnDM
SzRiq3DPV9LtqFtIL4TZQvU1jKasmutNPv9/izBdioKzK1rl7LPM9VFMU/rsoYeN
J/6rZAriwZK4+TyvcUBADyGKga3jG6wjZb5aFxqbufoz45uZxeGt3yvNAvXd23j1
mkpy9yXZOk1a0m47gMOSxc10X3KKaSljoyOZEPOZkcf+CyGMO0WlnTFHls7W9889
YOHBJKKVy5dPCYifjK3KgNFd928dA/AJfrV873g4smqxigKehtFQssR/a00PtmSI
Bsl97Z1YemJZGrYRh+SZ4f2XYpQvjbd6PCMEV/f132mzdd8UpgghNAhbPvQQLGfO
qhWuPLcnJCTlzPIWxGEf2NxeR33G4pbAEM+OpJrJJgHOA05PHjqABWcuBxobNmjB
UTVxookjH3gD84zUGRDcd8rVGQAqTEQdfLDUit+v0IfCtIC9glB1QWcEdSY+WNWd
ZjibqyNbxpR43fx+RJsur9pkB+QAOpMY8r1YN3GzLbd3CBZhdVEv+/c3q4Jt1Atm
bceJeV1J+z5Fas3GGuRxi4Aje5pdL66joY+PBsclxhWuWMMrEjKPl2AJa0b0wdx0
SKPhPjqQ45Tkwxi5EG5MWF+QMyaUZVhgwsiCVwVdLHFocs2I4p8xgw+ibTsOEY55
lUVrZIJLJBn8WD5I59SL
=+O1c
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
