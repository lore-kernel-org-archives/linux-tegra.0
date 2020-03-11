From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Date: Thu, 12 Mar 2020 00:24:46 +0100
Message-ID: <20200311232446.GA998881@ulmo>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
 <20200311143753.GC494173@ulmo>
 <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: daniel-/w4YWyX8dFk@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 05:54:46PM +0300, Wambui Karuga wrote:
> Hey Thierry,
>=20
> On Wed, 11 Mar 2020, Thierry Reding wrote:
>=20
> > On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
> > > Since 987d65d01356 (drm: debugfs: make
> > > drm_debugfs_create_files() never fail) there is no need to check the
> > > return value of drm_debugfs_create_files(). Therefore, remove the
> > > return checks and error handling of the drm_debugfs_create_files()
> > > function from various debugfs init functions in drm/tegra and have
> > > them return 0 directly.
> > >=20
> > > This change also includes removing the use of drm_debugfs_create_files
> > > as a return value in tegra_debugfs_init() and have the function decla=
red
> > > as void.
> > >=20
> > > Signed-off-by: Wambui Karuga <wambui.karugax-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  drivers/gpu/drm/tegra/dc.c   | 11 +----------
> > >  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
> > >  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
> > >  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
> > >  drivers/gpu/drm/tegra/sor.c  | 11 +----------
> > >  5 files changed, 8 insertions(+), 44 deletions(-)
> >=20
> > Applied, thanks.
> >=20
> There's a newer version[1] of this patch series as this specific patch
> depends on other work in drm.

Oh yeah, I just noticed that this patch causes a build failure, so I
backed it out again.

If there's dependencies on other work, it's probably best to take this
through drm-misc, in which case:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Let me know if you'd prefer me to apply this to drm/tegra instead.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5pczsACgkQ3SOs138+
s6HS4Q/+P562RsBDU9ZpqlH/UKz4Fl0liGtZcZPtT8vsdxVvw6pnXlF1Flc0b99d
EPk6sJ/3s+cWhfClB1ZlOnn/insCTRmtOLpqFaN5qmtbQNCG0jI84s+4uJJU5lgx
drcSDnXfLGTaSVQBPzwVS2gYnuM0rduA3M5MfCq7L/V+K2Cbs4k3r9BUyDKPZ92N
P8XzCqdfB4nj9tX3fAP5PCncio8wOvWtvUVkH3ZGDTypbNWkbF2wbQ2ESU7uis3q
aeTA74Eqv2z/lq2uq2Jk9QqOko31i+6SUIv3x/MOxmOXXpN442ib7DoAXCGvroIK
IvPDD18Che8PeUi2zLe+2pT/9AHR4ZN9SqBZ72rEhOsGNczJEo57uy2J+ZL8yZnH
4u7trV6ozHtOlFPrn5LNQONpbNG+esnsghrWwm7tz8Mscq2CiFCvHioyN4lzhOKd
gHJ3ZkZPFXqgmALsnAhP9vpLuQ68aGsrkW4tslBZNp/T2xzU27lG7r8JKyBkADSN
hkYfhsPlhJXJozmgVBJK6cJnstGJ2jaQjIKy/pZYb+g8T1upzykbTkJaT9CF9hSN
NE+lWaQ+OITnBwN76VMnuotVwoM2dB8lChqHLYFhqMk52JGEFZskpI/RO5MKejpH
BZddEqbYrBfBmUQ4V2BdkxjKrRlXZvLl5x0RC/wjdNStNQqKPx8=
=pQXY
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
