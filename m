From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 3/6] pinctrl: core device tree mapping table parsing
 support
Date: Thu, 22 Mar 2012 11:39:36 +0800
Message-ID: <20120322033935.GA840@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-3-git-send-email-swarren@wwwdotorg.org>
 <20120321073116.GE3191@shlinux2.ap.freescale.net>
 <4F69F844.3060102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F69F844.3060102-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 21, 2012 at 11:48:20PM +0800, Stephen Warren wrote:
> On 03/21/2012 01:31 AM, Dong Aisheng wrote:
> > On Wed, Mar 21, 2012 at 01:44:36AM +0800, Stephen Warren wrote:
> >> During pinctrl_get(), if the client device has a device tree node, look
> >> for the common pinctrl properties there. If found, parse the referenced
> >> device tree nodes, with the help of the pinctrl drivers, and generate
> >> mapping table entries from them.
> >>
> >> During pinctrl_put(), free any results of device tree parsing.
> 
> >> +static void dt_free_map(struct pinctrl_dev *pctldev,
> >> +		     struct pinctrl_map *map, unsigned num_maps)
> >> +{
> >> +	if (pctldev) {
> >> +		struct pinctrl_ops *ops = pctldev->desc->pctlops;
> >> +		ops->dt_free_map(pctldev, map, num_maps);
> >> +	} else {
> >
> > I remember for hog on functions the pctldev becomes pinctrl devices itself,
> > so in which case pctldev can be NULL?
> 
> PIN_MAP_TYPE_DUMMY_STATE has no pctldev.
> 
Oh, get it now.
Maybe we could a line of comment in the generating dummy state code telling about
this.

> >> +static int dt_to_map_one_config(struct pinctrl *p, const char *statename,
> >> +				struct device_node *np_config)
> >> +{
> >> +	struct device_node *np_pctldev;
> >> +	struct pinctrl_dev *pctldev;
> >> +	struct pinctrl_ops *ops;
> >> +	int ret;
> >> +	struct pinctrl_map *map;
> >> +	unsigned num_maps;
> >> +
> >> +	/* Find the pin controller containing np_config */
> >> +	np_pctldev = of_node_get(np_config);
> >
> > It seems the np_config node is already got when call of_find_node_by_phandle.
> > So do we still need this line?
> 
> Right below that code, we traverse up the tree using
> of_get_next_parent(). Internally, this calls of_node_put() on the node
> pointer that's passed in. Hence, we need an extra get() to match this.
> 
Yes, it's true.
So it's reasonable here.

> >> +int pinctrl_dt_to_map(struct pinctrl *p)
> >> +{
> >> +	struct device_node *np = p->dev->of_node;
> >> +	int state, ret;
> >> +	char *propname;
> >> +	struct property *prop;
> >> +	const char *statename;
> >> +	const __be32 *list;
> >> +	int size, config;
> >> +	phandle phandle;
> >> +	struct device_node *np_config;
> >> +	struct pinctrl_dt_map *dt_map;
> >
> > Add NULL np checking?
> 
> Oops yes. I though I had that somewhere, but evidently not...
> 
> >> +	/* We may store pointers to property names within the node */
> >> +	of_node_get(np);
> >> +
> >> +	/* For each defined state ID */
> >> +	for (state = 0; ; state++) {
> >> +		/* Retrieve the pinctrl-* property */
> >> +		propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
> >> +		prop = of_find_property(np, propname, &size);
> ...
> >> +			/* strlen("pinctrl-") == 8 */
> >> +			if (strlen(prop->name) < 8) {
> >
> > Do we really need this extra checking?
> > It seems the prop->name is the "pinctrl-%d" you searched above, so the
> > strlen(prop->name) must not < 8, right?
> 
> Assuming of_find_property works correctly, I guess that's true. We can
> remove that if check.
> 
> >> +				dev_err(p->dev, "prop %s inconsistent length\n",
> >> +					prop->name);
> >> +				ret = -EINVAL;
> >> +				goto err;
> >> +			}
> >> +			statename = prop->name + 8;
> >
> > From this code, it seems actually we provide user the option by chance to define
> > state as pinctrl-syspend which is out of our binding doc.
> 
> The user can place a property with name "pinctrl-suspend" into the DT.
> However, since we only look for properties named pinctrl-%d, then the
> code will never read/use it, just like any other unexpected property.
> 
Yes, you're correct.
I misunderstood that.

> >> +		}
> >> +
> >> +		/* For every referenced pin configuration node in it */
> >> +		for (config = 0; config < size; config++) {
> >> +			phandle = be32_to_cpup(list++);
> >> +
> >> +			/* Look up the pin configuration node */
> >> +			np_config = of_find_node_by_phandle(phandle);
> >
> > One option is using of_parse_phandle, then we do not need calculate
> > the phandle offset by ourselves.
> > Like:
> > np_config = of_parse_phandle(propname , config);
> 
> Yes, that's a good idea. I'll try that.
> 
> >> +			if (!np_config) {
> >> +				dev_err(p->dev,
> >> +					"prop %s index %i invalid phandle\n",
> >> +					prop->name, config);
> >> +				ret = -EINVAL;
> >> +				goto err;
> >> +			}
> >> +
> >> +			/* Parse the node */
> >> +			ret = dt_to_map_one_config(p, statename, np_config);
> >> +			of_node_put(np_config);
> >> +			if (ret < 0)
> >> +				goto err;
> >> +		}
> >> +
> >> +		/* No entries in DT? Generate a dummy state table entry */
> >> +		if (!size) {
> >> +			ret = dt_remember_dummy_state(p, statename);
> >> +			if (ret < 0)
> >> +				goto err;
> >> +		}
> >> +	}
> >> +
> >> +	list_for_each_entry(dt_map, &p->dt_maps, node) {
> >> +		ret = pinctrl_register_map(dt_map->map, dt_map->num_maps,
> >> +					   false, true);
> >> +		if (ret < 0)
> >> +			goto err;
> >> +	}
> >
> > What's main purpose of differing the map registration and introduce a
> > intermediate pinctrl_dt_map(dt_remember_or_free_map)?
> > What about directly register maps once it's parsed?
> 
> s/differing/deferring/ I assume.
> 
> IIRC, this was mainly to simplify error handling; by deferring it, you
> don't have to unregister everything when undoing a failed parse.
> However, I guess that pinctrl_dt_free_maps() already cleans up
> everything anyway, so we couuld just register everything as soon as its
> parsed. I'll think a little more about this and switch to doing that if
> will work.
> 
Yes, since it introduces extra complexities which i'm not sure is worth
enough, we can double check it.

Regards
Dong Aisheng
