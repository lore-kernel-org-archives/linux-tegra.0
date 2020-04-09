From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: avoid unused function warnings
Date: Thu, 9 Apr 2020 17:01:46 +0200
Message-ID: <20200409150146.GA3505571@ulmo>
References: <20200408190043.532711-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200408190043.532711-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2020 at 09:00:30PM +0200, Arnd Bergmann wrote:
> The suspend/resume functions have no callers depending on
> configuration, so they must be marked __maybe_unused to
> avoid these harmless warnings:
>=20
> drivers/memory/tegra/tegra186.c:1578:12: error: 'tegra186_mc_resume' defi=
ned but not used [-Werror=3Dunused-function]
>  1578 | static int tegra186_mc_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~
> drivers/memory/tegra/tegra186.c:1573:12: error: 'tegra186_mc_suspend' def=
ined but not used [-Werror=3Dunused-function]
>  1573 | static int tegra186_mc_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~
>=20
> Fixes: 177602b00641 ("memory: tegra: Add system sleep support")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra186.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Do you want to apply this to ARM SoC directly or would you prefer if I
collected fixes and send a PR sometime later in the cycle?

If the former:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6PONkACgkQ3SOs138+
s6GwCxAAqz/EbclxuLXTI0bmj3b7UG7+js/fzr2oWdIIu3SkJWJfoxyfxdWXZDUG
M5989jPwZxiqyZU68dplxAED6TzPTMFJHYqvtk+Ex73gwRidRj5Jpoa8sXuOVsLL
Io7Us/Zhd233Qi+QyfSfmR3Gvq6X9M/HKvLIVj8x/lbLinnunGlmMBE0i4VTt0e0
1yK6L2wMWTolXwmJqRYtZ8Ct8HbSJUfOQnrx4dvrthrxYpEGe9c3mqj7b2ds7TeQ
Y7tAoPxqOmMbju5BKHhmMkY+xpIfE4NNxyCGfiLcGaPuJ0DQtrIqrLGWAtD7RpMj
CXAqI7YUvp3fF/CUIDgVrPRt17G/VR98EYYuyu0YO7Frr3eUx9p7LsWtmC0vQvb5
I2c+crnGHhnb8Rw9I4B9xH3pYt+7bLPg5wz/4stF8SWE3oq3FZc41Dd9k2jir7vy
daz7SxTC++0aBIa3gwk2tXWLbb90fZuMOi0T8QVz5uaGWUpGygaT/WyUBucMTGQ3
qtJJe7nJ6RHwQZL8tvsuxDR6djl0zV3jHtOvT5s17ET/HNCgANp1cSr8UOJOgqdg
F+ape+W428Hgpkp+6Kj6IbCtVHbW1lgmEcLxuLb4BvPIR4mroQNg5ffYzpWZ5TTL
8iUv9Z4kedsuVwd01glV7uMV6+aW3n2u5P34R5s21OTFlF2C8e4=
=KD63
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
