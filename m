From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/15] drm: More plane clipping polish
Date: Fri, 24 Nov 2017 14:41:28 +0100
Message-ID: <20171124134128.GB15999@ulmo>
References: <20171123190502.28449-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171123190502.28449-1-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2017 at 09:04:47PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>=20
> This series first unifies all users of drm_atomic_helper_check_plane_stat=
e()
> to populate the clip rectangle with drm_mode_get_hv_timing(), and once
> everything is unified the clip rectangle handling is sucked into
> drm_atomic_helper_check_plane_state() away from driver code.
>=20
> Entire series available here:
> git://github.com/vsyrjala/linux.git atomic_plane_helper_clip
>=20
> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
> Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
>=20
> Ville Syrj=C3=A4l=C3=A4 (15):
>   drm/i915: Reject odd pipe source width with double wide/dual link
>   drm/i915: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/hdlcd: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/arm/mali-dp: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/simple_kms_helper: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/imx: Use drm_mode_get_hv_timing() to populate plane clip rectangle
>   drm/mediatek: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/meson: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/msm/mdp5: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/nouveau/kms/nv50: Use drm_mode_get_hv_timing() to populate plane
>     clip rectangle
>   drm/rockchip: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/tegra/dc: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/vmwgfx: Use drm_mode_get_hv_timing() to populate plane clip
>     rectangle
>   drm/zte: Use drm_mode_get_hv_timing() to populate plane clip rectangle
>   drm: Don't pass clip to drm_atomic_helper_check_plane_state()
>=20
>  drivers/gpu/drm/arm/hdlcd_crtc.c            |  6 +-----
>  drivers/gpu/drm/arm/malidp_planes.c         |  5 +----
>  drivers/gpu/drm/armada/armada_overlay.c     |  2 +-
>  drivers/gpu/drm/drm_atomic_helper.c         | 12 +++++++-----
>  drivers/gpu/drm/drm_plane_helper.c          | 11 +++--------
>  drivers/gpu/drm/drm_simple_kms_helper.c     |  5 -----
>  drivers/gpu/drm/i915/intel_atomic_plane.c   |  8 --------
>  drivers/gpu/drm/i915/intel_display.c        | 12 +++++++-----
>  drivers/gpu/drm/i915/intel_drv.h            |  1 -
>  drivers/gpu/drm/i915/intel_sprite.c         |  8 ++++++--
>  drivers/gpu/drm/imx/ipuv3-plane.c           |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  6 +-----
>  drivers/gpu/drm/meson/meson_plane.c         |  6 +-----
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c   | 14 ++------------
>  drivers/gpu/drm/nouveau/nv50_display.c      |  8 --------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  8 +-------
>  drivers/gpu/drm/tegra/dc.c                  |  8 +-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  8 +-------
>  drivers/gpu/drm/zte/zx_plane.c              | 15 +--------------
>  include/drm/drm_atomic_helper.h             |  1 -
>  include/drm/drm_plane_helper.h              |  1 -
>  21 files changed, 35 insertions(+), 117 deletions(-)

The series:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloYIYUACgkQ3SOs138+
s6GL3g//abDmnXSwrgZxHqktOrdeNkfCqAzAeF1edwDUPRk72cWhL9Gz2GyIoKxz
rHBr5G3zQ4B4q4y8r8U5xuxeYcozxEww/HPYKkdaGSMAqA3nNwudAaZ5hbt9CGkP
efMpUY0qfr8ntxnm+iiURIGpFn3QN1uCVQAn+/EWyM65/k0En8PsJdn5vDYl4kY8
CEwnLcfCqQLHIuI55CvRJQsPHz7iEaMqCrMJmlKRiMX5l5RPVaI4WJufG3YM0agR
84yknx5lGVXI+eqcVnarvpDEcjLGF1VqnaYKvWnzt4aOk/1CRSx6euwFGHqgPx8y
I4ssRqaf4DsqYMpjJqxGEuOvRdU/XU8GCjubHUGMo1p1PzS+rhh2CgHg3UBwsNin
7sMmQYUJThFYBbK7pghtKpCMOEH7EVtJvNEdCrZNuP7bRjbMnlyQUNnebXEqTfkb
KhlogD28dkzgzP6bruAlONNQNqGjGICAoPer9FcFwh/MGdUC3XCJpzU3LhMyPPEE
JAaU8RPz4YtDvzDIVVZ9ozAcTDnepyiOtFU8WKRHq8kYiR87BteQNYOf3/dW8FjX
8Mupt7ImJexyugbiPdlju+Xtcn7MHZlph9CHkIqXhAVVzGXzQtOWWQqj3ylYv8ad
RwICxCwQW/7th0rST3pgMMTbNIhfv1NtDgn3JDFwvK9g7gpQn8g=
=J7ZF
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
