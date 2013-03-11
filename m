From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Mon, 11 Mar 2013 20:49:33 +0200
Message-ID: <20130311184933.GA8228@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
 <5138FA7D.3040104@wwwdotorg.org>
 <20130308070836.GB21589@arwen.pp.htv.fi>
 <513A1F55.1000800@wwwdotorg.org>
 <20130311065903.GE12860@arwen.pp.htv.fi>
 <513E0E33.1020105@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <513E0E33.1020105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 11, 2013 at 11:02:43AM -0600, Stephen Warren wrote:
> >> On 03/08/2013 12:08 AM, Felipe Balbi wrote:
> >>> On Thu, Mar 07, 2013 at 01:37:17PM -0700, Stephen Warren
> >>> wrote:
> >>>> On 03/07/2013 08:45 AM, Felipe Balbi wrote:
> >>>>> this will make sure that we have sensible names for all
> >>>>> phy drivers. Current situation was already quite bad with
> >>>>> too generic names being used.
> >>>>=20
> >>>> Is phy-$name specific enough? There are other types of PHY
> >>>> such as Ethernet, etc. What about phy-usb-$name?
> >>>=20
> >>> we will be creating a generic (kernel-wide) phy layer, so I
> >>> guess that matters very little. Specially since we don't want
> >>> to be differentiating PHYs by their subsystem and rather by the
> >>> IP name (which means phy-tegra, phy-samsung, phy-omap, are all
> >>> 'wrong', but there were no better names).
> >>>=20
> >>>> Venu, please comment on what conflicts, if any, this will
> >>>> cause with the patches you'll be sending to clean up the
> >>>> Tegra USB/PHY drivers. Thanks.
> >>>=20
> >>> BTW, let's stop with the whole dependency between PHY driver=20
> >>> cleanup and arch/arm/mach-tegra/, too many patches have gone=20
> >>> upstream bypassing my tree. What we should be doing is figuring
> >>> out how to remove arch/ dependencies so that patches can go
> >>> upstream and not cause conflicts.
> >>=20
> >> Unfortunately, there's no way to actually avoid the dependencies=20
> >> themselves. The DT bindings and EHCI/PHY controller split are
> >> wrong, and need work on both the DT and drivers to fix.
> >=20
> > but those changes don't need to come together, right ? I mean, for
> > the DT part you could add the bindings to driver A without removing
> > from driver B and span the changes accross 2 merge windows.
>=20
> There is only a single driver. It's being reworked to support the new
> binding.

alright, so what's the problem of adding new binding without removing
old one for v3.10 and remove old on v3.11 ? It gives a 3 month grace
period for all boards to be converted, at least.

--=20
balbi

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRPic9AAoJEIaOsuA1yqRECrYP+QE6/alX0wsCJ+pBVOy4ZQZA
J3X5I/WUE/K9SZtyjYSVy9qJ6RNRrDBKyujFVTiyQeRZIut1B6g3+7tnfQvy17sY
Ls624fMDbhYW7IQT9yvEWYV0RfdgNGsVQ8Y23mY6e1KDbs0sQLa6/q2FiubYYOTZ
orL3Iqw8GnywM7Y7bMDFjQdpFNXRkgIh/4ba52lW1XQ0NFcc7hod9esavCnwAAj/
no+3l157bMfkSb3RAwnFK0O8rhO9lALi+t0Byt93Zob1Vt7q6M5e93so2KAdVUIJ
wk35tChnEeXSSfS5u+Wy0SvUxCEh/xr10XlkGKgfSyo0aRftkIfftIDAoIEdibGC
c7mTsrF+SERsnLctXAgvVyGwaeBzYo+vodNMBaFBFu2rXuIBsOjEqROfCHIX7oGi
ac6KFHd9tgwOZbSBfYT1PC2bb3xyG4WYF/2SWziDt/xLu4METwA3bHBq5a5pV9Ya
Nv6Nwn73akKG7oxskA2sZxvevYbPWcgSp8Z9L6uwU9CJSCgtyjlA7P8GrZuARTfv
ib8gSEfGdMDDKU+RK2uX5lsJXVzP+pV8J+dHCSCcifV2vPZhrAaPDzWKqqm3czTb
0VFjNj1wAlUT9MEhuRUkp+m+uZ/YB1o0gzu7Z9JTUdMEbeqUHuwuVippEnw4R3ac
XtVOBgI9ZXhbiSrfXdvP
=U9Bk
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
