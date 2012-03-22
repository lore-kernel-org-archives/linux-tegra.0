From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 3/6] pinctrl: core device tree mapping table parsing
 support
Date: Thu, 22 Mar 2012 13:49:29 +0800
Message-ID: <20120322054928.GD840@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-3-git-send-email-swarren@wwwdotorg.org>
 <20120321073116.GE3191@shlinux2.ap.freescale.net>
 <4F69F844.3060102@wwwdotorg.org>
 <4F6A0F05.90104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F6A0F05.90104-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 22, 2012 at 01:25:25AM +0800, Stephen Warren wrote:
> On 03/21/2012 09:48 AM, Stephen Warren wrote:
> > On 03/21/2012 01:31 AM, Dong Aisheng wrote:
> >> On Wed, Mar 21, 2012 at 01:44:36AM +0800, Stephen Warren wrote:
> ...
> >>> +int pinctrl_dt_to_map(struct pinctrl *p)
> >>> +{
> >>> +	struct device_node *np = p->dev->of_node;
> >>> +	int state, ret;
> >>> +	char *propname;
> >>> +	struct property *prop;
> >>> +	const char *statename;
> >>> +	const __be32 *list;
> >>> +	int size, config;
> >>> +	phandle phandle;
> >>> +	struct device_node *np_config;
> >>> +	struct pinctrl_dt_map *dt_map;
> >>
> >> Add NULL np checking?
> > 
> > Oops yes. I though I had that somewhere, but evidently not...
> 
> It turns out this isn't needed; of_node_get() and of_find_property()
> both handle a NULL np just fine. Still, I suppose this might not always
> be true for arbitrary code that's in pinctrl_dt_to_map(), so perhaps we
> should add this anyway.
> 
Yes, and it's meaningless to keep going forward if np is NULL.

> >>> +		}
> >>> +
> >>> +		/* For every referenced pin configuration node in it */
> >>> +		for (config = 0; config < size; config++) {
> >>> +			phandle = be32_to_cpup(list++);
> >>> +
> >>> +			/* Look up the pin configuration node */
> >>> +			np_config = of_find_node_by_phandle(phandle);
> >>
> >> One option is using of_parse_phandle, then we do not need calculate
> >> the phandle offset by ourselves.
> >> Like:
> >> np_config = of_parse_phandle(propname , config);
> > 
> > Yes, that's a good idea. I'll try that.
> 
> I looked at this more, and the existing code is a lot more efficient;
> of_parse_phandle() internally calls of_find_property() each time, which
> this pinctrl code has already done. I'd rather just leave this as it is.
> Are you OK with that?
> 
Yes, i'm ok with it.

Regards
Dong Aisheng
