From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] remgap: Fix possible sleep-in-atomic in
 regmap_bulk_write()
Date: Tue, 18 Mar 2014 13:04:26 +0000
Message-ID: <20140318130426.GA11706@sirena.org.uk>
References: <1395143914-26929-1-git-send-email-tiwai@suse.de>
 <20140318122218.GQ11706@sirena.org.uk>
 <s5hr45zr7f1.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7lclw+czRZDHN64H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hr45zr7f1.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7lclw+czRZDHN64H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 01:57:22PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Tue, Mar 18, 2014 at 12:58:33PM +0100, Takashi Iwai wrote:

> > > +		map->lock(map->lock_arg);
> > >  		for (i =3D 0; i < val_count * val_bytes; i +=3D val_bytes)
> > >  			map->format.parse_inplace(wval + i);
> > > =20
> > >  		ret =3D _regmap_raw_write(map, reg, wval, val_bytes * val_count);
> > > +		map->unlock(map->lock_arg);

> > If we're reducing the locking region here then we should take the lock
> > after doing the parse_inplace() to reduce the locked region.  Nothing
> > else can be referring to the data since we only just allocated it.  I'll
> > fix that by hand and apply.

> I thought of that, too, but didn't take it because covering the lock
> there doesn't change the fact that it's still fundamentally racy.

I'm not sure what you mean here - what do you mean yb "covering the
lock"?

> > Please also send things to the list for the subsystem (linux-kernel if
> > there's not a specific one).

> OK, I just copied the previous recipient of the thread...

Sure, but if there's another subsystem adding that subsystem helps
things along.

--7lclw+czRZDHN64H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKERXAAoJELSic+t+oim9MPgP/iQzSHC2I1Mb80Yc6eE3BjJf
rNy13kN4ZpxWBMxCy20bK+A1fDOZU80NEYGXlKvup+imC9uG+kNjaPYs7x47p+rV
0vexP9TDV1odwig5qROA9ELeV/bqxE63/QzP9I93Jwf2d6NhSu4sHv1KEbhhdqWi
qVZdLOgMhRpqx3bzrdRewdadFneh3ly6tV5JWFBJhW6R4kFGdQnNqHxQjsjla6Zy
mAtC9JnBb+2HBwruOuzJtyNP41HohGgP9Wf9MdfWLNHSe/IohfrG6W5IM+/EdxbD
u/EtYJ6QdUKV3lyVbgDq045c6BH9payTV1KBBbJqIOel50MTYSZ3gVjtzVDAzkiM
olfU8oZXMaV5FK1P2vHxWlQfw4Sg1mJpjb/PCEuSBLuiD/VxwQH0445dGV73pIUB
9HFV3L0ep8EZRhsvhLoYDxdUXOfSHyR0/xoeVRN7LECcTGoe1viWUUrNSq9rhHv2
iyve6p5T6CjT0JUg3muXQloCo6UrWYHokAm6QH+6kMWScjyV5JVmcGZE9owlnoR9
h6avXIhPHU4ONvAzyv59ZBgMcHHLYxcPBzsE1nEnEtLCapQXfAT7sfMvrr+AjaG3
uE+lZcHOzvSbBpj7ElBQDRq/7MOlJryaZYmedWYYVvj6aA0tlUu+zXB2UCBQNDWA
Wr3nuuz/CZbgZU0Sr1Kh
=SWFL
-----END PGP SIGNATURE-----

--7lclw+czRZDHN64H--
