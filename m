From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: tegra: Have EMC clock implement
 determine_rate()
Date: Tue, 24 Mar 2015 11:38:35 +0100
Message-ID: <20150324103834.GF18115@ulmo.nvidia.com>
References: <1426584991-11110-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426584991-11110-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426584991-11110-4-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 10:36:13AM +0100, Tomeu Vizoso wrote:
> instead of round_rate, so we can take rate constraints into account when
> choosing the best rate.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/clk/tegra/clk-emc.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)

Mike, Stephen,

I'd like to take this into the Tegra tree because other patches depend
on this (albeit as far as I can tell it's only a runtime dependency).
This patch also depends on the EMC frequency scaling patches (that Mike
Acked) that I have in a separate branch. Alternatively I can provide a
stable branch with my current stash of patches that you can pull into
the clk tree.

Thanks,
Thierry

> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> index 704fff7..615da43 100644
> --- a/drivers/clk/tegra/clk-emc.c
> +++ b/drivers/clk/tegra/clk-emc.c
> @@ -117,8 +117,11 @@ static unsigned long emc_recalc_rate(struct clk_hw *=
hw,
>   * safer since things have EMC rate floors. Also don't touch parent_rate
>   * since we don't want the CCF to play with our parent clocks.
>   */
> -static long emc_round_rate(struct clk_hw *hw, unsigned long rate,
> -		    unsigned long *parent_rate)
> +static long emc_determine_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long min_rate,
> +			       unsigned long max_rate,
> +			       unsigned long *best_parent_rate,
> +			       struct clk_hw **best_parent_hw)
>  {
>  	struct tegra_clk_emc *tegra;
>  	u8 ram_code =3D tegra_read_ram_code();
> @@ -133,7 +136,15 @@ static long emc_round_rate(struct clk_hw *hw, unsign=
ed long rate,
> =20
>                  timing =3D tegra->timings + i;
> =20
> -                if (timing->rate >=3D rate)
> +		if (timing->rate > max_rate) {
> +			i =3D min(i, 1);
> +			return tegra->timings[i - 1].rate;
> +		}
> +
> +		if (timing->rate < min_rate)
> +			continue;
> +
> +		if (timing->rate >=3D rate)
>                          return timing->rate;
>          }
> =20
> @@ -452,7 +463,7 @@ static int load_timings_from_dt(struct tegra_clk_emc =
*tegra,
> =20
>  static const struct clk_ops tegra_clk_emc_ops =3D {
>  	.recalc_rate =3D emc_recalc_rate,
> -	.round_rate =3D emc_round_rate,
> +	.determine_rate =3D emc_determine_rate,
>  	.set_rate =3D emc_set_rate,
>  	.get_parent =3D emc_get_parent,
>  };
> --=20
> 2.1.0
>=20

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVET6qAAoJEN0jrNd/PrOh4egP/1FJDUrM7fFtD1EOgcVpIlHf
WvQvhmmUGFhidvGh+Lw8RReTJKFuDb8tZ2fv7BZsGnIifckEKt39nsdjiSAc3dnt
S1xv99mWhKgE4uhNwSzyMPvjAEnbMHoZ4kRxyy8k/c2ByxmbGyF3CPtROE9+1lDG
HhjyNSkZ+SZmDHNPvFUEtkbZ3K50iELIPdXIaLv4VO4R91ae+9PQhElbkzQ1BUOG
aaAe7SzdGEbnJ156iH671rOS3FLHZqPs2AOBvMhkE6u3pOs6YtqKltIvM60wAbIf
xuAG22OwseDxhfLjYVOq4BGpgnXZhv88+vuZtHsZRbv/3iKQ0xTKU0U/C6FIksFJ
pmUqX1ODXzyEDFdlizEgNETcGU9UzXYf1RQB2Q4R0FMREj1ygYOM8ZXA6qnqKsRH
GcS23eNyIikrt3dKM1FkBnFxINOmOntZtuje+9dUEKsgRo/LHC6H6jPOz+yAftYq
WnIF7ZbDIRv2k2BUXUpVhU3nz91ohdSrBkZFgYJzMojWc8BPhes9ItAzQZm5K250
vE+4COt9F1JYdEv7sLAEkAKCUTtdPPYei9lwMw1mG4sAJuqaPRb49m6nsmLNUH5l
yqlqLQKb01zfKXuOCcRo1ixrJmlPLbC1PG7PuEAx1Fmx/Mu9bKY30XuXbEefO7HJ
wJRohOgTec+jF1WVCv4W
=OkE0
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
