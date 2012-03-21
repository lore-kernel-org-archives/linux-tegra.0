From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 6/6] pinctrl: tegra: Add complete device tree support
Date: Wed, 21 Mar 2012 17:35:06 +0800
Message-ID: <20120321093504.GA12118@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332265479-1260-6-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 21, 2012 at 01:44:39AM +0800, Stephen Warren wrote:
> Implement pinctrl_ops dt_node_to_map() and dt_free_map(). These allow
> complete specification of the desired pinmux configuration using device
> tree.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> v2: Rebase on of_property_for_each_string() API changes.
> ---
Nice code and a good example to people.

A small suggestion below:
> +static int add_map_configs(struct pinctrl_map **map, unsigned *num_maps,
> +			   const char *group, unsigned long *configs,
> +			   unsigned num_configs)
> +{
> +	unsigned i = *num_maps;
> +	unsigned long *dup_configs;
> +	int ret;
> +
> +	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
> +			      GFP_KERNEL);
> +	if (!dup_configs)
> +		return -ENOMEM;
> +
> +	ret = add_map(map, num_maps);
> +	if (ret < 0)
> +		return ret;
> +
> +	(*map)[i].type = PIN_MAP_TYPE_CONFIGS_GROUP;
It still does not support PIN_MAP_TYPE_CONFIGS_PIN, right?

> +	for_each_child_of_node(np_config, np) {
> +		ret = of_property_read_string(np, "nvidia,function", &function);
> +		if (ret < 0)
> +			function = NULL;
> +
> +		for (i = 0; i < ARRAY_SIZE(cfg_params); i++) {
> +			ret = of_property_read_u32(np, cfg_params[i].property,
> +						   &val);
> +			if (!ret) {
> +				config = TEGRA_PINCONF_PACK(
> +						cfg_params[i].param, val);
> +				ret = add_config(&configs, &num_configs,
> +						 config);
> +				if (ret < 0)
> +					goto error;
> +			}
> +		}
> +
> +		of_property_for_each_string(np, "nvidia,pins", prop, group) {
If we calculate out the strings count and allocate corresponding size array, we may not
need to keep krealloc the maps and configs array size for each entry.
And this may be a little higher efficient.

Regards
Dong Aisheng
