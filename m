From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [REPOST Patch v1 3/3] power: power_supply_core: Add support for
 supplied_from
Date: Sat, 30 Mar 2013 15:41:17 -0700
Message-ID: <20130330224117.GA24610@lizard>
References: <1364264690-2124-1-git-send-email-rklein@nvidia.com>
 <1364264690-2124-4-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364264690-2124-4-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 25, 2013 at 10:24:50PM -0400, Rhyland Klein wrote:
[...]
> +int power_supply_find_supply_from_node(struct device_node *supply_node)
> +{
> +	int error;
> +	struct device *dev;
> +	struct class_dev_iter iter;
> +
> +	/* Use iterator to see if any other device is registered.
> +	 * This is required since class_for_each_device returns 0
> +	 * if there are no devices registered.
> +	 */

Minor nit: can you please adhere to the canonical style for the multiline
comments?

> +	class_dev_iter_init(&iter, power_supply_class, NULL, NULL);
> +	dev = class_dev_iter_next(&iter);
> +
> +	if (!dev)
> +		return -EPROBE_DEFER;
> +
> +	/* we have to treat the return value as inverted, because if
> +	 * we return error on not found, then it won't continue looking.
> +	 * So we trick it by returning error on success to stop looking
> +	 * once the matching device is found.
> +	 */

Ditto.

> +	error = class_for_each_device(power_supply_class, NULL, supply_node,
> +				       __power_supply_find_supply_from_node);
> +
> +	return error ? 0 : -EPROBE_DEFER;
> +}
> +
> +int power_supply_check_supplies(struct power_supply *psy)
> +{
> +	struct device_node *np;
> +	int cnt = 0;
> +	int ret = 0;
> +
> +	/* If there is already a list honor it */
> +	if (psy->supplied_from && psy->num_supplies > 0)
> +		return 0;
> +
> +	/* No device node found, nothing to do */
> +	if (!psy->of_node)
> +		return 0;
> +
> +	do {

You can move 'int ret;' here (without initializer).

> +		np = of_parse_phandle(psy->of_node, "power-supplies", cnt++);
> +		if (!np)
> +			continue;
> +
> +		ret = power_supply_find_supply_from_node(np);
> +		if (ret) {
> +			dev_dbg(psy->dev, "Failed to find supply, defer!\n");
> +			return -EPROBE_DEFER;
> +		}
> +	} while (np);
> +
> +	/* All supplies found, allocate char ** array for filling */
> +	psy->supplied_from = devm_kzalloc(psy->dev, sizeof(psy->supplied_from),
> +					  GFP_KERNEL);
> +	if (!psy->supplied_from) {
> +		dev_err(psy->dev, "Couldn't allocate memory for supply list\n");
> +		return -ENOMEM;
> +	}
> +
> +	*psy->supplied_from = devm_kzalloc(psy->dev, sizeof(char *) * cnt,
> +					   GFP_KERNEL);
> +	if (!*psy->supplied_from) {
> +		dev_err(psy->dev, "Couldn't allocate memory for supply list\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = power_supply_populate_supplied_from(psy);
> +
> +	return ret;

can be just 'return power_supply_populate_supplied_from(psy);'

> +}
> +#endif
> +
>  static int __power_supply_am_i_supplied(struct device *dev, void *data)
>  {
>  	union power_supply_propval ret = {0,};
> @@ -359,6 +486,14 @@ int power_supply_register(struct device *parent, struct power_supply *psy)
>  
>  	INIT_WORK(&psy->changed_work, power_supply_changed_work);
>  
> +#ifdef CONFIG_OF
> +	rc = power_supply_check_supplies(psy);
> +	if (rc) {
> +		dev_info(dev, "Not all required supplies found, defer probe\n");
> +		goto check_supplies_failed;
> +	}
> +#endif
[...]
> +#ifdef CONFIG_OF
> +check_supplies_failed:
> +#endif

Can you make an empty, static inline stub for
power_supply_check_supplies() for !CONFIG_OF case, so that we won't need
#ifdefs inside this function?

Otherwise it looks great, thanks a lot!

Anton
