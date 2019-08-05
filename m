From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 12/16] drm/panel: use inline comments in drm_panel.h
Date: Mon, 5 Aug 2019 13:54:25 +0300
Message-ID: <20190805105425.GG29747@pendragon.ideasonboard.com>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-13-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-13-sam@ravnborg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Aliso
List-Id: linux-tegra@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Aug 04, 2019 at 10:16:33PM +0200, Sam Ravnborg wrote:
> Inline comments provide better space for additional comments.
> Comments was slightly edited to follow the normal style,
> but no change to actual content.
> Used the opportuniy to change the order in drm_panel_funcs
> to follow the order they will be used by a panel.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_panel.h | 82 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 053d611656b9..5e62deea49ba 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -36,14 +36,6 @@ struct display_timing;
>  
>  /**
>   * struct drm_panel_funcs - perform operations on a given panel
> - * @disable: disable panel (turn off back light, etc.)
> - * @unprepare: turn off panel
> - * @prepare: turn on panel and perform set up
> - * @enable: enable panel (turn on back light, etc.)
> - * @get_modes: add modes to the connector that the panel is attached to and
> - * return the number of modes added
> - * @get_timings: copy display timings into the provided array and return
> - * the number of display timings available
>   *
>   * The .prepare() function is typically called before the display controller
>   * starts to transmit video data. Panel drivers can use this to turn the panel
> @@ -69,31 +61,89 @@ struct display_timing;
>   * the panel. This is the job of the .unprepare() function.
>   */
>  struct drm_panel_funcs {
> -	int (*disable)(struct drm_panel *panel);
> -	int (*unprepare)(struct drm_panel *panel);
> +	/**
> +	 * @prepare:
> +	 *
> +	 * Turn on panel and perform set up.
> +	 */
>  	int (*prepare)(struct drm_panel *panel);
> +
> +	/**
> +	 * @enable:
> +	 *
> +	 * Enable panel (turn on back light, etc.).
> +	 */
>  	int (*enable)(struct drm_panel *panel);
> +
> +	/**
> +	 * @disable:
> +	 *
> +	 * Disable panel (turn off back light, etc.).
> +	 */
> +	int (*disable)(struct drm_panel *panel);
> +
> +	/**
> +	 * @unprepare:
> +	 *
> +	 * Turn off panel.
> +	 */
> +	int (*unprepare)(struct drm_panel *panel);
> +
> +	/**
> +	 * @get_modes:
> +	 *
> +	 * Add modes to the connector that the panel is attached to and
> +	 * return the number of modes added.
> +	 */
>  	int (*get_modes)(struct drm_panel *panel);
> +
> +	/**
> +	 * @get_timings:
> +	 *
> +	 * Copy display timings into the provided array and return
> +	 * the number of display timings available.
> +	 */
>  	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
>  			   struct display_timing *timings);
>  };
>  
>  /**
>   * struct drm_panel - DRM panel object
> - * @drm: DRM device owning the panel
> - * @connector: DRM connector that the panel is attached to
> - * @dev: parent device of the panel
> - * @link: link from panel device (supplier) to DRM device (consumer)
> - * @funcs: operations that can be performed on the panel
> - * @list: panel entry in registry
>   */
>  struct drm_panel {
> +	/**
> +	 * @drm:
> +	 *
> +	 * DRM device owning the panel.
> +	 */
>  	struct drm_device *drm;
> +
> +	/**
> +	 * @connector:
> +	 *
> +	 * DRM connector that the panel is attached to.
> +	 */
>  	struct drm_connector *connector;
> +
> +	/**
> +	 * @dev:
> +	 *
> +	 * Parent device of the panel.
> +	 */
>  	struct device *dev;
>  
> +	/**
> +	 * @funcs:
> +	 *
> +	 * Operations that can be performed on the panel.
> +	 */
>  	const struct drm_panel_funcs *funcs;
>  
> +	/**
> +	 * @list:
> +	 *
> +	 * Panel entry in registry.
> +	 */
>  	struct list_head list;
>  };
>  

-- 
Regards,

Laurent Pinchart
