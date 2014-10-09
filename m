From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Thu, 9 Oct 2014 12:08:12 +0200
Message-ID: <20141009100811.GB3718@ulmo.nvidia.com>
References: <542B9A0E.7020206@samsung.com>
 <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
 <542D13CC.5000304@samsung.com>
 <542D2E7C.1020904@samsung.com>
 <542D3C96.7000400@samsung.com>
 <54362066.9000504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54362066.9000504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2014 at 02:43:02PM +0900, Alexandre Courbot wrote:
> On 10/02/2014 08:52 PM, Andrzej Hajda wrote:
> >Hi,
> >
> >+CC possible victims
> >
> >On 10/02/2014 12:52 PM, Inki Dae wrote:
> >>On 2014=EB=85=84 10=EC=9B=94 02=EC=9D=BC 17:58, Joonyoung Shim wrote:
> >>>Hi Andrzej,
> >>>
> >>>On 10/01/2014 05:14 PM, Andrzej Hajda wrote:
> >>>>The patch disables vblanks during dpms off only if pagefilp has
> >>>>not been finished. It also replaces drm_vblank_off with drm_crtc_vbla=
nk_put.
> >>>>It fixes issue with page_flip ioctl not being able to acquire vblank =
counter.
> >>>This problem isn't related with pageflip, it just causes from
> >>>7ffd7a68511c710b84db3548a1997fd2625f580a commit (drm: Always reject
> >>>drm_vblank_get() after drm_vblank_off()).
> >>>
> >>>We need to use drm_vblank_on() as a counterpart to drm_vblank_off()
> >>>after the commit .
> >
> >This patch should break also other drivers, it seems at least following
> >drms could be affected:
> >armada, sti, tegra.
>=20
> Indeed we (tegra) have just been hit by this. The problem seems to come f=
rom
> the fact that we have been using drm_vblank_pre_modeset,
> drm_vblank_post_modeset and drm_vblank_off conjointly. All these functions
> depend on the value of vblank->inmodeset, and 7ffd7a68511 increases the
> vblank reference counter only in drm_vblank_off, which can result in the
> acquired reference never being released.
>=20
> The following seems to fix this for Tegra, by stopping using
> drm_vblank_pre/post_modeset and relying on drm_vblank_off/on instead:
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index b08df07cad47..3955d81236d0 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -739,7 +739,6 @@ static const struct drm_crtc_funcs tegra_crtc_funcs =
=3D {
>=20
>  static void tegra_crtc_disable(struct drm_crtc *crtc)
>  {
> -       struct tegra_dc *dc =3D to_tegra_dc(crtc);
>         struct drm_device *drm =3D crtc->dev;
>         struct drm_plane *plane;
>=20
> @@ -755,7 +754,7 @@ static void tegra_crtc_disable(struct drm_crtc *crtc)
>                 }
>         }
>=20
> -       drm_vblank_off(drm, dc->pipe);
> +       drm_crtc_vblank_off(crtc);
>  }
>=20
>  static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
> @@ -844,7 +843,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
>         u32 value;
>         int err;
>=20
> -       drm_vblank_pre_modeset(crtc->dev, dc->pipe);
> +       drm_crtc_vblank_off(crtc);
>=20
>         err =3D tegra_crtc_setup_clk(crtc, mode);
>         if (err) {
> @@ -946,7 +945,7 @@ static void tegra_crtc_commit(struct drm_crtc *crtc)
>         value =3D GENERAL_ACT_REQ | WIN_A_ACT_REQ;
>         tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>=20
> -       drm_vblank_post_modeset(crtc->dev, dc->pipe);
> +       drm_crtc_vblank_on(crtc);
>  }
>=20
>  static void tegra_crtc_load_lut(struct drm_crtc *crtc)
>=20
> Thierry, does this look ok to you?

Yes, that looks like almost the same patch that I sent out yesterday.
The difference is that I didn't replace the drm_vblank_pre_modeset()
call with drm_vblank_off() like you did, but rather just dropped the
former.

I /think/ your version is more correct in that regard.

Thierry

> But there might be another issue, which is that calls to drm_vblank_get()
> will return -EINVAL if invoked between drm_blank_off and drm_blank_on. Is
> this really the desired behavior? Can it at least happen? If so, how are
> drivers supposed to react to this situation?

It shouldn't happen. If drm_vblank_off() and drm_vblank_on() are called
around a modeset they should never conflict with drm_vblank_get(), at
least on Tegra, because the modeset and page-flip IOCTLs will be
serialized.

Thierry

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUNl6LAAoJEN0jrNd/PrOhw0cQAJNmTPQtDWz8KJcJb+qJ7Y4p
6iRUNRnuePh0KKQOz2rPcO6x/OJMzKPBbdC7cGCJTjYafCxZbHGBMi/UGlmXKpFE
t0Cyn9DTjTLv6u1J8WtN3whAHYEZXWLfsy5Fr4AwK8ylrAVIbbO/ynSjSIwDgRBw
RJzHkz8Dv3MNHJ02fGhzCNX1ScVG1+Li49ZROP0UxzluepVEHRZG8Pmbmc5UDV2H
n5myWldjW16cuIePT8bHOMmen0CzjO9QMe1RaVB7XeMJY2J7t1ncBsJdRbRFn2WM
kHASTs60I0F4wGg8Fh0+X0MCqrnazVrUNXBn3hqJ8+gdji1wONmWvOGs9GQL6GGk
JGS91kgxMlN7fgq5U2UXg6rO2Er93BccwvxTbT5l/zOf8O5M1oRf0lXdSi165q9M
/5o5ZCtGyX63eFDGDMIAH5oSlH7JawV6azxzqpVlIlg0ucqIxGcKPDzNWovwZS9t
RkeKD1uaEo+2jJTtiRi9G08k89YT0QjZ/jlVQO5HIyWVwCZEL7qHXQIVgWZSdbbe
J4fAvGiy7OjFpeh7VUWoEVlg4fL/A6n6scz9QppOMhP/zo1NxWU7GSae79GFCxCF
yWGLowPz7DRm0f9gWR1zLww3jOipV6fWf6Lo+amPYfa2nEOo3/mLDF4GejnMTWCY
8fBp5iKV+cC55+M5CFhr
=TNgT
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
