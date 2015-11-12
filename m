From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 17:14:13 +0100
Message-ID: <20151112161413.GB3913@ulmo>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <20151112125422.GA3758@Red>
 <20151112132837.GF31671@ulmo>
 <20151112134519.GJ24008@pengutronix.de>
 <20151112135500.GA1131@ulmo>
 <20151112145458.GB3758@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151112145458.GB3758@Red>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LABBE Corentin <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, LABBE Corentin <montjoie.mailing-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 03:54:58PM +0100, LABBE Corentin wrote:
> On Thu, Nov 12, 2015 at 02:55:00PM +0100, Thierry Reding wrote:
> > On Thu, Nov 12, 2015 at 02:45:20PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Nov 12, 2015 at 02:28:37PM +0100, Thierry Reding wrote:
> > > > On Thu, Nov 12, 2015 at 01:54:22PM +0100, LABBE Corentin wrote:
> > > > > On Thu, Nov 12, 2015 at 01:29:23PM +0100, Thierry Reding wrote:
> > > > > > On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> > > > > > > of_match_device could return NULL, and so cause a NULL pointer
> > > > > >=20
> > > > > > No. There is no way that of_match_device() can ever fail. The d=
river
> > > > > > core uses the same table to match the OF device to the driver, =
so the
> > > > > > only case where of_match_device() would return NULL is if no ma=
tch was
> > > > > > found, in which case the tegra_i2c_probe() function would never=
 have
> > > > > > been called in the first place.
> > > > > >=20
> > > > > > Thierry
> > > > > >=20
> > > > >=20
> > > > > In a parallel thread for i2c-rcar, the conclusion was different.
> > > > > https://lkml.org/lkml/2015/11/12/83
> > > >=20
> > > > The conclusion was the same: there should be no case where this hap=
pens.
> > > > The example that Uwe gave is hypothetical and not valid DT in the f=
irst
> > > > place. So instead of chickening out I think it'd be better to just =
crash
> > > > to make sure people fix the DT.
> > >=20
> > > It depends in your trust in the DT. Just because it's not advisable to
> > > do something that is not documented usually isn't a good excuse to not
> > > handle broken input. That't the case for webserver requests, arguments
> > > to system calls and several more. I admit DT is a bit special because
> > > you have to assume it's trusted, but still handling errors in a sane =
way
> > > is IMHO nice.
> >=20
> > Given that it's supposed to be provided by firmware and possibly from a
> > ROM, crashing might be a better motivation for fixing it than erroring
> > out, which people might just ignore or not notice until it's too late.
> >=20
> > > > On a side-note I think that platform_match() should be stricter and=
 do
> > > > something like this instead:
> > > >=20
> > > > 	if (dev->of_node) {
> > > > 		if (of_driver_match_device(dev, drv))
> > > > 			return 1;
> > > >=20
> > > > 		return 0;
> > > > 	}
> > > That's equivalent to
> > >=20
> > > 	if (dev->of_node)
> > > 		return of_driver_match_device(dev, drv);
> > >=20
> > > and was already suggested in the thread referenced from my reply to
> > > http://article.gmane.org/gmane.linux.kernel/2083641 :-)
> >=20
> > Ah, too many cross-reference =3D) FWIW:
> >=20
> > Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
>=20
> Just for be sure, since the thread goes in lot of direction, you ack my p=
atch ?
> Perhaps is it better that I resent a version which use of_device_get_matc=
h_data() ?

No, the Acked-by was for Uwe's proposal to modify platform_match(). I
think if we want to gracefully handle these cases, then the right way to
do so is by having the driver core not fallback to name matches for
devices instantiated from device tree.

Sorry for being unclear.

Thierry

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRLrVAAoJEN0jrNd/PrOhnKMQAK4FzhwxJK3DO+49HUnpy1vf
kjgKdztiDwSDr6aCVHgxwmwqcP8DN8Bo3uK4/MZDH40bwUEqsOIZckHemU9D9Awg
7v5MpKlH5ein3rl+x77m9xRHkzWs8rArC9ro5M/2JhnQ/isRzLdtY8+umOMquFDw
RsKN/i68OA+FnyFxiuaczayRQoSnPOqyv2qsmA7kahJGcPzitYSimPTRiTyCF7Ov
yewbK79rfo2jMvh4mF7K9aH29Uo7BxibzOWaHEb4As8wKNogIehRiYdUmQoHs+DS
yDrNiM3Cfn93CQ9rpznWpm3lQcnjrtcjt3OcLjqHso5B1I5Y0I0tJhmp+Vd8Ygvn
wYjPiPHrJXG3HzoZ2s3qyvFeIjMtl1XnvbbsrzUFyB4dcs/sJlCOuErllVFRASqM
WncMMdSX/jt8pCUSNEE9XBOlzrQCmUVBWIGwqplN2SFDAazJk2q/S6sQMikDwCR8
KRIWW3XwnEx+Onqa9iDDG+I9ZqiK8icXh2YLveiozHIxCCccYOjW4nCtVSevLd53
GNCTdCILDlX1qwLnVzSC3UoFtL9E7gKn+dxyiaY5/CztoVFxB+RHmkL81LwkobzI
e4W6HDcXhyyZFigPVTOcnYH0AzBt9KO0xg1s6i8YDsU3aEq0uSJkjSYRD0UoZAZc
bb/tBXLSZx8I4nDczyJA
=BC+q
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
