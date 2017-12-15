From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: mark t186 display hub PM functions
 __maybe_unused
Date: Fri, 15 Dec 2017 16:10:30 +0300
Message-ID: <0085adc9-a29d-df09-a464-f55d6fd967b9@gmail.com>
References: <20171215125205.2969211-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215125205.2969211-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 15.12.2017 15:51, Arnd Bergmann wrote:
> The newly introduced driver has optional suspend/resume functions,
> causing a warning when CONFIG_PM is disabled:
> 
> drivers/gpu/drm/tegra/hub.c:749:12: error: 'tegra_display_hub_resume' defined but not used [-Werror=unused-function]
> drivers/gpu/drm/tegra/hub.c:733:12: error: 'tegra_display_hub_suspend' defined but not used [-Werror=unused-function]
> 
> This marks them __maybe_unused to shut up the warnings.
> 
> Fixes: c4755fb9064f ("drm/tegra: Add Tegra186 display hub support")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/hub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index cccd44711d68..f4911feda9ff 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -730,7 +730,7 @@ static int tegra_display_hub_remove(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int tegra_display_hub_suspend(struct device *dev)
> +static int __maybe_unused tegra_display_hub_suspend(struct device *dev)
>  {
>  	struct tegra_display_hub *hub = dev_get_drvdata(dev);
>  	int err;
> @@ -746,7 +746,7 @@ static int tegra_display_hub_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_display_hub_resume(struct device *dev)
> +static int __maybe_unused tegra_display_hub_resume(struct device *dev)
>  {
>  	struct tegra_display_hub *hub = dev_get_drvdata(dev);
>  	int err;
> 

Probably would be better to put '#ifdef CONFIG_PM' around these functions for
the consistency with the other drm/tegra files.
