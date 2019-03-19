From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/5] reset: Add acquired flag to
 of_reset_control_array_get()
Date: Tue, 19 Mar 2019 17:37:56 +0100
Message-ID: <1553013476.6482.6.camel@pengutronix.de>
References: <20190221152557.8534-1-thierry.reding@gmail.com>
         <20190221152557.8534-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221152557.8534-2-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Felipe Balbi <balbi@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 2019-02-21 at 16:25 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to be able to request an array of reset controls in acquired or
> released mode, add the acquired flag to of_reset_control_array_get() and
> pass the flag to subsequent calls of __of_reset_control_get().
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/reset/core.c              |  9 ++++++---
>  drivers/usb/dwc3/dwc3-of-simple.c |  3 ++-
>  include/linux/reset.h             | 14 ++++++++------
>  3 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 1e8a42b16f23..f94da91c22af 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -830,12 +830,15 @@ static int of_reset_control_get_count(struct device_node *node)
>   * @np: device node for the device that requests the reset controls array
>   * @shared: whether reset controls are shared or not
>   * @optional: whether it is optional to get the reset controls
> + * @acquired: only one reset control may be acquired for a given controller
> + *            and ID
>   *
>   * Returns pointer to allocated reset_control_array on success or
>   * error on failure
>   */
>  struct reset_control *
> -of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
> +of_reset_control_array_get(struct device_node *np, bool shared, bool optional,
> +			   bool acquired)
>  {
>  	struct reset_control_array *resets;
>  	struct reset_control *rstc;
> @@ -851,7 +854,7 @@ of_reset_control_array_get(struct device_node *np, bool shared, bool optional)
>  
>  	for (i = 0; i < num; i++) {
>  		rstc = __of_reset_control_get(np, NULL, i, shared, optional,
> -					      true);
> +					      acquired);
>  		if (IS_ERR(rstc))
>  			goto err_rst;
>  		resets->rstc[i] = rstc;
> @@ -898,7 +901,7 @@ devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
>  	if (!devres)
>  		return ERR_PTR(-ENOMEM);
>  
> -	rstc = of_reset_control_array_get(dev->of_node, shared, optional);
> +	rstc = of_reset_control_array_get(dev->of_node, shared, optional, true);
>  	if (IS_ERR(rstc)) {
>  		devres_free(devres);
>  		return rstc;
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index 4c2771c5e727..67ce2037472d 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -107,7 +107,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  		simple->pulse_resets = true;
>  	}
>  
> -	simple->resets = of_reset_control_array_get(np, shared_resets, true);
> +	simple->resets = of_reset_control_array_get(np, shared_resets, true,
> +						    true);

Felipe, could I get your acked-by to merge this through the reset tree?

dwc3-of-simple is a bit of a special case because it calls
of_reset_control_array_get directly instead of through the
of_reset_control_array_get_shared/exclusive wrappers.

regards
Philipp
