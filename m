From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 4/6] drm/tegra: output: Support DRM bridges
Date: Wed, 6 May 2020 18:43:08 +0200
Message-ID: <20200506164308.GD19296@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-5-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Apr 18, 2020 at 08:07:01PM +0300, Dmitry Osipenko wrote:
> Newer Tegra device-trees will specify a video output graph which involves
> a bridge. This patch adds initial support for the DRM bridges to the Tegra
> DRM output.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 ++
>  drivers/gpu/drm/tegra/output.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 804869799305..cccd368b6752 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -12,6 +12,7 @@
>  #include <linux/of_gpio.h>
>  
>  #include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_helper.h>
> @@ -116,6 +117,7 @@ struct tegra_output {
>  	struct device_node *of_node;
>  	struct device *dev;
>  
> +	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
>  	const struct edid *edid;
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index a6a711d54e88..ccd1421f1b24 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -99,8 +100,19 @@ int tegra_output_probe(struct tegra_output *output)
>  	if (!output->of_node)
>  		output->of_node = output->dev->of_node;
>  
> +	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
> +					  &output->panel, &output->bridge);
> +	if (err && err != -ENODEV)
> +		return err;
> +
>  	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
>  	if (panel) {
> +		/*
> +		 * Don't mix nvidia,panel phandle with the graph in a
> +		 * device-tree.
> +		 */
> +		WARN_ON(output->panel || output->bridge);
> +
>  		output->panel = of_drm_find_panel(panel);
>  		of_node_put(panel);
>  
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
