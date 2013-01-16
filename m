From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 19:45:40 +0100
Message-ID: <20130116184540.GB28660@avionic-0098.adnet.avionic-design.de>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
 <20130116152355.GA965@avionic-0098.adnet.avionic-design.de>
 <1358352210.3157.8.camel@tellur>
 <87fw21qctl.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87fw21qctl.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 07:04:22PM +0200, Jani Nikula wrote:
> On Wed, 16 Jan 2013, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> > Am Mittwoch, den 16.01.2013, 16:23 +0100 schrieb Thierry Reding:
> >> On Wed, Jan 16, 2013 at 03:36:41PM +0100, Lucas Stach wrote:
> >> [...]
> >> > @@ -705,7 +705,7 @@ static int standard_timing_level(struct edid *ed=
id)
> >> >   * monitors fill with ascii space (0x20) instead.
> >> >   */
> >> >  static int
> >> > -bad_std_timing(u8 a, u8 b)
> >> > +bad_std_timing(const u8 a, const u8 b)
> >> >  {
> >> >  	return (a =3D=3D 0x00 && b =3D=3D 0x00) ||
> >> >  	       (a =3D=3D 0x01 && b =3D=3D 0x01) ||
> >>=20
> >> Was this intended to go in here?
>=20
> [...]
>=20
> > Yes, probably I should have been a bit more elaborate in the commit
> > message. Both hunks are intentional, as I looked at how those functions
> > in the environment of the edid handling funcs are used and added const
> > where appropriate, not just strictly to the struct edid pointer.
>=20
> Please, let's not start constifying non-pointer parameters and local
> variables.

I agree. I don't think there's any advantage in making a and b const.

Thierry

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9vVUAAoJEN0jrNd/PrOhwWIP/3Z6TSM2V8lxmB6BBvfZnszq
tWIMXH0W/s7oKlEU3Hap50/UhlJxto9M9KxuAfci23Nt6CrsG18tdMDBlWZlQV+m
QUXlJ9C3PReTluVnQ8Uh7EXN1qivKpnuPZ6Bcr8pi/mYM0FP6Ln99JxOjbB2dPzG
WeC5d+swPNYpq4FZOcTzjyluwJjGvDzgnSaS09QE8ZcgrE5PUaxd7VFXD7oQHCwu
nlTfV+dMxBBKgW7zi/lMJ8ZvXYvpsY5kcZKyovdc/6JMbrxbf3hqDtdYnZK7MSO7
eXSRevyY20vqs9ouRVFJHICgFq8Ge85YpLnNHA6tlhOIcNE/gLXr9OL9dQYI3WFt
YCmdrnOwsPx7DoHUV4OCRREZrkBoqsPdDfyORZ/l5fZaF0vihcSoWYnMHTgIVDTo
5BrR1TjX0dZQgCHEJeI8lppVDYXxAi7CLOe1VY7S12CXjYdz4YbO9aHwI54hwyAS
malBmhHxr0UK1rXrOr2EMTP+02FvuJz0qfI1rKQrEjjDhiQal3ygK4CLFEfkCTKd
me4vxHkLV1y8er8Fl4eSI3Pvnnh3YjWB+VIgpDsn7SwcbGHmy0NFXIAnOr/Xx8KF
LCbcv+ts026B6uQfDkEvU6vkXTp/bkBYeN2RmKLZtkykDCs84HWFQ/zg8PldNYe8
fJyofrXazCGt6Q6VJPsC
=enzy
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
