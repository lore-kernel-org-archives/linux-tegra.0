From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Date: Wed, 17 Jun 2020 16:10:15 +0200
Message-ID: <20200617141015.GB3536291@ulmo>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8e45b425-b667-433e-2074-7a058329f5c2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
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
> > v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
> > v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
> >=20
> > Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/dc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..04d6848d19fc 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_crea=
te(struct drm_device *drm,
> >  	}
> > =20
> >  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> > +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
> > =20
> >  	return &plane->base;
> >  }
> >=20
>=20
> Looks nice, thanks! Since you dropped all other zpos changes for other
> planes and given that the other planes have 255 for the max zpos, what
> about to set the cursor's zpos to 256?

I'd prefer to have all of the planes' zpos within the same range. By
default the other planes will be on the very bottom end of that range
and the atomic core will normalize the zpos for all planes anyway, so
the cursor plane will end up with a very small normalized zpos in the
end.

The zpos documentation already mentions that the behaviour is undefined
if two planes have the same zpos value, so I think userspace is going to
know how to set these anyway.

It might be worth to do a follow-up patch that is smarter about setting
the range of valid values. 0-255 is true on later chips where we
actually have a proper "layer depth" register field and I wanted this to
be uniform across all generations. Other drivers seem to set the upper
limit on the zpos range to be equal to the number of planes available,
so that there aren't potentially big gaps in the numbering. That said,
since the core already normalizes the zpos for us, I don't see a big
benefit in explicitly clipping the range.

Thierry

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJEcACgkQ3SOs138+
s6G60xAAwyap6WO12SudpUTIDTnWEapALfkB70KdeN1LlQXgSqGE+QK64mOlno/i
yG1WcmUph/G1s+tK45jVKr2d0OKUFMqGeeB5h0rAjGYIOQN8DAh8wOidleeCowY2
YVHAOSzJtoF/+ovHVNEOOet7C1OX7pUpUz21gQ4TKgydJ9P5DtbwCP67mHCuEx+6
e6oJZYR4UZDURiebgB9UmwomXm2dka82e28vrcrkeX+2zra/vO97e4bNQA2Dl1BX
qPrPFEIfWoch8s0giWz79p5FK80AuqjXVL1Fks6vG74E5DzL0F6BPXryFPKqg8XS
IvqFQ0ATokM+ZTzf6lSUlBfH7HffnSDtZiQP5dsaMVFDDjqLCTlB2JD0hKBiffzg
cqcHjM4DvjGYBrPtEe6SuIiARr9/DBTPXzcqFTtPcuGxmalefHZnMc4RD3comOSI
b/fpB21n3RY7lQC44j3G4m184GQv8MPuzvfvBzTRgLwxJBnbI39JnNeOEh8Oiybl
3fyxnbV72Nimsrd7dXV2NnhFWprzAmWN0IODAiGRGfSKIGLdh+h3Xik0ufOyLGBA
e3mYEPFmJ8AKx+AUIiYQ4Y492Rq1PviyGW/5iWG7tK7t/bedWOOGObHOk5fT+sEN
kh66ifmz13uHGSQuJwLbDylto3LpqlMwHxHMBKkBbbypA2DnR00=
=ASa+
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
