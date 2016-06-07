From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: [PATCH 10/20] drm: rockchip: Rely on the default ->best_encoder()
 behavior
Date: Tue, 7 Jun 2016 08:51:54 +0800
Message-ID: <57561AAA.5060500@rock-chips.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464877907-27723-11-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1464877907-27723-11-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Alexey Brodkin <abrodkin@synopsys.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Thierry
List-Id: linux-tegra@vger.kernel.org

On 2016=E5=B9=B406=E6=9C=8802=E6=97=A5 22:31, Boris Brezillon wrote:
> All outputss have a 1:1 relationship between connectors and encoders
> and the driver is relying on the atomic helpers: we can drop the cust=
om
> ->best_encoder() implementations  and let the core call
> drm_atomic_helper_best_encoder() for us.

Good, All connectors and encoders is 1:1 relationship on rockchip=20
outputs, so

Acked-by: Mark Yao <mark.yao@rock-chips.com>

>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/gpu/drm/rockchip/dw-mipi-dsi.c | 9 ---------
>   drivers/gpu/drm/rockchip/inno_hdmi.c   | 9 ---------
>   2 files changed, 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm=
/rockchip/dw-mipi-dsi.c
> index dedc65b..ca22e5e 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> @@ -964,18 +964,9 @@ static enum drm_mode_status dw_mipi_dsi_mode_val=
id(
>   	return mode_status;
>   }
>  =20
> -static struct drm_encoder *dw_mipi_dsi_connector_best_encoder(
> -					struct drm_connector *connector)
> -{
> -	struct dw_mipi_dsi *dsi =3D con_to_dsi(connector);
> -
> -	return &dsi->encoder;
> -}
> -
>   static struct drm_connector_helper_funcs dw_mipi_dsi_connector_help=
er_funcs =3D {
>   	.get_modes =3D dw_mipi_dsi_connector_get_modes,
>   	.mode_valid =3D dw_mipi_dsi_mode_valid,
> -	.best_encoder =3D dw_mipi_dsi_connector_best_encoder,
>   };
>  =20
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/r=
ockchip/inno_hdmi.c
> index f8b4feb..006260d 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -579,14 +579,6 @@ inno_hdmi_connector_mode_valid(struct drm_connec=
tor *connector,
>   	return MODE_OK;
>   }
>  =20
> -static struct drm_encoder *
> -inno_hdmi_connector_best_encoder(struct drm_connector *connector)
> -{
> -	struct inno_hdmi *hdmi =3D to_inno_hdmi(connector);
> -
> -	return &hdmi->encoder;
> -}
> -
>   static int
>   inno_hdmi_probe_single_connector_modes(struct drm_connector *connec=
tor,
>   				       uint32_t maxX, uint32_t maxY)
> @@ -613,7 +605,6 @@ static struct drm_connector_funcs inno_hdmi_conne=
ctor_funcs =3D {
>   static struct drm_connector_helper_funcs inno_hdmi_connector_helper=
_funcs =3D {
>   	.get_modes =3D inno_hdmi_connector_get_modes,
>   	.mode_valid =3D inno_hdmi_connector_mode_valid,
> -	.best_encoder =3D inno_hdmi_connector_best_encoder,
>   };
>  =20
>   static int inno_hdmi_register(struct drm_device *drm, struct inno_h=
dmi *hdmi)


--=20
=EF=BC=ADark Yao
