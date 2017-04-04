From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 2/4] reset: Add APIs to manage array of resets
Date: Tue, 4 Apr 2017 16:09:44 +0530
Message-ID: <52efd58a-e4f2-d3a7-0145-4c2f60ef6dd6@codeaurora.org>
References: <1491226922-20307-1-git-send-email-vivek.gautam@codeaurora.org>
 <1491226922-20307-3-git-send-email-vivek.gautam@codeaurora.org>
 <1491237384.2378.128.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1491237384.2378.128.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, thierry.reding@gmail.com, balbi@kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Philipp,


On 04/03/2017 10:06 PM, Philipp Zabel wrote:
> Hi Vivek,
>
> thank you for the patch series. A few comments below: I'd like to reduce
> the API surface a bit and include the counting and array allocation in
> the _get functions, if possible.

Thank you for reviewing the patch. Please find my comments inline.

>
> On Mon, 2017-04-03 at 19:12 +0530, Vivek Gautam wrote:
>> Many devices may want to request a bunch of resets
>> and control them. So it's better to manage them as an
>> array. Add APIs to _get(), _assert(), and _deassert()
>> an array of reset_control.
>>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> ---
>>
>> Changes since v1:
>>   - New patch added to the series.
>>
>>   drivers/reset/core.c  | 169 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/reset.h | 108 ++++++++++++++++++++++++++++++++
>>   2 files changed, 277 insertions(+)
>>
>> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> index 66db061165cb..fb908aa4f69e 100644
>> --- a/drivers/reset/core.c
>> +++ b/drivers/reset/core.c
>> @@ -477,3 +477,172 @@ int of_reset_control_get_count(struct device_node *node)
>>   	return count;
>>   }
>>   EXPORT_SYMBOL_GPL(of_reset_control_get_count);
>> +
>> +/*
>> + * APIs to manage an array of reset controllers
>> + */
>> +/**
>> + * reset_control_array_assert: assert a list of resets
>> + *
>> + * @resets: reset control array holding info about a list of resets
>> + * @num_rsts: number of resets to be asserted.
> This should mention the API doesn't make any guarantees that the reset
> lines controlled by the reset array are asserted or deasserted in any
> particular order.

Sure, will add this comment.

>
>> + * Returns 0 on success or error number on failure.
>> + */
>> +int reset_control_array_assert(int num_rsts,
>> +				struct reset_control_array *resets)
> I'd prefer to mirror the gpiod API a little, and to have the number
> contained in the array structure, similar to struct gpio_descs:
>
> struct reset_control_array {
> 	unsigned int num_rstcs;
> 	struct reset_control *rstc[];
> };
>
> int reset_control_array_assert(struct reset_control_array *resets)
> {
> 	...

Alright, i can update this.
I took regulator_bulk interface as the reference, but now i see
gpio_descs has a smaller footprint.

>> +{
>> +	int ret, i;
>> +
>> +	if (WARN_ON(IS_ERR_OR_NULL(resets)))
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < num_rsts; i++) {
>> +		ret = reset_control_assert(resets[i].rst);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(reset_control_array_assert);
>> +
>> +/**
>> + * reset_control_array_deassert: deassert a list of resets
>> + *
>> + * @resets: reset control array holding info about a list of resets
>> + * @num_rsts: number of resets to be deasserted.
> Same here, no guarantees on the order in which the resets are
> deasserted.

sure.

>
>> + * Returns 0 on success or error number on failure.
>> + */
>> +int reset_control_array_deassert(int num_rsts,
>> +				struct reset_control_array *resets)
>> +{
>> +	int ret, i;
>> +
>> +	if (WARN_ON(IS_ERR_OR_NULL(resets)))
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < num_rsts; i++)
>> +		ret = reset_control_deassert(resets[i].rst);
>> +		if (ret)
>> +			goto err;
>> +
>> +	return 0;
>> +
>> +err:
>> +	while (--i >= 0)
>> +		reset_control_assert(resets[i].rst);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(reset_control_array_deassert);
>> +
>> +/**
>> + * reset_control_array_get - Get a list of reset controllers
> A list of "reset controls".

right, will update this.

>
>> + *
>> + * @dev: device that requests the list of reset controllers
>> + * @num_rsts: number of reset controllers requested
>> + * @resets: reset control array holding info about a list of resets
>> + * @shared: whether reset controllers are shared or not
>> + * @optional: whether it is optional to get the reset controllers
>> + *
> This should mention that the array API is intended for a list of resets
> that just have to be asserted or deasserted, without any requirements on
> the order.

Sure, will mention that.

>
>> + * Returns 0 on success or error number on failure
>> + */
>> +static int reset_control_array_get(struct device *dev, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional)
> Can we make this count and return a pointer to the newly created array?
>
> static struct reset_controls *
> reset_control_array_get(struct device *dev, bool shared, bool optional)
> {
> 	...
>
> That way the consumer doesn't have to care about counting and array
> allocation.

Just trying to think again in line with the regulator bulk APIs.
Can't a user provide a list of reset controls as data and thus
request reset controls with a "id" and num_resets available.

e.g.
    const char * const rst_names[] = {
      "rst1", "rst2" ...
    };
    xyz_data = {
      .resets = rst_names;
      .num = ARRAY_SIZE(rst_names);
    };
and then the driver making use of reset_control_array APIs
to request this list of reset controls and assert/deassert them.

I am assuming this case when one user driver is used across a bunch
of platforms with different number of resets available.
We may not want to rely solely on the device tree entries, since
the resets can be mandatory in few cases and we may want to
return failure.

>
>> +{
>> +	int ret, i;
>> +	struct reset_control *rstc;
>> +
>> +	for (i = 0; i < num_rsts; i++) {
>> +		rstc = __of_reset_control_get(dev ? dev->of_node : NULL,
>> +					resets[i].name, i, shared, optional);
>> +		if (IS_ERR(rstc)) {
>> +			ret = PTR_ERR(rstc);
>> +			goto err_rst;
>> +		}
>> +		resets[i].rst = rstc;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_rst:
>> +	while (--i >= 0)
>> +		reset_control_put(resets[i].rst);
>> +	return ret;
>> +}
>> +
>> +static void devm_reset_control_array_release(struct device *dev, void *res)
>> +{
>> +	struct reset_control_devres *ptr = res;
>> +	int i;
>> +
>> +	for (i = 0; i < ptr->num_resets; i++)
>> +		reset_control_put(ptr->resets[i].rst);
>> +}
>> +
>> +/**
>> + * devm_reset_control_array_get - Resource managed reset_control_array_get
>> + *				  See reset_control_array_get() for more
>> + *				  details
>> + *
>> + * Returns 0 on success or error number on failure
>> + */
>> +int devm_reset_control_array_get(struct device *dev, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional)
> Same here.
>
>> +{
>> +	struct reset_control_devres *ptr;
>> +	int ret;
>> +
>> +	ptr = devres_alloc(devm_reset_control_array_release, sizeof(*ptr),
>> +			   GFP_KERNEL);
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	ret = reset_control_array_get(dev, num_rsts, resets,
>> +					shared, optional);
>> +	if (ret) {
>> +		ptr->resets = resets;
>> +		ptr->num_resets = num_rsts;
>> +		devres_add(dev, ptr);
>> +	} else {
>> +		devres_free(ptr);
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_reset_control_array_get);
>> +
>> +int of_reset_control_array_get(struct device_node *node, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional)
> And here.
>
>> +{
>> +	int ret, i;
>> +	struct reset_control *rstc;
>> +
>> +	for (i = 0; i < num_rsts; i++) {
>> +		rstc = __of_reset_control_get(node, NULL, i, shared, optional);
>> +		if (IS_ERR(rstc)) {
>> +			ret = PTR_ERR(rstc);
>> +			goto err_rst;
>> +		}
>> +		resets[i].rst = rstc;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_rst:
>> +	while (--i >= 0)
>> +		reset_control_put(resets[i].rst);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(of_reset_control_array_get);
>> +
>> +void reset_control_array_put(int num, struct reset_control_array *resets)
> This could drop the num then.

Sure.

>
>> +{
>> +	while (num--)
>> +		reset_control_put(resets[num].rst);
>> +}
>> +EXPORT_SYMBOL_GPL(reset_control_array_put);
>> diff --git a/include/linux/reset.h b/include/linux/reset.h
>> index d89556412ccc..d6ca70b9d634 100644
>> --- a/include/linux/reset.h
>> +++ b/include/linux/reset.h
>> @@ -5,6 +5,16 @@
>>   
>>   struct reset_control;
>>   
>> +struct reset_control_array {
>> +	struct reset_control *rst;
>> +	const char *name;
> Drop the name. This interface is only good for a bunch of anonymous
> resets that can all be asserted or deasserted in arbitrary order. If the
> reset lines have to be known individually, this is probably the wrong
> interface.

Sure, will drop 'name' and have the reset_control_array structure
as suggested above.

>
>> +};
>> +
>> +struct reset_control_devres {
>> +	struct reset_control_array *resets;
>> +	int num_resets;
>> +};
>> +
>>   #ifdef CONFIG_RESET_CONTROLLER
>>   
>>   int reset_control_reset(struct reset_control *rstc);
>> @@ -23,6 +33,18 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
>>   int __must_check device_reset(struct device *dev);
>>   int of_reset_control_get_count(struct device_node *node);
>>   
>> +int reset_control_array_assert(int num_rsts,
>> +				struct reset_control_array *resets);
>> +int reset_control_array_deassert(int num_rsts,
>> +				struct reset_control_array *resets);
>> +int devm_reset_control_array_get(struct device *dev, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional);
>> +int of_reset_control_array_get(struct device_node *node, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional);
>> +void reset_control_array_put(int num, struct reset_control_array *resets);
>> +
>>   static inline int device_reset_optional(struct device *dev)
>>   {
>>   	return device_reset(dev);
>> @@ -85,6 +107,39 @@ static inline struct reset_control *__devm_reset_control_get(
>>   	return -ENOTSUPP;
>>   }
>>   
>> +static inline int reset_control_array_assert(int num_rsts,
>> +				struct reset_control_array *resets)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline int reset_control_array_deassert(int num_rsts,
>> +				struct reset_control_array *resets)
>> +{
>> +	return 0;
>> +}
> Is this missing a stub for reset_control_array_get?

No, that's supposed to be a static function.

>
>> +static inline
>> +int devm_reset_control_array_get(struct device *dev, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional)
>> +{
>> +	return optional ? NULL : ERR_PTR(-ENOTSUPP);
>> +}
>> +
>> +static inline
>> +int of_reset_control_array_get(struct device_node *node, int num_rsts,
>> +				struct reset_control_array *resets,
>> +				bool shared, bool optional)
>> +{
>> +	return optional ? NULL : ERR_PTR(-ENOTSUPP);
>> +}
>> +
>> +static inline
>> +void reset_control_array_put(int num, struct reset_control_array *resets)
>> +{
>> +}
>> +
>>   #endif /* CONFIG_RESET_CONTROLLER */
>>   
>>   /**
>> @@ -374,4 +429,57 @@ static inline struct reset_control *devm_reset_control_get_by_index(
>>   {
>>   	return devm_reset_control_get_exclusive_by_index(dev, index);
>>   }
>> +
>> +/*
>> + * APIs to manage a list of reset controllers
>> + */
>> +static inline
>> +int devm_reset_control_array_get_exclusive(struct device *dev, int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return devm_reset_control_array_get(dev, num_rsts,
>> +						resets, false, false);
>> +}
>> +
>> +static inline
>> +int devm_reset_control_array_get_shared(struct device *dev, int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return devm_reset_control_array_get(dev, num_rsts,
>> +						resets, true, false);
>> +}
>> +
>> +static inline
>> +int devm_reset_control_array_get_optional_exclusive(struct device *dev,
>> +					int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return devm_reset_control_array_get(dev, num_rsts,
>> +						resets, false, true);
>> +}
>> +
>> +static inline
>> +int devm_reset_control_array_get_optional_shared(struct device *dev,
>> +					int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return devm_reset_control_array_get(dev, num_rsts,
>> +						resets, true, true);
>> +}
>> +
>> +static inline
>> +int of_reset_control_array_get_exclusive(struct device_node *node,
>> +					int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return of_reset_control_array_get(node, num_rsts, resets, false, false);
>> +}
>> +
>> +static inline
>> +int of_reset_control_array_get_shared(struct device_node *node,
>> +					int num_rsts,
>> +					struct reset_control_array *resets)
>> +{
>> +	return of_reset_control_array_get(node, num_rsts, resets, true, false);
>> +}
>>   #endif
> regards
> Philipp
>

Best Regards
Vivek

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
