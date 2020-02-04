From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/tegra: sor: Disable runtime PM on probe failure
Date: Tue, 4 Feb 2020 10:35:25 +0000
Message-ID: <a250f64f-3576-027c-9cb9-1919609af7b3@nvidia.com>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
 <20200131165910.3443936-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200131165910.3443936-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 31/01/2020 16:59, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> If the driver fails to probe, make sure to disable runtime PM again.
> 
> While at it, make the cleanup code in ->remove() symmetric.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/sor.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 96cd89bb2e82..aa4e1695b537 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3926,13 +3926,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  				      sor->index);
>  		if (!name) {
>  			err = -ENOMEM;
> -			goto remove;
> +			goto rpm_disable;
>  		}
>  
>  		err = host1x_client_resume(&sor->client);
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to resume: %d\n", err);
> -			goto remove;
> +			goto rpm_disable;
>  		}
>  
>  		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
> @@ -3943,7 +3943,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		err = PTR_ERR(sor->clk_pad);
>  		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
>  			err);
> -		goto remove;
> +		goto rpm_disable;
>  	}
>  
>  	INIT_LIST_HEAD(&sor->client.list);
> @@ -3954,11 +3954,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
> -		goto remove;
> +		goto rpm_disable;
>  	}
>  
>  	return 0;
>  
> +rpm_disable:
> +	pm_runtime_disable(&pdev->dev);
>  remove:
>  	if (sor->ops && sor->ops->remove)
>  		sor->ops->remove(sor);
> @@ -3972,8 +3974,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  	struct tegra_sor *sor = platform_get_drvdata(pdev);
>  	int err;
>  
> -	pm_runtime_disable(&pdev->dev);
> -
>  	err = host1x_client_unregister(&sor->client);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> @@ -3981,6 +3981,8 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	pm_runtime_disable(&pdev->dev);
> +
>  	if (sor->ops && sor->ops->remove) {
>  		err = sor->ops->remove(sor);
>  		if (err < 0)
> 

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
