From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] sound: ASoC: tegra: Remove SoC-specific Kconfig
 depends and selects
Date: Thu, 17 Aug 2017 16:22:11 +0200
Message-ID: <20170817142211.GH6854@ulmo>
References: <20170730112220.15525-1-contact@paulk.fr>
 <20170731102309.GE26667@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170731102309.GE26667@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 12:23:09PM +0200, Thierry Reding wrote:
> On Sun, Jul 30, 2017 at 01:22:18PM +0200, Paul Kocialkowski wrote:
> > This removes the SoC-specific dependencies on the platform drivers,
> > as well as SoC-specific selections of platform drivers for the
> > machine drivers. The rationale behind this change is that the
> > dependencies are not actual build dependencies but run-time ones.
> >=20
> > The previously listed SoCs were also incomplete: for instance, tegra124
> > uses the tegra30 platform drivers, which could not be built without
> > ARCH_TEGRA_3x_SOC set.
> >=20
> > Descriptions of the tristates are also added to allow these options
> > to be set via defconfig/menuconfig.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> >  sound/soc/tegra/Kconfig | 42 ++++++++++++++----------------------------
> >  1 file changed, 14 insertions(+), 28 deletions(-)
>=20
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Mark,

do you want to pick this up, or would you rather provide an Acked-by so
that I can take it through the Tegra tree along with the defconfig
changes? I can provide a branch with this patch in case we ever need it
for conflict resolution.

Thierry

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVpo8ACgkQ3SOs138+
s6FU7xAAjwFfvWqIGrLd9ruDIKqwJ2gc8WBZK51YX9V7m99A/+8ThLLtL1y23Ijr
x5kJDX7h6El0dxr8Wd9paHkMuQEYXeQ7+xXZxPlU7ivIUMY8xEfrcUMtizRbBagH
iWiVUGJIS84QCjqXDQYvjjwRYZIH3iA2ZiupcQCLeCpXiL/h9fk8TQywj+YiZeCW
1QgtjPALcYlLyhcQ5yfn9iPwp9ig5YNk6OgxcLBp9bsLIfKefkIZKOSz6Sdvmm4X
1W2UYtWBxII0zP6HJdWPLg815cXY+aSFd1smlfE9sSS73PXvkp7gn9aJQ2V1ZG6w
/z3vowmcskGo985KK3oNADhmOQyaxhSL7ZXIFLAJ5+rF81qOW/pvIU/LlxIeXpas
fhG+qnTXX7zgc+giY0OT7yS852HnO3cN54p8CrTMXuDs49Pg1Whovj14Hl4W/GV5
GR+HY+O7Ghb9xtZkp25OM9BJTIrKeqXNaZAMoHhNjp8ub1P+MFXWFp+v704bG1TZ
1RCznqUD8EkpZoO8xHCdehi43UnPPaIGP1CLijZKqqYnSyQt4WGerLqFeBGKFJKf
9L0IL3/c//4B/XidyLAzwS/LDPfm0Pgce1htqhQ/pHWpv5K/96mQVzPkspHcM1ZD
qkS+G+ZXWgEG6yGEqmcZk1GEovs4KZr12HvvxwOX5ZiULNNQtZ0=
=QSiD
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--
