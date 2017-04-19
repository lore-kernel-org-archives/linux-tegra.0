From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 1/4] reset: Add API to count number of reset
 available with device
Date: Wed, 19 Apr 2017 12:25:32 +0200
Message-ID: <1492597532.2970.61.camel@pengutronix.de>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
         <1492514488-27385-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492514488-27385-2-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-04-18 at 16:51 +0530, Vivek Gautam wrote:
> Count number of reset phandles available with the device node
> to know the resets a given device has.
> 
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/reset/core.c  | 23 +++++++++++++++++++++++
>  include/linux/reset.h |  6 ++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index cd739d2fa160..f0a06a7aca93 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -465,3 +465,26 @@ int device_reset(struct device *dev)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(device_reset);
> +
> +/**
> + * of_reset_control_get_count - Count number of resets available with a device
> + *
> + * @node: device node that contains 'resets'.
> + *
> + * Returns positive reset count on success, or error number on failure and
> + * on count being zero.
> + */
> +int of_reset_control_get_count(struct device_node *node)
> +{
> +	int count;
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	count = of_count_phandle_with_args(node, "resets", "#reset-cells");
> +	if (count == 0)
> +		count = -ENOENT;
> +
> +	return count;
> +}
> +EXPORT_SYMBOL_GPL(of_reset_control_get_count);

This doesn't need to be public anymore. You can make it static and merge
it into the second patch.

regards
Philipp
