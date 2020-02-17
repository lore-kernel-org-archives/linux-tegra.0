From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 12/22] ASoC: tegra: Use device managed resource APIs
 to get the clock
Date: Mon, 17 Feb 2020 10:48:26 +0100
Message-ID: <20200217094826.GN1339021@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-13-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WeDu0lr7bteb/II5"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-13-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--WeDu0lr7bteb/II5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:17PM -0800, Sowjanya Komatineni wrote:
> tegra_asoc_utils uses clk_get() to get the clock and clk_put() to
> free them explicitly.
>=20
> This patch updates it to use device managed resource API
> devm_clk_get() so the clock will be automatically released and freed
> when the device is unbound and removes tegra_asoc_utils_fini() as
> its no longer needed.
>=20
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Sameer Pujar <spujar@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  sound/soc/tegra/tegra_alc5632.c    |  7 +------
>  sound/soc/tegra/tegra_asoc_utils.c | 39 +++++++++-----------------------=
------
>  sound/soc/tegra/tegra_asoc_utils.h |  1 -
>  sound/soc/tegra/tegra_max98090.c   | 22 ++++++---------------
>  sound/soc/tegra/tegra_rt5640.c     | 22 ++++++---------------
>  sound/soc/tegra/tegra_rt5677.c     |  7 +------
>  sound/soc/tegra/tegra_sgtl5000.c   |  7 +------
>  sound/soc/tegra/tegra_wm8753.c     | 22 ++++++---------------
>  sound/soc/tegra/tegra_wm8903.c     | 22 ++++++---------------
>  sound/soc/tegra/tegra_wm9712.c     |  8 ++------
>  sound/soc/tegra/trimslice.c        | 18 ++++--------------
>  11 files changed, 42 insertions(+), 133 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--WeDu0lr7bteb/II5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KYWoACgkQ3SOs138+
s6GK5A/5AcdDL/94+MLDuWQO9rtvoWy8z68TTio7XPaP1m3tLsAWmOrO4b+QPfyp
pnyHtrq8rW9fRShCzBPf6DM5tAKALPrwoJSBWABqZNr0vupPZKcDCc47xRyz0VSI
oeT4BuDIjYJtEQyzvUibM3ZsnbKJ0Iis8ZKQZK2b5UjGKt3/mO2sf6HmrXrUjAnn
fo3FNwCiEvIkBkcyEu7NIZN7BzpHHWKRni7BgBnu+2Tr7cdqKwxkr9Eek52AVFV6
IBY7pn2JSCd3Yf82RadY/lpLmQ2i5M/ZKFhraMnVGfBYFr73B56sv69XEtv+I3do
GP7t8FimcM2Nj+yNERQidOxBTT4JaF5lt6lXFEqqz3OYFcJ2GVc/3BNpEwrsL2z+
s0mv00ALzbrSdifmLYE+JbSBdscZArJDzs4aOJmNEbJUXEo3ucMkRVBwFoGcHtjQ
4RrvHR/pvGX85Cyhjmo0Z+uNi0Nr/JciRePBelXdjdeLn0LRCaSqntQ90rHnCi3V
txQ33jOfO2Q5VlEsHBwuRYYzlqhIVVnIW8WII8cPSso91NM99QyI6tY+BLXJqT6p
kqQw2OzXfCBdO/xCFLGu1LLsVFmFe9HPI+Yh5tde07/OutCgQ0hl5BnEDzg9ywnl
CLdRdoUHbVoZdwg7R8QzMuUZ+nYTslcYQYYOBW5r/iBkd7u36Co=
=yMLv
-----END PGP SIGNATURE-----

--WeDu0lr7bteb/II5--
