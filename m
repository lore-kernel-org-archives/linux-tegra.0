From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/8] regulator: core: Parse max-spread value per
 regulator couple
Date: Mon, 17 Jun 2019 16:25:14 +0100
Message-ID: <20190617152514.GY5316@sirena.org.uk>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="csti59zOqP8qx56L"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603235904.19097-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--csti59zOqP8qx56L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 02:58:58AM +0300, Dmitry Osipenko wrote:

> +#include <linux/regulator/driver.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/suspend.h>
> =20
> @@ -156,7 +157,7 @@ struct regulation_constraints {
>  	int system_load;
> =20
>  	/* used for coupled regulators */
> -	int max_spread;
> +	int max_spread[MAX_COUPLED];

I'd rather move MAX_COUPLED into a separate header than include driver.h
so we've got a bit more compile time sepration.

--csti59zOqP8qx56L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HsNkACgkQJNaLcl1U
h9Ds0wf+Ow2WVLIAd7uSRuPgCkWfL5qPDrkNCdes2qVTogdzf+l0bEi2s7g36y4U
UocF82di0IgOVQjkw4DbBTJNaDaF86PrH4+M3E7uE7egH9TW69S5wSwF13eQDxWx
if3V5TMA7C5pW03WGvh59MRbaeTsthOaL5wnVX5gGV7osuWdUYkz/6RRpG4RASIs
sGP+anp7dO/3VmX1Aq/h38OYLomU+0m0wW959jgdepTVnsaw86/BCesCvwc9M86k
ki0BGR28baq+mLhvDsd17qWLwTgigeMBPmQuCEXNppizyGi3lmuUzuNiU12WtJ/n
+YVh9cmMrcndt259HzuYGB/QABYFTg==
=evmc
-----END PGP SIGNATURE-----

--csti59zOqP8qx56L--
