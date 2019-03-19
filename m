From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 5/5] drm/tegra: sor: Implement acquire/release for reset
Date: Tue, 19 Mar 2019 17:45:10 +0100
Message-ID: <1553013910.6482.11.camel@pengutronix.de>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
         <20190221152557.8534-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-5-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2019-02-21 at 16:25 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> By implementing the acquire/release protocol, the SOR reset can be
> shared with other drivers that also adhere to this protocol, such as the
> PMC driver that uses the same reset as part of the powergate and -ungate
> implementation using generic power domains.
> 
> Runtime PM makes sure that the operations are executed in the right
> order, and the reset core has error handling and WARNs in place to make
> sure the acquire/release protocol is followed.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 40057106f5f3..5be5a0817dfe 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -2871,6 +2871,13 @@ static int tegra_sor_init(struct host1x_client *client)
>  	 * kernel is possible.
>  	 */
>  	if (sor->rst) {
> +		err = reset_control_acquire(sor->rst);
> +		if (err < 0) {
> +			dev_err(sor->dev, "failed to acquire SOR reset: %d\n",
> +				err);
> +			return err;
> +		}
> +
>  		err = reset_control_assert(sor->rst);
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to assert SOR reset: %d\n",
> @@ -2894,6 +2901,8 @@ static int tegra_sor_init(struct host1x_client *client)
>  				err);
>  			return err;
>  		}
> +
> +		reset_control_release(sor->rst);
>  	}
>  
>  	err = clk_prepare_enable(sor->clk_safe);
> @@ -3331,7 +3340,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		goto remove;
>  	}
>  
> -	sor->rst = devm_reset_control_get(&pdev->dev, "sor");
> +	sor->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "sor");
>  	if (IS_ERR(sor->rst)) {
>  		err = PTR_ERR(sor->rst);
>  
> @@ -3519,6 +3528,8 @@ static int tegra_sor_suspend(struct device *dev)
>  			dev_err(dev, "failed to assert reset: %d\n", err);
>  			return err;
>  		}
> +
> +		reset_control_release(sor->rst);
>  	}
>  
>  	usleep_range(1000, 2000);
> @@ -3542,9 +3553,17 @@ static int tegra_sor_resume(struct device *dev)
>  	usleep_range(1000, 2000);
>  
>  	if (sor->rst) {
> +		err = reset_control_acquire(sor->rst);
> +		if (err < 0) {
> +			dev_err(dev, "failed to acquire reset: %d\n", err);
> +			clk_disable_unprepare(sor->clk);
> +			return err;
> +		}
> +
>  		err = reset_control_deassert(sor->rst);
>  		if (err < 0) {
>  			dev_err(dev, "failed to deassert reset: %d\n", err);
> +			reset_control_release(sor->rst);
>  			clk_disable_unprepare(sor->clk);
>  			return err;
>  		}

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
