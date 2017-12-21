From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats
 on Tegra20/30
Date: Thu, 21 Dec 2017 15:10:25 +0100
Message-ID: <20171221141025.GA18544@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
 <20171220180119.GB8780@ulmo>
 <3924358d-ae3b-78a4-1227-164435add8d1@gmail.com>
 <20171220201641.GB31757@ulmo>
 <0a19bbe0-5dd2-7929-c1e0-dfe6d3817d35@gmail.com>
 <20171220220230.GA15796@mithrandir>
 <2c52becd-f20e-599b-c421-bf4b18dda6bf@gmail.com>
 <a6644fc8-9c22-4b6b-1fec-82a7636bda65@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a6644fc8-9c22-4b6b-1fec-82a7636bda65-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2017 at 01:38:31AM +0300, Dmitry Osipenko wrote:
> On 21.12.2017 01:23, Dmitry Osipenko wrote:
> > On 21.12.2017 01:02, Thierry Reding wrote:
> >> On Thu, Dec 21, 2017 at 12:05:40AM +0300, Dmitry Osipenko wrote:
> >>> On 20.12.2017 23:16, Thierry Reding wrote:
> >>>> On Wed, Dec 20, 2017 at 11:01:49PM +0300, Dmitry Osipenko wrote:
> >>>>> On 20.12.2017 21:01, Thierry Reding wrote:
> >>>>>> On Wed, Dec 20, 2017 at 06:46:11PM +0300, Dmitry Osipenko wrote:
> >>>>>>> Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") =
broke
> >>>>>>> DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB for=
mat if
> >>>>>>> requested FB depth is 24bpp. As a result, Xorg doesn't work anymo=
re with
> >>>>>>> both modesetting and opentegra drivers. On older Tegra's each pla=
ne has
> >>>>>>> a blending configuration which should be used to enable / disable=
 alpha
> >>>>>>> blending and right now the blending configs are hardcoded to disa=
bled
> >>>>>>> alpha blending. In order to support alpha formats properly, planes
> >>>>>>> blending configuration must be adjusted, until then the alpha for=
mats
> >>>>>>> are equal to non-alpha.
> >>>>>>>
> >>>>>>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> >>>>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
> >>>>>>>  drivers/gpu/drm/tegra/dc.h    |  1 +
> >>>>>>>  drivers/gpu/drm/tegra/fb.c    | 13 -------------
> >>>>>>>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
> >>>>>>>  drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
> >>>>>>>  drivers/gpu/drm/tegra/plane.h |  2 +-
> >>>>>>>  6 files changed, 39 insertions(+), 31 deletions(-)
> >>>>>>
> >>>>>> This kept bugging me, so I spent some time looking at the blending
> >>>>>> programming. I came up with the attached patch which seems to work
> >>>>>> for all scenarios and is fairly similar to your patch. It has the
> >>>>>> added benefit that we can keep support for more formats.
> >>>>>>
> >>>>>> Any comments?
> >>>>>>
> >>>>>> Thierry
> >>>>>> --- >8 ---
> >>>>>> From 3d2b7d1a9b8239dc6940477d8783461ac60783bc Mon Sep 17 00:00:00 =
2001
> >>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>> Date: Wed, 20 Dec 2017 09:39:14 +0100
> >>>>>> Subject: [PATCH] drm/tegra: dc: Implement legacy blending
> >>>>>>
> >>>>>> This implements alpha blending on legacy display controllers (Tegr=
a20,
> >>>>>> Tegra30 and Tegra114). While it's theoretically possible to suppor=
t the
> >>>>>> zpos property to enable userspace to specify the Z-order of each p=
lane
> >>>>>> individually, this is not currently supported and the same fixed Z-
> >>>>>> order as previously defined is used.
> >>>>>
> >>>>> Perhaps one variant of implementing zpos could be by making overlay=
s 'virtual',
> >>>>> so each virtual overlay will be backed by the real HW plane and we =
could swap
> >>>>> the HW planes of the virtual overlays, emulating zpos.
> >>>>>
> >>>>>> Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats")=
 since
