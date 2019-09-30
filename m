From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 08/14] ARM: tegra: Make outer_disable() open-coded
Date: Mon, 30 Sep 2019 10:05:11 +0200
Message-ID: <20190930080511.GE1518582@ulmo>
References: <20190929175952.22690-1-digetx@gmail.com>
 <20190929175952.22690-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190929175952.22690-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 08:59:46PM +0300, Dmitry Osipenko wrote:
> The outer_disable() of Tegra's suspend code is open-coded now since
> that helper produces spurious warning message about secondary CPUs being
> online. The secondaries are actually halted by the cpuidle driver on
> entering into LP2 idle-state. This fixes a storm of warnings once LP2
> idling state is enabled on Tegra30.

If the cpuidle driver halts the secondaries, shouldn't it set it offline
then so that outer_disable() can still work correctly?

Thierry

>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/pm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
> index 7d9ef26e52a7..16a02937d3da 100644
> --- a/arch/arm/mach-tegra/pm.c
> +++ b/arch/arm/mach-tegra/pm.c
> @@ -146,9 +146,10 @@ static int tegra_sleep_cpu(unsigned long v2p)
>  	 * if any of secondary CPU's is online and this is the LP2-idle
>  	 * code-path only for Tegra20/30.
>  	 */
> -	if (trusted_foundations_registered())
> -		outer_disable();
> -
> +#ifdef CONFIG_OUTER_CACHE
> +	if (trusted_foundations_registered() && outer_cache.disable)
> +		outer_cache.disable();
> +#endif
>  	/*
>  	 * Note that besides of setting up CPU reset vector this firmware
>  	 * call may also do the following, depending on the FW version:
> --=20
> 2.23.0
>=20

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2RtzUACgkQ3SOs138+
s6Eq3RAAq+IM3JsJRvcEWa4zVK9I0xB+MNVeoUFLf4YWngs+qR/ozuEMfUGUf8yr
Zn/lNHPCFdfG905CuOrhlvK8WAuq3XZl7LsXDeAtwv/6/FAEUTn2ZIsDGOAas716
tCRbTmo1dU5Krs+Ws8NtbnZKqW1HZEck42lOkImjylj+9na7+BCOQJgkFjzX7M/k
eSpAmE+C+6HaZfJtmFxP5s8ukCCynw92T2S0w4zrruIwNM8aWSziuDgq4NLctbja
nLgQuvdOSvCIHbtnqJU0aO8DcezDW4UvpI5LD3DUfVaFP3iPsjtvGWfxhjKBy5oo
9jODrFIUMHoSzv0KXi86NVXHmcWUZS61Ww+YgRZRgFtRBQaKNzCohPwajiNEyZu2
Ss3AT5UFGSEhHI2fDFXe7YeaYhgHMh/fCKg+FYrsGAz6PmREkf9GSO7p8PFo7cv3
GxE8qlRjz2CqQA3voW+O38g7QW4bZYTTSVP9VHgwPjocRY300SM4AD7q7bzUraBx
RGbleDykkPVuwKRsno3Y85pcD2zANq3kx7VEgarc10llSewh7KLI0O3C7JnhR2C3
Y5M9jGTAF2LHjIj9X/pVz00/vyXdfSreqTQAIMfQYIFXXdQwsUWAdYtRhwOYrRYq
Z6QefJ+tE/IVq8Cmj7swr3Kc/zXxj1oAYjQbpwLhZXbEnsYbAsY=
=ZN/o
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
