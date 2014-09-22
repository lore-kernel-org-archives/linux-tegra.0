From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Set the dsi lp clk parent and rate
Date: Mon, 22 Sep 2014 18:46:52 +0100
Message-ID: <20140922174652.GP3290@leverpostej>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411156429-19797-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, mike.turquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 19, 2014 at 08:53:48PM +0100, Sean Paul wrote:
> Per NVidia, this clock rate should be around 70MHz in
> order to properly sample reads on data lane 0. In order
> to achieve this rate, we need to reparent the clock from
> clk_m which can only achieve 12MHz. Add parent_lp to the
> dts bindings and set the parent & rate on init.
> 
> Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/nvidia,tegra20-host1x.txt  | 10 ++++++++--
>  drivers/gpu/drm/tegra/dsi.c                            | 18 ++++++++++++++++++
>  drivers/gpu/drm/tegra/dsi.h                            |  3 +++
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> index b48f4ef..fef2918 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> @@ -191,6 +191,10 @@ of the following host1x client modules:
>    - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
>    - nvidia,edid: supplies a binary EDID blob
>    - nvidia,panel: phandle of a display panel
> +  - clock-names: Can include the following entries:
> +    - lp_parent: The parent clock for lp
> +  - clocks: Must contain an entry for each optional entry in clock-names.
> +    See ../clocks/clock-bindings.txt for details.

Did this driver previously acquire clocks?

What order or names did it expect if so?

>  
>  - sor: serial output resource
>  
> @@ -360,8 +364,10 @@ Example:
>  			compatible = "nvidia,tegra20-dsi";
>  			reg = <0x54300000 0x00040000>;
>  			clocks = <&tegra_car TEGRA20_CLK_DSI>,
> -				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
> -			clock-names = "dsi", "parent";
> +				 <&tegra_car TEGRA124_CLK_DSIALP>,
> +				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>,
> +				 <&tegra_car TEGRA124_CLK_PLL_P>;
> +			clock-names = "dsi", "lp", "parent", "lp_parent";

Please document _all_ the names you expect.

What exactly are these two new clocks?

Is this all the clocks that feed into the DSI block? Are any of these
not directly wired to the DSI block?

Why exactly do you need to reparent it to this particular clock, and why
do you need a reference here in order to do so, given it presumably
doesn't feed directly into the DSI block?

How are these clocks described w.r.t. each other at the moment?

>  			resets = <&tegra_car 48>;
>  			reset-names = "dsi";
>  			status = "disabled";
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index f787445..c0258ae 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -837,6 +837,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>  	struct tegra_dsi *dsi;
>  	struct resource *regs;
>  	int err;
> +	struct clk *lp_parent;
>  
>  	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi)
> @@ -879,6 +880,23 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>  		return PTR_ERR(dsi->clk_lp);
>  	}
>  
> +	lp_parent = devm_clk_get(&pdev->dev, "lp_parent");
> +	if (!IS_ERR(lp_parent)) {
> +		err = clk_set_parent(dsi->clk_lp, lp_parent);
> +		if (err < 0) {
> +			dev_err(&pdev->dev, "cannot set lp clock parent\n");
> +			return err;
> +		}
> +	} else {
> +		dev_info(&pdev->dev, "no lp clock parent, using hw default\n");
> +	}
> +
> +	err = clk_set_rate(dsi->clk_lp, DSI_LP_CLK_RATE);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "cannot set low-power clock rate\n");
> +		return err;
> +	}

This looks like a change of behaviour given the "lp" clock wasn't
required originally.

Mark.

> +
>  	err = clk_prepare_enable(dsi->clk_lp);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "cannot enable low-power clock\n");
> diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.h
> index 5ce610d..a332caf 100644
> --- a/drivers/gpu/drm/tegra/dsi.h
> +++ b/drivers/gpu/drm/tegra/dsi.h
> @@ -127,4 +127,7 @@ enum tegra_dsi_format {
>  	TEGRA_DSI_FORMAT_24P,
>  };
>  
> +/* default lp clock rate */
> +#define DSI_LP_CLK_RATE			(70 * 1000 * 1000)
> +
>  #endif
> -- 
> 2.0.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
