From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 4/4] ARM: tegra: Core code changes for v3.19
Date: Mon, 1 Dec 2014 14:19:43 +0100
Message-ID: <20141201131942.GA11943@ulmo.nvidia.com>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com>
 <1416570832-6220-4-git-send-email-thierry.reding@gmail.com>
 <201411282249.58149.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201411282249.58149.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 10:49:57PM +0100, Arnd Bergmann wrote:
> On Friday 21 November 2014, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit f114040e3ea6e07372334ade75d1ee0775c3=
55e1:
> >=20
> >   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-3.19-soc
> >=20
> > for you to fetch changes up to e4a680099a6e97ecdbb81081cff9e4a489a4dc44:
> >=20
> >   ARM: tegra: Re-add removed SoC id macro to tegra_resume() (2014-11-17=
 11:43:21 +0100)
> >=20
>=20
> Hmm, I guess this should have been part of 3.18, but I just sent out
> a pull request for fixes today, and it may have been the last time.
>=20
> Pulled into next/fixes-non-critical now. I see that there is a stable
> tag on it, which means that it will find its way into 3.18.x, but it's
> really the wrong way to send a patch for the following merge window when
> there is a stable tag on it.

It didn't seem quite critical enough for it to get it into 3.18, but
perhaps it should still have gone that route. I'll try to be more
careful next time around.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfGrtAAoJEN0jrNd/PrOhJrsP/174lgqzUyL2EDEtSCphFyYy
N8wDM95U+tXqKfBFzQdFbWRdhIXWpsaQe2rTJwbu+Ny9xIBwF+6ycA0quqsoXPgK
5EhEYIsR4rixIa0ljM1Pbl83VBhrEE7/weypnNhu3C1zXE1WPs+u0kdB8cmQJeOG
7u/aWNLQ3WYqBvtXjEou0SGxHpldyDDj0ZX27azqh+6JsSVPlZk1bDAdoCEVphN+
c/FUfaHjjc1+nBZnx7wrR8AvQjeTD2cmZhE2Dj8c4MsIJlJRAq3uXX8gWl+BluG0
3a5zXHfJEv6MLTozzCk3KrQZXzmKgFemmbyC0x93LgaJkGlwzcNfGliNNI2cODMk
cEyS0hB+3bs+Aaneby977tOopHy1KSFgrvElT2Fo81h0T9q/9QZ3MV23fXjZ1E09
wOKuESUyIQCEH3D+KRdpH/ZGZWsxp4mFPe+05xqJebkRot5gbsmgw4C+bU0r8Wko
MoXoKE6BV+xIgQa6WP6sg4CFLMpSeTbugRDwzUpyr+9/A9fSj8vdT7AFBM3YE17Q
zVZqW83uT/NopcW/bxkJZpFFGx4OPd8Pc0So4ezpUpJEPjsFWjYRdaksrFicNqCO
0rXVmdLmrZFS2FE7SvVcNeZxLCf8UBforrKF0nJO+S2vLDfm3Cah8ya7iVFn2D/w
/m41640l8vy/fP8RcYFk
=LWe4
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
