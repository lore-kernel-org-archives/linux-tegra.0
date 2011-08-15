From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH 10/12] arm/tegra: Add device tree support to pinmux
 driver
Date: Mon, 15 Aug 2011 09:09:40 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA25055@HQMAIL01.nvidia.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
 <1313189697-21287-11-git-send-email-swarren@nvidia.com>
 <20110813104323.GC2643@pulham.picochip.com>
 <20110813104850.GD2643@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110813104850.GD2643-apL1N+EY0C9YtYNIL7UdTEEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jamie Iles wrote at Saturday, August 13, 2011 4:49 AM:
> On Sat, Aug 13, 2011 at 11:43:23AM +0100, Jamie Iles wrote:
> > Hi Stephen,
> >
> > On Fri, Aug 12, 2011 at 04:54:55PM -0600, Stephen Warren wrote:
...
> > > diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
...
> > > +#ifdef CONFIG_OF
> > > +static void __init tegra_pinmux_probe_dt(struct platform_device *pdev)
> > > +{
> > > +	int pg;
> > > +
> > > +	for (pg = 0; pg < TEGRA_MAX_PINGROUP; pg++) {
> > > +		const char *pg_name = pingroup_name(pg);
> > > +		struct tegra_pingroup_config config;
> > > +		struct device_node *pg_node;
> > > +		int ret;
> > > +		const char *s;
> > > +
> > > +		pg_node = of_find_child_node_by_name(pdev->dev.of_node,
> > > +						     pg_name);
> > > +		if (pg_node == NULL)
> > > +			continue;
> >
> > Rather than iterating over all of the mux names in the pinmux driver and
> > searching for a matching DT node, could you not do it the other way
> > round?  So do an for_each_child_of_node() on the pinmux node then find
> > the matching pingroup keyed by the node name?  This would eliminate
> > of_find_child_node_by_name().  You could also catch invalid
> > configurations for non-existent pins this way.
> 
> I just re-read your introduction email and saw you've already discussed
> this!  Would this require an explicit pin name property though or could
> you just key off of the pg_node->name?

No, I think pg_node->name will work out fine; it's what of_find_child_node_by_name
is using anyway.

-- 
nvpublic
