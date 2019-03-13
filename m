From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 2/2] dmaengine: tegra210-adma: update system sleep
 callbacks
Date: Wed, 13 Mar 2019 10:28:48 +0000
Message-ID: <c4d0a061-e435-8a60-0dfc-f8e66c0a9f0b@nvidia.com>
References: <1552455794-24946-1-git-send-email-spujar@nvidia.com>
 <1552455794-24946-2-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552455794-24946-2-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, dan.j.williams@intel.com, vkoul@kernel.org
Cc: treding@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/03/2019 05:43, Sameer Pujar wrote:
> If the driver is active till late suspend, where runtime PM cannot run,
> force suspend is essential in such case to put the device in low power
> state. Thus pm_runtime_force_suspend and pm_runtime_force_resume are
> used as system sleep callbacks during system wide PM transitions.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  drivers/dma/tegra210-adma.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index 650cd9c..be29171 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -796,17 +796,11 @@ static int tegra_adma_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int tegra_adma_pm_suspend(struct device *dev)
> -{
> -	return pm_runtime_suspended(dev) == false;
> -}
> -#endif
> -
>  static const struct dev_pm_ops tegra_adma_dev_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_adma_runtime_suspend,
>  			   tegra_adma_runtime_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_adma_pm_suspend, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };

Looking at our downstream kernel we use LATE_SYSTEM_SLEEP for these. Any
reason why you changed this?

Cheers
Jon

-- 
nvpublic
