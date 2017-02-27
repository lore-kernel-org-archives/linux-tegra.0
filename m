From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: Remove unnecessary 'out of memory' message
Date: Mon, 27 Feb 2017 08:26:54 +0100
Message-ID: <20170227072654.GA27415@ulmo.ba.sec>
References: <1488021488-17847-1-git-send-email-codrut.cristian.grosu@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488021488-17847-1-git-send-email-codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Codrut Grosu <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2017 at 01:18:08PM +0200, Codrut Grosu wrote:
> This was reported by checkpatch.pl
>=20
> Signed-off-by: Codrut GROSU <codrut.cristian.grosu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  sound/soc/tegra/tegra20_ac97.c   | 1 -
>  sound/soc/tegra/tegra20_das.c    | 1 -
>  sound/soc/tegra/tegra20_i2s.c    | 1 -
>  sound/soc/tegra/tegra20_spdif.c  | 5 ++---
>  sound/soc/tegra/tegra30_ahub.c   | 4 +---
>  sound/soc/tegra/tegra30_i2s.c    | 1 -
>  sound/soc/tegra/tegra_alc5632.c  | 4 +---
>  sound/soc/tegra/tegra_max98090.c | 4 +---
>  sound/soc/tegra/tegra_rt5640.c   | 4 +---
>  sound/soc/tegra/tegra_sgtl5000.c | 4 +---
>  sound/soc/tegra/tegra_wm8753.c   | 4 +---
>  sound/soc/tegra/tegra_wm8903.c   | 4 +---
>  sound/soc/tegra/tegra_wm9712.c   | 4 +---
>  sound/soc/tegra/trimslice.c      | 4 +---
>  14 files changed, 11 insertions(+), 34 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliz1LsACgkQ3SOs138+
s6EYpw//c7XwHoyhLVtm8TTcbSpNj7J5+XTa4XhF+MbciVFgHFceRny3GDaA7/cV
WGde1/Ce3KXj+n9RWTVNcMu4MVqBRyEElM+B4t/fpjoB5IX9vcSJkR34lUkFYXcP
UvT3Kkd25jOvuPWJrpCsk4YX1tKy/WEX1acb3AW2rc+7IltX7S7hPr+8PuZMUj3W
m6mosrhRDWc7F+pDCBtvnJqaf1uXL3goUc6vGZdIJCYgQ1liePH0fbuXZoOzK+CO
AQ1h9egce89in2KgSBqr3otf6sNGXGTJckrH/7Qst78ZTRicm8busTDYTVceD4aK
4EZwWwWMUODD6RqWI7IZcouwQhLosIW1BLOOSYadwEisT+10L1XWyacefgIpUuE3
FXsCBV1vjY0lqIDof8rcQmwiCNW2txqmefZEY4CKxRQ15G5TLZcD0ME7gjP5/n4l
J5dNjqevLeNOQgySbJEyj7mQxQhzQMvEtcWSXua7GGCsf5srGFSsUSi5J1rqY+wL
z0sjs561DjYh6keKWrPB3DJ1Sze/1JshRjVi+BW2JIFyA4a6drLeB7t5k2Z5qBMf
s6I9v3vvDj65DdvGbPznZZ11xOFkAacdb22VsrR9KDI7s3WyCcbK1eciSTnfWpyo
U5FrLWmUhw6AaVBCFQRgL1yh6AB4FOpeRMZ325+QewQbHUkvA6Y=
=6W64
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
