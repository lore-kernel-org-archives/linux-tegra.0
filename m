From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210
 support
Date: Thu, 7 Apr 2016 14:42:59 -0600
Message-ID: <5706C653.4040807@wwwdotorg.org>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
 <56E99F10.1060508@wwwdotorg.org> <20160405144416.GA10809@ulmo.ba.sec>
 <570429B8.3060002@wwwdotorg.org> <20160406170824.GA28843@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160406170824.GA28843-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/06/2016 11:08 AM, Thierry Reding wrote:
> On Tue, Apr 05, 2016 at 03:10:16PM -0600, Stephen Warren wrote:
>> On 04/05/2016 08:44 AM, Thierry Reding wrote:
>>> On Wed, Mar 16, 2016 at 11:59:44AM -0600, Stephen Warren wrote:
>>>> On 03/04/2016 09:19 AM, Thierry Reding wrote:
>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> Extend the binding to cover the set of feature found in Tegra210.
>>>>
>>>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>>>
>>>>> +	padctl@0,7009f000 {
>>>> ...
>>>>> +		pads {
>>>> ...
>>>>> +		};
>>>>> +
>>>>> +		ports {
>>>> ...
>>>>> +		};
>>>>
>>>> As a comment not affecting my ack in any way: At the top-level, we place all
>>>> the child nodes into "array container" nodes named "pads" and "ports". This
>>>> is nice since it separates different types of child nodes and allows easily
>>>> adding more types of child nodes in the future without interference, and in
>>>> a way that allows us to explicitly know what each node is without having to
>>>> interpret its name or compatible value to do so. However, we haven't done
>>>> this with the per-lane child nodes inside each pad. If we were to rev the
>>>> design, I'd be tempted to suggest:
>>>>
>>>> 	padctl@0,7009f000 {
>>>> 		pads {
>>>> 			usb2 {
>>>> 				lanes { // This level is new
>>>> 					usb2-0 {
>>>
>>> I tried to make this work, but it's unfortunately not possible with the
>>> current code. The reason is that the PHY subsystem assumes that either
>>> the provider DT node corresponds to that of the device (the usb2 pad in
>>> the above example) or one of its children. Hence, putting everything
>>> into one more level further down would require some mechanism to tell
>>> the subsystem about it so that it can be found.
>>
>> When the padctl driver registers the PHY objects with the PHY subsystem, can
>> it pass the lanes node as the DT node? That woulud mean each lane /was/ a
>> child of the node registered with the PHY subsystem.
>>
>> Perhaps the PHY subsystem requires a struct device rather than a DT node
>> registered with it?
>
> Yes, that's how the PHY subsystem works. You pass it a struct device *
> that it will wrap a struct phy_provider around. It will then use that
> struct device's ->of_node as the parent for the child lookup.
>
>> If so, does it make sense to create a separate struct device with the
>> of_node pointing at lanes{}?
>
> I suspect that that would work, but I'm already somewhat uncomfortable
> about how many devices the driver creates. Adding more dummy devices
> seems like a workaround.
>
>>> Arguably the current support code isn't a good argument for designing a
>>> binding, so perhaps it'd be useful to add this mechanism in order to get
>>> a better binding. On the other hand, I'm not sure it's really worth it,
>>> since we already have generic bindings that specify the layout of child
>>> devices, and those have been agreed upon broadly (presumably).
>>>
>>> In light of the recent discussion on DPAUX vs. I2C, I see how having the
>>> extra level would be useful to provide additional context. If you think
>>> it's worth it I can spend the extra time to get this implemented in the
>>> core.
>>
>> Naively, it sounds like it'd be a good idea to fix the PHY core. It really
>> shouldn't care about the parent of any object registered with it; it should
>> only interact with the specific object it was given, and any other data such
>> as "ops" callbacks. Do you have any inkling how much work that would be?
>
> I attached what I came up with. It extends the OF PHY provider registry
> by allowing an additional node to be specified that if specified will
> serve as the parent for the child lookup (and hence overrides the
> default node that's taken from the struct device).
>
> It is a fairly trivial patch, and you'll notice the bulk of the changes
> is adding the additional parameter in a number of different places. The
> only thing I'm not quite happy about is that we start needing to pass a
> fairly large number of arguments. But perhaps it's still okay.
>
> An alternative would be to make struct phy_provider embeddable into
> driver private structures. That way they could be completely initialized
> by a driver before being passed to the __of_phy_provider_register()
> function (much like struct gpio_chip and others). That would be a fairly
> intrusive change, one that I'd be willing to take on, though I'd like to
> have Kishon's opinion on this before going ahead.

Either of those options look OK to me, and don't seem too invasive. I 
imagine the amount of work is not too great given you've already 
implemented the first option:-)

> For reference, here's what I'm imagining:
>
> 	struct foo_phy_provider {
> 		struct phy_provider base;
> 		...
> 	};
>
> 	int foo_probe(struct platform_device *pdev)
> 	{
> 		struct foo_phy_provider *priv;
> 		...
>
> 		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> 		if (!priv)
> 			return -ENOMEM;
>
> 		priv->base.dev = &pdev->dev;
> 		priv->base.of_xlate = foo_of_xlate;
>
> 		err = devm_of_phy_provider_register(&priv->base);
> 		if (err < 0)
> 			return err;
>
> 		...
> 	}
>
> And of course adapt the signature of the __of_phy_provider_register()
> function and remove the allocation from it.
>
> Thierry
>
> --- >8 ---
>  From 15e5348a1a63837efd00309fdce5cda979498f77 Mon Sep 17 00:00:00 2001
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date: Tue, 5 Apr 2016 17:17:34 +0200
> Subject: [PATCH] phy: core: Allow children node to be overridden
>
> In order to more flexibly support device tree bindings, allow drivers to
> override the container of the child nodes. By default the device node of
> the PHY provider is assumed to be the parent for children, but bindings
> may decide to add additional levels for better organization.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   Documentation/phy.txt   | 16 ++++++++++++++--
>   drivers/phy/phy-core.c  | 27 +++++++++++++++++++++------
>   include/linux/phy/phy.h | 31 +++++++++++++++++++++----------
>   3 files changed, 56 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/phy.txt b/Documentation/phy.txt
> index b388c5af9e72..0aa994bd9a91 100644
> --- a/Documentation/phy.txt
> +++ b/Documentation/phy.txt
> @@ -31,16 +31,28 @@ should provide its own implementation of of_xlate. of_xlate is used only for
>   dt boot case.
>
>   #define of_phy_provider_register(dev, xlate)    \
> -        __of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +        __of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
>
>   #define devm_of_phy_provider_register(dev, xlate)       \
> -        __devm_of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +        __devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
>
>   of_phy_provider_register and devm_of_phy_provider_register macros can be used to
>   register the phy_provider and it takes device and of_xlate as
>   arguments. For the dt boot case, all PHY providers should use one of the above
>   2 macros to register the PHY provider.
>
> +Often the device tree nodes associated with a PHY provider will contain a set
> +of children that each represent a single PHY. Some bindings may nest the child
> +nodes within extra levels for context and extensibility, in which case the low
> +level of_phy_provider_register_full() and devm_of_phy_provider_register_full()
> +macros can be used to override the node containing the children.
> +
> +#define of_phy_provider_register_full(dev, children, xlate) \
> +	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> +
> +#define devm_of_phy_provider_register_full(dev, children, xlate) \
> +	__devm_of_phy_provider_register_full(dev, children, THIS_MODULE, xlate)
> +
>   void devm_of_phy_provider_unregister(struct device *dev,
>   	struct phy_provider *phy_provider);
>   void of_phy_provider_unregister(struct phy_provider *phy_provider);
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index e7e574dc667a..7f7da2138c82 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -135,13 +135,19 @@ static struct phy *phy_find(struct device *dev, const char *con_id)
>   static struct phy_provider *of_phy_provider_lookup(struct device_node *node)
>   {
>   	struct phy_provider *phy_provider;
> +	struct device_node *children;
>   	struct device_node *child;
>
>   	list_for_each_entry(phy_provider, &phy_provider_list, list) {
>   		if (phy_provider->dev->of_node == node)
>   			return phy_provider;
>
> -		for_each_child_of_node(phy_provider->dev->of_node, child)
> +		if (!phy_provider->children)
> +			children = phy_provider->dev->of_node;
> +		else
> +			children = phy_provider->children;
> +
> +		for_each_child_of_node(children, child)
>   			if (child == node)
>   				return phy_provider;
>   	}
> @@ -811,16 +817,22 @@ EXPORT_SYMBOL_GPL(devm_phy_destroy);
>   /**
>    * __of_phy_provider_register() - create/register phy provider with the framework
>    * @dev: struct device of the phy provider
> + * @children: device node containing children (if different from dev->of_node)
>    * @owner: the module owner containing of_xlate
>    * @of_xlate: function pointer to obtain phy instance from phy provider
>    *
>    * Creates struct phy_provider from dev and of_xlate function pointer.
>    * This is used in the case of dt boot for finding the phy instance from
>    * phy provider.
> + *
> + * If the PHY provider doesn't nest children directly but uses a separate
> + * child node to contain the individual children, the @children parameter
> + * can be used to override the default (i.e. dev->of_node).
>    */
>   struct phy_provider *__of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>   {
>   	struct phy_provider *phy_provider;
>
> @@ -829,6 +841,7 @@ struct phy_provider *__of_phy_provider_register(struct device *dev,
>   		return ERR_PTR(-ENOMEM);
>
>   	phy_provider->dev = dev;
> +	phy_provider->children = children;
>   	phy_provider->owner = owner;
>   	phy_provider->of_xlate = of_xlate;
>
> @@ -854,8 +867,9 @@ EXPORT_SYMBOL_GPL(__of_phy_provider_register);
>    * on the devres data, then, devres data is freed.
>    */
>   struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>   {
>   	struct phy_provider **ptr, *phy_provider;
>
> @@ -863,7 +877,8 @@ struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
>   	if (!ptr)
>   		return ERR_PTR(-ENOMEM);
>
> -	phy_provider = __of_phy_provider_register(dev, owner, of_xlate);
> +	phy_provider = __of_phy_provider_register(dev, children, owner,
> +						  of_xlate);
>   	if (!IS_ERR(phy_provider)) {
>   		*ptr = phy_provider;
>   		devres_add(dev, ptr);
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 8cf05e341cff..a810f2a18842 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -77,6 +77,7 @@ struct phy {
>    */
>   struct phy_provider {
>   	struct device		*dev;
> +	struct device_node	*children;
>   	struct module		*owner;
>   	struct list_head	list;
>   	struct phy * (*of_xlate)(struct device *dev,
> @@ -93,10 +94,16 @@ struct phy_lookup {
>   #define	to_phy(a)	(container_of((a), struct phy, dev))
>
>   #define	of_phy_provider_register(dev, xlate)	\
> -	__of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +	__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
>
>   #define	devm_of_phy_provider_register(dev, xlate)	\
> -	__devm_of_phy_provider_register((dev), THIS_MODULE, (xlate))
> +	__devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
> +
> +#define of_phy_provider_register_full(dev, children, xlate) \
> +	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
> +
> +#define devm_of_phy_provider_register_full(dev, children, xlate) \
> +	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
>
>   static inline void phy_set_drvdata(struct phy *phy, void *data)
>   {
> @@ -147,11 +154,13 @@ struct phy *devm_phy_create(struct device *dev, struct device_node *node,
>   void phy_destroy(struct phy *phy);
>   void devm_phy_destroy(struct device *dev, struct phy *phy);
>   struct phy_provider *__of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args));
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args));
>   struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
> -	struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args));
> +	struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args));
>   void of_phy_provider_unregister(struct phy_provider *phy_provider);
>   void devm_of_phy_provider_unregister(struct device *dev,
>   	struct phy_provider *phy_provider);
> @@ -312,15 +321,17 @@ static inline void devm_phy_destroy(struct device *dev, struct phy *phy)
>   }
>
>   static inline struct phy_provider *__of_phy_provider_register(
> -	struct device *dev, struct module *owner, struct phy * (*of_xlate)(
> -	struct device *dev, struct of_phandle_args *args))
> +	struct device *dev, struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>   {
>   	return ERR_PTR(-ENOSYS);
>   }
>
>   static inline struct phy_provider *__devm_of_phy_provider_register(struct device
> -	*dev, struct module *owner, struct phy * (*of_xlate)(struct device *dev,
> -	struct of_phandle_args *args))
> +	*dev, struct device_node *children, struct module *owner,
> +	struct phy * (*of_xlate)(struct device *dev,
> +				 struct of_phandle_args *args))
>   {
>   	return ERR_PTR(-ENOSYS);
>   }
>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
