From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Do not print errors for clk_round_rate()
Date: Wed, 27 Nov 2013 17:34:43 +0100
Message-ID: <20131127163442.GA25458@ulmo.nvidia.com>
References: <1385569563-25408-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385569563-25408-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 05:26:03PM +0100, Thierry Reding wrote:
> clk_round_rate() can be used by drivers to determine whether or not a
> frequency is supported by the clock. The current Tegra clock driver
> outputs an error message and a stacktrace when the requested rate isn't
> supported. That's fine for clk_set_rate(), but it's confusing when all
> the driver does is query whether or not a frequency is supported.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-pll.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Cc'ing Stefan, since he reported this error or IRC. Stefan, can you
check whether this fixes the issue you were seeing? In case you're not
subscribed, please let me know and I'll resend the patch.

Peter, if you're fine with applying as-is, can you add this:

	Reported-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

to give proper credit?

Thanks,
Thierry

>=20
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 7aec773a5ca6..55ece6726108 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -435,9 +435,6 @@ static int _calc_rate(struct clk_hw *hw, struct tegra=
_clk_pll_freq_table *cfg,
>  	if (cfg->m > divm_max(pll) || cfg->n > divn_max(pll) ||
>  	    (1 << p_div) > divp_max(pll)
>  	    || cfg->output_rate > pll->params->vco_max) {
> -		pr_err("%s: Failed to set %s rate %lu\n",
> -		       __func__, __clk_get_name(hw->clk), rate);
> -		WARN_ON(1);
>  		return -EINVAL;
>  	}
> =20
> @@ -584,6 +581,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsign=
ed long rate,
> =20
>  	if (_get_table_rate(hw, &cfg, rate, parent_rate) &&
>  	    _calc_rate(hw, &cfg, rate, parent_rate)) {
> +		pr_err("%s: Failed to set %s rate %lu\n", __func__,
> +		       __clk_get_name(hw->clk), rate);
>  		WARN_ON(1);
>  		return -EINVAL;
>  	}
> @@ -615,10 +614,8 @@ static long clk_pll_round_rate(struct clk_hw *hw, un=
signed long rate,
>  		return __clk_get_rate(hw->clk);
> =20
>  	if (_get_table_rate(hw, &cfg, rate, *prate) &&
> -	    _calc_rate(hw, &cfg, rate, *prate)) {
> -		WARN_ON(1);
> +	    _calc_rate(hw, &cfg, rate, *prate))
>  		return -EINVAL;
> -	}
> =20
>  	return cfg.output_rate;
>  }
> --=20
> 1.8.4.2
>=20

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlh8iAAoJEN0jrNd/PrOhXCUP/16EDMWmwTF6Hu36kXXfkYFe
BT54HhW45+qeWJvO7PvDm1di/jRTJqUw/ABdKPPY09NyWXquXxMtAeoPjh/RsR7Q
ZJYcSD6CZ6gP1SN+Kpnr/snRjEfEjH8QfNeW8CLlKngqKZeKA8Lnc2hqeE/vPOKW
DiIJM9T67uSouxe/USDUU3Yw/sV0nke07aluvesqTtdAsZ3oCKm+3fMaRFYOVJxV
NEpZjP50eKe+XABp+IBQSfAIHSXv9KTqVQw1C2mEqXMzEXWX+YvSVP9lhOMdUFeC
gqdeVABt7oLqwS8w7nDNOFLs+9FJGXQ0hCj4Oj+4z7yE+CCx7ifc96y7whm4bY/a
7ohJ6v7cg/vuz72njbhEKeS3VNmFkRPQDQrSUYtJxj/qxTtv6UCPMirdQbf3FJyI
4EihrTOGcb+i1Ty8F/iUm3LxP4EZyoXgZ33xkO10vYWIUGPk6BlNAL/Yl7T0uUoH
qO2lss5GRncxDulsrGs2KdweWPPl3L+4I3oxBJeGLB+W6ssNYd1pS1qNrBXGAkw6
3hmJGg1Lt8SYQvQ9QBzkeZutkUx9lhawsX2HCSfHts3iYLZC/1ihFmsaguLyAmeB
zYaas7Y7oXpOfYg5n9rf2J5LQzr/o+fHvuKd35Zw1huK3HLFNXatKr7vw+HwnXBQ
0Z80T8fAOyxzqHDcyaKl
=c/ei
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
