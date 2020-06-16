From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
Date: Tue, 16 Jun 2020 18:13:41 +0200
Message-ID: <20200616161341.GA3009091@ulmo>
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
 <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c34c97ab-08de-341e-05e5-77e2651d956f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 06:54:35PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 15:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> > have a zpos property") a warning is emitted if there's a mix of planes
> > with and without a zpos property.
> >=20
> > On Tegra, cursor planes are always composited on top of all other
> > planes, which is why they never had a zpos property attached to them.
> > However, since the composition order is fixed, this is trivial to
> > remedy by simply attaching an immutable zpos property to them.
> >=20
> > Changes in v2:
> > - hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >=20
> > Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
> >  drivers/gpu/drm/tegra/hub.c | 2 +-
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..85408eed4685 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create=
(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> > -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> > +	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> > =20
> >  	err =3D drm_plane_create_rotation_property(&plane->base,
> >  						 DRM_MODE_ROTATE_0,
> > @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_crea=
te(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> > +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> > =20
> >  	return &plane->base;
> >  }
> > @@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_=
create(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> > -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> > +
> > +	if (!cursor)
> > +		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> > +	else
> > +		drm_plane_create_zpos_immutable_property(&plane->base, 255);
>=20
> On T20/30 we're are setting the plane's type to CURSOR because we want
> to use one overlay plane for the mouse cursor. Nevertheless, it's still
> a generic overlay plane that can change its z-position, and thus, it's
> wrong to make zpos immutable here.

But it doesn't really make sense for the cursor plane to change z-
position, even if it's technically possible. We do want it to always be
on top anyway. Doing it this way makes the cursor behave the same way
irrespective of the Tegra generation that we're running on.

Yes, that may not fully expose the capabilities of the hardware, but we
are already restricting the hardware capabilities by exposing the
overlay plane as a cursor plane in the first place.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o77IACgkQ3SOs138+
s6E4lQ//Y2TkGcKv0aei1ScJVjYGc7wbH0fWvmlFFsq9a2HvLqKqCY+4F9shI77V
6x/k2sjQI2tL6nD8n5Qeu5JGMkc6dREPenIxkJ4HYiqlkqBv/WjsGQmh04w0Gi1W
Z++iUQz46Wn/AdI0/fl16458One4/2+63VBf4q9UzSu2yeTmNmE2o8copJOpbm+W
sWLy3CSEI7XgIjAbOcXE0zcyuFeo6Zr96owhibYhE2ClEh6dftk98/eLp1k+ZCFY
ZloGWglLE36g6ttnXoVS//KTSwxUS6Ll89GZbQrXU2ffmlsLFOJAcVsDZucGuvQB
GhjMOO174LDGASkCSYanKxY6c71R2jilxxHsk6M+7HsD39eedxSj8LcElgVm+Bfg
Hj2Udt/UbKQp7f0jnSbjA4vA/g++T1igUkTXh/LtEw8KgILiRKfE0JV8nYc5VIzX
3of+6QTQmhdD4Di2aBVYEbP+NmwGX9d9cfhbm5XI/0qBR3U6v9LRzpsJheq1cB6L
8QCwoO5x1fumcW81125BS0/P24uBSfpeLH8kg2/dvYPg5nUSuXy/kV8ceApvzFMR
Qs8NTlyqYvVQ3m9OZn3B35XUUJCMup2wDG/z2d5ql62FCkwqPDS5AVP48W/B5jQ9
RETTZln2gfpIvBGQfBH9jryKGeAHDCd2/2JPhtUCp5slUIAx32s=
=Pe8q
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
