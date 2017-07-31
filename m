From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: tegra: Use platform_irq_count()
Date: Mon, 31 Jul 2017 12:57:13 +0200
Message-ID: <20170731105713.GG26667@ulmo>
References: <20170720160057.13483-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t4apE7yKrX2dGgJC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170720160057.13483-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--t4apE7yKrX2dGgJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 06:00:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Use platform_irq_count() instead of open-coding the same code sequence.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Ping...

Thierry

--t4apE7yKrX2dGgJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/DQcACgkQ3SOs138+
s6Hn6A//QMNvYehJk4wnjA/6E/kFJTSyulSh8fKLt5YWkfzCBCnK6iGTR/O7pCyt
/TNEx6416/oGWx0MygFnGGHWT9KuTocfH20DhLo+ikETgwCEWUpQks9qqmzRubpN
b6luRD42d9RU8luKDbcxO3Q3TbelILEJdb4SGOtK8wPSUBvDQpvtq8XakVnJ7llC
YzOmJ34jcF8tGiqhzUlFu+90WiEdf4oCMkijX+SSjkgNYnqM5QaFZyWDqiy/Hm8m
/TR8JSpZUOUVKwBDrri1dWc+zUlhsWWr7D8XK3DKwSpCQTVV4/Ic1pCdZcaKZGFr
g/7+oiK1oDGNRdE2OHfN02QbTU4hpwVW8cWl/lQqVBLam5dcG0OzbcRyNSDtf+MQ
FoZ5Mr/f0zkP009YGbcB1JTotzpE4t7DtcfBZ2gfA5P48/ee4NzZ+f/P1AUMV1DG
JrTWs6rvm/xUeXOFMBq3wm9ERIFsjg56gXPU+iUa9ixSkfFyOHPHkJ2Fmx9U8GwU
C/LVSbmVm8uJRUCl2ArfonLvmr7sYM0MrgSkiTmYue79n/rZOAkFKpHwQ9ru/PdB
WxqJkOV+w6TkAEpPnmPDP3HfzwAsrXSr8XJ9USPLloz1HpLvz+G0ob0o7rssuxkJ
H97bk6hSUASKx0+QJOpLvhv+7a2wi0IxYJFV5so2lzJUUBvWot0=
=YSYp
-----END PGP SIGNATURE-----

--t4apE7yKrX2dGgJC--
