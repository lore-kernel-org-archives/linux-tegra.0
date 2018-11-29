From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v4 1/3] thermal: tegra: remove unnecessary warnings
Date: Thu, 29 Nov 2018 08:39:39 -0800
Message-ID: <20181129163938.GA2045@localhost.localdomain>
References: <1543486183-2868-1-git-send-email-wni@nvidia.com>
 <1543486183-2868-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543486183-2868-2-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: thierry.reding@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hey,

On Thu, Nov 29, 2018 at 06:09:41PM +0800, Wei Ni wrote:
> Convert warnings to info as not all platforms may
> have all the thresholds and sensors enabled.
> 
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index ed28110a3535..55cc1f2f6a45 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -550,7 +550,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
>  
>  	ret = tz->ops->get_crit_temp(tz, &temperature);
>  	if (ret) {
> -		dev_warn(dev, "thermtrip: %s: missing critical temperature\n",
> +		dev_info(dev, "thermtrip: %s: missing critical temperature\n",

I am mostly ok with your change in direction. But are you sure this is a
good thing? What about in the case that you have a platform that have
the crit temp and you really failed to .get_crit_temp()?

>  			 sg->name);
>  		goto set_throttle;
>  	}
> @@ -569,7 +569,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
>  set_throttle:
>  	ret = get_hot_temp(tz, &trip, &temperature);
>  	if (ret) {
> -		dev_warn(dev, "throttrip: %s: missing hot temperature\n",
> +		dev_info(dev, "throttrip: %s: missing hot temperature\n",
>  			 sg->name);
>  		return 0;
>  	}
> @@ -600,7 +600,7 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
>  	}
>  
>  	if (i == THROTTLE_SIZE)
> -		dev_warn(dev, "throttrip: %s: missing throttle cdev\n",
> +		dev_info(dev, "throttrip: %s: missing throttle cdev\n",
>  			 sg->name);
>  
>  	return 0;
> -- 
> 2.7.4
> 
