From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] ARM: tegra: Correct PL310 Auxiliary Control Register
 initialization
Date: Wed, 6 May 2020 18:44:56 +0200
Message-ID: <20200506164456.GC2723987@ulmo>
References: <20200313090104.20750-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200313090104.20750-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 12:01:04PM +0300, Dmitry Osipenko wrote:
> The PL310 Auxiliary Control Register shouldn't have the "Full line of
> zero" optimization bit being set before L2 cache is enabled. The L2X0
> driver takes care of enabling the optimization by itself.
>=20
> This patch fixes a noisy error message on Tegra20 and Tegra30 telling
> that cache optimization is erroneously enabled without enabling it for
> the CPU:
>=20
> 	L2C-310: enabling full line of zeros but not enabled in Cortex-A9
>=20
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/mach-tegra/tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-5.8/arm/core, thanks.

Thierry

--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y6YcACgkQ3SOs138+
s6GD/A/+NzmvjIPJ34uaTNbvaUoVRNP+HMuGLoEmhzzf+wTDrT0UwTVlz0nKSh7F
6vwI05FUgT3FRozK65BE0DtYYjTCLQhISvMBn7tJ/LfHOGiXVuZeSLuKKzfkrleZ
wTuPkYj4v0lHtOncYNWDKzxHKYYbsoRKDVxyPnH3hLFbsxyG392xzcOgsegiv0Fk
EFED3VkVMoS3zSU2amy0m8BNDhQFojA2yYIAb76+fO/amRpFGhyi/cbU3diylCuY
RiOGX2hrfnkC21zMYl8vLE07QCAnm9ZiFU2O2hjp8l9fDIBdGo8UvT6xv4OKuo/b
lMWuO7z+tk+f8BovUQ6W4PSrL4xEvjKBoGLQzyDTTfpMWrQ9cJuFufg9FkskjGwD
oJV5IJdy5DgFmbcWHhkNveCLSE3CO4/NfNuWQQAXE1yfsP4m+rn3KQqzfCkiKnUL
SU4FwucPNnR7BwrdeIZ5kP1F9Fi0toiOuzZv2EgmtjAomlX7JYJy8Usi60NUptX5
UYV55WiDmRpVavBOTzuKLnqOXYfNpdzkQOuWzjjJE4+LjinqtTJcP8Oc3gBQyMaS
9fxR4LtKLBnBMPCA12+E71prlZZnMqUQcy2CwU1iSqdrR577AjPQsEtIY6LNYzCE
ogWFdne+JAry3+gwbAPxmYkAx4SLVvHrpCfOAlZl5mI8M3KwXc0=
=1shP
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
