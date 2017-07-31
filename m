From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] sound: ASoC: tegra: Remove SoC-specific Kconfig
 depends and selects
Date: Mon, 31 Jul 2017 12:23:09 +0200
Message-ID: <20170731102309.GE26667@ulmo>
References: <20170730112220.15525-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170730112220.15525-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2017 at 01:22:18PM +0200, Paul Kocialkowski wrote:
> This removes the SoC-specific dependencies on the platform drivers,
> as well as SoC-specific selections of platform drivers for the
> machine drivers. The rationale behind this change is that the
> dependencies are not actual build dependencies but run-time ones.
>=20
> The previously listed SoCs were also incomplete: for instance, tegra124
> uses the tegra30 platform drivers, which could not be built without
> ARCH_TEGRA_3x_SOC set.
>=20
> Descriptions of the tristates are also added to allow these options
> to be set via defconfig/menuconfig.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  sound/soc/tegra/Kconfig | 42 ++++++++++++++----------------------------
>  1 file changed, 14 insertions(+), 28 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/BQ0ACgkQ3SOs138+
s6Hgng//baRSeMP4UDCFD6q4KZtj5Yg0pm+LK5Dq0R3s9y4plbZDCoI+I/1qpEJI
b1V3SwHI9PdQXuEb8TQ29xpskM8BoEqzmmNtBxCsn5iJf4myWZu5oN3CjJfTjhwA
IYUe4KQzUb2dVkXpcxrrQk+ULoixFzVhJvOUnILOqNvnEaFiXutLOPl+SVe6Zilu
FPiXQd/JV5tRzmJTGrTIlmiYnI8M6Dg4NP0XwIXCBwkPTn2udih9bciiNgCfjads
AJyk+yI2PKXZ1NXVo4nzTVOhAOnKUeYrUTxGD8TXujxvx1Xcx2jptp1bG7s6MNGx
F1bH/Wj/LqjyYdiMBtomvTgUkeDz1GbasnWzTvRSxXGHFeXJQLgmINoeXRoMyNRD
mdqSz1eZ2SuYhhzcZSTKlJG+dymcmPbm0mGz+ojHIwzkDPYvUSVclMZTG+TtwS8k
oKb1UKgoTrBvZqS899jaqXGAmTmPvikoRVvVcVnM71F+wd9C/JLMp4GPvrqDkKl7
Y5xSlavBWfuJ1rc7Ll219+2pIsGkT4UKOtO0XFyoBcqDeSZ3eQKe/zj38sjtuyw6
7TPHcOMkYUIRuXWYybgGPLS+rY/4dUTyCWnkjtAveEy4S+A3V9g43cPUKAsvJ1WQ
IMRngs6NKq7OBEM8LAcaxZgfwFXJnPQ7H+0h2lbPHUB/xGBiCug=
=uYBZ
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
