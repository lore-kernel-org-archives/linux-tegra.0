From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] drm: Add NVIDIA Tegra30 support
Date: Tue, 20 Nov 2012 15:33:36 +0800
Message-ID: <50AB3250.1060804@nvidia.com>
References: <1353396376-24121-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353396376-24121-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen & Thierry,

I downloaded all patches from patchwork so right now it should not have
space issues.

Mark
On 11/20/2012 03:26 PM, Mark Zhang wrote:
> This patch is based on Thierry's drm patch for Tegra20:
> - [PATCH v2 0/6] Device tree updates for host1x support
> - [PATCH v3 0/2] NVIDIA Tegra DRM driver
> 
> It adds the support for NVIDIA Tegra30.
> 
> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c     |    1 +
>  drivers/gpu/drm/tegra/host1x.c |    3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 53b9852..37bd759 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -818,6 +818,7 @@ static int tegra_dc_remove(struct platform_device *pdev)
>  }
>  
>  static struct of_device_id tegra_dc_of_match[] = {
> +	{ .compatible = "nvidia,tegra30-dc", },
>  	{ .compatible = "nvidia,tegra20-dc", },
>  	{ },
>  };
> diff --git a/drivers/gpu/drm/tegra/host1x.c b/drivers/gpu/drm/tegra/host1x.c
> index 1f728cd..28c28ac 100644
> --- a/drivers/gpu/drm/tegra/host1x.c
> +++ b/drivers/gpu/drm/tegra/host1x.c
> @@ -66,6 +66,8 @@ static int host1x_remove_drm_client(struct host1x *host1x,
>  static int host1x_parse_dt(struct host1x *host1x)
>  {
>  	static const char * const compat[] = {
> +		"nvidia,tegra30-dc",
> +		"nvidia,tegra30-hdmi",
>  		"nvidia,tegra20-dc",
>  		"nvidia,tegra20-hdmi",
>  	};
> @@ -268,6 +270,7 @@ int host1x_unregister_client(struct host1x *host1x,
>  }
>  
>  static struct of_device_id tegra_host1x_of_match[] = {
> +	{ .compatible = "nvidia,tegra30-host1x", },
>  	{ .compatible = "nvidia,tegra20-host1x", },
>  	{ },
>  };
> 
