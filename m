From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/3] firmware: trusted_foundations: Different way of
 L2 cache enabling after LP2 suspend
Date: Wed, 6 May 2020 18:34:47 +0200
Message-ID: <20200506163447.GC2723057@ulmo>
References: <20200324224335.5825-1-digetx@gmail.com>
 <20200324224335.5825-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200324224335.5825-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 01:43:34AM +0300, Dmitry Osipenko wrote:
> ASUS TF300T device may not work properly if firmware is asked to fully
> re-initialize L2 cache after resume from LP2 suspend. The downstream
> kernel of TF300T uses different opcode to enable cache after resuming
> from LP2, this opcode also works fine on Nexus 7 and Ouya devices.
> Supposedly, this may be needed by an older firmware versions.
>=20
> Reported-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> Tested-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/pm.c                     |  4 ++++
>  drivers/firmware/trusted_foundations.c       | 21 ++++++++++++++++++--
>  include/linux/firmware/trusted_foundations.h |  1 +
>  3 files changed, 24 insertions(+), 2 deletions(-)

I split this up and applied it to for-5.8/firmware and for-5.8/arm/core,
respectively.

Thanks,
Thierry

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y5ycACgkQ3SOs138+
s6FCSRAAh02WAmouPtmya248FjU/uaRY3IDf6ewTOb0PsVokeZQB4biQYVvIN7CW
l15w6+90Ni3RTxe6g3GewA8IIxmRYet1RGeRIFYo2ZhLCL5SurzOcQp1V7NO3Jg3
UrgHSCOlmZM3W55qOwucjdolZINuXvhqbgscHdDHn3hbfJ7vciHSAVvKR+eDijU7
xL+UZJ72i2UVgFwnu0ecREIPLDzzRSbwTP7z5Aedelr6RyNpjJFpwXL1ARRIpV+B
f5AVWvyn4PqKrHgav+N7mPAccVXu3NImsa6e+GlPq6JJCMt2bD8a7FBXha0Xp+z9
LcF3Fwv3H7ZWfGiqqtTrhBADXUaj3fkJ8zQzbeHR5W5DvYJFkaZtIuAtH4/Rissh
Fnk0j3kJ+WRUD3/CdAKpOdMEcqmQW4eU5JWHFrEqXtwICE51tKiF7qnLtgwNsrll
m/Y4dCq7l4KsKAHQSU4/H53PuJkyAlQW5UKCIdOzizqjMtRQCjvQFsq46WSYD9uK
b7WW44l8UpUHfKGT7hSQfHhi5OHucY5otFCx81rTj3Dyv6ckLbd5igPAZk8cylMg
HXfxegHGR0f1Tb8HfUsBbs/fNUFnhPNsWgM0nMvbmxNbpKH9LCeOlKSdY1y/WpWy
OEJiuem6uaohDNwOC+tUOEBhRn06wZcOpGkQOBNm3qswQkXecos=
=+mgt
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
