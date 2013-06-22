From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PULL] drm-tegra-fixes
Date: Sat, 22 Jun 2013 13:07:53 +0200
Message-ID: <20130622110752.GA17064@manwe>
References: <20130620103642.GB28263@manwe>
 <CAPM=9tz_-m+kZo9+BJ1P-3-d01+HDEQkM0-Kvdc4GFVffex5gg@mail.gmail.com>
 <20130620210710.GA9707@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130620210710.GA9707@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2013 at 11:07:11PM +0200, Thierry Reding wrote:
> On Fri, Jun 21, 2013 at 06:37:30AM +1000, Dave Airlie wrote:
> > >   git://anongit.freedesktop.org/tegra/linux.git drm/fixes
> > >
> > > for you to fetch changes up to 2b15aa0fd466a4b2defdfd84c0b5168804b3eb=
33:
> > >
> > >   gpu: host1x: Rework CPU syncpoint increment (2013-06-20 12:21:38 +0=
200)
> > >
> > > I know this comes awfully late and is much bigger than I'd like. It's
> > > all my fault, though, since I've been travelling a lot lately and just
> > > didn't find the time to prepare this earlier. I did want to sort out
> > > patches that didn't warrant to go in before the final 3.10 release, b=
ut
> > > all met the criteria as far as I could tell.
> > >
> >=20
> > Don't think I want to submit this to Linus, its way too much at this po=
int,
> >=20
> > User visible oops or regressions is all you get now really.
>=20
> Okay, I understand. Can you take this pull request for 3.11 instead?

Scratch that. I'll send a proper pull request for 3.11.

Thierry

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRxYWIAAoJEN0jrNd/PrOh2ZEP/2n75tUYNSy1NO/Lanmc3Y2N
HvDc6HB20L7gIBWzfHm7+OMhZ5xtV7uLgkNElp8bEy353yPhL+PyQHqwqVXCPA9C
evFrLfs2KaCIo8k5Ilvk1/d/ff4eMMMmOzDGItz5Gfyfu/pqd2xMWHTLB03epP7R
sj0UDH4A2tJ48rZMA0DgXRNHw0TxgqugG4RYfy65adU7mkU9iqcSm9V+aAJ9jvh3
RTAG6wL372XK7h5aWX7CqUfWXIm0NLRIPei00gmhFP1E3WADGjkgN9mwgJTIWTP1
oZfPoI76nSqwcRRv+C6YfN1d6uJpZThjru8Gyt3prx+aJqbmGjD0+Ig+fivavj0P
l725glZWn2QAm1h7fooVRJXPoUNEFj99V+TzdDu41mbQnKqdNzCDoFYdfGiOlHbc
eHL9CyCtXtKj3b3+Mt8q/9Q9qiKzw6UDx6vMzOgj5bqVdFVYrkpul/qxuRShNqnp
GFt3Y+wex3CUtpXss4MfpsTZ7VeoX0N+2ZwatjpwKbUe61bKDNEQribMblOtNDvT
bi1xsJ7ik/WLLjhy8O7AWxUCrYKlhDe3cQuxVjofRhNu0n9BbEnh3mt3k/YkrQ2Y
frbw6yIJKO7OUcMC/oUmFeNFdWNFoyIE8uL829rQNnghcuvowQx3FX+tHjtAbo02
Z7/0DnwYOqorwHDTWTAt
=UYTV
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
