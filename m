From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V3 3/6] pinctrl: core device tree mapping table parsing
 support
Date: Fri, 23 Mar 2012 11:55:49 +0800
Message-ID: <20120323035548.GA23958@shlinux2.ap.freescale.net>
References: <1332440842-1098-1-git-send-email-swarren@wwwdotorg.org>
 <1332440842-1098-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332440842-1098-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 23, 2012 at 02:27:19AM +0800, Stephen Warren wrote:
> During pinctrl_get(), if the client device has a device tree node, look
> for the common pinctrl properties there. If found, parse the referenced
> device tree nodes, with the help of the pinctrl drivers, and generate
> mapping table entries from them.
> 
> During pinctrl_put(), free any results of device tree parsing.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> v3: Add explit check for devies without dev->of_node. Add comments re:
>     lack of pctldev for PIN_MAP_TYPE_DUMMY_STATE.
> v2: Place most code into new file devicetree.c
> 
> pinctrl core dt fixup
> ---
.......
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
> +	/* CONFIG_OF enabled, p->dev not instantiated from DT */
> +	if (!np)
> +		return 0;
> +
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
You thought this checking is still needed?
prop->name should be exactly what you search above ("pinctrl-%d"), right?

> +				dev_err(p->dev, "prop %s inconsistent length\n",
> +					prop->name);
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +			statename = prop->name + 8;
> +		}
> +
> +		/* For every referenced pin configuration node in it */
> +		for (config = 0; config < size; config++) {
> +			phandle = be32_to_cpup(list++);
> +
> +			/* Look up the pin configuration node */
> +			np_config = of_find_node_by_phandle(phandle);
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
It seems we're still keeping the intermediate pinctrl_dt_map, although
not know the result you found,
but i'm ok we just do it currently.

Regards
Dong Aisheng