> >>>>>> the opaque formats are now supported.
> >>>>>>
> >>>>>> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> >>>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/tegra/dc.c    | 74 ++++++++++++++++++++++++++++++=
++++---------
> >>>>>>  drivers/gpu/drm/tegra/dc.h    | 13 ++++++++
> >>>>>>  drivers/gpu/drm/tegra/fb.c    | 12 -------
> >>>>>>  drivers/gpu/drm/tegra/plane.c | 41 ++++++++++++++++++++++++
> >>>>>>  drivers/gpu/drm/tegra/plane.h |  3 ++
> >>>>>>  5 files changed, 116 insertions(+), 27 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc=
=2Ec
> >>>>>> index bc65c314e00f..07c687d7f615 100644
> >>>>>> --- a/drivers/gpu/drm/tegra/dc.c
> >>>>>> +++ b/drivers/gpu/drm/tegra/dc.c
> >>>>>> @@ -168,32 +168,46 @@ static inline u32 compute_initial_dda(unsign=
ed int in)
> >>>>>>  	return dfixed_frac(inf);
> >>>>>>  }
> >>>>>> =20
> >>>>>> -static void tegra_plane_setup_blending_legacy(struct tegra_plane =
*plane)
> >>>>>> +static void
> >>>>>> +tegra_plane_setup_blending_legacy(struct tegra_plane *plane,
> >>>>>> +				  const struct tegra_dc_window *window)
> >>>>>>  {
> >>>>>> +	u32 foreground =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
> >>>>>> +			 BLEND_COLOR_KEY_NONE;
> >>>>>> +	u32 background =3D BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0) |
> >>>>>> +			 BLEND_COLOR_KEY_NONE;
> >>>>>> +	u32 blendnokey =3D BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
> >>>>>> +
> >>>>>> +	/* enable alpha blending if window->alpha */
> >>>>>> +	if (window->alpha) {
> >>>>>> +		background |=3D BLEND_CONTROL_DEPENDENT;
> >>>>>> +		foreground |=3D BLEND_CONTROL_ALPHA;
> >>>>>> +	}
> >>>>>
> >>>>> I think dependent weight means that window doesn't have alpha trans=
parency. So
> >>>>> we should set the dependent_weight mode for opaque formats and alph=
a_weight for
> >>>>> formats with alpha channel.
> >>>>
> >>>> According to the TRM, dependent weight means that its weight will be=
 1 -
> >>>> the sum of the other overlapping windows. And it certainly seems to =
work
> >>>> that way in my tests (see below).
> >>>
> >>> Yes, and you are hardcoding the blending modes regardless of the actu=
al plane
> >>> format. So even if underlying window has alpha format, it will be tre=
ated as it
> >>> is opaque.
> >>
> >> Ah yes, indeed. The patch currently assumes that if the current plane
> >> has an alpha component, then all the others will, too. That can probab=
ly
> >> be done fairly easily by looking at the current atomic state and
> >> inspecting the pixel format for each plane on the same CRTC. Let me ta=
ke
> >> a stab at that tomorrow.
> >=20
> > Okay, please push patch to the public repo once it is ready and let me =
know.
> > I'll rebase cursor patch on it.
> >=20
> >> I'm wondering if we can deal with zpos, too, if we're already going
> >> through the trouble of looking at all planes involved. I think we can
> >> simply permute the WIN_BLEND register writes depending on the Z-order
> >> to implement proper zpos support.
> > I think we will have to permute the whole window state, not only the WI=
N_BLEND
> > register.
> >=20
> > Also I'm not sure how to make topmost window opaque and underlying wind=
ows
> > transparent, will have to check how blending works. Maybe it not possib=
le at all..
>=20
> Although it is simple to implement using the fixed weights for 2WIN cases=
, but
> then we will have to enhance the legacy blending code a tad to handle thi=
s case
> properly. You'll have to do quite a lot for tomorrow ;) Alternatively you=
 can
> still apply my patch that drops alpha formats on T20/30 and we will try to
> implement alpha + zpos for 4.17.

I think I finally nailed this. Just sent out a v2 and updated my test
program to use different formats for each plane. I tested all opaque &
alpha combinations and it all looks correct now.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo7wM4ACgkQ3SOs138+
s6EYYQ/+LMN6Y+2+fvNiT1Kaw1RvqhQipns5QCCs2LWYCPMgF0jpJUMJbih3/3Ou
YqGhiv/V+XDsgGx/DCOrwvGbNP+T34h7J9Qh6+cgO4Gp17nimg5zd0t9aDfqzxBP
zhzzFN0U4zpyhMXnyk48LWQV0nYrYlEmQElYm/c59IHoShFyIyEcrxpWlQVIjJB1
8dD1ukfuDokS/aYl5JHFA9651QG6Sh8QnstS76JihgcuQs1TL1o0JQCuFekDxEeU
cZBBHxVIrNktwNxauAJOS5f2TwjRUzPfEvjjaXhVONJQmJFk76bkk8Sny7QCPUtU
+7gT4xSXptkQoVnfHegyvIuX2BA0LeFUx8gW2cxqWfsgYrbY0FmCACW3PsohEswU
HwXJrw4zrC//9aQ+7z4XMVpTdKo9kQ4hcznuIJTjLSL7EXpMNkqqyef0sEqrNR17
DhBJhKeav3CT9We59OzRKL1fSQfLaFiQJ+u96PMIdR44pZiL4YwhMLASTrp9CaPD
ktq2YU1tmOCD2CoqqKf1daZJqx8+uJ2K/eki1EH9BnhZ3rAP6g5eBlntlsbpzUA9
FUdul6E3epPQTnuKfl/u1FmeowONfEiFnH/Y9+7APS/hX+quNSbuhat1t/8bQAdY
sEkBgYdEgwBjGAl0WvUgc1wrWSeKP8KsV/aQh7Dkke6ebb6QI74=
=hFnR
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
