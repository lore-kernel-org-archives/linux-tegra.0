From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 13/18] gpu: host1x: mipi: Update
 tegra_mipi_request() to be node based
Date: Thu, 18 Jun 2020 03:27:37 +0300
Message-ID: <9a0a0a02-0d02-15ae-85de-e752ecdd0ae1@gmail.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-14-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1592358094-23459-14-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
> Tegra CSI driver need a separate MIPI device for each channel as
> calibration of corresponding MIPI pads for each channel should
> happen independently.
> 
> So, this patch updates tegra_mipi_request() API to add a device_node
> pointer argument to allow creating mipi device for specific device
> node rather than a device.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 2 +-
>  drivers/gpu/host1x/mipi.c   | 7 +++++--
>  include/linux/host1x.h      | 3 ++-
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 38beab9..0443589 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->regs))
>  		return PTR_ERR(dsi->regs);
>  
> -	dsi->mipi = tegra_mipi_request(&pdev->dev);
> +	dsi->mipi = tegra_mipi_request(&pdev->dev, NULL);
>  	if (IS_ERR(dsi->mipi))
>  		return PTR_ERR(dsi->mipi);
>  
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e00809d..93b354b 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -206,13 +206,16 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
>  	return 0;
>  }
>  
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device)
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np)
>  {
> -	struct device_node *np = device->of_node;
>  	struct tegra_mipi_device *dev;
>  	struct of_phandle_args args;
>  	int err;
>  
> +	if (!np)
> +		np = device->of_node;

Will be nicer if DSI panel could pass the device's node directly,
instead of this.
