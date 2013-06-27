From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu/host1x: Remove DRIVER_BUS_PLATFORM from
 driver_features
Date: Thu, 27 Jun 2013 12:01:48 +0200
Message-ID: <20130627100147.GA15081@mithrandir>
References: <1369806274-19046-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20130529105039.GA30742@manwe>
 <2786016.HggCTvYnMZ@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2786016.HggCTvYnMZ@avalon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 11:09:39AM +0200, Laurent Pinchart wrote:
> Hi Thierry,
>=20
> On Wednesday 29 May 2013 12:50:40 Thierry Reding wrote:
> > On Wed, May 29, 2013 at 07:44:34AM +0200, Laurent Pinchart wrote:
> > > From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > >=20
> > > DRIVER_BUS_PLATFORM is not a DRM driver feature flag, it must not be =
set
> > > in the driver's driver_features field.
> > >=20
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/gpu/host1x/drm/drm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Applied, thanks. I did modify the subject's prefix to "drm/tegra: " for
> > consistency, though.
>=20
> Do you plan to push the patch to v3.11 through Dave's tree ? I can't find=
 it=20
> in drm-next.

Yes, I have it in my for-next branch (so it should be in linux-next)
that I'll request Dave to pull from for 3.11.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzA2LAAoJEN0jrNd/PrOhQMkP/3ehY7czrBx/+0uqcvU75tO8
tG45/uM65hyTNUilIuyzHm+aImIxpUp135pCmHo+dmCSuXMmVz7DR+/kxxrRdwvO
s6cvyAwwxYUAqq40uIEeNRJQ6SQqzlRt6xS+PkzHuQ7RweUyJhye8lSs8cmDOVHo
IdrnAeldhxi9hEWicf4IZ6H6kW86I+ONoKytIAlM2XzVzl2QsoBb9L3zjMqkMF0g
VijUIz5wjn1ORU81cDkeVoUsmRPvpDZUG6RqYh249LASSUDwrYKj9WZgm5jsIOT0
waxsuBHJTcBcmBfDDnl7nu6EtKptDQyzvqdG9z8q+VYE/K3lcvgxjuAVaa1p1qdO
exiChpaftdIjV3BqKfid4mXDsgj+BmEsbpK2sKod/xTerbtqFxRhQJHfAS0vcQG1
uMeOUYL9aQcURHVbAYEry8KJ4bw0VdQ0taLPvR26gi8gE/T/oMegRmHYQ7DyBYMr
NC8m2JgbFlxMWZ/3PuuBA5InJWsCZQDwU2qG68B4aEy720/7NwNxTi+8Tm/GFgsp
iectj24pC0uHSTyPba7iX+aDsVptk8wGc+T70HYFXj4seJTbZTz4pMBK9dEkZ+wb
ADDYUxArnihEVrGyW53zVQJQRJ6gvkVX1xtmB8awGIci65dsLwBpWZC5bZ2sSKzm
dl4WbMvG1FR3JssA/bRE
=JA9q
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
