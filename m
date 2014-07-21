From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] staging/nvec: Pass proper resource to mfd_add_devices()
Date: Mon, 21 Jul 2014 23:49:38 +0200
Message-ID: <20140721214936.GD12076@mithrandir>
References: <1405943561-2656-1-git-send-email-thierry.reding@gmail.com>
 <20140721220136.5bd54deb52f7717d8880b11c@gmx.de>
 <20140721213915.GA8168@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140721213915.GA8168-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 02:39:15PM -0700, Greg Kroah-Hartman wrote:
> On Mon, Jul 21, 2014 at 10:01:36PM +0200, Marc Dietrich wrote:
> > Hi Thierry,
> >=20
> > On Mon, 21 Jul 2014 13:52:41 +0200
> > Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >=20
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > The mfd_add_devices() parameter takes a struct resource * as fifth
> > > argument, but the nvec driver passes in a void __iomem *. The driver
> > > gets away with it because none of the subdevices ever directly access
> > > the registers.
> >=20
> > you are right, this one looked bogus.=20
> >=20
> > > While at it, use platform_get_irq() instead of platform_get_resource()
> > > to get the device's interrupt. This makes it easier to pass in the
> > > register region since the variable is no longer reused.
> > >=20
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Alternatively we could simply pass NULL into mfd_add_devices(), which
> > > might be a slightly more accurate representation of what's going on.
> > >
> > > Marc, Greg, any preferences?
> >=20
> > I just tested with NULL as base and it seems to produce no harm. Even
> > if we may get rid of mfd_add_devices in the future, passing NULL is
> > cleaner for now and no children will ever make use of it. So please send
> > a new version with this change.
> >=20
> > Otherwise, thanks for looking and cleaning up.
>=20
> Ok, can I get your ack for this patch then?

I'll resend a patch which passes in NULL as base tomorrow as requested
by Marc.

Thierry

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTzYrwAAoJEN0jrNd/PrOhOE0P/2ztVGFvcczZv+QhfM39yCcH
J7yZG3IlL8D8ns9wq6IPtLYq39BhAxyp1ZTYNQP/9B4SHTZdpvykWRzmveFLFlo+
ONg/vLXLm+R78xfM2jF+7+UH/tOYtBEkad9hIXsDAcHXmIYiuoSRnqxEuzlMg4DG
Kla2YhcHnciQqjMv8avQ4zUt7lf0WQi2KlRQodOrAFm0pJe5bAJb7wRFRp8RUkDA
ajwvooOFihh4laTWbJcni2F63czfBfA65BCX4PT8iX2ZiMiuxjzTbtPJeCxQdL92
Qkvhge3rueT+4o62AaM2cgLjeBTleKbPzt5ZEWX9dJk+4G4QqTsMM/ixKmeGvxjl
ZnN0iy6fM8hP0u9d1g6UBeOxRZ6j2k+jIZUxotguzL9WnJpj54X1LmIhUrVYwYcD
1n7kwp7zlkcGg2TvL/YBNJVHHLzzv/KPlqXdsyt3NgkY+Bpw4GGiVLNfWkzJ3XGE
E+AhXPytUXz8BbnhnULyUfLrJd0OR2J+t7d6uSZ6t+Obef6mbwJnnptJ/fDdzqc2
/mKsFgA4KHBrPYgg5M22FHoKn9SbjqzVPKoQtOfbAnX244bQ/uuW6jcAD+6p+5km
18g3obC7VGecn9mBU9uOVTrEFQhkk3cotMPsMSebkZq23ClVQFOhO8MeaP/FEozH
pc8U0+vX47dVsacKXP5N
=Mu1q
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
