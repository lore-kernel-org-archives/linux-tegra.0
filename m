From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 3/6] pinctrl: core device tree mapping table parsing
 support
Date: Wed, 21 Mar 2012 15:31:17 +0800
Message-ID: <20120321073116.GE3191@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332265479-1260-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 21, 2012 at 01:44:36AM +0800, Stephen Warren wrote:
> During pinctrl_get(), if the client device has a device tree node, look
> for the common pinctrl properties there. If found, parse the referenced
> device tree nodes, with the help of the pinctrl drivers, and generate
> mapping table entries from them.
> 
> During pinctrl_put(), free any results of device tree parsing.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> v2: Place most code into new file devicetree.c
Much clearer.:)

> + * struct pinctrl_dt_map - mapping table chunk parsed from device tree
> + * @node: list node for struct pinctrl's @dt_maps field
> + * @pctldev: the pin controller that allocated this struct, and will free it
> + * @maps: the mapping table entries
> + */
> +struct pinctrl_dt_map {
> +	struct list_head node;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_map *map;
> +	unsigned num_maps;
> +};
> +
> +static void dt_free_map(struct pinctrl_dev *pctldev,
> +		     struct pinctrl_map *map, unsigned num_maps)
> +{
> +	if (pctldev) {
> +		struct pinctrl_ops *ops = pctldev->desc->pctlops;
> +		ops->dt_free_map(pctldev, map, num_maps);
> +	} else {
I remember for hog on functions the pctldev becomes pinctrl devices itself,
so in which case pctldev can be NULL?

> +static struct pinctrl_dev *find_pinctrl_by_of_node(struct device_node *np)
> +{
> +	struct pinctrl_dev *pctldev;
> +
> +	list_for_each_entry(pctldev, &pinctrldev_list, node)
> +		if (pctldev->dev->of_node == np)
> +			return pctldev;
> +
> +	return NULL;
> +}
> +
> +static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
> +				struct device_node *np_config)
> +{
> +	struct device_node *np_pctldev;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_ops *ops;
> +	int ret;
> +	struct pinctrl_map *map;
> +	unsigned num_maps;
> +
> +	/* Find the pin controller containing np_config */
> +	np_pctldev = of_node_get(np_config);
It seems the np_config node is already got when call of_find_node_by_phandle.
So do we still need this line?

> +int pinctrl_dt_to_map(struct pinctrl *p)
> +{
> +	struct device_node *np = p->dev->of_node;
> +	int state, ret;
> +	char *propname;
> +	struct property *prop;
> +	const char *statename;
> +	const __be32 *list;
> +	int size, config;
> +	phandle phandle;
> +	struct device_node *np_config;
> +	struct pinctrl_dt_map *dt_map;
> +
Add NULL np checking?

> +	/* We may store pointers to property names within the node */
> +	of_node_get(np);
> +
> +	/* For each defined state ID */
> +	for (state = 0; ; state++) {
> +		/* Retrieve the pinctrl-* property */
> +		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> +		prop = of_find_property(np, propname, &size);
> +		kfree(propname);
> +		if (!prop)
> +			break;
> +		list = prop->value;
> +		size /= sizeof(*list);
> +
> +		/* Determine whether pinctrl-names property names the state */
> +		ret = of_property_read_string_index(np, "pinctrl-names",
> +						    state, &statename);
> +		/*
> +		 * If not, statename is just the integer state ID. But rather
> +		 * than dynamically allocate it and have to free it later,
> +		 * just point part way into the property name for the string.
> +		 */
> +		if (ret < 0) {
> +			/* strlen("pinctrl-") == 8 */
> +			if (strlen(prop->name) < 8) {
Do we really need this extra checking?
It seems the prop->name is the "pinctrl-%d" you searched above, so the
strlen(prop->name) must not < 8, right?

> +				dev_err(p->dev, "prop %s inconsistent length\n",
> +					prop->name);
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +			statename = prop->name + 8;
From this code, it seems actually we provide user the option by chance to define
state as pinctrl-syspend which is out of our binding doc.

> +		}
> +
> +		/* For every referenced pin configuration node in it */
> +		for (config = 0; config < size; config++) {
> +			phandle = be32_to_cpup(list++);
> +
> +			/* Look up the pin configuration node */
> +			np_config = of_find_node_by_phandle(phandle);
One option is using of_parse_phandle, then we do not need calculate
the phandle offset by ourselves.
Like:
np_config = of_parse_phandle(propname , config);

> +			if (!np_config) {
> +				dev_err(p->dev,
> +					"prop %s index %i invalid phandle\n",
> +					prop->name, config);
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +
> +			/* Parse the node */
> +			ret = dt_to_map_one_config(p, statename, np_config);
> +			of_node_put(np_config);
> +			if (ret < 0)
> +				goto err;
> +		}
> +
> +		/* No entries in DT? Generate a dummy state table entry */
> +		if (!size) {
> +			ret = dt_remember_dummy_state(p, statename);
> +			if (ret < 0)
> +				goto err;
> +		}
> +	}
> +
> +	list_for_each_entry(dt_map, &p->dt_maps, node) {
> +		ret = pinctrl_register_map(dt_map->map, dt_map->num_maps,
> +					   false, true);
> +		if (ret < 0)
> +			goto err;
> +	}
What's main purpose of differing the map registration and introduce a
intermediate pinctrl_dt_map(dt_remember_or_free_map)?
What about directly register maps once it's parsed?

Regards
Dong Aisheng
