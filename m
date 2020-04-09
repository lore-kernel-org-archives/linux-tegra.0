From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: fix tegra_pmc_get_suspend_mode definition
Date: Thu, 9 Apr 2020 17:02:31 +0200
Message-ID: <20200409150231.GB3505571@ulmo>
References: <20200408190127.587768-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200408190127.587768-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 09:01:15PM +0200, Arnd Bergmann wrote:
> When CONFIG_PM_SLEEP is disabled, the function is not defined,
> causing a link failure:
>=20
> arm-linux-gnueabi-ld: drivers/cpuidle/cpuidle-tegra.o: in function `tegra=
_cpuidle_probe':
> cpuidle-tegra.c:(.text+0x24): undefined reference to `tegra_pmc_get_suspe=
nd_mode'
>=20
> Change the #ifdef check according to the definition.
>=20
> Fixes: 382ac8e22b90 ("cpuidle: tegra: Disable CC6 state if LP2 unavailabl=
e")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  include/soc/tegra/pmc.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Let me know if you'd prefer me to send this in a pull request later on.

Thanks,
Thierry

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6POQcACgkQ3SOs138+
s6F7ZhAAvVQ5d5Dr9bT31eAT6TA/weF92Mw2WXqCGnhT/tDE5mSqIkGHnhLvMHXa
h334Mk0SNxcgKec5lXumw2TFlnvfFy2aEItOrMP4U4CIe99AYpknMfE+LvQplfb4
JDzqugOFS7c9rUOPfQQy9WJ0YL/7qYm01gPtTAor+yGY5dJJW3vHl8I/issqJQnU
xPbY0EzD4qPyKe8e3T1OwpgiF1vHQCDrNtFsNt6otc/2lV5t+/OxLWxRx9skp9A4
zTMFVOK8CuhyUnE5Ik0y/ZmzmUFbrjOqOntuvO/NUotkPB95x5/AYy+P3Eu+qBqT
/3510BE94NojOZu7rY7PKlCkI0DuwXV4qV6FrRLvpAWa3xf/Y6/afJMgRSWNKKHj
ODOfgPrR71u0om9DG+/CrlD7QpYWXbpGQUB1JUtoQTU53UNSo9ZNgsvngzEwcqUY
6WYVi5EWitfVXcmvyEWyJ002EJAvLNgnwxmPZl1zVDAVB8NOsQhV0Qvi5lwLFGhF
u4Qmc9b+WndPwHaELLB3ScUPCD3+gT8WSOLavYZdQl3x48aFySWjm1OeXiBGfebq
4mVHghjV3/7YVPIvOom+EhAoEAJox5WnZzeRht1AleTmDt7IqNvPSUygNk2L/lrQ
XRZcVXx3nNe+vcwsJaW6Ln8z0gtTlKmUjN8Xzmy2wRhtPFaSziU=
=lZ2U
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
