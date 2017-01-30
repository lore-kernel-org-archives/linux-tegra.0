From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.11-rc1
Date: Mon, 30 Jan 2017 07:54:21 +0100
Message-ID: <20170130065421.GC3585@ulmo.ba.sec>
References: <20170127092121.21570-1-thierry.reding@gmail.com>
 <20170127092121.21570-4-thierry.reding@gmail.com>
 <20170130050017.GH18943@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130050017.GH18943@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2017 at 09:00:17PM -0800, Olof Johansson wrote:
> On Fri, Jan 27, 2017 at 10:21:21AM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79=
be88:
> >=20
> >   Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.11-arm64-dt
> >=20
> > for you to fetch changes up to 7bcf266462da736ae4b42d5c73cd5dc0da540772:
> >=20
> >   arm64: tegra: Use symbolic reset identifiers (2017-01-27 10:13:24 +01=
00)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > arm64: tegra: Device tree changes for v4.11-rc1
> >=20
> > This contains three patches that reintroduce symbolic identifiers for
> > clocks, resets and mailboxes. These had been converted to literals in
> > the v4.10 release to avoid complicated dependencies between branches.
> >=20
> > ----------------------------------------------------------------
> > Thierry Reding (3):
> >       arm64: tegra: Use symbolic HSP identifiers
> >       arm64: tegra: Use symbolic clock identifiers
> >       arm64: tegra: Use symbolic reset identifiers
> >=20
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 86 +++++++++++++++++-------=
--------
> >  1 file changed, 45 insertions(+), 41 deletions(-)
>=20
> Merged, thanks!
>=20
> No more t186 material than this for 4.11, though? :(

Unfortunately not. After the holidays I was preoccupied with some
regressions and Tegra186 didn't see the amount of progress I had hoped.
There's more planned for v4.12, though.

Thierry

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO4x0ACgkQ3SOs138+
s6FuXw/9F6+1t4M9RRp+7AApqN7wcTwlTEMcrvcUvBpYN0b2s+o1HjbTg+gSAIYa
g59L9lkp3T+vWK4UlEAnN5+mmAH8qDStVdeyh9GV/y0Hfkc1Yhxrv8clHPVaB3om
6imxy1J4tD/XxahECfKHamh+OCd0yJSjof/UjezczhiZlJT9fCLEGvE1ZzoZ8JH+
OfetWDnPb+tVA9Cox8CRd2qFejFu0LxfJqd/WCBJC5k6SX1GqxiDe6Ho9oydOCPb
6fAQvFC3h1+WCEKFVT+CVmuN/x3joFW15tHg2kTdrMR3tgHynbw33f8hjMuCzQKo
6N5Yrds35yAgDb87mzj+MoyP7P+Gb7iYLO2AAew4sCr0XVTMWDMoJdIzwUHavQpU
b/KmbW7ZYfUkYZ4oYnTJ8bNxEKv3Z/cechMJJZsnKuL5yQ/OnDdRCB5OTd9ressM
nKFZW9S6XAXc0tW34Uv9it48pa8sci7SnS5vVkTfbIP6WcwWZ1un6129ISAB5kty
MLXJHT/BOnRD14TLhHE3jKzBtdPANBB+3Sfil/clcv5z2rYnJV3C9yzYXsaYnPXL
IEdyeJDPR1VWrfSfT3Df7paKLtkhg6LVlETImNla0PzL6dR5VVPf893NEgrMZhv3
kOvVzYOKGgmZHx/QP4dfmaKwCyNElQzUJUlRswC7gJjerGcPVXk=
=H5AN
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
