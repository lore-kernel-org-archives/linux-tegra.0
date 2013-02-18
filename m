From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tegra: Add plane support
Date: Mon, 18 Feb 2013 07:40:02 +0100
Message-ID: <20130218064002.GA30856@avionic-0098.mockup.avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
 <1360771506-17849-3-git-send-email-thierry.reding@avionic-design.de>
 <5121C500.3000000@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5121C500.3000000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 02:06:56PM +0800, Mark Zhang wrote:
> On 02/14/2013 12:05 AM, Thierry Reding wrote:
> > Add support for the B and C planes which support RGB and YUV pixel
> > formats and can be used as overlays or hardware cursor. Currently
> > only 32-bit RGBA pixel formats are advertised.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> [...]
> > +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc=
 *dc)
> > +{
> > +	unsigned int i;
> > +	int err =3D 0;
> > +
> > +	for (i =3D 0; i < 2; i++) {
> > +		struct tegra_plane *plane;
> > +
> > +		plane =3D devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
>=20
> Using "devm_kzalloc" here seems like not a good idea. Everytime plane
> disable or crtc disable, we should free "struct tegra_plane" which is
> allocated here. But the memory which devm_kzalloc allocates is only
> freed when the driver detach. This makes lots of memory can't be
> recycled when the plane enable/disable frequently.

Why would we want to do that? I don't think doing so would even work,
since the planes are resources that need to be registered with the DRM
core and therefore can't be allocated on-demand.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRIczCAAoJEN0jrNd/PrOh/HEP/jciN9arLGWfkLFtWJJ7QASU
URV/6ENLZbEE+pl8VCuXnSP2vvrSh2bl22s/TTjayawu/t7t4deqDwcvSC352cQI
X/pQduZiL/7PRgA7YITTbzUyZ22eu49atYcAJAV2kk8YDYObD78XLI+Nmi4lSXai
O1V2qHlWK7Kx0w/NBsbcHBfAqM9hmEsvS/PK+muPn1Zjmcn87Epmk3cr8wBzse01
zyhzX/DMl6Vkccd9ypqwKGxrMlmkvQWyPFFNqZ86y1MKne8GoWw2ZlQg9PV5loVk
MRxChN70U2OIywRxXsWHLJJ0njSTgdZpJENTwlVYQHAPLp4tNf5CO7CDCNDGgtC2
rpfxU/VPBJUb/b0b3HaKOPOk8oOlbi63kROgC+kvtLoiAA+xizGwwPiSVCgTJuFU
68oIbRk1Br4mG19HIrbHcPIl5LVWcWGsxEE2aixBORBPpBWs3XRjl8Hgw/+qXEwe
1hvNfoMN2d3JSchZ53vMKdEOw3QcCZAVL+4BzCX2fMFASICi6CUb9zmnfjbHOP3w
FfQ64laxPJIf8xndNf2LIeyAXvlW0tdl5c8rBBOJZnVGz7hIWQ7iP/4heLEiduCC
Sl0KgLklmxNIUSpL+qKdhEaanuJM7IEvt112ZJ78aaJX3ZqyvuCRmUGzADv88NA7
NoDHUSypd0er7m12J7aE
=+ep4
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
