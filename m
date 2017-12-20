From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats
 on Tegra20/30
Date: Wed, 20 Dec 2017 21:16:41 +0100
Message-ID: <20171220201641.GB31757@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
 <20171220180119.GB8780@ulmo>
 <3924358d-ae3b-78a4-1227-164435add8d1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3924358d-ae3b-78a4-1227-164435add8d1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 11:01:49PM +0300, Dmitry Osipenko wrote:
> On 20.12.2017 21:01, Thierry Reding wrote:
> > On Wed, Dec 20, 2017 at 06:46:11PM +0300, Dmitry Osipenko wrote:
> >> Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") broke
> >> DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB format if
> >> requested FB depth is 24bpp. As a result, Xorg doesn't work anymore wi=
th
> >> both modesetting and opentegra drivers. On older Tegra's each plane has
> >> a blending configuration which should be used to enable / disable alpha
> >> blending and right now the blending configs are hardcoded to disabled
> >> alpha blending. In order to support alpha formats properly, planes
> >> blending configuration must be adjusted, until then the alpha formats
> >> are equal to non-alpha.
> >>
> >> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
> >>  drivers/gpu/drm/tegra/dc.h    |  1 +
> >>  drivers/gpu/drm/tegra/fb.c    | 13 -------------
> >>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
> >>  drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
> >>  drivers/gpu/drm/tegra/plane.h |  2 +-
> >>  6 files changed, 39 insertions(+), 31 deletions(-)
> >=20
> > This kept bugging me, so I spent some time looking at the blending
> > programming. I came up with the attached patch which seems to work
> > for all scenarios and is fairly similar to your patch. It has the
> > added benefit that we can keep support for more formats.
> >=20
> > Any comments?
> >=20
> > Thierry
> > --- >8 ---
> > From 3d2b7d1a9b8239dc6940477d8783461ac60783bc Mon Sep 17 00:00:00 2001
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Date: Wed, 20 Dec 2017 09:39:14 +0100
> > Subject: [PATCH] drm/tegra: dc: Implement legacy blending
> >=20
> > This implements alpha blending on legacy display controllers (Tegra20,
> > Tegra30 and Tegra114). While it's theoretically possible to support the
> > zpos property to enable userspace to specify the Z-order of each plane
> > individually, this is not currently supported and the same fixed Z-
> > order as previously defined is used.
>=20
> Perhaps one variant of implementing zpos could be by making overlays 'vir=
tual',
> so each virtual overlay will be backed by the real HW plane and we could =
swap
> the HW planes of the virtual overlays, emulating zpos.
>=20
> > Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") since
> > the opaque formats are now supported.
> >=20
> > Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/gpu/drm/tegra/dc.c    | 74 ++++++++++++++++++++++++++++++++++-=
--------
> >  drivers/gpu/drm/tegra/dc.h    | 13 ++++++++
> >  drivers/gpu/drm/tegra/fb.c    | 12 -------
> >  drivers/gpu/drm/tegra/plane.c | 41 ++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/plane.h |  3 ++
> >  5 files changed, 116 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index bc65c314e00f..07c687d7f615 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -168,32 +168,46 @@ static inline u32 compute_initial_dda(unsigned in=
t in)
> >  	return dfixed_frac(inf);
> >  }
> > =20
> > -static void tegra_plane_setup_blending_legacy(struct tegra_plane *plan=
e)
> > +static void
> > +tegra_plane_setup_blending_legacy(struct tegra_plane *plane,
> > +				  const struct tegra_dc_window *window)
> >  {
> > +	u32 foreground =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
> > +			 BLEND_COLOR_KEY_NONE;
> > +	u32 background =3D BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0) |
> > +			 BLEND_COLOR_KEY_NONE;
> > +	u32 blendnokey =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
> > +
> > +	/* enable alpha blending if window->alpha */
> > +	if (window->alpha) {
> > +		background |=3D BLEND_CONTROL_DEPENDENT;
> > +		foreground |=3D BLEND_CONTROL_ALPHA;
> > +	}
>=20
> I think dependent weight means that window doesn't have alpha transparenc=
y. So
> we should set the dependent_weight mode for opaque formats and alpha_weig=
ht for
> formats with alpha channel.

According to the TRM, dependent weight means that its weight will be 1 -
the sum of the other overlapping windows. And it certainly seems to work
that way in my tests (see below).

> If the above is correct, then I'm suggesting to not expose alpha formats,=
 we
> should properly test all combinations of blending of all the windows. In =
one
> case you could apply my patch for now and then me/you/we could work on a =
proper
> legacy blending implementation based on your patch. In the other case I c=
ould
> take your patch into v4 (cursor patch would have to be rabased in that ca=
se) and
> we will correct blending sometime later. I don't mind either case, up to =
you to
> decide.

The problem with not exposing alpha formats is that we either have to
omit them everywhere or implement complicated workarounds that make the
old hardware special. That's still true to some degree in this patch,
but I think it's fairly cleanly split out.

> Is there any ready-made testsuite for the DRM planes blending? Or you hav=
e made
> a test by yourself? In the latter case, could you please share the code s=
o that
> I could test it too without burden of writing testcases from scratch?

I've implemented a test for this in my fork of libdrm:

	https://cgit.freedesktop.org/~tagr/drm/

The kms-planes-blending test will fill three framebuffers with the
primary colors at 0.5 alpha and presents them in three planes that
overlay at the screen center.

I tested it on TrimSlice and the result looks correct.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6xSYACgkQ3SOs138+
s6GkHA/9FMkvSVWGnIrmntHSi0q4hqPyHKXNNpfKnZXhG0sLOXgaZliuc0wkgYk2
4CAu9rbxSJg6eu0PNao4QRMquf32ek8JZZhQtK5JS6RqxlKnab4PD+it9YRsrJwI
Cl+cEiSWmcCwcjPv8TP8ykgjFxRmZqNYQ3rPC6f2kixk6qyWsEVSQfNFQ75esKja
ukxFyXob+DexZE8ExuliBlOVb1dcLdDShKd7xkVuJmv+Vsvl2D6fiRw64h0Fg0U2
BSCl0Y4naGw63S5d0odYAFHsCiDzDEK8ZCRaS0JY4n4K9p/5SPkv0n+y2uCSjzLi
f5QzL3zD4CZRPYXx3EJUN9oJMv5N32dJdKxl0AFg6/7fpkyPoq5CSatVXlp/cBm2
89yIy/ausH6b0TDzsD+yFzkz3BHIFqhhaRdm2gHTEHJMhRRWITVhAYO75rqzqjeP
+g6926R2TKIxGkHwyle1i1K9ZDc5A+XFZgcoXEBOPrAbAHm7KoI3ODR8yD2sW0nx
VqdTdeKwzbjTzfYqu4y3ykSro0Uu68PuemYcwPXjxtb0EDaLSP309sSZQhkALDqu
IIXfV52U9PTMv6+a/4gcVLlcWi3fPtdhEtT1mgPbro5F6vFZOVjXMN2RLXIXlHiM
flcTTSOxsK+H+oGUB//6az8Iq4izRL3/rpq3tZ2ZFJmDqhDUr4U=
=8IzS
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
