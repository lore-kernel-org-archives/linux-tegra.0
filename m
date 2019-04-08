From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] rtc: tegra: set range
Date: Mon, 8 Apr 2019 12:22:49 +0200
Message-ID: <20190408102249.GC6644@ulmo>
References: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190407211646.14962-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 07, 2019 at 11:16:44PM +0200, Alexandre Belloni wrote:
> The Tegra 20 RTC is a 32bit seconds counter (with an unused millisecond
> counter).
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-tegra.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
> index c6b0a99aa3a9..3f93a1f7abb5 100644
> --- a/drivers/rtc/rtc-tegra.c
> +++ b/drivers/rtc/rtc-tegra.c
> @@ -306,6 +306,13 @@ static int __init tegra_rtc_probe(struct platform_de=
vice *pdev)
> =20
>  	info->tegra_rtc_irq =3D ret;
> =20
> +	info->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
> +	if (IS_ERR(info->rtc_dev))
> +		return PTR_ERR(info->rtc_dev);
> +
> +	info->rtc_dev->ops =3D &tegra_rtc_ops;
> +	info->rtc_dev->range_max =3D U32_MAX;

The placement of this new block seems somewhat arbitrary, but either
way:

Acked-by: Thierry Reding <treding@nvidia.com>

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrIPUACgkQ3SOs138+
s6EFHA//bcDrlv65Vh810bQ+bQqBQKmZg2VMLx1IKXABdzXeKleGTHMjVs+zvkeC
zL+p1/6J+z8Oaq2uhCFuwdZG42ZFqGb59afSg3nLp0Sn6Dl5yNrYKmW5ZOO2FmW2
oSw72M0WUR0B8E3yL7d8eFBYnLwEPk18hwdBjke9T71DiP6UB3q1XrD53vrqZHB/
iJhThMJoiwnhkKa/XOEidPyr1qkP8dsVttND6iEuQBK0s+y/KK+X6AcMHDK1Ng5E
tnby4q1fXHNb4avEHp0JIk7cCdHAM7NKnxbBza7gKe0UcytRWYChvigAuP6qStgR
/QvNPaDkQy0QNq1j0+8yvFkq+gkmIjr5CUI08ev+3Q8AOZJDq1RM4/NKPpvwKIy9
/J8rvlATzd7YTqXc4gM1T6r/rwGdbjjvTgvR6qWq/3NfDeK5rL0MXKsrGQkcgHsE
JJhK+vE051ltQ4OZ7VjBFfyvFsQZ4Tc3AR/9Zl7z5m5+5IwukcZnn1P83RS7uOFL
goZfATBFgtq2hUzRrIdlXLga0CQa1KZDx0jCribeEy4H1DdW6nFG4uJPFzKrcZHf
+gq875Wbp7of4h4pGeKs95aPwIXEyDNg05TX9EjFDc0oZUs4OXnQl4qK2WhLhNG3
sd8uVIYu6IcEcW4ZmIGw/M5OZJEOjLcPi1ADA9DOz+3VYLXgSLU=
=Pr/2
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
