From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 13:29:23 +0100
Message-ID: <20151112122923.GA31671@ulmo>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: gnurou@gmail.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> of_match_device could return NULL, and so cause a NULL pointer

No. There is no way that of_match_device() can ever fail. The driver
core uses the same table to match the OF device to the driver, so the
only case where of_match_device() would return NULL is if no match was
found, in which case the tegra_i2c_probe() function would never have
been called in the first place.

Thierry

> dereference later at line 809:
> i2c_dev->hw =3D match->data;
>=20
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index a0522fc..c803551 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -806,7 +806,10 @@ static int tegra_i2c_probe(struct platform_device *p=
dev)
> =20
>  	if (pdev->dev.of_node) {
>  		const struct of_device_id *match;
> +
>  		match =3D of_match_device(tegra_i2c_of_match, &pdev->dev);
> +		if (!match)
> +			return -ENODEV;
>  		i2c_dev->hw =3D match->data;
>  		i2c_dev->is_dvc =3D of_device_is_compatible(pdev->dev.of_node,
>  						"nvidia,tegra20-i2c-dvc");
> --=20
> 2.4.10
>=20

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRIYjAAoJEN0jrNd/PrOhbQcQAL0jAQVQhVwTtPNeHxdbsbqk
m4Z9EyUE8C/J+l/mHTKnxiRFEww+EM7azrVS4ywMjuLxZxJJfBDdFf1rbCG96byl
DKrGEi5r16dX8FJ3yD1mcLQxX75LNqK8T0QnZroN9HMHfivX81hejOsU8HMBfFwb
PC3xQFHH0Kd54qmWwUz9O2bSBPeiNf+lucVSxyCpYGjbXCCY9jbloYYV0dwjIu4H
8HliRYtAOknnl7UaDnq1Osei0JFggidA5SLg4+CFqsSPPKf5Rhm3ZzAGyK/5EbQv
cv+OfjTzMNhKG9T8PL9g6Z1z+CGYDbht+gXPEG8rFOgA7aTNv8MyK2BYPsomsVnW
j24Udl5rzMg8Lh2o7Epgaa5dOWj/n6ltIH5TidkpUjI3SJYGdmDPZ9kb3EDcqC2k
ZK12+3elYRT1ZnnPy4DYqUAlZvpCpbpTBVZQYlrwvuZAS7yj8JmmRt/OL1vY8Ok+
oJs+eIut4Dmy0xqeZ5yFBkwzggj64+jZLf16ERb6ZqzUQttt/FzEpu1JStgBVoSz
JrLfgHi3iPTcungHRM5xEfgshtAfwGdGF/jhBlhg0bEzk5BZaZyXtaMbA6Zmre4F
SlG8PtdI9OYr6E9iXyP05ShR518aIuqZ0whD0jW2fubhoCyP0Y/cqJ7gdkwaTQjW
Aaxp0a72O21wrORE65G1
=45KG
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
