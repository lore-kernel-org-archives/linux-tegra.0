From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [Outreachy kernel] [PATCH] drm/tegra: Replace dev_* with
 DRM_DEV_*
Date: Sun, 24 Sep 2017 08:52:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709240848120.2101@hadrien>
References: <1506232762-10235-1-git-send-email-harshasharmaiitr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506232762-10235-1-git-send-email-harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harsha Sharma <harshasharmaiitr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, outreachy-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On Sun, 24 Sep 2017, Harsha Sharma wrote:

> Replace all occurences of dev_info/err/dbg with DRM_DEV_INFO/
> ERROR/DEBUG as we have DRM_DEV_* variants of drm print macros
> Done using following coccinelle semantic patch

Some calls after under comments.  They could be dropped.

Some calls appear to now exceed 80 characters, because the name of the
print function is longer.  Newlines should be added to avoid this, if
possible.

When the argument list extends over multiple lines, the continuation lines
are lines up with the right side of the original position of the ( and not
the new position.  But it seems that the right side of the original
position coincides with a tab, so this could be OK, if it looks
reasonable.

julia

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
>  drivers/gpu/drm/tegra/dc.c     |  50 +++++++-------
>  drivers/gpu/drm/tegra/dpaux.c  |  22 +++----
>  drivers/gpu/drm/tegra/dsi.c    |  60 ++++++++---------
>  drivers/gpu/drm/tegra/falcon.c |  14 ++--
>  drivers/gpu/drm/tegra/fb.c     |  16 ++---
>  drivers/gpu/drm/tegra/gem.c    |   6 +-
>  drivers/gpu/drm/tegra/gr2d.c   |   8 +--
>  drivers/gpu/drm/tegra/gr3d.c   |  16 ++---
>  drivers/gpu/drm/tegra/hdmi.c   |  52 +++++++--------
>  drivers/gpu/drm/tegra/output.c |   6 +-
>  drivers/gpu/drm/tegra/rgb.c    |  10 +--
>  drivers/gpu/drm/tegra/sor.c    | 144 ++++++++++++++++++++---------------------
>  drivers/gpu/drm/tegra/vic.c    |  12 ++--
>  13 files changed, 208 insertions(+), 208 deletions(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 4df3911..16aff88 100644
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
> @@ -1370,14 +1370,14 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
>
>  	if (status & FRAME_END_INT) {
>  		/*
> -		dev_dbg(dc->dev, "%s(): frame end\n", __func__);
> +		DRM_DEV_DEBUG(dc->dev, "%s(): frame end\n", __func__);
>  		*/
>  		dc->stats.frames++;
>  	}
>
>  	if (status & VBLANK_INT) {
>  		/*
> -		dev_dbg(dc->dev, "%s(): vertical blank\n", __func__);
> +		DRM_DEV_DEBUG(dc->dev, "%s(): vertical blank\n", __func__);
>  		*/
>  		drm_crtc_handle_vblank(&dc->base);
>  		tegra_dc_finish_page_flip(dc);
> @@ -1386,14 +1386,14 @@ static irqreturn_t tegra_dc_irq(int irq, void *data)
>
>  	if (status & (WIN_A_UF_INT | WIN_B_UF_INT | WIN_C_UF_INT)) {
>  		/*
> -		dev_dbg(dc->dev, "%s(): underflow\n", __func__);
> +		DRM_DEV_DEBUG(dc->dev, "%s(): underflow\n", __func__);
>  		*/
>  		dc->stats.underflow++;
>  	}
>
>  	if (status & (WIN_A_OF_INT | WIN_B_OF_INT | WIN_C_OF_INT)) {
>  		/*
> -		dev_dbg(dc->dev, "%s(): overflow\n", __func__);
> +		DRM_DEV_DEBUG(dc->dev, "%s(): overflow\n", __func__);
>  		*/
>  		dc->stats.overflow++;
>  	}
> @@ -1763,7 +1763,7 @@ static int tegra_dc_init(struct host1x_client *client)
>  	if (tegra->domain) {
>  		err = iommu_attach_device(tegra->domain, dc->dev);
>  		if (err < 0) {
> -			dev_err(dc->dev, "failed to attach to domain: %d\n",
> +			DRM_DEV_ERROR(dc->dev, "failed to attach to domain: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -1801,7 +1801,7 @@ static int tegra_dc_init(struct host1x_client *client)
>
>  	err = tegra_dc_rgb_init(drm, dc);
>  	if (err < 0 && err != -ENODEV) {
> -		dev_err(dc->dev, "failed to initialize RGB output: %d\n", err);
> +		DRM_DEV_ERROR(dc->dev, "failed to initialize RGB output: %d\n", err);
>  		goto cleanup;
>  	}
>
> @@ -1812,13 +1812,13 @@ static int tegra_dc_init(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_dc_debugfs_init(dc, drm->primary);
>  		if (err < 0)
> -			dev_err(dc->dev, "debugfs setup failed: %d\n", err);
> +			DRM_DEV_ERROR(dc->dev, "debugfs setup failed: %d\n", err);
>  	}
>
>  	err = devm_request_irq(dc->dev, dc->irq, tegra_dc_irq, 0,
>  			       dev_name(dc->dev), dc);
>  	if (err < 0) {
> -		dev_err(dc->dev, "failed to request IRQ#%u: %d\n", dc->irq,
> +		DRM_DEV_ERROR(dc->dev, "failed to request IRQ#%u: %d\n", dc->irq,
>  			err);
>  		goto cleanup;
>  	}
> @@ -1850,12 +1850,12 @@ static int tegra_dc_exit(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_dc_debugfs_exit(dc);
>  		if (err < 0)
> -			dev_err(dc->dev, "debugfs cleanup failed: %d\n", err);
> +			DRM_DEV_ERROR(dc->dev, "debugfs cleanup failed: %d\n", err);
>  	}
>
>  	err = tegra_dc_rgb_exit(dc);
>  	if (err) {
> -		dev_err(dc->dev, "failed to shutdown RGB output: %d\n", err);
> +		DRM_DEV_ERROR(dc->dev, "failed to shutdown RGB output: %d\n", err);
>  		return err;
>  	}
>
> @@ -1954,7 +1954,7 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
>
>  	err = of_property_read_u32(dc->dev->of_node, "nvidia,head", &value);
>  	if (err < 0) {
> -		dev_err(dc->dev, "missing \"nvidia,head\" property\n");
> +		DRM_DEV_ERROR(dc->dev, "missing \"nvidia,head\" property\n");
>
>  		/*
>  		 * If the nvidia,head property isn't present, try to find the
> @@ -2009,13 +2009,13 @@ static int tegra_dc_probe(struct platform_device *pdev)
>
>  	dc->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(dc->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get clock\n");
>  		return PTR_ERR(dc->clk);
>  	}
>
>  	dc->rst = devm_reset_control_get(&pdev->dev, "dc");
>  	if (IS_ERR(dc->rst)) {
> -		dev_err(&pdev->dev, "failed to get reset\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get reset\n");
>  		return PTR_ERR(dc->rst);
>  	}
>
> @@ -2038,13 +2038,13 @@ static int tegra_dc_probe(struct platform_device *pdev)
>
>  	dc->irq = platform_get_irq(pdev, 0);
>  	if (dc->irq < 0) {
> -		dev_err(&pdev->dev, "failed to get IRQ\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get IRQ\n");
>  		return -ENXIO;
>  	}
>
>  	err = tegra_dc_rgb_probe(dc);
>  	if (err < 0 && err != -ENODEV) {
> -		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to probe RGB output: %d\n", err);
>  		return err;
>  	}
>
> @@ -2057,7 +2057,7 @@ static int tegra_dc_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&dc->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -2072,14 +2072,14 @@ static int tegra_dc_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&dc->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
>
>  	err = tegra_dc_rgb_remove(dc);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to remove RGB output: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to remove RGB output: %d\n", err);
>  		return err;
>  	}
>
> @@ -2097,7 +2097,7 @@ static int tegra_dc_suspend(struct device *dev)
>  	if (!dc->soc->broken_reset) {
>  		err = reset_control_assert(dc->rst);
>  		if (err < 0) {
> -			dev_err(dev, "failed to assert reset: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to assert reset: %d\n", err);
>  			return err;
>  		}
>  	}
> @@ -2119,20 +2119,20 @@ static int tegra_dc_resume(struct device *dev)
>  		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
>  							dc->rst);
>  		if (err < 0) {
> -			dev_err(dev, "failed to power partition: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to power partition: %d\n", err);
>  			return err;
>  		}
>  	} else {
>  		err = clk_prepare_enable(dc->clk);
>  		if (err < 0) {
> -			dev_err(dev, "failed to enable clock: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to enable clock: %d\n", err);
>  			return err;
>  		}
>
>  		if (!dc->soc->broken_reset) {
>  			err = reset_control_deassert(dc->rst);
>  			if (err < 0) {
> -				dev_err(dev,
> +				DRM_DEV_ERROR(dev,
>  					"failed to deassert reset: %d\n", err);
>  				return err;
>  			}
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index e4da041..1516bca 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -446,14 +446,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>
>  	dpaux->irq = platform_get_irq(pdev, 0);
>  	if (dpaux->irq < 0) {
> -		dev_err(&pdev->dev, "failed to get IRQ\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get IRQ\n");
>  		return -ENXIO;
>  	}
>
>  	if (!pdev->dev.pm_domain) {
>  		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
>  		if (IS_ERR(dpaux->rst)) {
> -			dev_err(&pdev->dev,
> +			DRM_DEV_ERROR(&pdev->dev,
>  				"failed to get reset control: %ld\n",
>  				PTR_ERR(dpaux->rst));
>  			return PTR_ERR(dpaux->rst);
> @@ -462,14 +462,14 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>
>  	dpaux->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(dpaux->clk)) {
> -		dev_err(&pdev->dev, "failed to get module clock: %ld\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get module clock: %ld\n",
>  			PTR_ERR(dpaux->clk));
>  		return PTR_ERR(dpaux->clk);
>  	}
>
>  	err = clk_prepare_enable(dpaux->clk);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to enable module clock: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to enable module clock: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -479,7 +479,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>
>  	dpaux->clk_parent = devm_clk_get(&pdev->dev, "parent");
>  	if (IS_ERR(dpaux->clk_parent)) {
> -		dev_err(&pdev->dev, "failed to get parent clock: %ld\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get parent clock: %ld\n",
>  			PTR_ERR(dpaux->clk_parent));
>  		err = PTR_ERR(dpaux->clk_parent);
>  		goto assert_reset;
> @@ -487,21 +487,21 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>
>  	err = clk_prepare_enable(dpaux->clk_parent);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to enable parent clock: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to enable parent clock: %d\n",
>  			err);
>  		goto assert_reset;
>  	}
>
>  	err = clk_set_rate(dpaux->clk_parent, 270000000);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to set clock to 270 MHz: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to set clock to 270 MHz: %d\n",
>  			err);
>  		goto disable_parent_clk;
>  	}
>
>  	dpaux->vdd = devm_regulator_get(&pdev->dev, "vdd");
>  	if (IS_ERR(dpaux->vdd)) {
> -		dev_err(&pdev->dev, "failed to get VDD supply: %ld\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get VDD supply: %ld\n",
>  			PTR_ERR(dpaux->vdd));
>  		err = PTR_ERR(dpaux->vdd);
>  		goto disable_parent_clk;
> @@ -510,7 +510,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>  	err = devm_request_irq(dpaux->dev, dpaux->irq, tegra_dpaux_irq, 0,
>  			       dev_name(dpaux->dev), dpaux);
>  	if (err < 0) {
> -		dev_err(dpaux->dev, "failed to request IRQ#%u: %d\n",
> +		DRM_DEV_ERROR(dpaux->dev, "failed to request IRQ#%u: %d\n",
>  			dpaux->irq, err);
>  		goto disable_parent_clk;
>  	}
> @@ -546,7 +546,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
>
>  	dpaux->pinctrl = devm_pinctrl_register(&pdev->dev, &dpaux->desc, dpaux);
>  	if (IS_ERR(dpaux->pinctrl)) {
> -		dev_err(&pdev->dev, "failed to register pincontrol\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register pincontrol\n");
>  		return PTR_ERR(dpaux->pinctrl);
>  	}
>  #endif
> @@ -779,7 +779,7 @@ int drm_dp_aux_train(struct drm_dp_aux *aux, struct drm_dp_link *link,
>  		break;
>
>  	default:
> -		dev_err(aux->dev, "unsupported training pattern %u\n", tp);
> +		DRM_DEV_ERROR(aux->dev, "unsupported training pattern %u\n", tp);
>  		return -EINVAL;
>  	}
>
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 046649e..22190f3 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -854,7 +854,7 @@ static void tegra_dsi_unprepare(struct tegra_dsi *dsi)
>
>  	err = tegra_mipi_disable(dsi->mipi);
>  	if (err < 0)
> -		dev_err(dsi->dev, "failed to disable MIPI calibration: %d\n",
> +		DRM_DEV_ERROR(dsi->dev, "failed to disable MIPI calibration: %d\n",
>  			err);
>
>  	pm_runtime_put(dsi->dev);
> @@ -887,7 +887,7 @@ static void tegra_dsi_encoder_disable(struct drm_encoder *encoder)
>
>  	err = tegra_dsi_wait_idle(dsi, 100);
>  	if (err < 0)
> -		dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
> +		DRM_DEV_DEBUG(dsi->dev, "failed to idle DSI: %d\n", err);
>
>  	tegra_dsi_soft_reset(dsi);
>
> @@ -907,12 +907,12 @@ static void tegra_dsi_prepare(struct tegra_dsi *dsi)
>
>  	err = tegra_mipi_enable(dsi->mipi);
>  	if (err < 0)
> -		dev_err(dsi->dev, "failed to enable MIPI calibration: %d\n",
> +		DRM_DEV_ERROR(dsi->dev, "failed to enable MIPI calibration: %d\n",
>  			err);
>
>  	err = tegra_dsi_pad_calibrate(dsi);
>  	if (err < 0)
> -		dev_err(dsi->dev, "MIPI calibration failed: %d\n", err);
> +		DRM_DEV_ERROR(dsi->dev, "MIPI calibration failed: %d\n", err);
>
>  	if (dsi->slave)
>  		tegra_dsi_prepare(dsi->slave);
> @@ -1006,7 +1006,7 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
>
>  	err = mipi_dphy_timing_validate(&state->timing, state->period);
>  	if (err < 0) {
> -		dev_err(dsi->dev, "failed to validate D-PHY timing: %d\n", err);
> +		DRM_DEV_ERROR(dsi->dev, "failed to validate D-PHY timing: %d\n", err);
>  		return err;
>  	}
>
> @@ -1032,7 +1032,7 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
>  	err = tegra_dc_state_setup_clock(dc, crtc_state, dsi->clk_parent,
>  					 plld, scdiv);
>  	if (err < 0) {
> -		dev_err(output->dev, "failed to setup CRTC state: %d\n", err);
> +		DRM_DEV_ERROR(output->dev, "failed to setup CRTC state: %d\n", err);
>  		return err;
>  	}
>
> @@ -1074,7 +1074,7 @@ static int tegra_dsi_init(struct host1x_client *client)
>
>  		err = tegra_output_init(drm, &dsi->output);
>  		if (err < 0)
> -			dev_err(dsi->dev, "failed to initialize output: %d\n",
> +			DRM_DEV_ERROR(dsi->dev, "failed to initialize output: %d\n",
>  				err);
>
>  		dsi->output.encoder.possible_crtcs = 0x3;
> @@ -1083,7 +1083,7 @@ static int tegra_dsi_init(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_dsi_debugfs_init(dsi, drm->primary);
>  		if (err < 0)
> -			dev_err(dsi->dev, "debugfs setup failed: %d\n", err);
> +			DRM_DEV_ERROR(dsi->dev, "debugfs setup failed: %d\n", err);
>  	}
>
>  	return 0;
> @@ -1159,11 +1159,11 @@ static ssize_t tegra_dsi_read_response(struct tegra_dsi *dsi,
>  	switch (value & 0x3f) {
>  	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
>  		errors = (value >> 8) & 0xffff;
> -		dev_dbg(dsi->dev, "Acknowledge and error report: %04x\n",
> +		DRM_DEV_DEBUG(dsi->dev, "Acknowledge and error report: %04x\n",
>  			errors);
>  		for (i = 0; i < ARRAY_SIZE(error_report); i++)
>  			if (errors & BIT(i))
> -				dev_dbg(dsi->dev, "  %2u: %s\n", i,
> +				DRM_DEV_DEBUG(dsi->dev, "  %2u: %s\n", i,
>  					error_report[i]);
>  		break;
>
> @@ -1187,7 +1187,7 @@ static ssize_t tegra_dsi_read_response(struct tegra_dsi *dsi,
>  		break;
>
>  	default:
> -		dev_err(dsi->dev, "unhandled response type: %02x\n",
> +		DRM_DEV_ERROR(dsi->dev, "unhandled response type: %02x\n",
>  			value & 0x3f);
>  		return -EPROTO;
>  	}
> @@ -1350,25 +1350,25 @@ static ssize_t tegra_dsi_host_transfer(struct mipi_dsi_host *host,
>  		switch (value) {
>  		case 0x84:
>  			/*
> -			dev_dbg(dsi->dev, "ACK\n");
> +			DRM_DEV_DEBUG(dsi->dev, "ACK\n");
>  			*/
>  			break;
>
>  		case 0x87:
>  			/*
> -			dev_dbg(dsi->dev, "ESCAPE\n");
> +			DRM_DEV_DEBUG(dsi->dev, "ESCAPE\n");
>  			*/
>  			break;
>
>  		default:
> -			dev_err(dsi->dev, "unknown status: %08x\n", value);
> +			DRM_DEV_ERROR(dsi->dev, "unknown status: %08x\n", value);
>  			break;
>  		}
>
>  		if (count > 1) {
>  			err = tegra_dsi_read_response(dsi, msg, count);
>  			if (err < 0)
> -				dev_err(dsi->dev,
> +				DRM_DEV_ERROR(dsi->dev,
>  					"failed to parse response: %zd\n",
>  					err);
>  			else {
> @@ -1419,12 +1419,12 @@ static int tegra_dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->slave) {
>  		int err;
>
> -		dev_dbg(dsi->dev, "attaching dual-channel device %s\n",
> +		DRM_DEV_DEBUG(dsi->dev, "attaching dual-channel device %s\n",
>  			dev_name(&device->dev));
>
>  		err = tegra_dsi_ganged_setup(dsi);
>  		if (err < 0) {
> -			dev_err(dsi->dev, "failed to set up ganged mode: %d\n",
> +			DRM_DEV_ERROR(dsi->dev, "failed to set up ganged mode: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -1530,31 +1530,31 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>
>  	dsi->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(dsi->clk)) {
> -		dev_err(&pdev->dev, "cannot get DSI clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get DSI clock\n");
>  		return PTR_ERR(dsi->clk);
>  	}
>
>  	dsi->clk_lp = devm_clk_get(&pdev->dev, "lp");
>  	if (IS_ERR(dsi->clk_lp)) {
> -		dev_err(&pdev->dev, "cannot get low-power clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get low-power clock\n");
>  		return PTR_ERR(dsi->clk_lp);
>  	}
>
>  	dsi->clk_parent = devm_clk_get(&pdev->dev, "parent");
>  	if (IS_ERR(dsi->clk_parent)) {
> -		dev_err(&pdev->dev, "cannot get parent clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get parent clock\n");
>  		return PTR_ERR(dsi->clk_parent);
>  	}
>
>  	dsi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>  	if (IS_ERR(dsi->vdd)) {
> -		dev_err(&pdev->dev, "cannot get VDD supply\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get VDD supply\n");
>  		return PTR_ERR(dsi->vdd);
>  	}
>
>  	err = tegra_dsi_setup_clocks(dsi);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "cannot setup clocks\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot setup clocks\n");
>  		return err;
>  	}
>
> @@ -1572,7 +1572,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>
>  	err = mipi_dsi_host_register(&dsi->host);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register DSI host: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register DSI host: %d\n", err);
>  		goto mipi_free;
>  	}
>
> @@ -1585,7 +1585,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&dsi->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
>  		goto unregister;
>  	}
> @@ -1608,7 +1608,7 @@ static int tegra_dsi_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&dsi->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -1630,7 +1630,7 @@ static int tegra_dsi_suspend(struct device *dev)
>  	if (dsi->rst) {
>  		err = reset_control_assert(dsi->rst);
>  		if (err < 0) {
> -			dev_err(dev, "failed to assert reset: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to assert reset: %d\n", err);
>  			return err;
>  		}
>  	}
> @@ -1652,19 +1652,19 @@ static int tegra_dsi_resume(struct device *dev)
>
>  	err = regulator_enable(dsi->vdd);
>  	if (err < 0) {
> -		dev_err(dsi->dev, "failed to enable VDD supply: %d\n", err);
> +		DRM_DEV_ERROR(dsi->dev, "failed to enable VDD supply: %d\n", err);
>  		return err;
>  	}
>
>  	err = clk_prepare_enable(dsi->clk);
>  	if (err < 0) {
> -		dev_err(dev, "cannot enable DSI clock: %d\n", err);
> +		DRM_DEV_ERROR(dev, "cannot enable DSI clock: %d\n", err);
>  		goto disable_vdd;
>  	}
>
>  	err = clk_prepare_enable(dsi->clk_lp);
>  	if (err < 0) {
> -		dev_err(dev, "cannot enable low-power clock: %d\n", err);
> +		DRM_DEV_ERROR(dev, "cannot enable low-power clock: %d\n", err);
>  		goto disable_clk;
>  	}
>
> @@ -1673,7 +1673,7 @@ static int tegra_dsi_resume(struct device *dev)
>  	if (dsi->rst) {
>  		err = reset_control_deassert(dsi->rst);
>  		if (err < 0) {
> -			dev_err(dev, "cannot assert reset: %d\n", err);
> +			DRM_DEV_ERROR(dev, "cannot assert reset: %d\n", err);
>  			goto disable_clk_lp;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
> index f685e729..e2dcb21 100644
> --- a/drivers/gpu/drm/tegra/falcon.c
> +++ b/drivers/gpu/drm/tegra/falcon.c
> @@ -75,7 +75,7 @@ static void falcon_copy_firmware_image(struct falcon *falcon,
>  			       falcon->firmware.size, DMA_TO_DEVICE);
>  	err = dma_mapping_error(falcon->dev, daddr);
>  	if (err) {
> -		dev_err(falcon->dev, "failed to map firmware: %d\n", err);
> +		DRM_DEV_ERROR(falcon->dev, "failed to map firmware: %d\n", err);
>  		return;
>  	}
>  	dma_sync_single_for_device(falcon->dev, daddr,
> @@ -91,19 +91,19 @@ static int falcon_parse_firmware_image(struct falcon *falcon)
>
>  	/* endian problems would show up right here */
>  	if (bin->magic != PCI_VENDOR_ID_NVIDIA) {
> -		dev_err(falcon->dev, "incorrect firmware magic\n");
> +		DRM_DEV_ERROR(falcon->dev, "incorrect firmware magic\n");
>  		return -EINVAL;
>  	}
>
>  	/* currently only version 1 is supported */
>  	if (bin->version != 1) {
> -		dev_err(falcon->dev, "unsupported firmware version\n");
> +		DRM_DEV_ERROR(falcon->dev, "unsupported firmware version\n");
>  		return -EINVAL;
>  	}
>
>  	/* check that the firmware size is consistent */
>  	if (bin->size > falcon->firmware.size) {
> -		dev_err(falcon->dev, "firmware image size inconsistency\n");
> +		DRM_DEV_ERROR(falcon->dev, "firmware image size inconsistency\n");
>  		return -EINVAL;
>  	}
>
> @@ -142,7 +142,7 @@ int falcon_load_firmware(struct falcon *falcon)
>  	falcon->firmware.vaddr = falcon->ops->alloc(falcon, firmware->size,
>  						    &falcon->firmware.paddr);
>  	if (!falcon->firmware.vaddr) {
> -		dev_err(falcon->dev, "dma memory mapping failed\n");
> +		DRM_DEV_ERROR(falcon->dev, "dma memory mapping failed\n");
>  		return -ENOMEM;
>  	}
>
> @@ -152,7 +152,7 @@ int falcon_load_firmware(struct falcon *falcon)
>  	/* parse the image data */
>  	err = falcon_parse_firmware_image(falcon);
>  	if (err < 0) {
> -		dev_err(falcon->dev, "failed to parse firmware image\n");
> +		DRM_DEV_ERROR(falcon->dev, "failed to parse firmware image\n");
>  		goto err_setup_firmware_image;
>  	}
>
> @@ -245,7 +245,7 @@ int falcon_boot(struct falcon *falcon)
>
>  	err = falcon_wait_idle(falcon);
>  	if (err < 0) {
> -		dev_err(falcon->dev, "Falcon boot failed due to timeout\n");
> +		DRM_DEV_ERROR(falcon->dev, "Falcon boot failed due to timeout\n");
>  		return err;
>  	}
>
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 80540c1..aa2d183 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -138,7 +138,7 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_device *drm,
>
>  	err = drm_framebuffer_init(drm, &fb->base, &tegra_fb_funcs);
>  	if (err < 0) {
> -		dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
> +		DRM_DEV_ERROR(drm->dev, "failed to initialize framebuffer: %d\n",
>  			err);
>  		kfree(fb->planes);
>  		kfree(fb);
> @@ -241,7 +241,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>
>  	info = drm_fb_helper_alloc_fbi(helper);
>  	if (IS_ERR(info)) {
> -		dev_err(drm->dev, "failed to allocate framebuffer info\n");
> +		DRM_DEV_ERROR(drm->dev, "failed to allocate framebuffer info\n");
>  		drm_gem_object_put_unlocked(&bo->gem);
>  		return PTR_ERR(info);
>  	}
> @@ -249,7 +249,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  	fbdev->fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
>  	if (IS_ERR(fbdev->fb)) {
>  		err = PTR_ERR(fbdev->fb);
> -		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
> +		DRM_DEV_ERROR(drm->dev, "failed to allocate DRM framebuffer: %d\n",
>  			err);
>  		drm_gem_object_put_unlocked(&bo->gem);
>  		return PTR_ERR(fbdev->fb);
> @@ -273,7 +273,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  		bo->vaddr = vmap(bo->pages, bo->num_pages, VM_MAP,
>  				 pgprot_writecombine(PAGE_KERNEL));
>  		if (!bo->vaddr) {
> -			dev_err(drm->dev, "failed to vmap() framebuffer\n");
> +			DRM_DEV_ERROR(drm->dev, "failed to vmap() framebuffer\n");
>  			err = -ENOMEM;
>  			goto destroy;
>  		}
> @@ -302,7 +302,7 @@ static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
>
>  	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
>  	if (!fbdev) {
> -		dev_err(drm->dev, "failed to allocate DRM fbdev\n");
> +		DRM_DEV_ERROR(drm->dev, "failed to allocate DRM fbdev\n");
>  		return ERR_PTR(-ENOMEM);
>  	}
>
> @@ -326,20 +326,20 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbdev,
>
>  	err = drm_fb_helper_init(drm, &fbdev->base, max_connectors);
>  	if (err < 0) {
> -		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
> +		DRM_DEV_ERROR(drm->dev, "failed to initialize DRM FB helper: %d\n",
>  			err);
>  		return err;
>  	}
>
>  	err = drm_fb_helper_single_add_all_connectors(&fbdev->base);
>  	if (err < 0) {
> -		dev_err(drm->dev, "failed to add connectors: %d\n", err);
> +		DRM_DEV_ERROR(drm->dev, "failed to add connectors: %d\n", err);
>  		goto fini;
>  	}
>
>  	err = drm_fb_helper_initial_config(&fbdev->base, preferred_bpp);
>  	if (err < 0) {
> -		dev_err(drm->dev, "failed to set initial configuration: %d\n",
> +		DRM_DEV_ERROR(drm->dev, "failed to set initial configuration: %d\n",
>  			err);
>  		goto fini;
>  	}
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index ab1e53d..39c8c69 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -128,7 +128,7 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
>  	err = drm_mm_insert_node_generic(&tegra->mm,
>  					 bo->mm, bo->gem.size, PAGE_SIZE, 0, 0);
>  	if (err < 0) {
> -		dev_err(tegra->drm->dev, "out of I/O virtual memory: %zd\n",
> +		DRM_DEV_ERROR(tegra->drm->dev, "out of I/O virtual memory: %zd\n",
>  			err);
>  		goto unlock;
>  	}
> @@ -138,7 +138,7 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
>  	err = iommu_map_sg(tegra->domain, bo->paddr, bo->sgt->sgl,
>  			   bo->sgt->nents, prot);
>  	if (err < 0) {
> -		dev_err(tegra->drm->dev, "failed to map buffer: %zd\n", err);
> +		DRM_DEV_ERROR(tegra->drm->dev, "failed to map buffer: %zd\n", err);
>  		goto remove;
>  	}
>
> @@ -268,7 +268,7 @@ static int tegra_bo_alloc(struct drm_device *drm, struct tegra_bo *bo)
>  		bo->vaddr = dma_alloc_wc(drm->dev, size, &bo->paddr,
>  					 GFP_KERNEL | __GFP_NOWARN);
>  		if (!bo->vaddr) {
> -			dev_err(drm->dev,
> +			DRM_DEV_ERROR(drm->dev,
>  				"failed to allocate buffer of size %zu\n",
>  				size);
>  			return -ENOMEM;
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 6ea070d..8e4ae75 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -164,13 +164,13 @@ static int gr2d_probe(struct platform_device *pdev)
>
>  	gr2d->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(gr2d->clk)) {
> -		dev_err(dev, "cannot get clock\n");
> +		DRM_DEV_ERROR(dev, "cannot get clock\n");
>  		return PTR_ERR(gr2d->clk);
>  	}
>
>  	err = clk_prepare_enable(gr2d->clk);
>  	if (err) {
> -		dev_err(dev, "cannot turn on clock\n");
> +		DRM_DEV_ERROR(dev, "cannot turn on clock\n");
>  		return err;
>  	}
>
> @@ -186,7 +186,7 @@ static int gr2d_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&gr2d->client.base);
>  	if (err < 0) {
> -		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to register host1x client: %d\n", err);
>  		clk_disable_unprepare(gr2d->clk);
>  		return err;
>  	}
> @@ -207,7 +207,7 @@ static int gr2d_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&gr2d->client.base);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index cee2ab6..81983bc 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -256,27 +256,27 @@ static int gr3d_probe(struct platform_device *pdev)
>
>  	gr3d->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(gr3d->clk)) {
> -		dev_err(&pdev->dev, "cannot get clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get clock\n");
>  		return PTR_ERR(gr3d->clk);
>  	}
>
>  	gr3d->rst = devm_reset_control_get(&pdev->dev, "3d");
>  	if (IS_ERR(gr3d->rst)) {
> -		dev_err(&pdev->dev, "cannot get reset\n");
> +		DRM_DEV_ERROR(&pdev->dev, "cannot get reset\n");
>  		return PTR_ERR(gr3d->rst);
>  	}
>
>  	if (of_device_is_compatible(np, "nvidia,tegra30-gr3d")) {
>  		gr3d->clk_secondary = devm_clk_get(&pdev->dev, "3d2");
>  		if (IS_ERR(gr3d->clk_secondary)) {
> -			dev_err(&pdev->dev, "cannot get secondary clock\n");
> +			DRM_DEV_ERROR(&pdev->dev, "cannot get secondary clock\n");
>  			return PTR_ERR(gr3d->clk_secondary);
>  		}
>
>  		gr3d->rst_secondary = devm_reset_control_get(&pdev->dev,
>  								"3d2");
>  		if (IS_ERR(gr3d->rst_secondary)) {
> -			dev_err(&pdev->dev, "cannot get secondary reset\n");
> +			DRM_DEV_ERROR(&pdev->dev, "cannot get secondary reset\n");
>  			return PTR_ERR(gr3d->rst_secondary);
>  		}
>  	}
> @@ -284,7 +284,7 @@ static int gr3d_probe(struct platform_device *pdev)
>  	err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_3D, gr3d->clk,
>  						gr3d->rst);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to power up 3D unit\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to power up 3D unit\n");
>  		return err;
>  	}
>
> @@ -293,7 +293,7 @@ static int gr3d_probe(struct platform_device *pdev)
>  							gr3d->clk_secondary,
>  							gr3d->rst_secondary);
>  		if (err < 0) {
> -			dev_err(&pdev->dev,
> +			DRM_DEV_ERROR(&pdev->dev,
>  				"failed to power up secondary 3D unit\n");
>  			return err;
>  		}
> @@ -311,7 +311,7 @@ static int gr3d_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&gr3d->client.base);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -332,7 +332,7 @@ static int gr3d_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&gr3d->client.base);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 5b9d83b..26d4aed 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -597,7 +597,7 @@ static int tegra_hdmi_setup_audio(struct tegra_hdmi *hdmi)
>  	config = tegra_hdmi_get_audio_config(hdmi->audio_sample_rate,
>  					     hdmi->pixel_clock);
>  	if (!config) {
> -		dev_err(hdmi->dev,
> +		DRM_DEV_ERROR(hdmi->dev,
>  			"cannot set audio to %u Hz at %u Hz pixel clock\n",
>  			hdmi->audio_sample_rate, hdmi->pixel_clock);
>  		return -EINVAL;
> @@ -704,7 +704,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hdmi *hdmi, const void *data,
>  		break;
>
>  	default:
> -		dev_err(hdmi->dev, "unsupported infoframe type: %02x\n",
> +		DRM_DEV_ERROR(hdmi->dev, "unsupported infoframe type: %02x\n",
>  			ptr[0]);
>  		return;
>  	}
> @@ -742,13 +742,13 @@ static void tegra_hdmi_setup_avi_infoframe(struct tegra_hdmi *hdmi,
>
>  	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, mode, false);
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to setup AVI infoframe: %zd\n", err);
> +		DRM_DEV_ERROR(hdmi->dev, "failed to setup AVI infoframe: %zd\n", err);
>  		return;
>  	}
>
>  	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to pack AVI infoframe: %zd\n", err);
> +		DRM_DEV_ERROR(hdmi->dev, "failed to pack AVI infoframe: %zd\n", err);
>  		return;
>  	}
>
> @@ -781,7 +781,7 @@ static void tegra_hdmi_setup_audio_infoframe(struct tegra_hdmi *hdmi)
>
>  	err = hdmi_audio_infoframe_init(&frame);
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to setup audio infoframe: %zd\n",
> +		DRM_DEV_ERROR(hdmi->dev, "failed to setup audio infoframe: %zd\n",
>  			err);
>  		return;
>  	}
> @@ -790,7 +790,7 @@ static void tegra_hdmi_setup_audio_infoframe(struct tegra_hdmi *hdmi)
>
>  	err = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to pack audio infoframe: %zd\n",
> +		DRM_DEV_ERROR(hdmi->dev, "failed to pack audio infoframe: %zd\n",
>  			err);
>  		return;
>  	}
> @@ -833,7 +833,7 @@ static void tegra_hdmi_setup_stereo_infoframe(struct tegra_hdmi *hdmi)
>
>  	err = hdmi_vendor_infoframe_pack(&frame, buffer, sizeof(buffer));
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to pack vendor infoframe: %zd\n",
> +		DRM_DEV_ERROR(hdmi->dev, "failed to pack vendor infoframe: %zd\n",
>  			err);
>  		return;
>  	}
> @@ -1009,7 +1009,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
>
>  	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
> +		DRM_DEV_ERROR(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
>  			err);
>  	}
>
> @@ -1209,7 +1209,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
>  	err = tegra_dc_state_setup_clock(dc, crtc_state, hdmi->clk_parent,
>  					 pclk, 0);
>  	if (err < 0) {
> -		dev_err(output->dev, "failed to setup CRTC state: %d\n", err);
> +		DRM_DEV_ERROR(output->dev, "failed to setup CRTC state: %d\n", err);
>  		return err;
>  	}
>
> @@ -1496,7 +1496,7 @@ static int tegra_hdmi_init(struct host1x_client *client)
>
>  	err = tegra_output_init(drm, &hdmi->output);
>  	if (err < 0) {
> -		dev_err(client->dev, "failed to initialize output: %d\n", err);
> +		DRM_DEV_ERROR(client->dev, "failed to initialize output: %d\n", err);
>  		return err;
>  	}
>
> @@ -1505,25 +1505,25 @@ static int tegra_hdmi_init(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_hdmi_debugfs_init(hdmi, drm->primary);
>  		if (err < 0)
> -			dev_err(client->dev, "debugfs setup failed: %d\n", err);
> +			DRM_DEV_ERROR(client->dev, "debugfs setup failed: %d\n", err);
>  	}
>
>  	err = regulator_enable(hdmi->hdmi);
>  	if (err < 0) {
> -		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
> +		DRM_DEV_ERROR(client->dev, "failed to enable HDMI regulator: %d\n",
>  			err);
>  		return err;
>  	}
>
>  	err = regulator_enable(hdmi->pll);
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
> +		DRM_DEV_ERROR(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
>  		return err;
>  	}
>
>  	err = regulator_enable(hdmi->vdd);
>  	if (err < 0) {
> -		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
> +		DRM_DEV_ERROR(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
>  		return err;
>  	}
>
> @@ -1687,13 +1687,13 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>
>  	hdmi->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(hdmi->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get clock\n");
>  		return PTR_ERR(hdmi->clk);
>  	}
>
>  	hdmi->rst = devm_reset_control_get(&pdev->dev, "hdmi");
>  	if (IS_ERR(hdmi->rst)) {
> -		dev_err(&pdev->dev, "failed to get reset\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get reset\n");
>  		return PTR_ERR(hdmi->rst);
>  	}
>
> @@ -1703,25 +1703,25 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>
>  	err = clk_set_parent(hdmi->clk, hdmi->clk_parent);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to setup clocks: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to setup clocks: %d\n", err);
>  		return err;
>  	}
>
>  	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
>  	if (IS_ERR(hdmi->hdmi)) {
> -		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get HDMI regulator\n");
>  		return PTR_ERR(hdmi->hdmi);
>  	}
>
>  	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
>  	if (IS_ERR(hdmi->pll)) {
> -		dev_err(&pdev->dev, "failed to get PLL regulator\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get PLL regulator\n");
>  		return PTR_ERR(hdmi->pll);
>  	}
>
>  	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
>  	if (IS_ERR(hdmi->vdd)) {
> -		dev_err(&pdev->dev, "failed to get VDD regulator\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get VDD regulator\n");
>  		return PTR_ERR(hdmi->vdd);
>  	}
>
> @@ -1745,7 +1745,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>  	err = devm_request_irq(hdmi->dev, hdmi->irq, tegra_hdmi_irq, 0,
>  			       dev_name(hdmi->dev), hdmi);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ#%u: %d\n",
>  			hdmi->irq, err);
>  		return err;
>  	}
> @@ -1759,7 +1759,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&hdmi->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -1776,7 +1776,7 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&hdmi->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -1794,7 +1794,7 @@ static int tegra_hdmi_suspend(struct device *dev)
>
>  	err = reset_control_assert(hdmi->rst);
>  	if (err < 0) {
> -		dev_err(dev, "failed to assert reset: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to assert reset: %d\n", err);
>  		return err;
>  	}
>
> @@ -1812,7 +1812,7 @@ static int tegra_hdmi_resume(struct device *dev)
>
>  	err = clk_prepare_enable(hdmi->clk);
>  	if (err < 0) {
> -		dev_err(dev, "failed to enable clock: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to enable clock: %d\n", err);
>  		return err;
>  	}
>
> @@ -1820,7 +1820,7 @@ static int tegra_hdmi_resume(struct device *dev)
>
>  	err = reset_control_deassert(hdmi->rst);
>  	if (err < 0) {
> -		dev_err(dev, "failed to deassert reset: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to deassert reset: %d\n", err);
>  		clk_disable_unprepare(hdmi->clk);
>  		return err;
>  	}
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 595d1ec..6f1122e 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -132,13 +132,13 @@ int tegra_output_probe(struct tegra_output *output)
>  		err = gpio_request_one(output->hpd_gpio, GPIOF_DIR_IN,
>  				       "HDMI hotplug detect");
>  		if (err < 0) {
> -			dev_err(output->dev, "gpio_request_one(): %d\n", err);
> +			DRM_DEV_ERROR(output->dev, "gpio_request_one(): %d\n", err);
>  			return err;
>  		}
>
>  		err = gpio_to_irq(output->hpd_gpio);
>  		if (err < 0) {
> -			dev_err(output->dev, "gpio_to_irq(): %d\n", err);
> +			DRM_DEV_ERROR(output->dev, "gpio_to_irq(): %d\n", err);
>  			gpio_free(output->hpd_gpio);
>  			return err;
>  		}
> @@ -151,7 +151,7 @@ int tegra_output_probe(struct tegra_output *output)
>  		err = request_threaded_irq(output->hpd_irq, NULL, hpd_irq,
>  					   flags, "hpd", output);
>  		if (err < 0) {
> -			dev_err(output->dev, "failed to request IRQ#%u: %d\n",
> +			DRM_DEV_ERROR(output->dev, "failed to request IRQ#%u: %d\n",
>  				output->hpd_irq, err);
>  			gpio_free(output->hpd_gpio);
>  			return err;
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index 78ec519..aae125d 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -201,7 +201,7 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
>  	err = tegra_dc_state_setup_clock(dc, crtc_state, rgb->clk_parent,
>  					 pclk, div);
>  	if (err < 0) {
> -		dev_err(output->dev, "failed to setup CRTC state: %d\n", err);
> +		DRM_DEV_ERROR(output->dev, "failed to setup CRTC state: %d\n", err);
>  		return err;
>  	}
>
> @@ -238,19 +238,19 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>
>  	rgb->clk = devm_clk_get(dc->dev, NULL);
>  	if (IS_ERR(rgb->clk)) {
> -		dev_err(dc->dev, "failed to get clock\n");
> +		DRM_DEV_ERROR(dc->dev, "failed to get clock\n");
>  		return PTR_ERR(rgb->clk);
>  	}
>
>  	rgb->clk_parent = devm_clk_get(dc->dev, "parent");
>  	if (IS_ERR(rgb->clk_parent)) {
> -		dev_err(dc->dev, "failed to get parent clock\n");
> +		DRM_DEV_ERROR(dc->dev, "failed to get parent clock\n");
>  		return PTR_ERR(rgb->clk_parent);
>  	}
>
>  	err = clk_set_parent(rgb->clk, rgb->clk_parent);
>  	if (err < 0) {
> -		dev_err(dc->dev, "failed to set parent clock: %d\n", err);
> +		DRM_DEV_ERROR(dc->dev, "failed to set parent clock: %d\n", err);
>  		return err;
>  	}
>
> @@ -295,7 +295,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
>
>  	err = tegra_output_init(drm, output);
>  	if (err < 0) {
> -		dev_err(output->dev, "failed to initialize output: %d\n", err);
> +		DRM_DEV_ERROR(output->dev, "failed to initialize output: %d\n", err);
>  		return err;
>  	}
>
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 7ab1d1d..af9bb45 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -751,7 +751,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
>  		config->tu_size = params.tu_size;
>  	}
>
> -	dev_dbg(sor->dev,
> +	DRM_DEV_DEBUG(sor->dev,
>  		"polarity: %d active count: %d tu size: %d active frac: %d\n",
>  		config->active_polarity, config->active_count,
>  		config->tu_size, config->active_frac);
> @@ -766,12 +766,12 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
>
>  	if (config->watermark > 30) {
>  		config->watermark = 30;
> -		dev_err(sor->dev,
> +		DRM_DEV_ERROR(sor->dev,
>  			"unable to compute TU size, forcing watermark to %u\n",
>  			config->watermark);
>  	} else if (config->watermark > num_syms_per_line) {
>  		config->watermark = num_syms_per_line;
> -		dev_err(sor->dev, "watermark too high, forcing to %u\n",
> +		DRM_DEV_ERROR(sor->dev, "watermark too high, forcing to %u\n",
>  			config->watermark);
>  	}
>
> @@ -789,7 +789,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
>  	config->vblank_symbols = div_u64(num, pclk);
>  	config->vblank_symbols -= 36 / link->num_lanes + 4;
>
> -	dev_dbg(sor->dev, "blank symbols: H:%u V:%u\n", config->hblank_symbols,
> +	DRM_DEV_DEBUG(sor->dev, "blank symbols: H:%u V:%u\n", config->hblank_symbols,
>  		config->vblank_symbols);
>
>  	return 0;
> @@ -999,7 +999,7 @@ static int tegra_sor_power_down(struct tegra_sor *sor)
>  	/* switch to safe parent clock */
>  	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set safe parent clock: %d\n", err);
>
>  	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
>  	value &= ~(SOR_DP_PADCTL_PD_TXD_3 | SOR_DP_PADCTL_PD_TXD_0 |
> @@ -1404,7 +1404,7 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_detach(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to detach SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to detach SOR: %d\n", err);
>
>  	tegra_sor_writel(sor, 0, SOR_STATE1);
>  	tegra_sor_update(sor);
> @@ -1423,17 +1423,17 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_power_down(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power down SOR: %d\n", err);
>
>  	if (sor->aux) {
>  		err = drm_dp_aux_disable(sor->aux);
>  		if (err < 0)
> -			dev_err(sor->dev, "failed to disable DP: %d\n", err);
> +			DRM_DEV_ERROR(sor->dev, "failed to disable DP: %d\n", err);
>  	}
>
>  	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_LVDS);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power off I/O rail: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power off I/O rail: %d\n", err);
>
>  	if (output->panel)
>  		drm_panel_unprepare(output->panel);
> @@ -1506,25 +1506,25 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>
>  	err = drm_dp_aux_enable(sor->aux);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to enable DP: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to enable DP: %d\n", err);
>
>  	err = drm_dp_link_probe(sor->aux, &link);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to probe eDP link: %d\n", err);
>  		return;
>  	}
>
>  	/* switch to safe parent clock */
>  	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set safe parent clock: %d\n", err);
>
>  	memset(&config, 0, sizeof(config));
>  	config.bits_per_pixel = state->bpc * 3;
>
>  	err = tegra_sor_compute_config(sor, mode, &config, &link);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to compute configuration: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to compute configuration: %d\n", err);
>
>  	value = tegra_sor_readl(sor, SOR_CLK_CNTRL);
>  	value &= ~SOR_CLK_CNTRL_DP_CLK_SEL_MASK;
> @@ -1593,7 +1593,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>  	/* step 2 */
>  	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power on I/O rail: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power on I/O rail: %d\n", err);
>
>  	usleep_range(5, 100);
>
> @@ -1632,7 +1632,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>  	/* switch to DP parent clock */
>  	err = tegra_sor_set_parent_clock(sor, sor->clk_dp);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set parent clock: %d\n", err);
>
>  	/* power DP lanes */
>  	value = tegra_sor_readl(sor, SOR_DP_PADCTL0);
> @@ -1702,15 +1702,15 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>
>  	err = drm_dp_link_probe(sor->aux, &link);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to probe eDP link: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to probe eDP link: %d\n", err);
>
>  	err = drm_dp_link_power_up(sor->aux, &link);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power up eDP link: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power up eDP link: %d\n", err);
>
>  	err = drm_dp_link_configure(sor->aux, &link);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to configure eDP link: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to configure eDP link: %d\n", err);
>
>  	rate = drm_dp_link_rate_to_bw_code(link.rate);
>  	lanes = link.num_lanes;
> @@ -1742,13 +1742,13 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_dp_train_fast(sor, &link);
>  	if (err < 0)
> -		dev_err(sor->dev, "DP fast link training failed: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "DP fast link training failed: %d\n", err);
>
> -	dev_dbg(sor->dev, "fast link training succeeded\n");
> +	DRM_DEV_DEBUG(sor->dev, "fast link training succeeded\n");
>
>  	err = tegra_sor_power_up(sor, 250);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power up SOR: %d\n", err);
>
>  	/* CSTM (LVDS, link A/B, upper) */
>  	value = SOR_CSTM_LVDS | SOR_CSTM_LINK_ACT_A | SOR_CSTM_LINK_ACT_B |
> @@ -1766,7 +1766,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>  	/* PWM setup */
>  	err = tegra_sor_setup_pwm(sor, 250);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to setup PWM: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to setup PWM: %d\n", err);
>
>  	tegra_sor_update(sor);
>
> @@ -1778,11 +1778,11 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_attach(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to attach SOR: %d\n", err);
>
>  	err = tegra_sor_wakeup(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to enable DC: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to enable DC: %d\n", err);
>
>  	if (output->panel)
>  		drm_panel_enable(output->panel);
> @@ -1806,7 +1806,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>  	err = tegra_dc_state_setup_clock(dc, crtc_state, sor->clk_parent,
>  					 pclk, 0);
>  	if (err < 0) {
> -		dev_err(output->dev, "failed to setup CRTC state: %d\n", err);
> +		DRM_DEV_ERROR(output->dev, "failed to setup CRTC state: %d\n", err);
>  		return err;
>  	}
>
> @@ -1864,7 +1864,7 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
>  		break;
>
>  	default:
> -		dev_err(sor->dev, "unsupported infoframe type: %02x\n",
> +		DRM_DEV_ERROR(sor->dev, "unsupported infoframe type: %02x\n",
>  			ptr[0]);
>  		return;
>  	}
> @@ -1911,13 +1911,13 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
>
>  	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, mode, false);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to setup AVI infoframe: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to setup AVI infoframe: %d\n", err);
>  		return err;
>  	}
>
>  	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to pack AVI infoframe: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to pack AVI infoframe: %d\n", err);
>  		return err;
>  	}
>
> @@ -1963,7 +1963,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_detach(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to detach SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to detach SOR: %d\n", err);
>
>  	tegra_sor_writel(sor, 0, SOR_STATE1);
>  	tegra_sor_update(sor);
> @@ -1978,11 +1978,11 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_power_down(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power down SOR: %d\n", err);
>
>  	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_HDMI);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power off HDMI rail: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power off HDMI rail: %d\n", err);
>
>  	pm_runtime_put(sor->dev);
>  }
> @@ -2008,13 +2008,13 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	/* switch to safe parent clock */
>  	err = tegra_sor_set_parent_clock(sor, sor->clk_safe);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set safe parent clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set safe parent clock: %d\n", err);
>
>  	div = clk_get_rate(sor->clk) / 1000000 * 4;
>
>  	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_HDMI);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power on HDMI rail: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power on HDMI rail: %d\n", err);
>
>  	usleep_range(20, 100);
>
> @@ -2113,11 +2113,11 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	/* switch to parent clock */
>  	err = clk_set_parent(sor->clk_src, sor->clk_parent);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set source clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set source clock: %d\n", err);
>
>  	err = tegra_sor_set_parent_clock(sor, sor->clk_src);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to set parent clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to set parent clock: %d\n", err);
>
>  	value = SOR_INPUT_CONTROL_HDMI_SRC_SELECT(dc->pipe);
>
> @@ -2151,7 +2151,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	/* infoframe setup */
>  	err = tegra_sor_hdmi_setup_avi_infoframe(sor, mode);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to setup AVI infoframe: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to setup AVI infoframe: %d\n", err);
>
>  	/* XXX HDMI audio support not implemented yet */
>  	tegra_sor_hdmi_disable_audio_infoframe(sor);
> @@ -2170,7 +2170,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  	/* production settings */
>  	settings = tegra_sor_hdmi_find_settings(sor, mode->clock * 1000);
>  	if (!settings) {
> -		dev_err(sor->dev, "no settings for pixel clock %d Hz\n",
> +		DRM_DEV_ERROR(sor->dev, "no settings for pixel clock %d Hz\n",
>  			mode->clock * 1000);
>  		return;
>  	}
> @@ -2244,7 +2244,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_power_up(sor, 250);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to power up SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to power up SOR: %d\n", err);
>
>  	/* configure dynamic range of output */
>  	value = tegra_sor_readl(sor, SOR_HEAD_STATE0(dc->pipe));
> @@ -2264,7 +2264,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_attach(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to attach SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to attach SOR: %d\n", err);
>
>  	/* enable display to SOR clock and generate HDMI preamble */
>  	value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
> @@ -2275,7 +2275,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>
>  	err = tegra_sor_wakeup(sor);
>  	if (err < 0)
> -		dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to wakeup SOR: %d\n", err);
>  }
>
>  static const struct drm_encoder_helper_funcs tegra_sor_hdmi_helpers = {
> @@ -2332,7 +2332,7 @@ static int tegra_sor_init(struct host1x_client *client)
>
>  	err = tegra_output_init(drm, &sor->output);
>  	if (err < 0) {
> -		dev_err(client->dev, "failed to initialize output: %d\n", err);
> +		DRM_DEV_ERROR(client->dev, "failed to initialize output: %d\n", err);
>  		return err;
>  	}
>
> @@ -2341,13 +2341,13 @@ static int tegra_sor_init(struct host1x_client *client)
>  	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
>  		err = tegra_sor_debugfs_init(sor, drm->primary);
>  		if (err < 0)
> -			dev_err(sor->dev, "debugfs setup failed: %d\n", err);
> +			DRM_DEV_ERROR(sor->dev, "debugfs setup failed: %d\n", err);
>  	}
>
>  	if (sor->aux) {
>  		err = drm_dp_aux_attach(sor->aux, &sor->output);
>  		if (err < 0) {
> -			dev_err(sor->dev, "failed to attach DP: %d\n", err);
> +			DRM_DEV_ERROR(sor->dev, "failed to attach DP: %d\n", err);
>  			return err;
>  		}
>  	}
> @@ -2359,7 +2359,7 @@ static int tegra_sor_init(struct host1x_client *client)
>  	if (sor->rst) {
>  		err = reset_control_assert(sor->rst);
>  		if (err < 0) {
> -			dev_err(sor->dev, "failed to assert SOR reset: %d\n",
> +			DRM_DEV_ERROR(sor->dev, "failed to assert SOR reset: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -2367,7 +2367,7 @@ static int tegra_sor_init(struct host1x_client *client)
>
>  	err = clk_prepare_enable(sor->clk);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to enable clock: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to enable clock: %d\n", err);
>  		return err;
>  	}
>
> @@ -2376,7 +2376,7 @@ static int tegra_sor_init(struct host1x_client *client)
>  	if (sor->rst) {
>  		err = reset_control_deassert(sor->rst);
>  		if (err < 0) {
> -			dev_err(sor->dev, "failed to deassert SOR reset: %d\n",
> +			DRM_DEV_ERROR(sor->dev, "failed to deassert SOR reset: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -2403,7 +2403,7 @@ static int tegra_sor_exit(struct host1x_client *client)
>  	if (sor->aux) {
>  		err = drm_dp_aux_detach(sor->aux);
>  		if (err < 0) {
> -			dev_err(sor->dev, "failed to detach DP: %d\n", err);
> +			DRM_DEV_ERROR(sor->dev, "failed to detach DP: %d\n", err);
>  			return err;
>  		}
>  	}
> @@ -2433,42 +2433,42 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
>
>  	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io");
>  	if (IS_ERR(sor->avdd_io_supply)) {
> -		dev_err(sor->dev, "cannot get AVDD I/O supply: %ld\n",
> +		DRM_DEV_ERROR(sor->dev, "cannot get AVDD I/O supply: %ld\n",
>  			PTR_ERR(sor->avdd_io_supply));
>  		return PTR_ERR(sor->avdd_io_supply);
>  	}
>
>  	err = regulator_enable(sor->avdd_io_supply);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to enable AVDD I/O supply: %d\n",
> +		DRM_DEV_ERROR(sor->dev, "failed to enable AVDD I/O supply: %d\n",
>  			err);
>  		return err;
>  	}
>
>  	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-pll");
>  	if (IS_ERR(sor->vdd_pll_supply)) {
> -		dev_err(sor->dev, "cannot get VDD PLL supply: %ld\n",
> +		DRM_DEV_ERROR(sor->dev, "cannot get VDD PLL supply: %ld\n",
>  			PTR_ERR(sor->vdd_pll_supply));
>  		return PTR_ERR(sor->vdd_pll_supply);
>  	}
>
>  	err = regulator_enable(sor->vdd_pll_supply);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to enable VDD PLL supply: %d\n",
> +		DRM_DEV_ERROR(sor->dev, "failed to enable VDD PLL supply: %d\n",
>  			err);
>  		return err;
>  	}
>
>  	sor->hdmi_supply = devm_regulator_get(sor->dev, "hdmi");
>  	if (IS_ERR(sor->hdmi_supply)) {
> -		dev_err(sor->dev, "cannot get HDMI supply: %ld\n",
> +		DRM_DEV_ERROR(sor->dev, "cannot get HDMI supply: %ld\n",
>  			PTR_ERR(sor->hdmi_supply));
>  		return PTR_ERR(sor->hdmi_supply);
>  	}
>
>  	err = regulator_enable(sor->hdmi_supply);
>  	if (err < 0) {
> -		dev_err(sor->dev, "failed to enable HDMI supply: %d\n", err);
> +		DRM_DEV_ERROR(sor->dev, "failed to enable HDMI supply: %d\n", err);
>  		return err;
>  	}
>
> @@ -2573,34 +2573,34 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		if (sor->soc->supports_hdmi) {
>  			sor->ops = &tegra_sor_hdmi_ops;
>  		} else if (sor->soc->supports_lvds) {
> -			dev_err(&pdev->dev, "LVDS not supported yet\n");
> +			DRM_DEV_ERROR(&pdev->dev, "LVDS not supported yet\n");
>  			return -ENODEV;
>  		} else {
> -			dev_err(&pdev->dev, "unknown (non-DP) support\n");
> +			DRM_DEV_ERROR(&pdev->dev, "unknown (non-DP) support\n");
>  			return -ENODEV;
>  		}
>  	} else {
>  		if (sor->soc->supports_edp) {
>  			sor->ops = &tegra_sor_edp_ops;
>  		} else if (sor->soc->supports_dp) {
> -			dev_err(&pdev->dev, "DisplayPort not supported yet\n");
> +			DRM_DEV_ERROR(&pdev->dev, "DisplayPort not supported yet\n");
>  			return -ENODEV;
>  		} else {
> -			dev_err(&pdev->dev, "unknown (DP) support\n");
> +			DRM_DEV_ERROR(&pdev->dev, "unknown (DP) support\n");
>  			return -ENODEV;
>  		}
>  	}
>
>  	err = tegra_output_probe(&sor->output);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to probe output: %d\n", err);
>  		return err;
>  	}
>
>  	if (sor->ops && sor->ops->probe) {
>  		err = sor->ops->probe(sor);
>  		if (err < 0) {
> -			dev_err(&pdev->dev, "failed to probe %s: %d\n",
> +			DRM_DEV_ERROR(&pdev->dev, "failed to probe %s: %d\n",
>  				sor->ops->name, err);
>  			goto output;
>  		}
> @@ -2617,7 +2617,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		sor->rst = devm_reset_control_get(&pdev->dev, "sor");
>  		if (IS_ERR(sor->rst)) {
>  			err = PTR_ERR(sor->rst);
> -			dev_err(&pdev->dev, "failed to get reset control: %d\n",
> +			DRM_DEV_ERROR(&pdev->dev, "failed to get reset control: %d\n",
>  				err);
>  			goto remove;
>  		}
> @@ -2626,7 +2626,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	sor->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(sor->clk)) {
>  		err = PTR_ERR(sor->clk);
> -		dev_err(&pdev->dev, "failed to get module clock: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get module clock: %d\n", err);
>  		goto remove;
>  	}
>
> @@ -2634,7 +2634,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		sor->clk_src = devm_clk_get(&pdev->dev, "source");
>  		if (IS_ERR(sor->clk_src)) {
>  			err = PTR_ERR(sor->clk_src);
> -			dev_err(sor->dev, "failed to get source clock: %d\n",
> +			DRM_DEV_ERROR(sor->dev, "failed to get source clock: %d\n",
>  				err);
>  			goto remove;
>  		}
> @@ -2643,21 +2643,21 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	sor->clk_parent = devm_clk_get(&pdev->dev, "parent");
>  	if (IS_ERR(sor->clk_parent)) {
>  		err = PTR_ERR(sor->clk_parent);
> -		dev_err(&pdev->dev, "failed to get parent clock: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get parent clock: %d\n", err);
>  		goto remove;
>  	}
>
>  	sor->clk_safe = devm_clk_get(&pdev->dev, "safe");
>  	if (IS_ERR(sor->clk_safe)) {
>  		err = PTR_ERR(sor->clk_safe);
> -		dev_err(&pdev->dev, "failed to get safe clock: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get safe clock: %d\n", err);
>  		goto remove;
>  	}
>
>  	sor->clk_dp = devm_clk_get(&pdev->dev, "dp");
>  	if (IS_ERR(sor->clk_dp)) {
>  		err = PTR_ERR(sor->clk_dp);
> -		dev_err(&pdev->dev, "failed to get DP clock: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get DP clock: %d\n", err);
>  		goto remove;
>  	}
>
> @@ -2670,7 +2670,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>
>  	if (IS_ERR(sor->clk_brick)) {
>  		err = PTR_ERR(sor->clk_brick);
> -		dev_err(&pdev->dev, "failed to register SOR clock: %d\n", err);
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register SOR clock: %d\n", err);
>  		goto remove;
>  	}
>
> @@ -2680,7 +2680,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&sor->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
>  		goto remove;
>  	}
> @@ -2704,7 +2704,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&sor->client);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> @@ -2712,7 +2712,7 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  	if (sor->ops && sor->ops->remove) {
>  		err = sor->ops->remove(sor);
>  		if (err < 0)
> -			dev_err(&pdev->dev, "failed to remove SOR: %d\n", err);
> +			DRM_DEV_ERROR(&pdev->dev, "failed to remove SOR: %d\n", err);
>  	}
>
>  	tegra_output_remove(&sor->output);
> @@ -2729,7 +2729,7 @@ static int tegra_sor_suspend(struct device *dev)
>  	if (sor->rst) {
>  		err = reset_control_assert(sor->rst);
>  		if (err < 0) {
> -			dev_err(dev, "failed to assert reset: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to assert reset: %d\n", err);
>  			return err;
>  		}
>  	}
> @@ -2748,7 +2748,7 @@ static int tegra_sor_resume(struct device *dev)
>
>  	err = clk_prepare_enable(sor->clk);
>  	if (err < 0) {
> -		dev_err(dev, "failed to enable clock: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to enable clock: %d\n", err);
>  		return err;
>  	}
>
> @@ -2757,7 +2757,7 @@ static int tegra_sor_resume(struct device *dev)
>  	if (sor->rst) {
>  		err = reset_control_deassert(sor->rst);
>  		if (err < 0) {
> -			dev_err(dev, "failed to deassert reset: %d\n", err);
> +			DRM_DEV_ERROR(dev, "failed to deassert reset: %d\n", err);
>  			clk_disable_unprepare(sor->clk);
>  			return err;
>  		}
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 2448229..dc4471e 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -104,7 +104,7 @@ static int vic_boot(struct vic *vic)
>
>  	err = falcon_wait_idle(&vic->falcon);
>  	if (err < 0) {
> -		dev_err(vic->dev,
> +		DRM_DEV_ERROR(vic->dev,
>  			"failed to set application ID and FCE base\n");
>  		return err;
>  	}
> @@ -146,7 +146,7 @@ static int vic_init(struct host1x_client *client)
>  	if (tegra->domain) {
>  		err = iommu_attach_device(tegra->domain, vic->dev);
>  		if (err < 0) {
> -			dev_err(vic->dev, "failed to attach to domain: %d\n",
> +			DRM_DEV_ERROR(vic->dev, "failed to attach to domain: %d\n",
>  				err);
>  			return err;
>  		}
> @@ -299,7 +299,7 @@ static int vic_probe(struct platform_device *pdev)
>
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!regs) {
> -		dev_err(&pdev->dev, "failed to get registers\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get registers\n");
>  		return -ENXIO;
>  	}
>
> @@ -309,7 +309,7 @@ static int vic_probe(struct platform_device *pdev)
>
>  	vic->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(vic->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get clock\n");
>  		return PTR_ERR(vic->clk);
>  	}
>
> @@ -341,7 +341,7 @@ static int vic_probe(struct platform_device *pdev)
>
>  	err = host1x_client_register(&vic->client.base);
>  	if (err < 0) {
> -		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		DRM_DEV_ERROR(dev, "failed to register host1x client: %d\n", err);
>  		platform_set_drvdata(pdev, NULL);
>  		goto exit_falcon;
>  	}
> @@ -370,7 +370,7 @@ static int vic_remove(struct platform_device *pdev)
>
>  	err = host1x_client_unregister(&vic->client.base);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> +		DRM_DEV_ERROR(&pdev->dev, "failed to unregister host1x client: %d\n",
>  			err);
>  		return err;
>  	}
> --
> 1.9.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To post to this group, send email to outreachy-kernel-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/1506232762-10235-1-git-send-email-harshasharmaiitr%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.
>
