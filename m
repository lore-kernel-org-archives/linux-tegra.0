From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 2/4] Revert "drm/tegra: Move drm_dp_link helpers to
 Tegra DRM"
Date: Mon, 20 Jan 2020 08:09:43 +0100
Message-ID: <20200120070943.GA197819@ulmo>
References: <1579488364-13182-1-git-send-email-allen.chen@ite.com.tw>
 <1579488364-13182-3-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1579488364-13182-3-git-send-email-allen.chen@ite.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: allen <allen.chen@ite.com.tw>
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 10:44:32AM +0800, allen wrote:
> IT6505 driver ite-it6505.c file using drm_dp_link helpers, so revert.
> This reverts commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292.
>=20
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 128 ++++++
>  drivers/gpu/drm/tegra/Makefile  |   1 -
>  drivers/gpu/drm/tegra/dp.c      | 876 ----------------------------------=
------
>  drivers/gpu/drm/tegra/dp.h      | 177 --------
>  drivers/gpu/drm/tegra/dpaux.c   |   1 -
>  drivers/gpu/drm/tegra/sor.c     |   1 -
>  include/drm/drm_dp_helper.h     |  16 +
>  7 files changed, 144 insertions(+), 1056 deletions(-)
>  delete mode 100644 drivers/gpu/drm/tegra/dp.c
>  delete mode 100644 drivers/gpu/drm/tegra/dp.h

Sorry, but no. Please just duplicate whatever information you need from
these helpers into your driver. The decision was made recently to remove
these helpers because they were a premature generalization and unlikely
to be useful very widely. See this commit:

commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292
Author: Thierry Reding <treding@nvidia.com>
Date:   Mon Oct 21 16:34:37 2019 +0200

    drm/tegra: Move drm_dp_link helpers to Tegra DRM

    During the discussion of patches that enhance the drm_dp_link helpers it
    was concluded that these helpers aren't very useful to begin with. After
    all other drivers have been converted not to use these helpers anymore,
    move these helpers into the last remaining user: Tegra DRM.

    If at some point these helpers are deemed more widely useful, they can
    be moved out into the DRM DP helpers again.

    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link: https://patchwork.freedesktop.org/patch/msgid/20191021143437.1477=
719-14-thierry.reding@gmail.com

Your new driver here doesn't change that, in my opinion, so just follow
what we did for other drivers and duplicate the corresponding code into
the driver.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4lUjQACgkQ3SOs138+
s6G9LQ//RT0oF0cSY99rYD5a4Gq9xwF0NRauxZ2UB31AHTClEOxlB2UvUO3mGmAO
guZ+9+1YTOL35FeRJIeE322/P+HOt7fp6iswZmIvVxfIHlp2+DjViefo/c3RVTCU
EegQahcz6HMV3uxCn0R0h+ZspQustfsd6JSaqbb0/ByUwz5CtmBg78v1NX0svp/w
v7bRIbANkre6CW7QoEZLQUuXcos81GYep0i4IxsjUFG0lavYTmt7sngYMWzio0Xu
ynQEspvKmyTEQoHBvNzvRrqhJxyYIBWB4JPYsqmf3Swb/xixh+ibD0ojhj8kXeTw
1OAFkzXRE4YnvaFwOBMTt84q7r40y+tolILK7M/e6pgOL3IBdeBothqQhFTbN88W
bCGlip7H74N4E6tSkH1x2lZTeiaAr7q6nHZsMleUtgs8+xt05sK3cO08tAfRqqpW
HsyN+1C5YP3hAq+XoTiWCU4OfcUX6QXsDoUwiFb/KeT6VoUuYVomHUzhAUDBmC/W
38IZzaBs4wnhCCrko8KJT7znM5os9pGFnYxHpkw9RhBKBfDOMt5U8dNgfPmmJx1f
nI8CjoxIGbP/rFrOL2yexacluAnFkoYy4+S81hnQT2C9Xoc1FtsUnB+xqpymiRtg
M97YeTh5QL2UT6MYm+Ot/4GRLo+jLlHSeESvCtojJEXzL9PDElQ=
=y4+8
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
