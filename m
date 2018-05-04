From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: plane: Implement zPos plane property
 for older Tegra's
Date: Fri, 4 May 2018 14:15:30 +0200
Message-ID: <20180504121530.GS13459@ulmo>
References: <20180504000844.18661-1-digetx@gmail.com>
 <20180504000844.18661-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K5roPakIqCb4O6y8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180504000844.18661-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--K5roPakIqCb4O6y8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 03:08:43AM +0300, Dmitry Osipenko wrote:
> Older Tegra's do not support planes z position handling in hardware,
> but HW provides knobs for zPos implementation in software.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c    | 134 ++++++++++++++++-------
>  drivers/gpu/drm/tegra/plane.c | 193 ++++++++++++++++++++++++----------
>  drivers/gpu/drm/tegra/plane.h |  13 ++-
>  3 files changed, 244 insertions(+), 96 deletions(-)

This is obviously a lot to review, but it looks pretty good. On minor
comment below.

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 2e81142281c3..ba5481cd470d 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -162,29 +162,90 @@ static void tegra_plane_setup_blending_legacy(struc=
t tegra_plane *plane)
[...]
> +		case 1:
> +			/*
> +			 * When both middle and topmost windows have an alpha,
> +			 * these windows a mixed together and then the result
> +			 * is blended over the bottom window.
> +			 */
> +			if ((state->blending[0].alpha &&
> +			     state->blending[0].top))

There seems to be one pair of parentheses too much here.

Thierry

--K5roPakIqCb4O6y8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsTuEACgkQ3SOs138+
s6FnXBAAjOr/npcqwva3yX/zDqfPAudXe0ZLQOCZv+5D58yBDDu2DA/WnV0P9pBC
WWsMvSNqyH/wbXmZX8k0E0l4frldaJsp4EkAwn57hbPgMqtWUwzrzm/Ygg2f6h2B
zI9u+L6MqYWpBDCcIJ1aUyr6HCiohfNAsqt/A7Aro+NbqVb+FmoIrZCDej/a41SB
cvEfk+C9vsnUJHJtvdKvRTZouxW6Lw2O7Kwwixnrn26MKKWsPwfE4/bS8we2d9Yi
8NKvwQqS7rheLMK5eX8sYxs8ZW7pPt13s0o0+uRj7M7J/N38/DMW0UxLoZpfeAUH
IfWetHseJsJodZmg/3H5TWaIEmIpIMXg3/PFZG1bLYvh2XxZM78k7Nr2gTFFmoqe
M+OH44mjeWEQFNcRHJdA1o9NKSJFboa6q4rTREic/Cu6OOl25M1rOUz0au5lCS5f
x0+ggTs8neNh9uBOeN6YTTx3bnPEQUvrUXxNY93cqo1/2q35U4kgdsb//wip04M3
hHEqP2MMfbFacitcw/8cfhmI3JGhXSLxT3ATvgvsiVL6s+tA0+NJvpXjak4OdnaJ
tg7EGD59gbfkRBD98tlPa2tS3lm3OVskrV4qNvmAKihH58xXyRO18blSsMOQRpkh
XkhHWWm7CckyZzhuz/nsLcj9AE6CtL4JCefSxjH7HRzRBjAiUQQ=
=a/Lf
-----END PGP SIGNATURE-----

--K5roPakIqCb4O6y8--
