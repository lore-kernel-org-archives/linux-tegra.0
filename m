From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 03/10] ARM: tegra: get power management configurations
 for PMC from DT
Date: Thu, 7 Mar 2013 18:46:21 +0800
Message-ID: <1362653181.1890.3.camel@jlo-ubuntu-64.nvidia.com>
References: <1362397207-5597-1-git-send-email-josephl@nvidia.com>
	 <51363A95.8090000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51363A95.8090000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 02:33 +0800, Stephen Warren wrote:
> On 03/04/2013 04:40 AM, Joseph Lo wrote:
> > If the system supports deep sleep mode (i.e. suspend), it should have
> > the power management configuration for PMC in the DT under the sub-node
> > of PMC. Different system may have different configurations, it should
> > be parsed from DT.
> 
> > diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
> 
> > @@ -143,6 +161,10 @@ static const struct of_device_id matches[] __initconst = {
> >  static void tegra_pmc_parse_dt(void)
> >  {
> >  	struct device_node *np;
> > +	u32 prop;
> > +	enum tegra_suspend_mode suspend_mode;
> > +	u32 core_good_time[2] = {0, 0};
> > +	u32 lp0_vec[2] = {0, 0};
> >  
> >  	np = of_find_matching_node(NULL, matches);
> >  	BUG_ON(!np);
> 
> This files doesn't look like that; the BUG_ON() isn't present upstream.
> yet. So, this series depends on some other patches not yet applied. You
> need to explicitly document your patch dependencies somewhere. Hopefully
> I can work it out...
> 
Sorry for that.

> The DT binding documentation patch (5/10) should be squashed into this
> patch; both document and implement the bindings in the same patch.

IIRC, you asked me to separate the binding documentation and
implementation into two different patch in internal review. Should I
squash these two now? (I can do that, just want to confirm.)

Thanks,
Joseph
