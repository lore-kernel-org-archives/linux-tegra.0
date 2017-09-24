From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [Outreachy kernel] [PATCH v2] drm/tegra: Replace dev_* with
 DRM_DEV_*
Date: Sun, 24 Sep 2017 19:00:21 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709241854120.2366@hadrien>
References: <1506271437-23058-1-git-send-email-harshasharmaiitr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506271437-23058-1-git-send-email-harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On Sun, 24 Sep 2017, Harsha Sharma wrote:

> Replace all occurences of dev_info/err/dbg with DRM_DEV_INFO/
> ERROR/DEBUG as we have DRM_DEV_* variants of drm print macros
> Done using following coccinelle semantic patch
>
> @r@
> @@
>
> (
> -dev_info
> +DRM_DEV_INFO
> |
> -dev_err
> +DRM_DEV_ERROR
> |
> -dev_dbg
> +DRM_DEV_DEBUG
> )
>
> Signed-off-by: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>  -Break line over 80 characters
>  -Changes in comments not required
>
>  drivers/gpu/drm/tegra/dc.c     |  53 +++++++-----
>  drivers/gpu/drm/tegra/dpaux.c  |  24 +++---
>  drivers/gpu/drm/tegra/dsi.c    |  68 ++++++++-------
>  drivers/gpu/drm/tegra/falcon.c |  16 ++--
>  drivers/gpu/drm/tegra/fb.c     |  22 +++--
>  drivers/gpu/drm/tegra/gem.c    |   8 +-
>  drivers/gpu/drm/tegra/gr2d.c   |  10 ++-
>  drivers/gpu/drm/tegra/gr3d.c   |  20 +++--
>  drivers/gpu/drm/tegra/hdmi.c   |  66 +++++++++------
>  drivers/gpu/drm/tegra/output.c |   8 +-
>  drivers/gpu/drm/tegra/rgb.c    |  12 +--
>  drivers/gpu/drm/tegra/sor.c    | 184 +++++++++++++++++++++++++----------------
>  drivers/gpu/drm/tegra/vic.c    |  15 ++--
>  13 files changed, 304 insertions(+), 202 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 4df3911..fbc9cc1 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1137,7 +1137,7 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
>
>  	err = clk_set_parent(dc->clk, state->clk);
>  	if (err < 0)
> -		dev_err(dc->dev, "failed to set parent clock: %d\n", err);
> +		DRM_DEV_ERROR(dc->dev, "failed to set parent clock: %d\n", err);
>
>  	/*
>  	 * Outputs may not want to change the parent clock rate. This is only
> @@ -1150,7 +1150,7 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
>  	if (state->pclk > 0) {
>  		err = clk_set_rate(state->clk, state->pclk);
>  		if (err < 0)
> -			dev_err(dc->dev,
> +			DRM_DEV_ERROR(dc->dev,
>  				"failed to set clock rate to %lu Hz\n",
>  				state->pclk);
>  	}
> @@ -1195,7 +1195,7 @@ static int tegra_dc_wait_idle(struct tegra_dc *dc, unsigned long timeout)
>  		usleep_range(1000, 2000);
>  	}
>
> -	dev_dbg(dc->dev, "timeout waiting for DC to become idle\n");
> +	DRM_DEV_DEBUG(dc->dev, "timeout waiting for DC to become idle\n");
>  	return -ETIMEDOUT;
>  }
>
> @@ -1763,7 +1763,8 @@ static int tegra_dc_init(struct host1x_client *client)
>  	if (tegra->domain) {
>  		err = iommu_attach_device(tegra->domain, dc->dev);
>  		if (err < 0) {
> -			dev_err(dc->dev, "failed to attach to domain: %d\n",
> +			DRM_DEV_ERROR(dc->dev,
> +				"failed to attach to domain: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -1801,7 +1802,8 @@ static int tegra_dc_init(struct host1x_client *client)
>
>  	err = tegra_dc_rgb_init(drm, dc);
>  	if (err < 0 && err != -ENODEV) {
> -		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
> +		DRM_DEV_ERROR(dc->dev,
> +			"failed to initialize RGB output: %d\n", err);
>  		goto cleanup;
>  	}
>
> @@ -1812,13 +1814,15 @@ static int tegra_dc_init(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_dc_debugfs_init(dc, drm->primary);
>  		if (err < 0)
> -			dev_err(dc->dev, "debugfs setup failed: %d\n", err);
> +			DRM_DEV_ERROR(dc->dev,
> +				"debugfs setup failed: %d\n", err);

The string could be on the same line as the function name.  Just the err
could be moved to the next line, and lined up with the right side of the (.

Overall, looking through the rest, it would probably really be nicer to
line the extra arguments up with the right side of the (.


>  	}
>
>  	err = devm_request_irq(dc->dev, dc->irq, tegra_dc_irq, 0,
>  			       dev_name(dc->dev), dc);
>  	if (err < 0) {
> -		dev_err(dc->dev, "failed to request IRQ#%u: %d\n", dc->irq,
> +		DRM_DEV_ERROR(dc->dev,
> +			"failed to request IRQ#%u: %d\n", dc->irq,

Same here.  Try to keep the string on the first line.

>  			err);
>  		goto cleanup;
>  	}
> @@ -1850,12 +1854,14 @@ static int tegra_dc_exit(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_dc_debugfs_exit(dc);
>  		if (err < 0)
> -			dev_err(dc->dev, "debugfs cleanup failed: %d\n", err);
> +			DRM_DEV_ERROR(dc->dev,
> +				"debugfs cleanup failed: %d\n", err);

Same here.  And so on.

[...]

> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 046649e..f9e4ad3 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -854,7 +854,8 @@ static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
>
>  	err = tegra_mipi_disable(dsi->mipi);
>  	if (err < 0)
> -		dev_err(dsi->dev, "failed to disable MIPI calibration: %d\n",
> +		DRM_DEV_ERROR(dsi->dev,
> +		"failed to disable MIPI calibration: %d\n",

Here the string is much too far to the left.

julia
