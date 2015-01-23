From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/36] drm/atomic: Add drm_atomic_plane_get_crtc_state()
Date: Fri, 23 Jan 2015 10:32:20 +0100
Message-ID: <20150123093219.GB3835@ulmo>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-6-git-send-email-thierry.reding@gmail.com>
 <20150120111011.GX10113@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150120111011.GX10113-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 12:10:11PM +0100, Daniel Vetter wrote:
> On Tue, Jan 20, 2015 at 11:48:24AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This function is useful to obtain the state of the CRTC that a plane is
> > being attached to.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  include/drm/drm_atomic.h | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >=20
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 51168a8b723a..ddca107e5cce 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -75,4 +75,25 @@ int __must_check drm_atomic_check_only(struct drm_at=
omic_state *state);
> >  int __must_check drm_atomic_commit(struct drm_atomic_state *state);
> >  int __must_check drm_atomic_async_commit(struct drm_atomic_state *stat=
e);
> > =20
> > +/**
> > + * drm_atomic_plane_get_crtc_state - obtain atomic state of the CRTC t=
hat a
> > + *     plane is being attached to
> > + * @state: atomic state of plane
> > + *
> > + * Getting the atomic state of the CRTC that a given plane being attac=
hed to
> > + * is non-trivial. We need to look at the global atomic state that the=
 plane
> > + * state is part of and extract the CRTC state using the CRTC's index.=
 Using
> > + * the drm_atomic_get_crtc_state() helper we make sure to acquire the =
proper
> > + * locks, too.
> > + *
> > + * RETURNS:
> > + * The atomic state of the CRTC that the plane is being attached to, o=
r an
> > + * ERR_PTR()-encoded negative error code on failure.
> > + */
> > +static inline struct drm_crtc_state *
> > +drm_atomic_plane_get_crtc_state(struct drm_plane_state *state)
> > +{
> > +	return drm_atomic_get_crtc_state(state->state, state->crtc);
>=20
> Hm, imo open-coding this is totally ok. Actually better since state->crtc
> might be NULL, and hiding that isn't a good idea.
>=20
> If you have a atomic_plane_disable hook then ->crtc is guaranteed to be
> non-NULL in atomic_plane_update, but being explicit here is imo a feature.
> So nacked from my side.

I've dropped this patch and open-coded this call in patch 34/36.

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUwhUjAAoJEN0jrNd/PrOhs44QALOBOZoyw01NOIngLjTZ6uVj
fY7D/2d53l4tnKS7aWGkrl6uYPseGyo+lO5IjMFY2wONYRdkzkazmozzQoSR/+YF
mwd5JO2mz9cPSPuj8clIcfLQvQLUA63XTSCj5sF1ZrDA/eikV375KjzFpOZH5H9M
fKfkFyZLAU6KcV4ya0qc1RFUzPBkff1RcG+FiJpTgaJbBzfwa99NmplStQwwueE0
sLxrf1pvMk7Rky207ggPxa4acd3jA3D17vrg0FZFnhpQ0kcvh4TF9Ri2TDiv9y1T
+BLrdkyopba+EGPp81/oWRCoeZloPHtSTgu3nCBqU8RkhCHn25WF9CCnU3JbC/dB
L37izaezkke/cgHxqs++ZJ7JBDZ1+6nWtiFKCjp+kwAtnDL9JRK+17Ao9ulVps0s
f7DIVUvx+tLWsAvh+CvktF/MmyiyA0/gCVuh4sK4KZodQSbYQ2OEIWdzwc3TXmWK
m7MM3p+cGpYO65O6DL4HnGwvrzTHG0mpOwuMK8V4EgAcIJn9HP7wWpQSfA54rp7M
tkwiUa89Mi5NoZmRSxjPPl7s20pc62Fwjsj4c0AQqZGlbDTmfD2p/x/3/tZm+4Oq
y/Cuv2PE1UsrsrHdVj00EYID6FGn+npTvtoMJBw+7Bn28g48xoSev+VLNVnSGA74
WGX0pX/HBTKFPiyTosCD
=ubjt
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
