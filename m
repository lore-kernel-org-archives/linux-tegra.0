From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 05/10] memory: tegra20-emc: Replace clk_get_sys with
 devm_clk_get
Date: Mon, 17 Jun 2019 11:46:02 +0200
Message-ID: <20190617094602.GC508@ulmo>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616233551.6838-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 02:35:46AM +0300, Dmitry Osipenko wrote:
> There is no problem for drivers to request pll_m and pll_p clocks for
> the device, hence there is no need to use clk_get_sys() and it could be
> replaced with devm_clk_get() for consistency.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/te=
gra20-emc.c
> index 43aef3614b65..527aa4b90e95 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -527,33 +527,29 @@ static int tegra_emc_probe(struct platform_device *=
pdev)
>  		goto unset_cb;
>  	}
> =20
> -	emc->pll_m =3D clk_get_sys(NULL, "pll_m");
> +	emc->pll_m =3D devm_clk_get(&pdev->dev, "pll_m");

Interesting... I didn't know that clk_get() had a fallback path to
return clk_get_sys() if the named clock wasn't found in DT. That's
nice.

Looks good to me.

Thierry

>  	if (IS_ERR(emc->pll_m)) {
>  		err =3D PTR_ERR(emc->pll_m);
>  		dev_err(&pdev->dev, "failed to get pll_m clock: %d\n", err);
>  		goto unset_cb;
>  	}
> =20
> -	emc->backup_clk =3D clk_get_sys(NULL, "pll_p");
> +	emc->backup_clk =3D devm_clk_get(&pdev->dev, "pll_p");
>  	if (IS_ERR(emc->backup_clk)) {
>  		err =3D PTR_ERR(emc->backup_clk);
>  		dev_err(&pdev->dev, "failed to get pll_p clock: %d\n", err);
> -		goto put_pll_m;
> +		goto unset_cb;
>  	}
> =20
>  	err =3D clk_notifier_register(emc->clk, &emc->clk_nb);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
>  			err);
> -		goto put_backup;
> +		goto unset_cb;
>  	}
> =20
>  	return 0;
> =20
> -put_backup:
> -	clk_put(emc->backup_clk);
> -put_pll_m:
> -	clk_put(emc->pll_m);
>  unset_cb:
>  	tegra20_clk_set_emc_round_callback(NULL, NULL);
> =20
> --=20
> 2.22.0
>=20

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HYVgACgkQ3SOs138+
s6EtgQ/9Gx+n4aKJJHIbFckpC+vU7VBdPMTAwd48nRN3rFmLbeWN2LaUW9M9WrKc
U0fezbnCkrzJXxkwUHilcxlnpOppZM+vTZlEu0tzt4DeXRgbZOOFUJWjHSH5pg3P
4pi43yWW84rT4+ybtx0QdzvfxVjvxeUdpsWjYgwU884ba96HtaDchSylbtki0Hfw
wdcN83GB9cjpnr/Xi6L/IkKMBFtF2UDPhTyQ+jGX5+GoajEiU1lp2Lxi5QwLiwjh
t2Yy70tjfwHZq9HW6FKIz7rzDIVrcfvB/uZ1vuCoecJPzF3w0udHemB7c0aMjAWk
mj8Fzt/+fIcqort2U1x1kMgYo/EQe57ILXUE8J/95QU3qq3gu2tPdRS4BtxAJ1HJ
z9vRRDJ7vPYrD6ECyDShO6/nU+Oh+I34fXSIjwqpjOcEMimGc2DzZ8Xx2BUw+Icm
i/20okN1spP69011y8UerIiHScdJU1RXpmYg9JzTRaRgmu04YoXUwqnLnp90PAkk
n9lVPLaZVnFsWPZa+lDxRyLDRkSweAQ8n9/1DV2drCqlI3k1IKtY5lrXGEc21AUR
kGIFqydYBxg76z8lZHozlzFhdMlHaNFpmJwH6AGDuhpIlZPF0D/hyYtF1FFQImiP
YYTWvugRpZOqIGP+XEhyaW6zrK+pYYMXjNpOZzg0Lj8vbpWrfxc=
=Ppyh
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
