From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V3 2/4] reset: Add APIs to manage array of resets
Date: Wed, 19 Apr 2017 17:25:28 +0530
Message-ID: <db4248f1-e379-0ece-5ea1-24cba28514a1@codeaurora.org>
References: <1492514488-27385-1-git-send-email-vivek.gautam@codeaurora.org>
 <1492514488-27385-3-git-send-email-vivek.gautam@codeaurora.org>
 <1492597912.2970.65.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492597912.2970.65.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Philipp,


On 04/19/2017 04:01 PM, Philipp Zabel wrote:
> On Tue, 2017-04-18 at 16:51 +0530, Vivek Gautam wrote:
>> Many devices may want to request a bunch of resets
>> and control them. So it's better to manage them as an
>> array. Add APIs to _get(), _assert(), and _deassert()
>> an array of reset_control.
> Thanks! This looks good to me, one small issue below.
>
>> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>   drivers/reset/core.c  | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/reset.h |  93 ++++++++++++++++++++++++++
>>   2 files changed, 270 insertions(+)
>>
>> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> index f0a06a7aca93..54bd3be5e7a4 100644
>> --- a/drivers/reset/core.c
>> +++ b/drivers/reset/core.c
>> @@ -488,3 +488,180 @@ int of_reset_control_get_count(struct device_node *node)
>>   	return count;
>>   }
>>   EXPORT_SYMBOL_GPL(of_reset_control_get_count);
>> +
>> +/**
>> + * APIs to manage an array of reset controls.
>> + */
>> +/**
>> + * reset_control_array_assert: assert a list of resets
>> + *
>> + * @resets: reset control array holding info about the list of resets
>> + *
>> + * This API doesn't guarantee that the reset lines controlled by
>> + * the reset array are asserted in any particular order.
>> + *
>> + * Returns 0 on success or error number on failure.
>> + */
>> +int reset_control_array_assert(struct reset_control_array *resets)
>> +{
>> +	int ret, i;
>> +
>> +	if (!resets)
>> +		return 0;
>> +
>> +	if (IS_ERR(resets))
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < resets->num_rstcs; i++) {
>> +		ret = reset_control_assert(resets->rstc[i]);
>> +		if (ret)
>> +			return ret;
> This should try to deassert the already asserted resets in the error
> case.

I assumed that the user will call _assert in case of failure, driver removal
or may be suspend, and thought that we may not care even if the _assert
failed. But i see now that we also care about the (de)assert count, so that
the shared resets are handled properly.

Will add the core to deassert the already asserted resets in error case.

Thanks

>
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(reset_control_array_assert);
>> +
>> +/**
>> + * reset_control_array_deassert: deassert a list of resets
>> + *
>> + * @resets: reset control array holding info about the list of resets
>> + *
>> + * This API doesn't guarantee that the reset lines controlled by
>> + * the reset array are deasserted in any particular order.
>> + *
>> + * Returns 0 on success or error number on failure.
>> + */
>> +int reset_control_array_deassert(struct reset_control_array *resets)
>> +{
>> +	int ret, i;
>> +
>> +	if (!resets)
>> +		return 0;
>> +
>> +	if (IS_ERR(resets))
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < resets->num_rstcs; i++) {
>> +		ret = reset_control_deassert(resets->rstc[i]);
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>> +	return 0;
>> +
>> +err:
>> +	while (i--)
>> +		reset_control_assert(resets->rstc[i]);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(reset_control_array_deassert);
> As this already does.

Yea, like this one.

Best Regards
Vivek

>
> regards
> Philipp
>

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
