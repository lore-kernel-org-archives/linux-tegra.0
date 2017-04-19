From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V3 2/4] reset: Add APIs to manage array of resets
Date: Wed, 19 Apr 2017 12:31:52 +0200
Message-ID: <1492597912.2970.65.camel@pengutronix.de>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
         <1492514488-27385-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492514488-27385-3-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: swarren@wwwdotorg.org, balbi@kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, thierry.reding@gmail.com, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2017-04-18 at 16:51 +0530, Vivek Gautam wrote:
> Many devices may want to request a bunch of resets
> and control them. So it's better to manage them as an
> array. Add APIs to _get(), _assert(), and _deassert()
> an array of reset_control.

Thanks! This looks good to me, one small issue below.

> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  drivers/reset/core.c  | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/reset.h |  93 ++++++++++++++++++++++++++
>  2 files changed, 270 insertions(+)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index f0a06a7aca93..54bd3be5e7a4 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -488,3 +488,180 @@ int of_reset_control_get_count(struct device_node *node)
>  	return count;
>  }
>  EXPORT_SYMBOL_GPL(of_reset_control_get_count);
> +
> +/**
> + * APIs to manage an array of reset controls.
> + */
> +/**
> + * reset_control_array_assert: assert a list of resets
> + *
> + * @resets: reset control array holding info about the list of resets
> + *
> + * This API doesn't guarantee that the reset lines controlled by
> + * the reset array are asserted in any particular order.
> + *
> + * Returns 0 on success or error number on failure.
> + */
> +int reset_control_array_assert(struct reset_control_array *resets)
> +{
> +	int ret, i;
> +
> +	if (!resets)
> +		return 0;
> +
> +	if (IS_ERR(resets))
> +		return -EINVAL;
> +
> +	for (i = 0; i < resets->num_rstcs; i++) {
> +		ret = reset_control_assert(resets->rstc[i]);
> +		if (ret)
> +			return ret;

This should try to deassert the already asserted resets in the error
case.

> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_control_array_assert);
> +
> +/**
> + * reset_control_array_deassert: deassert a list of resets
> + *
> + * @resets: reset control array holding info about the list of resets
> + *
> + * This API doesn't guarantee that the reset lines controlled by
> + * the reset array are deasserted in any particular order.
> + *
> + * Returns 0 on success or error number on failure.
> + */
> +int reset_control_array_deassert(struct reset_control_array *resets)
> +{
> +	int ret, i;
> +
> +	if (!resets)
> +		return 0;
> +
> +	if (IS_ERR(resets))
> +		return -EINVAL;
> +
> +	for (i = 0; i < resets->num_rstcs; i++) {
> +		ret = reset_control_deassert(resets->rstc[i]);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (i--)
> +		reset_control_assert(resets->rstc[i]);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(reset_control_array_deassert);

As this already does.

regards
Philipp
