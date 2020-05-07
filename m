From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: avoid unused function warnings
Date: Thu, 7 May 2020 22:02:40 +0200
Message-ID: <20200507200240.GA2981633@ulmo>
References: <20200408190043.532711-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200408190043.532711-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
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

Applied to for-5.8/memory, thanks.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60aV4ACgkQ3SOs138+
s6HB4xAAtc0jHXbJjHqyz+xVNP+KreaFGVRf3w9YmnJhAFFOhWaUf0/5UUOKwzp9
5XwyYYa5cSzJtk/AOGPgfEtGF4pBx7KJKF+Sxhg8jVJXMfRwYc4q2wqoKsfbT42h
fslFVb7sGWUiUtCvvkCFlDLw+8QhmbTqnG4zCSL4d/YdNqTPKAZIFrivP5LU9UZT
m+VSSrSegwekwvHN1oWtoXIrO7j8tCoXHHjzvHH457ijv/s7QXW2GycnNstPOOIj
KqLLCyrY7UPxJykiGBsO+tCmT8bo/xZKEFOTtxsZNFAmA6Ckzx5s1KA5EX8Gf/G6
zg/+9t1DATutn+USPq3yTznqN+OnN8R6xohhC5CjsxHSWsxmQwtaYH4rtr49sRp8
TaMtA3Rz4bD+8MUoT69fXC7xnj7fmXDZh2NwK4AnxlDvV+YFsz7Fj614IqOucDzj
b/vXJkT4VwHjmUg9yIAKDiTVSeT/y25xWtI8uEbEJKHNCRv9ybfZOqi7gnAIsa9M
oSCrBL8W8aDsze4kpbWnOvadFWEOFErhWShPTA5I+sgYCvstY9OXg+75/0QBa/1L
+YooiDJWhAjlM+o/f+2Unb/DB2VQsIToYTTu6VkKe66+9xZ3ki2qt149sEKu4piQ
VTGmTotNkWBSKivcBqU10+rJPbNmeJYFNGfWiLC+Jz2SkNaeU+g=
=xt3U
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
