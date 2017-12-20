From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats
 on Tegra20/30
Date: Wed, 20 Dec 2017 23:02:32 +0100
Message-ID: <20171220220230.GA15796@mithrandir>
References: <cover.1513783738.git.digetx@gmail.com>
 <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
 <20171220180119.GB8780@ulmo>
 <3924358d-ae3b-78a4-1227-164435add8d1@gmail.com>
 <20171220201641.GB31757@ulmo>
 <0a19bbe0-5dd2-7929-c1e0-dfe6d3817d35@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1522637488=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <0a19bbe0-5dd2-7929-c1e0-dfe6d3817d35@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1522637488==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 12:05:40AM +0300, Dmitry Osipenko wrote:
> On 20.12.2017 23:16, Thierry Reding wrote:
> > On Wed, Dec 20, 2017 at 11:01:49PM +0300, Dmitry Osipenko wrote:
> >> On 20.12.2017 21:01, Thierry Reding wrote:
> >>> On Wed, Dec 20, 2017 at 06:46:11PM +0300, Dmitry Osipenko wrote:
> >>>> Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") bro=
ke
> >>>> DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB format=
 if
> >>>> requested FB depth is 24bpp. As a result, Xorg doesn't work anymore =
with
> >>>> both modesetting and opentegra drivers. On older Tegra's each plane =
has
> >>>> a blending configuration which should be used to enable / disable al=
pha
> >>>> blending and right now the blending configs are hardcoded to disabled
> >>>> alpha blending. In order to support alpha formats properly, planes
> >>>> blending configuration must be adjusted, until then the alpha formats
> >>>> are equal to non-alpha.
> >>>>
> >>>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
> >>>>  drivers/gpu/drm/tegra/dc.h    |  1 +
> >>>>  drivers/gpu/drm/tegra/fb.c    | 13 -------------
> >>>>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
> >>>>  drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
> >>>>  drivers/gpu/drm/tegra/plane.h |  2 +-
> >>>>  6 files changed, 39 insertions(+), 31 deletions(-)
> >>>
> >>> This kept bugging me, so I spent some time looking at the blending
> >>> programming. I came up with the attached patch which seems to work
> >>> for all scenarios and is fairly similar to your patch. It has the
> >>> added benefit that we can keep support for more formats.
> >>>
> >>> Any comments?
> >>>
> >>> Thierry
> >>> --- >8 ---
> >>> From 3d2b7d1a9b8239dc6940477d8783461ac60783bc Mon Sep 17 00:00:00 2001
> >>> From: Thierry Reding <treding@nvidia.com>
> >>> Date: Wed, 20 Dec 2017 09:39:14 +0100
> >>> Subject: [PATCH] drm/tegra: dc: Implement legacy blending
> >>>
> >>> This implements alpha blending on legacy display controllers (Tegra20,
> >>> Tegra30 and Tegra114). While it's theoretically possible to support t=
he
> >>> zpos property to enable userspace to specify the Z-order of each plane
> >>> individually, this is not currently supported and the same fixed Z-
> >>> order as previously defined is used.
> >>
> >> Perhaps one variant of implementing zpos could be by making overlays '=
virtual',
> >> so each virtual overlay will be backed by the real HW plane and we cou=
ld swap
> >> the HW planes of the virtual overlays, emulating zpos.
> >>
> >>> Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") si=
nce
> >>> the opaque formats are now supported.
> >>>
> >>> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> >>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/drm/tegra/dc.c    | 74 +++++++++++++++++++++++++++++++++=
+---------
> >>>  drivers/gpu/drm/tegra/dc.h    | 13 ++++++++
> >>>  drivers/gpu/drm/tegra/fb.c    | 12 -------
> >>>  drivers/gpu/drm/tegra/plane.c | 41 ++++++++++++++++++++++++
> >>>  drivers/gpu/drm/tegra/plane.h |  3 ++
> >>>  5 files changed, 116 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> >>> index bc65c314e00f..07c687d7f615 100644
> >>> --- a/drivers/gpu/drm/tegra/dc.c
> >>> +++ b/drivers/gpu/drm/tegra/dc.c
> >>> @@ -168,32 +168,46 @@ static inline u32 compute_initial_dda(unsigned =
int in)
> >>>  	return dfixed_frac(inf);
> >>>  }
> >>> =20
> >>> -static void tegra_plane_setup_blending_legacy(struct tegra_plane *pl=
ane)
> >>> +static void
> >>> +tegra_plane_setup_blending_legacy(struct tegra_plane *plane,
> >>> +				  const struct tegra_dc_window *window)
> >>>  {
> >>> +	u32 foreground =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
> >>> +			 BLEND_COLOR_KEY_NONE;
> >>> +	u32 background =3D BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0) |
> >>> +			 BLEND_COLOR_KEY_NONE;
> >>> +	u32 blendnokey =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
> >>> +
> >>> +	/* enable alpha blending if window->alpha */
> >>> +	if (window->alpha) {
> >>> +		background |=3D BLEND_CONTROL_DEPENDENT;
> >>> +		foreground |=3D BLEND_CONTROL_ALPHA;
> >>> +	}
> >>
> >> I think dependent weight means that window doesn't have alpha transpar=
ency. So
> >> we should set the dependent_weight mode for opaque formats and alpha_w=
eight for
> >> formats with alpha channel.
> >=20
> > According to the TRM, dependent weight means that its weight will be 1 -
> > the sum of the other overlapping windows. And it certainly seems to work
> > that way in my tests (see below).
>=20
> Yes, and you are hardcoding the blending modes regardless of the actual p=
lane
> format. So even if underlying window has alpha format, it will be treated=
 as it
