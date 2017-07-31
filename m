From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: configs: Add Tegra I2S interfaces to
 tegra_defconfig
Date: Mon, 31 Jul 2017 12:22:39 +0200
Message-ID: <20170731102239.GC26667@ulmo>
References: <20170730112220.15525-1-contact@paulk.fr>
 <20170730112220.15525-2-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170730112220.15525-2-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2017 at 01:22:19PM +0200, Paul Kocialkowski wrote:
> This selects both the Tegra20 and Tegra30 I2S interfaces (that were
> previously auto-selected by Kconfig but are not anymore) to
> tegra_defconfig, as built-ins.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thierry

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/BO8ACgkQ3SOs138+
s6GOIhAAkU3zSw+ZRgMQzWvtBUcgLJe/8zlWolavaaX3U+FOgG7jXDgwqcImsgG6
riqwRVnzj2VNizIVJAANZn4SYSILjYmRIAbDGG+VFdZbkaQmCVHAmHS4gQBJS9xm
CK87bHVaI74lUTnXHa60pUCcc0bLkITn3dp+JAPWWFo990DAych36pwpDZNcPG5M
LaegCzgpaEfQGE2gCUE2I9pcHqBEt5R00zDskQDfqLfkDUtYzm4VOOzUvP9NUEVZ
XgqnqBGCT0jYZr5HBR5VKTCxodmWeeGiPh0LxNRBRN4t6ZnGhTv8/13fFUT3VuY8
DgKSXL1Nu3o+zy5yS6IbygA1SwX8nhAN3ipz0yHcfAtwgbWH1BzYhoZOiWacOdtt
gpLhAr2XEMA6T180kaDnXafxQSsSi+PGz2oJtEFoiOu8eRatc9h5Oly6fs+3PHCt
cem8sy5XA8cA8iF0TnxHvzDd6rgymtMhBJ9vRFVWHb89SGnaFhaoZRJE8UaRaNOC
r2uMosNnz1bW3gHcUW//7LmmNAjNFlV/CbCKqJiFlPRYrKkGeEBN6IUoZjJqMccS
BVIXqU911tlOMJZIE4d3Rg2XwsI4sb0iYHdeEJ2z9PCQcOwHLOZgulAlCcUQzLYp
2jV8noQPeD1785nVghSOzMZIKuLLeN1NQ06SzUvfvC1egHTAG78=
=Q3uq
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--
