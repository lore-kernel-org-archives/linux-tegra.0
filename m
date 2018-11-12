From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/atomic: Create and use
 __drm_atomic_helper_crtc_reset() everywhere
Date: Mon, 12 Nov 2018 16:36:56 +0100
Message-ID: <20181112153656.GB29481@ulmo>
References: <20181112150114.18395-1-maarten.lankhorst@linux.intel.com>
 <20181112150114.18395-2-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1731932772=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181112150114.18395-2-maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Haneen Mohammed <hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Heiko =?utf-8?B?U3TDg8K8Ym5lcg==?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Shirish S <shirish.s-5C7GfCeVMHo@public.gmane.org>, Anthony Koo <Anthony.Koo-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Tony Cheng <Tony.Cheng-5C7GfCeVMHo@public.gmane.org>, David Francis <David.Francis-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime
List-Id: linux-tegra@vger.kernel.org


--===============1731932772==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2018 at 04:01:14PM +0100, Maarten Lankhorst wrote:
> We already have __drm_atomic_helper_connector_reset() and
> __drm_atomic_helper_plane_reset(), extend this to crtc as well.
>=20
> Most drivers already have a gpu reset hook, correct it.
> Nouveau already implemented its own __drm_atomic_helper_crtc_reset(),
> convert it to the common one.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>
> Cc: Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>
> Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
> Cc: "Christian K=C3=83=C2=B6nig" <christian.koenig-5C7GfCeVMHo@public.gmane.org>
> Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> Cc: Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
> Cc: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> Cc: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
> Cc: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: "Heiko St=C3=83=C2=BCbner" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Tony Cheng <Tony.Cheng-5C7GfCeVMHo@public.gmane.org>
> Cc: Shirish S <shirish.s-5C7GfCeVMHo@public.gmane.org>
> Cc: Mikita Lipski <mikita.lipski-5C7GfCeVMHo@public.gmane.org>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>
> Cc: David Francis <David.Francis-5C7GfCeVMHo@public.gmane.org>
> Cc: Anthony Koo <Anthony.Koo-5C7GfCeVMHo@public.gmane.org>
> Cc: Jeykumar Sankaran <jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Bruce Wang <bzwang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Sravanthi Kollukuduru <skolluku-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Steve Kowalik <steven-6LFzBC5e86lrQi2OjOYqKQ@public.gmane.org>
> Cc: Carsten Behling <carsten.behling-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Cc: Haneen Mohammed <hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Mahesh Kumar <mahesh1.kumar-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +--
>  drivers/gpu/drm/arm/malidp_crtc.c             |  5 +--
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  5 +--
>  drivers/gpu/drm/drm_atomic_state_helper.c     | 31 ++++++++++++++++---
>  drivers/gpu/drm/i915/intel_display.c          |  2 +-
>  drivers/gpu/drm/imx/ipuv3-crtc.c              |  5 +--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  5 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 ++-----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  6 +---
>  drivers/gpu/drm/nouveau/dispnv50/head.c       | 13 ++------
>  drivers/gpu/drm/omapdrm/omap_crtc.c           |  7 ++---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  4 +--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  7 +++--
>  drivers/gpu/drm/tegra/dc.c                    |  5 +--
>  drivers/gpu/drm/vc4/vc4_crtc.c                |  8 ++---
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  7 +----
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  9 +-----
>  include/drm/drm_atomic_state_helper.h         |  2 ++
>  18 files changed, 56 insertions(+), 81 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvpnhgACgkQ3SOs138+
s6F+FRAAiCLN0vQ538M1feZf8j0L01HdLb8VeZzYA/Uw+ka6t86s7o1rkfEx4Kcq
DanhhFLCyRs61MqS3CFK0EGbxZ8RF1JcS9VeCgDGLbxwTLMSHy43VEWlLf2Me1PD
fD9G1H17pJ8BDPaLa6d1Ui6ziDHWBDmfRTQfc0iVpeA4xYy0TMYo4Y8xyt6pZ6Pp
+VuUd9OB9RO4EwWZ8/jFFlTcZFte/AQxv4rKfvDs53K6mnKcBBIzuIvyGZ/sM7kA
Ae2eHg07YtCPoFKiFqTexwv6GiiOJd0Dfe3YYMeywoPnLHBKXIz5WrHbnNJvptsk
oJBNNvHTEvA/94vgYebu7Xihz96j1NzsUc0sfxrCwP2c/HvwQlyeBU4YhhmrA6B1
eTex+kRxNeOpt0zUDAv38gERGMVZuxda8N6SGfGO0TbrZPcvjRckwXt50I2u0zuw
d2ou6fy4cDPglro3KBVGS9NXAnJwI6XFEo/shsVopMFybtmCQBK0GGNEybO21wzu
eMmXsCrn0P42UoUWOA6HcH5kcDD0IbKtVoAW0PVyOkSndBOk6GEuN3Gj9u6N6oTH
7JhS/nnwjCfSzgTWIhC7DVWCntyqem4ermhuBvsHQL5v4DUqczuRBau6ZTdkluz6
GEJGvg40FjTETMp6vLHbZI9BGGyGw9W/kqWFHCTx0fgpLFaDpio=
=7jOa
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

--===============1731932772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

--===============1731932772==--
