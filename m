From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 5/6] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Wed, 6 May 2020 18:45:17 +0200
Message-ID: <20200506164517.GE19296@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, g@ravnborg.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 18, 2020 at 08:07:02PM +0300, Dmitry Osipenko wrote:
> Newer Tegra device-trees will specify a video output graph, which involves
> LVDS encoder bridge. This patch adds support for the LVDS encoder bridge
> to the RGB output, allowing us to model the display hardware properly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 58 +++++++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 0562a7eb793f..9a7024ec96bc 100644
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
> +	 * in order to transmit data to the panel.  Historically devices that
> +	 * use an older device-tree version didn't model the bridge, assuming
> +	 * that encoder is turned ON by default, while today's DRM allows us
> +	 * to model LVDS encoder properly.
> +	 *
> +	 * Newer device-trees utilize LVDS encoder bridge, which provides
> +	 * us with a connector and handles the display panel.
> +	 *
> +	 * For older device-trees we fall back to our own connector and use
> +	 * nvidia,panel phandle.
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
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
