From: Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 11/20] drm: sti: Rely on the default ->best_encoder()
 behavior
Date: Wed, 8 Jun 2016 11:35:40 +0200
Message-ID: <5757E6EC.1050802@st.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-12-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1465300095-16971-12-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-msm-u79uwXL29TasMV2rI37PzA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Boris,

Thanks for the patch.

Acked-by: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>

Vincent

On 06/07/2016 01:48 PM, Boris Brezillon wrote:
> All outputs have a 1:1 relationship between connectors and encoders
> and the driver is relying on the atomic helpers: we can drop the custom
> ->best_encoder() implementations and let the core call
> drm_atomic_helper_best_encoder() for us.
>
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/gpu/drm/sti/sti_dvo.c  | 10 ----------
>   drivers/gpu/drm/sti/sti_hda.c  | 10 ----------
>   drivers/gpu/drm/sti/sti_hdmi.c | 10 ----------
>   3 files changed, 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index 25f7663..d5627d1 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -384,20 +384,10 @@ static int sti_dvo_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_dvo_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_dvo_connector *dvo_connector
> -		= to_sti_dvo_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return dvo_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_dvo_connector_helper_funcs = {
>   	.get_modes = sti_dvo_connector_get_modes,
>   	.mode_valid = sti_dvo_connector_mode_valid,
> -	.best_encoder = sti_dvo_best_encoder,
>   };
>
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index f7d3464..c4649f5 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -676,20 +676,10 @@ static int sti_hda_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_hda_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_hda_connector *hda_connector
> -		= to_sti_hda_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return hda_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_hda_connector_helper_funcs = {
>   	.get_modes = sti_hda_connector_get_modes,
>   	.mode_valid = sti_hda_connector_mode_valid,
> -	.best_encoder = sti_hda_best_encoder,
>   };
>
>   static enum drm_connector_status
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 6ef0715..dc9ab6e 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -897,20 +897,10 @@ static int sti_hdmi_connector_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>
> -struct drm_encoder *sti_hdmi_best_encoder(struct drm_connector *connector)
> -{
> -	struct sti_hdmi_connector *hdmi_connector
> -		= to_sti_hdmi_connector(connector);
> -
> -	/* Best encoder is the one associated during connector creation */
> -	return hdmi_connector->encoder;
> -}
> -
>   static const
>   struct drm_connector_helper_funcs sti_hdmi_connector_helper_funcs = {
>   	.get_modes = sti_hdmi_connector_get_modes,
>   	.mode_valid = sti_hdmi_connector_mode_valid,
> -	.best_encoder = sti_hdmi_best_encoder,
>   };
>
>   /* get detection status of display device */
>
