From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/edid: Pass connector to AVI
 inforframe functions
Date: Tue, 20 Nov 2018 17:27:04 +0100
Message-ID: <20181120162704.GA10045@ulmo>
References: <20181120161345.15440-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1371029932=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181120161345.15440-1-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Seung-Woo Kim <sw0312.kim@s>
List-Id: linux-tegra@vger.kernel.org


--===============1371029932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 20, 2018 at 06:13:42PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>=20
> Make life easier for drivers by simply passing the connector
> to drm_hdmi_avi_infoframe_from_display_mode() and
> drm_hdmi_avi_infoframe_quant_range(). That way drivers don't
> need to worry about is_hdmi2_sink mess.
>=20
> Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig-5C7GfCeVMHo@public.gmane.org>
> Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>
> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: "Heiko St=C3=BCbner" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c     |  2 +-
>  drivers/gpu/drm/bridge/analogix-anx78xx.c |  5 ++--
>  drivers/gpu/drm/bridge/sii902x.c          |  3 ++-
>  drivers/gpu/drm/bridge/sil-sii8620.c      |  3 +--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  3 ++-
>  drivers/gpu/drm/drm_edid.c                | 33 ++++++++++++++---------
>  drivers/gpu/drm/exynos/exynos_hdmi.c      |  3 ++-
>  drivers/gpu/drm/i2c/tda998x_drv.c         |  3 ++-
>  drivers/gpu/drm/i915/intel_hdmi.c         | 14 +++++-----
>  drivers/gpu/drm/i915/intel_lspcon.c       | 15 ++++++-----
>  drivers/gpu/drm/i915/intel_sdvo.c         | 10 ++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c       |  3 ++-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    |  3 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c   |  7 +++--
>  drivers/gpu/drm/omapdrm/omap_encoder.c    |  5 ++--
>  drivers/gpu/drm/radeon/radeon_audio.c     |  2 +-
>  drivers/gpu/drm/rockchip/inno_hdmi.c      |  4 ++-
>  drivers/gpu/drm/sti/sti_hdmi.c            |  3 ++-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c    |  3 ++-
>  drivers/gpu/drm/tegra/hdmi.c              |  3 ++-
>  drivers/gpu/drm/tegra/sor.c               |  3 ++-
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 11 +++++---
>  drivers/gpu/drm/zte/zx_hdmi.c             |  4 ++-
>  include/drm/drm_edid.h                    |  8 +++---
>  27 files changed, 94 insertions(+), 66 deletions(-)

That's actually a lot nicer:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv0NdgACgkQ3SOs138+
s6FSFw//Q8EETWYerXmcUSoY2ieXZ+iJ2jEazV/aXriZbwUxAempQOCyTBzyqrrg
vTGsnWXUE+eVo3CMqxex90+PGC7Dhhea9NOP57fzcviMWpFimuZ8ir/wOcp3CNX9
9XfM7VY20iW/EluICA9nxV8GlYxLo1h8cGAQkJbkO1q329JzRGFAHI5lVelQ10Hv
ipu0qIKLAxuN7ApCeZJltQlJ5GRXiPbAKXlT7MErwyBl/0fek9FboZeUjjs3KMa7
oyURNRaOMdfKoiYExd45zWt0usZc22M3XHZpyCb+/0ihjnXJ+iIIe5FHDHZaE5vR
waEQT1srx8f04cKm62zp+Xt9yRhSUG//e5z7yOxlWUT0SdeYu7O17H/HwWH47S29
LwnIcLsG+o7nUTcuKue1CQfXZRyNK3bYILrelIHwfCQjwa0AKFSviGafS8Gd0QYK
oM8q2GoI7EyAXlniLMceP/yAkKGlKvuKpLPX3UlESAAu4j8vGKkJBVY3Sdbcbn5I
SeOyavzekpMzC4JWIRtcGqFRrwt71a12LObQXZdSjfW7grTr57uQrOqwFM+x0edA
SlTlJl8asA1rHbXKEedtd8NdT1HLXYQpQTyIGvDrhPKqO2dx5rMvJ9xP2aV2a1Mu
GWJUyv+3BAHQXsOl13uiZEqKoL7N5ZQB6ZZ2dosTWt9x/c9vvpg=
=l76x
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

--===============1371029932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

--===============1371029932==--
