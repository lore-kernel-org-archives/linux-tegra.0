From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: remove board_init_funcs array
Date: Wed, 22 Jun 2016 15:34:57 +0200
Message-ID: <20160622133457.GM26943@ulmo.ba.sec>
References: <20160622124052.1263574-1-arnd@arndb.de>
 <20160622125013.GH26943@ulmo.ba.sec>
 <40780752.S2fyoFjsUW@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Aaj1jBvBEV7KRjLi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40780752.S2fyoFjsUW@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--Aaj1jBvBEV7KRjLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 03:05:35PM +0200, Arnd Bergmann wrote:
> On Wednesday, June 22, 2016 2:50:13 PM CEST Thierry Reding wrote:
> >=20
> > Not enough information to check signature validity.
> > On Wed, Jun 22, 2016 at 02:39:41PM +0200, Arnd Bergmann wrote:
> > > In a configuration that enables CONFIG_UBSAN_SANITIZE_ALL, I am getti=
ng
> > > a section mismatch warning for tegra20:
> > >=20
> > > WARNING: arch/arm/mach-tegra/built-in.o(.data+0x6e0): Section mismatc=
h in reference from the variable board_init_funcs to the function .init.tex=
t:paz00_init()
> > >=20
> > > The array is no longer useful here since there is only one entry,
> > > so we can simply call the function directly after checking
> > > of_machine_is_compatible(). This fixes the section mismatch
> > > and is easier to read.
> > >=20
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  arch/arm/mach-tegra/tegra.c | 24 +++---------------------
> > >  1 file changed, 3 insertions(+), 21 deletions(-)
> >=20
> > Shouldn't these section mismatches show up with default builds? I
> > haven't seen any when building Tegra configurations.
> >=20
> > I'm going to apply this patch because I think it's useful, but it sure
> > would be nice to know why I need to enable this new UBSAN stuff to get
> > these warnings now.
>=20
> It depends on the how aggressive the inlining works. Without UBSAN,
> gcc seems to completely optimze away the loop and just the function
> directly, which it can do because 'board_init_funcs' is static.
>=20
> I assume that the UBSAN object overflow check has the effect of
> not dropping the symbol so it can check the size.

Ah, I see. Thanks.

Thierry

--Aaj1jBvBEV7KRjLi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXapQBAAoJEN0jrNd/PrOhbUYQAJRL+Ir32EzcU8Doqqc/t+KT
+8SOvUrX0OdKSSjUjxYtWhrQ9ziSArOmDNDtoygF1feA+yX4ACjzP5Ju9lpl7fb1
tOEJf3pntIaLCLgYbr8EXZaoxLE7VblSj55G72LSA4+03kC+yDZpq0rkLadtgFMy
pAGQobbHKPBEcrymDfvOSDm4zHRSFmO0ywhmb+Xpo4OQQha69GmU2PoU7caD6N8H
fFUIp9voGe7QZ5VHPpNGlQkSAEhmAbmWmVLIETROzkN4iq3Aogqr+wiPThOCKnyF
3cutbW1uP7b1PB/LXbelqbAMzpIzquv2f7zBY6X4av1zg0heABvigOGAVyqm7AdA
1434RkHNEk/AFaRGatDiYduXw4arOcUmYcAVBKxIupxXATBXeGnIlcA7GgtkSR4d
/TVdj3VXz53oACF+aEb4wqDw+l4EBzHhBTo8wi2JaV4pZMQTXzhzdsLjzpLvOwRL
HJUezWJzAofrSVTdthRvK2QFSsGX45YjcqGLylh/JgkELiyj/wLIrt+4OgzIta5C
HDIMq6+DZ0TthLEG1plfu1V4cCud92cPMmG6mW4iy5ptZHJAbKAzcFCJxah97FCU
vppKFPjnv27mVA8qxbA4+gLdUj30KzPvSqL+BREEWeY7tFMYUKdTXPxTJuIbzun5
hOpJFzV0n6Zn9HeuhDVF
=toHr
-----END PGP SIGNATURE-----

--Aaj1jBvBEV7KRjLi--
