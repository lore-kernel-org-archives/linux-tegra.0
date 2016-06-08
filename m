From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 07/20] drm: mediatek: Rely on the default
 ->best_encoder() behavior
Date: Wed, 8 Jun 2016 13:17:07 +0200
Message-ID: <5757FEB3.8050001@gmail.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465300095-16971-8-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Alexey Brodkin <abrodkin@synopsys.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thier>
List-Id: linux-tegra@vger.kernel.org



On 07/06/16 13:48, Boris Brezillon wrote:
> We have a 1:1 relationship between connectors and encoders and the
> driver is relying on the atomic helpers: we can drop the custom
> ->best_encoder() implementation and let the core call
> drm_atomic_helper_best_encoder() for us.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 2d808e5..7343ffc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -575,14 +575,6 @@ static int mtk_dsi_connector_get_modes(struct drm_connector *connector)
>   	return drm_panel_get_modes(dsi->panel);
>   }
>
> -static struct drm_encoder *mtk_dsi_connector_best_encoder(
> -		struct drm_connector *connector)
> -{
> -	struct mtk_dsi *dsi = connector_to_dsi(connector);
> -
> -	return &dsi->encoder;
> -}
> -
>   static const struct drm_encoder_helper_funcs mtk_dsi_encoder_helper_funcs = {
>   	.mode_fixup = mtk_dsi_encoder_mode_fixup,
>   	.mode_set = mtk_dsi_encoder_mode_set,
> @@ -603,7 +595,6 @@ static const struct drm_connector_funcs mtk_dsi_connector_funcs = {
>   static const struct drm_connector_helper_funcs
>   	mtk_dsi_connector_helper_funcs = {
>   	.get_modes = mtk_dsi_connector_get_modes,
> -	.best_encoder = mtk_dsi_connector_best_encoder,
>   };
>
>   static int mtk_drm_attach_bridge(struct drm_bridge *bridge,
>