> is opaque.

Ah yes, indeed. The patch currently assumes that if the current plane
has an alpha component, then all the others will, too. That can probably
be done fairly easily by looking at the current atomic state and
inspecting the pixel format for each plane on the same CRTC. Let me take
a stab at that tomorrow.

I'm wondering if we can deal with zpos, too, if we're already going
through the trouble of looking at all planes involved. I think we can
simply permute the WIN_BLEND register writes depending on the Z-order
to implement proper zpos support.

Thierry

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo63dAACgkQ3SOs138+
s6HgYxAAgwsUniLfygLqyDgONkwq68JtQe4Y5qEUfBZT8ZiIDeJToGwsLRqqMFNo
fdLhj85rnEQuWidfYSWopsd2dugkGHDM5sbm7pXYTXUpHkgE/Dg7BmHGttjGxAFJ
aPM5R9WU5Ceq4FHPb6eRLOTWXxNQfwV5ldqnbbsmVorAWp9EriK+dbxiPWTabJUD
TZ8RBWeqQU2IhcAtKS9EfQHU5QwdVyREy6kR29A1CwUwVgAMfSLVSRdxh83KNvK2
EhuGtmKZvLO+a173ctYQSr21Dqj3ovtoPQ9aK07/xxWFLsWSMEN0CMWj7BwUmBlt
zkNhvZcaBTvdzoKEfx7HPiuT6zIaBlIK6gnfJkzIm8aEMwDDqJNWcok6kdMC2MB/
xvupUM5ANEf5A+9NSSgCW15j+S9fGmULcHpOR5vS725/4QqM0O62EeC1KF9fCRdM
SAoekrijm1kKE8VLpCYrjzGb6yrtoNMQHvNBa3EhILjy1FWwLCmL2iZaHLG4MCEL
ZSTuYZW2K9AgDwfGheaZMf1Jxog7x+R90V2NcHhdSCRK8GglnN1FHAtMPKcJRpb9
DebkceoXRpPbHUOFEdSG4jLl0Hp87M9izCkYCCClDEvjpmGa/6wQMcQ0ehXw1kF5
UKWIINRFEla49pxhxDZ8RBK9aCkl0MSp4P0VMly6wGdpsm3/wBM=
=bVan
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

--===============1522637488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1522637488==--
