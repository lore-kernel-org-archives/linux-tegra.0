From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm: replace IS_ERR and PTR_ERR with PTR_ERR_OR_ZERO
Date: Fri, 27 Dec 2019 12:54:01 +0100
Message-ID: <20191227115401.agumkfuiwexl2wmx@hendrix.home>
References: <20191225132042.5491-1-yukuai3@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qekez63uoqkeptq7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191225132042.5491-1-yukuai3@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yu kuai <yukuai3@huawei.com>
Cc: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, wens@csie.org, jernej.skrabec@siol.net, thierry.reding@gmail.com, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, zhengbin13@huawei.com, yi.zhang@huawei.com
List-Id: linux-tegra@vger.kernel.org


--qekez63uoqkeptq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 25, 2019 at 09:20:42PM +0800, yu kuai wrote:
> no functional change, just to make the code simpler
>
> Signed-off-by: yu kuai <yukuai3@huawei.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c         | 5 +----
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c    | 6 ++----
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c    | 4 +---
>  drivers/gpu/drm/omapdrm/dss/hdmi_phy.c      | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_dotclock.c      | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c      | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 4 +---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 5 +----
>  drivers/gpu/drm/tegra/drm.c                 | 4 +---
>  drivers/gpu/drm/tegra/gem.c                 | 4 +---
>  10 files changed, 11 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index 0f557fad4513..eb71baedf19e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -587,10 +587,7 @@ static int hdmi_audio_register(struct omap_hdmi *hdmi)
>  		&hdmi->pdev->dev, "omap-hdmi-audio", PLATFORM_DEVID_AUTO,
>  		&pdata, sizeof(pdata));
>
> -	if (IS_ERR(hdmi->audio_pdev))
> -		return PTR_ERR(hdmi->audio_pdev);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
>  }
>
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> index ea5d5c228534..fdd73fb73653 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> @@ -924,8 +924,6 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>  	core->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(core->base))
> -		return PTR_ERR(core->base);
> -
> -	return 0;
> +
> +	return PTR_ERR_OR_ZERO(core->base);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> index ff4d35c8771f..30454bc9de78 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> @@ -908,8 +908,6 @@ int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>  	core->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(core->base))
> -		return PTR_ERR(core->base);
>
> -	return 0;
> +	return PTR_ERR_OR_ZERO(core->base);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> index 00bbf24488c1..bbc02d5aa8fb 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_phy.c
> @@ -191,8 +191,6 @@ int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy,
>
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
>  	phy->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(phy->base))
> -		return PTR_ERR(phy->base);
>
> -	return 0;
> +	return PTR_ERR_OR_ZERO(phy->base);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> index 417ade3d2565..84c04d8192b3 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> @@ -191,10 +191,8 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
>  	dclk->hw.init = &init;
>
>  	tcon->dclk = clk_register(dev, &dclk->hw);
> -	if (IS_ERR(tcon->dclk))
> -		return PTR_ERR(tcon->dclk);
>
> -	return 0;
> +	return PTR_ERR_OR_ZERO(tcon->dclk);

This has been submitted a couple of times already. It's harder to
maintain and not easier to read.

Please remove sun4i from your patch

Maxime

--qekez63uoqkeptq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXgXw2QAKCRDj7w1vZxhR
xcC0AP41YnCplFDuwO92c5iWckNOenpr5t0CgtMx4SUZvRwRfAEAofLF2tx6/nNv
2u5zEYJchT5oj2oyNfSR2wa6CCYaMQM=
=9hHy
-----END PGP SIGNATURE-----

--qekez63uoqkeptq7--
