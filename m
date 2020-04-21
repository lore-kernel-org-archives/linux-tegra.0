From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
Date: Wed, 22 Apr 2020 00:15:03 +0200
Message-ID: <20200421221503.GA3445172@ulmo>
References: <20200415122427.111769-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200415122427.111769-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> The Tegra DRM drivers includes the legacy GPIO headers
> <linux/gpio.h> and <linux/of_gpio.h> but what it really
> uses is <linux/gpio/consumer.h> since only gpio_desc
> structs are ever referenced.
>=20
> Include the right header on the top level tegra/drm.h
> file and drop all the surplus includes.
>=20
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 2 --
>  drivers/gpu/drm/tegra/drm.h   | 2 +-
>  drivers/gpu/drm/tegra/hdmi.c  | 1 -
>  drivers/gpu/drm/tegra/sor.c   | 1 -
>  4 files changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fcGQACgkQ3SOs138+
s6HLkhAAu4iEB6DmFiY8mIfbg5zlR+Zh1clXUkIPGTDhEGEQjmNF+j3mjMs+Ij6k
fJZapANopEijtJpoAYpr8mDOAQ1gcdWLAaeKfGKWLyW/r3aoDO1ZxsaLQBQIeimN
oIrDycRU0d2r5wbg1bHQfOq0wwaUS1YuHEMx4v2RGSvK/E5IrDB/O3Td7E1ols6l
K8zZFHvvAvTUaecYHwVKac2NqRJVDHjDqvu9YIvaXbJ2VbXDy5kY33MjX8nfBewK
HBsnQ/r8nUpAjSBx9SRZy3lxBiFXfYOiWQwNvvBF+GSO/za5RTWzSJP8WQKvn2eo
gw4Foxqp+5xBEqLmRzjPya1y3y2pno3WKTzLTYPcUjBwu8SnUJ1eAmxj8JQpdRPx
FYeEaka89Ip5fX+NJ89N/pTmRfSYH5zkKecTMbloafmXcbsLP79YsYSEFuiC8pUW
Tot7yRErxDXuCgfeqUwfx/pcuuYHTIolYBGzJkzX/Kylw6tD1kgg3ChngveZjPTz
GS49BeviCSSAELi/B51+vHaQa4um9SSClAlqW1Rp4VI+d16lQsIgO48cUhEUC6X2
2g/BBScvZ5Kl+QBJmDriMHaa6/n4UkU5J2wgnNgcwuPbLJLqsmrkPjHaUr4S+Om7
s0jglCkeo/U/naAYZrQu+M9pkhY+PE9BWWBhWgqiW3C6SNnZyKg=
=S/Uu
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
