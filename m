From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/15] drm/tegra/dc: Use drm_mode_get_hv_timing() to
 populate plane clip rectangle
Date: Fri, 24 Nov 2017 14:42:06 +0100
Message-ID: <20171124134206.GC15999@ulmo>
References: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
 <20171123190502.28449-13-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171123190502.28449-13-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2017 at 09:04:59PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>=20
> Use drm_mode_get_hv_timing() to fill out the plane clip rectangle.
>=20
> No functional changes as the code already uses crtc_state->mode
> to populate the clip, which is also what drm_mode_get_hv_timing()
> uses.
>=20
> Once everyone agrees on this we can move the clip handling into
> drm_atomic_helper_check_plane_state().
>=20
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

I assume you want to take this through drm-misc, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloYIa4ACgkQ3SOs138+
s6H2kg/9EAnp511oiRckqrdQM/wnNzH+TDNbJ3q9O8VFcb1I1sLz+3FC0f2ljVU2
a7qHnx+jVmiFlVqw/42Do9WYNQgISv9hzpnMfjR69tQIPpkSdciAZQm5EAzFrZWX
lAhLqePwOett5SiZyYemH0h9x8J6Ze9lTpP1Z5oN5/Sq9uGtv64BL9zl1gJiLSYN
AHqZWgzZYs/LDcnboWABvZSejnezSq3HFpVdR6i4UDmo8wRIR6MEVzlQWR408gk0
17owlkFMfcZr9sKMB91J1ynC1cgyVWM7IcRnYhoc0THQ+/Je6KTiNMGNL8iBNbaf
c1Ir4/+KNj8Z0/1t36bLpLE4X3ocOrSqD2wVwoEVyBBHTtDpsnnAzfT4oZx/6Hb1
DgZJN6v55wVfiGdmrvviiZH2k+kh+EXiE50zsmaTIMZecmuYwQ5xZ9j7j9liHX2H
LgR9cK+8pktXDy0VtoCJYzTcVImQ0raPRpXkvxW+8LpInslOVn5FhTiaTZdgYOVP
p72U6RXVbTGMYnCdqu9y1arfqKZQtno/RHRaavNzFRRdYBXICbH/3acibz16OhB4
Cy/mvxRfzgq85oUEfvMntbuaRFAp0JApuCMOSgdUZTmU1CVmwnc76Myxe9x0cEFn
GXh/pThPVTjLgi+mjoF4BSUKpS0OjcMDASsCqNxi86R9ekO7gT4=
=aU1l
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
