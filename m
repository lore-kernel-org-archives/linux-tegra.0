From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 14/17] drm/tegra: Convert to using
 __drm_atomic_helper_crtc_reset() for reset.
Date: Mon, 4 Mar 2019 14:02:38 +0100
Message-ID: <20190304130238.GI9040@ulmo>
References: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
 <20190301125627.7285-15-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0963683880=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190301125627.7285-15-maarten.lankhorst@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0963683880==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AptwxgnoZDC4KQWS"
Content-Disposition: inline


--AptwxgnoZDC4KQWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2019 at 01:56:24PM +0100, Maarten Lankhorst wrote:
> Convert tegra to using __drm_atomic_helper_crtc_reset(), instead of
> writing its own version. Instead of open coding destroy_state(),
> call it directly for freeing the old state.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/dc.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 607a6ea17ecc..57c88d78cdaa 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1153,25 +1153,6 @@ static void tegra_dc_destroy(struct drm_crtc *crtc)
>  	drm_crtc_cleanup(crtc);
>  }
> =20
> -static void tegra_crtc_reset(struct drm_crtc *crtc)
> -{
> -	struct tegra_dc_state *state;
> -
> -	if (crtc->state)
> -		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> -
> -	kfree(crtc->state);
> -	crtc->state =3D NULL;
> -
> -	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (state) {
> -		crtc->state =3D &state->base;
> -		crtc->state->crtc =3D crtc;
> -	}
> -
> -	drm_crtc_vblank_reset(crtc);
> -}
> -
>  static struct drm_crtc_state *
>  tegra_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>  {
> @@ -1198,6 +1179,17 @@ static void tegra_crtc_atomic_destroy_state(struct=
 drm_crtc *crtc,
>  	kfree(state);
>  }
> =20
> +static void tegra_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct tegra_dc_state *state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +
> +	if (crtc->state)
> +		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +	drm_crtc_vblank_reset(crtc);
> +}
> +

I would preferred a predeclaration of tegra_crtc_atomic_destroy_state()
in this case because the implementations are in the same order as their
use in tegra_crtc_funcs, but I think I can live with it, so either way:

Acked-by: Thierry Reding <treding@nvidia.com>

--AptwxgnoZDC4KQWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx9Ie0ACgkQ3SOs138+
s6GhWQ/+M7oR/xdDrXVysh+CZC40qvDeB9WWaBEbojdlZbx5zLxRaefhGB3ClfTf
LKf2/oMCbr+n9JeE0uS+1LNSz3+Tc/GPELJ6BWp+8yLJfSWUB+yB23VkcGCHC9n4
iUKt3cQuMN1f2czBqiNXbtdcvFM2logfE1/UymfgciAGzYcoM42iQnmpTv3PV0xd
YCc1auvOAFTq5lMzhTxa6rvUsrmKxZUtaDVihQOOMtmMIY5ykjZoZXtWLwpfTWA5
zyHzZt8hFgqylB32zKgCIHBWeVaA3ZE1Ww3kYwRDdx3hwRapG0fAvywC6/E6R55i
PStUYz24o6wLDq4JVNO4SSyQUO8l3zuA0Ip8GOu9EmgGNDLw76r7N3iMoKSDGoyI
VfTeOyWP/G/rS8qCEJopa96clb6PVvYkGE+3PiOj5k86TVwgJAVB1YaQrEnPB4Fj
+yyutvey/+WYnH7AhUROy74+jjwkemyauvHFhvT/TkD7Qj78Eps5C2CssdWCBizD
N+3uOXeSOkDPevaMT3PrSyrnRBdmrIhX0uyMFAflaZawb81PJsCPrxiYHy5m3j3m
RNTruem15GZrMLfPHY57kiBIUhhkSMJC/0GgETTbUDNLIbcDY45ouH5C0Vz/ed8V
Rm4W4EmmI8u2yfyzHtuxsDUkkbr9SLJvkL8mq/JgHi+DHvCMtjs=
=qRhK
-----END PGP SIGNATURE-----

--AptwxgnoZDC4KQWS--

--===============0963683880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0963683880==--
