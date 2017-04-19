From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 3/4] usb: dwc3: of-simple: Add support to get resets
 for the device
Date: Wed, 19 Apr 2017 12:32:09 +0200
Message-ID: <1492597929.2970.66.camel@pengutronix.de>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
         <1492514488-27385-4-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492514488-27385-4-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-04-18 at 16:51 +0530, Vivek Gautam wrote:
> Add support to get a list of resets available for the device.
> These resets must be kept de-asserted until the device is
> in use.
> 
> Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/usb/dwc3/dwc3-of-simple.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index fe414e7a9c78..9116df649f0b 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -29,13 +29,39 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  
>  struct dwc3_of_simple {
>  	struct device		*dev;
>  	struct clk		**clks;
>  	int			num_clocks;
> +	struct reset_control_array *resets;
>  };
>  
> +static int dwc3_of_simple_reset_init(struct dwc3_of_simple *simple)
> +{
> +	struct device		*dev = simple->dev;
> +	int			ret;
> +
> +	simple->resets = of_reset_control_array_get_exclusive(dev->of_node);
> +	if (IS_ERR(simple->resets)) {
> +		ret = PTR_ERR(simple->resets);
> +		if (ret == -ENOENT)
> +			/* not all controllers required resets */
> +			return 0;

If you use the of_reset_control_array_get_optional_exclusive variant,
you can remove the three lines directly above.

> +		dev_err(dev, "failed to get device resets\n");

It would be nice to print the error code here.

> +		return ret;
> +	}
> +
> +	ret = reset_control_array_deassert(simple->resets);
> +	if (ret) {
> +		reset_control_array_put(simple->resets);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
>  {
>  	struct device		*dev = simple->dev;
> @@ -100,6 +126,10 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = dwc3_of_simple_reset_init(simple);
> +	if (ret)
> +		return ret;
> +

I would just move the contents of dwc3_of_simple_reset_init here and add
a goto error path at the end of dwc3_of_simple_clk_init to handle the
reset control cleanup as needed.

>  	ret = of_platform_populate(np, NULL, NULL, dev);
>  	if (ret) {
>  		for (i = 0; i < simple->num_clocks; i++) {
> @@ -107,6 +137,9 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
>  			clk_put(simple->clks[i]);
>  		}
>  
> +		reset_control_array_assert(simple->resets);
> +		reset_control_array_put(simple->resets);
> +
>  		return ret;
>  	}
>  
> @@ -128,6 +161,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
>  		clk_put(simple->clks[i]);
>  	}
>  
> +	reset_control_array_assert(simple->resets);
> +	reset_control_array_put(simple->resets);
> +

Must the reset be asserted before of_platform_depopulate?

>  	of_platform_depopulate(dev);

Given the order above, I'd expect the reset cleanup here.

>  	pm_runtime_put_sync(dev);

regards
Philipp
