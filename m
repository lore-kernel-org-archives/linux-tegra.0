From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Exposing GPU information for userspace processes
Date: Wed, 17 Jul 2013 07:40:26 +0200
Message-ID: <20130717054024.GF11359@mithrandir>
References: <51DC8493.9090405@nvidia.com>
 <CAPM=9tyCTF_+Z0S0+TKxio94LCRpJeWJ6U2EcozUj8tjmMESNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPM=9tyCTF_+Z0S0+TKxio94LCRpJeWJ6U2EcozUj8tjmMESNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 04:01:49PM +1000, Dave Airlie wrote:
> On Wed, Jul 10, 2013 at 7:45 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > We are currently looking into exporting some information from the linux
> > kernel to userspace about the GPU. This information is specific per
> > board as the data can vary depending on the fuses burnt on the board.
> >
> > Right now we are leaning towards adding sysfs properties to our existing
> > nodes to share this information.
> >
> > Before we write up the patches and update our userspace apps to check
> > the new locations, we wanted to make sure there wasn't a more
> > accepted/proper way to export information already.
> >
> > Right now for instance we want to export a property to say how many
> > pixel pipes there are. This could then be exported in something like:
> >
> > /sys/bus/platform/drivers/gr3d/54180000.gr3d/num_pixel_pipes
> >
> > Is this the best approach to take right now or is there another way we
> > should export this and similar HW specific information?
>=20
> All the x86 GPU drivers use gpu specific get param ioctls for this so far.
>=20
> e.g. drivers/gpu/drm/radeon/radeon_kms.c:radeon_info_ioctl

If we want to add an IOCTL for it then we should take some care to craft
it properly so we don't have to keep adding new ones because we forgot
to provide half the information. Something like what radeon does looks
like it's extensible enough for us not to have to worry too much.

Thierry

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5i5IAAoJEN0jrNd/PrOhG7sP+wTsNWL5uS+8JhXO+7p8fl45
eBR9bpMTZ03+aJZp2ilvy/yl0pvfjOJ3tJjU+QIL1FhYg0KwxvzLjjze9Fpx7i5b
YPQEr1Hu6YQ+/wC+ExEjJLNWff5QCQnOhtgkqxyozSmo81QOLxdWqw6ySgKrwewi
wFOSsCOh0EQuzJcukzV/eV8QmZWRCUUmapq0pj0gAUQc0Q9+tLi2nodiBOGLHelS
E9AHRbZAl/V5rtkO2ht5QGn4VD/WyN1LmjwmnC6qnPMDJ1pjDcDOS/xRwnIeDOfd
OG0SwIS+45KR9T7+0aXs5IAGpp1XV/YdnnLu26S0l8fzxeiVdLCpONwF//3O+zHW
CnyAw/sfzse2Jrmi9/ge7ly2tuMPLHBPb1YdxHhKxMxsVTprFXOEBjyxlZ4Romr0
34cHTdR6zkPJPDGOMaCzhFdTucJ3nLMuBggVPzw8mJuC5BUKIia1AxBxW4GxbUEm
NfMHLDLS6NmxNWVPcD/70olKijx9vvBE7/TpHh2oafwr/k/DsBj3nMiWszGPdZoR
ilG9RtL0GgFXYqKc5RSYmVpsu1JD+d6uFmIywQr226mqnq0+Bm7BfvR3gV1oFYDD
DzvMpHKF4DqcdYQzyQ5Yhd+CCl3FtPVbuj9DS4hisPyelDvZAUAkaa57AJrQpNRY
wxu4lVVX4eASGMXrMAO5
=akaR
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
