From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 6/6] drm/tegra: output: rgb: Wrap directly-connected
 panel into DRM bridge
Date: Sat, 25 Apr 2020 19:02:37 +0200
Message-ID: <20200425170237.GA20498@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-7-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry

On Sat, Apr 18, 2020 at 08:07:03PM +0300, Dmitry Osipenko wrote:
> Currently Tegra DRM driver manually manages display panel, but this
> management could be moved out into DRM core if we'll wrap panel into
> DRM bridge. This patch wraps RGB panel into a DRM bridge and removes
> manual handling of the panel from the RGB output code.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This resulted in the expected simplifications - good.
Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

> ---
>  drivers/gpu/drm/tegra/rgb.c | 53 +++++++++++++------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 9a7024ec96bc..a4c5a6066c54 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -8,7 +8,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge_connector.h>
> -#include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
>  #include "drm.h"
> @@ -86,15 +85,6 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
>  		tegra_dc_writel(dc, table[i].value, table[i].offset);
>  }
>  
> -static const struct drm_connector_funcs tegra_rgb_connector_funcs = {
> -	.reset = drm_atomic_helper_connector_reset,
> -	.detect = tegra_output_connector_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = tegra_output_connector_destroy,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>  static enum drm_mode_status
>  tegra_rgb_connector_mode_valid(struct drm_connector *connector,
>  			       struct drm_display_mode *mode)
> @@ -117,14 +107,8 @@ static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
>  	struct tegra_output *output = encoder_to_output(encoder);
>  	struct tegra_rgb *rgb = to_rgb(output);
>  
> -	if (output->panel)
> -		drm_panel_disable(output->panel);
> -
>  	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
>  	tegra_dc_commit(rgb->dc);
> -
> -	if (output->panel)
> -		drm_panel_unprepare(output->panel);
>  }
>  
>  static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
> @@ -133,9 +117,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
>  	struct tegra_rgb *rgb = to_rgb(output);
>  	u32 value;
>  
> -	if (output->panel)
> -		drm_panel_prepare(output->panel);
> -
>  	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
>  
>  	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> @@ -157,9 +138,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
>  	tegra_dc_writel(rgb->dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
>  
>  	tegra_dc_commit(rgb->dc);
> -
> -	if (output->panel)
> -		drm_panel_enable(output->panel);
>  }
>  
>  static int
> @@ -278,6 +256,23 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>  	drm_encoder_helper_add(&output->encoder,
>  			       &tegra_rgb_encoder_helper_funcs);
>  
> +	/*
> +	 * Wrap directly-connected panel into DRM bridge in order to let
> +	 * DRM core to handle panel for us.
> +	 */
> +	if (output->panel) {
> +		output->bridge = devm_drm_panel_bridge_add(output->dev,
> +							   output->panel);
> +		if (IS_ERR(output->bridge)) {
> +			dev_err(output->dev,
> +				"failed to wrap panel into bridge: %pe\n",
> +				output->bridge);
> +			return PTR_ERR(output->bridge);
> +		}
> +
> +		output->panel = NULL;
> +	}
> +
>  	/*
>  	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
>  	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
> @@ -292,8 +287,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>  	 * Newer device-trees utilize LVDS encoder bridge, which provides
>  	 * us with a connector and handles the display panel.
>  	 *
> -	 * For older device-trees we fall back to our own connector and use
> -	 * nvidia,panel phandle.
> +	 * For older device-trees we wrapped panel into the panel-bridge.
>  	 */
>  	if (output->bridge) {
>  		err = drm_bridge_attach(&output->encoder, output->bridge,
> @@ -313,17 +307,6 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>  		}
>  
>  		drm_connector_attach_encoder(connector, &output->encoder);
> -	} else {
> -		drm_connector_init(drm, &output->connector,
> -				   &tegra_rgb_connector_funcs,
> -				   DRM_MODE_CONNECTOR_LVDS);
> -		drm_connector_helper_add(&output->connector,
> -					 &tegra_rgb_connector_helper_funcs);
> -		output->connector.dpms = DRM_MODE_DPMS_OFF;
> -
> -		drm_connector_attach_encoder(&output->connector,
> -					     &output->encoder);
> -		drm_connector_register(&output->connector);
>  	}
>  
>  	err = tegra_output_init(drm, output);
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
