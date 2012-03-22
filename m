From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 6/6] pinctrl: tegra: Add complete device tree support
Date: Thu, 22 Mar 2012 11:22:25 -0600
Message-ID: <4F6B5FD1.4040702@wwwdotorg.org>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org> <1332265479-1260-6-git-send-email-swarren@wwwdotorg.org> <20120321093504.GA12118@shlinux2.ap.freescale.net> <4F69FCBF.3050708@wwwdotorg.org> <20120322040730.GC840@shlinux2.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120322040730.GC840-Fb7DQEYuewWctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21/2012 10:07 PM, Dong Aisheng wrote:
> On Thu, Mar 22, 2012 at 12:07:27AM +0800, Stephen Warren wrote:
>> On 03/21/2012 03:35 AM, Dong Aisheng wrote:
>>> On Wed, Mar 21, 2012 at 01:44:39AM +0800, Stephen Warren wrote:
>>>> Implement pinctrl_ops dt_node_to_map() and dt_free_map(). These allow
>>>> complete specification of the desired pinmux configuration using device
>>>> tree.
...
>>>> +	for_each_child_of_node(np_config, np) {
>>>> +		ret = of_property_read_string(np, "nvidia,function", &function);
>>>> +		if (ret < 0)
>>>> +			function = NULL;
>>>> +
>>>> +		for (i = 0; i < ARRAY_SIZE(cfg_params); i++) {
>>>> +			ret = of_property_read_u32(np, cfg_params[i].property,
>>>> +						   &val);
>>>> +			if (!ret) {
>>>> +				config = TEGRA_PINCONF_PACK(
>>>> +						cfg_params[i].param, val);
>>>> +				ret = add_config(&configs, &num_configs,
>>>> +						 config);
>>>> +				if (ret < 0)
>>>> +					goto error;
>>>> +			}
>>>> +		}
>>>> +
>>>> +		of_property_for_each_string(np, "nvidia,pins", prop, group) {
>>>
>>> If we calculate out the strings count and allocate corresponding size array, we may not
>>> need to keep krealloc the maps and configs array size for each entry.
>>> And this may be a little higher efficient.
>>
>> That's true. However, it'd require the code to loop once to determine
>> how many properties are present and how many entries there are in the
>> pin list. Then, loop again to actually construct the mapping table
>> array. This is all added complexity that doesn't affect correctness. I'd
>> rather get the simple code going first, and then refine it later if
>> there turns out to be a performance issue.
>>
> Can we use of_property_count_strings?

It'd be possible to avoid some of the reallocs this way. We could
realloc once per node rather than once per (node, pin). It does make the
code a bit more complex though, since you have to reserve space up-front
during the one realloc and so have to store separate num_maps and
num_maps_allocated. I'll see how bad it gets, and maybe include it in v3
if it isn't horrible.
