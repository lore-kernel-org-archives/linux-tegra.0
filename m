From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: max77620: disable notifier events for FPS
 rails
Date: Thu, 10 Jan 2019 12:07:07 +0000
Message-ID: <20190110120707.GD9541@sirena.org.uk>
References: <20190110041117.8216-1-markz@nvidia.com>
 <20190110041117.8216-2-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110041117.8216-2-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2019 at 12:11:17PM +0800, Mark Zhang wrote:

> +		/* there is no SW control for rails which are part of FPS
> +		 * set always no contraint to true to avoid regulator
> +		 * enable/disable notification
> +		 */
> +		if (pmic->reg_pdata[id].active_fps_src != MAX77620_FPS_SRC_NONE)
> +			rdev->constraints->always_on = true;

A driver should never modify the constraints, you should register a
different set of operations without an enable operation instead and let
the framework handle this.

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw3NWoACgkQJNaLcl1U
h9BFxQf6A5L3JMfn39i9h3RNP/+qflBVJSYoaO13ri3YacNgdJxCDwFqGe3vqbLm
Vz5QIqN640305Wfet7N6mdOx9/K/sp75PgZl40ZQ4/muybAzjwLguNjKvW0sGlaZ
PsJ4vvDvK4WAQa2KiKTY/vidLEJ5uZ6Mn1RsW4Zhnxfs1gwQYouuRwY6sKooNtFZ
8DZEIUSecRvkFWgoYPbk39qBcAF99uh65Due0UCUw1PIuMy1BDsUYia701vh8vJf
Ey31LxCCCcP2fCETPS3ruvRfzPJEvdExSGC/3wpliwP7RBiuGza2eFkWIL/phox0
q4ESn6HVHluWdBTAbF3xGsqXoquRgw==
=zGSx
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
