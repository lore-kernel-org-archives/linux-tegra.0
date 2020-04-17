From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Fri, 17 Apr 2020 22:24:53 +0300
Message-ID: <20200417192453.GH5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417175238.27154-4-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Fri, Apr 17, 2020 at 08:52:38PM +0300, Dmitry Osipenko wrote:
> Newer Tegra device-trees will specify a video output graph, which involves
> LVDS encoder bridge. This patch adds support for the LVDS encoder bridge
> to the RGB output, allowing us to model the display hardware properly.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 58 +++++++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 0562a7eb793f..f28a226914c0 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -7,6 +7,7 @@
>  #include <linux/clk.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -267,24 +268,63 @@ int tegra_dc_rgb_remove(struct tegra_dc *dc)
>  int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>  {
>  	struct tegra_output *output = dc->rgb;
> +	struct drm_connector *connector;
>  	int err;
>  
>  	if (!dc->rgb)
>  		return -ENODEV;
>  
> -	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
> -			   DRM_MODE_CONNECTOR_LVDS);
> -	drm_connector_helper_add(&output->connector,
> -				 &tegra_rgb_connector_helper_funcs);
> -	output->connector.dpms = DRM_MODE_DPMS_OFF;
> -
>  	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
>  	drm_encoder_helper_add(&output->encoder,
>  			       &tegra_rgb_encoder_helper_funcs);
>  
> -	drm_connector_attach_encoder(&output->connector,
> -					  &output->encoder);
> -	drm_connector_register(&output->connector);
> +	/*
> +	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
> +	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
> +	 * go to display panel's receiver.
> +	 *
> +	 * Encoder usually have a power-down control which needs to be enabled
> +	 * in order to transmit data to the panel. Historically devices that
> +	 * use an older device-tree version didn't model the bridge, assuming
> +	 * that encoder is turned ON by default, while today's DRM allows us
> +	 * to model LVDS encoder properly.
> +	 *
> +	 * Newer device-trees utilize LVDS encoder bridge, which provides
> +	 * us with a connector and handles the display panel.
> +	 *
> +	 * For older device-trees we fall back to our own connector and use
> +	 * nvidia,panel phandle.

As I tried to explain before, if you wrap the panel in a bridge with
drm_panel_bridge_add() (or the devm_ variant), you will always have a
bridge associated with the output, and will be able to remove your
custom connector implementation. I thus recommend converting to
drm_panel_bridge_add() either as part of this patch series, or just
after it, to get full benefits.

With the assumption that this will be handled,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> +	 */
> +	if (output->bridge) {
> +		err = drm_bridge_attach(&output->encoder, output->bridge,
> +					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (err) {
> +			dev_err(output->dev, "failed to attach bridge: %d\n",
> +				err);
> +			return err;
> +		}
> +
> +		connector = drm_bridge_connector_init(drm, &output->encoder);
> +		if (IS_ERR(connector)) {
> +			dev_err(output->dev,
> +				"failed to initialize bridge connector: %pe\n",
> +				connector);
> +			return PTR_ERR(connector);
> +		}
> +
> +		drm_connector_attach_encoder(connector, &output->encoder);
> +	} else {
> +		drm_connector_init(drm, &output->connector,
> +				   &tegra_rgb_connector_funcs,
> +				   DRM_MODE_CONNECTOR_LVDS);
> +		drm_connector_helper_add(&output->connector,
> +					 &tegra_rgb_connector_helper_funcs);
> +		output->connector.dpms = DRM_MODE_DPMS_OFF;
> +
> +		drm_connector_attach_encoder(&output->connector,
> +					     &output->encoder);
> +		drm_connector_register(&output->connector);
> +	}
>  
>  	err = tegra_output_init(drm, output);
>  	if (err < 0) {

-- 
Regards,

Laurent Pinchart
