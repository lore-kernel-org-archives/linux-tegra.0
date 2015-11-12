From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 14:55:00 +0100
Message-ID: <20151112135500.GA1131@ulmo>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
 <20151112132837.GF31671@ulmo>
 <20151112134519.GJ24008@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151112134519.GJ24008-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: LABBE Corentin <montjoie.mailing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 02:45:20PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Thu, Nov 12, 2015 at 02:28:37PM +0100, Thierry Reding wrote:
> > On Thu, Nov 12, 2015 at 01:54:22PM +0100, LABBE Corentin wrote:
> > > On Thu, Nov 12, 2015 at 01:29:23PM +0100, Thierry Reding wrote:
> > > > On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> > > > > of_match_device could return NULL, and so cause a NULL pointer
> > > >=20
> > > > No. There is no way that of_match_device() can ever fail. The driver
> > > > core uses the same table to match the OF device to the driver, so t=
he
> > > > only case where of_match_device() would return NULL is if no match =
was
> > > > found, in which case the tegra_i2c_probe() function would never have
> > > > been called in the first place.
> > > >=20
> > > > Thierry
> > > >=20
> > >=20
> > > In a parallel thread for i2c-rcar, the conclusion was different.
> > > https://lkml.org/lkml/2015/11/12/83
> >=20
> > The conclusion was the same: there should be no case where this happens.
> > The example that Uwe gave is hypothetical and not valid DT in the first
> > place. So instead of chickening out I think it'd be better to just crash
> > to make sure people fix the DT.
>=20
> It depends in your trust in the DT. Just because it's not advisable to
> do something that is not documented usually isn't a good excuse to not
> handle broken input. That't the case for webserver requests, arguments
> to system calls and several more. I admit DT is a bit special because
> you have to assume it's trusted, but still handling errors in a sane way
> is IMHO nice.

Given that it's supposed to be provided by firmware and possibly from a
ROM, crashing might be a better motivation for fixing it than erroring
out, which people might just ignore or not notice until it's too late.

> > On a side-note I think that platform_match() should be stricter and do
> > something like this instead:
> >=20
> > 	if (dev->of_node) {
> > 		if (of_driver_match_device(dev, drv))
> > 			return 1;
> >=20
> > 		return 0;
> > 	}
> That's equivalent to
>=20
> 	if (dev->of_node)
> 		return of_driver_match_device(dev, drv);
>=20
> and was already suggested in the thread referenced from my reply to
> http://article.gmane.org/gmane.linux.kernel/2083641 :-)

Ah, too many cross-reference =3D) FWIW:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

If we want to gracefully handle this, then let's do it in the core by
making sure that drivers where it would return NULL are never probed,
rather than coding this check in every single driver.

Thierry

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRJo0AAoJEN0jrNd/PrOhg5gP/RK2sR01I54+wcraspRj0MX7
+tMDWcacqHj+3zrB8hQ5w3VwI2nqAH0jqgyoAEtU9D7ljB4an4qlfLdC6Qe3Cw31
gaLXQbbCB/axWSIr1wJNOIMrPk+HlIKRP6186vRk/EA9g3m99lrI3Ol/0s5KD20/
F/gNye0J6CAr4RkPwIj68hIIOwi0hjXoLaUfiP78z4Zm4xuh+zBxdHvEUVX9+0o2
R5SWzHfD8BIOdAw8o8aeIsefF/jz3L7/LKtgUuLCxlF/d/nr1yC2/GjzqSOb9zcT
0E2S+Rvub+LwF/sBDuC9JM5pFXyyzALNAz1yDrhpp6FIgXGolgnWTeCc5LLzwJ5j
14G/LSCL0LoG18lW0MmKgxURX/lKGbHzMDAVv9Sj/xEgEdDbCcJ7HrkVNkRA91oG
iuUScAiz/K28P0whglvkz7MQ99j5lW07UDfX6fIgSv67nCfRDDMehFd8XWeeHegl
xNnhiA3m2ccD8UnElzkFhwy+7uXCGNt/RjzhqG41fkJAec0xR1+de4ET7cuCz1uG
zBwN9BaLYb1ScHH+NJChlrMAMyqIvS5s5/q2OiE2yTX10MeC9EcgUYVS2xOW7QQk
CvW3TDQwSjkALXXoD/mDBce2DknBiUGSE5LoDdoTPTGeX1r71jXEf3rPg6hok+Hh
PUl6I5hc2Y7yV00gDjp8
=1k14
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
