From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 10:31:11 +0800
Message-ID: <1381890671.11523.15.camel@jlo-ubuntu-64.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
	 <1381850883-12722-14-git-send-email-treding@nvidia.com>
	 <525DB8B2.2050203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525DB8B2.2050203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-10-16 at 05:50 +0800, Stephen Warren wrote:
> On 10/15/2013 09:28 AM, Thierry Reding wrote:
> > Extend the list of power gates found on Tegra114. Note that there are
> > now holes in the list, so perhaps a simple array is no longer the best
> > data structure to represent it. But perhaps this is good enough for now
> > and can be cleaned up in a follow up patch?
> 
> Peter should probably comment on this, since I think he's touched the
> powergate driver the most recently.
> 
> One idea might be to have the powergate IDs be "virtual", with a
> virtual->HW ID mapping table per SoC. The virtual IDs need not have any
> gaps. I'm not sure that having gaps is really much of a problem though,
> except for the debugfs code in powergate.c...
> 
> > diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
> 
> > +#define TEGRA_POWERGATE_DISA	18
> > +#define TEGRA_POWERGATE_DISB	19
> 
> s/DIS/DSI/ perhaps?
> 
> > -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
> 
> I expect that was added deliberately. Perhaps Peter or Joseph can
> comment? Admittedly, it's not used right now.
> 
> BTW, while you're fiddling with powergate.c, I note that
> mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than including
> tegra-powergate.h. Can you fix that?

The reason why we didn't keep updated this code and use this driver is
because we want it to convert to use generic power domain
infrastructure[1]. Not sure this makes sense to you. (Only PCIe uses
this powergate driver until now.)

[1]:
include/linux/pm_domain.h
drivers/base/power/domain.c
Documentation/power/devices.txt
Documentation/power/runtime_pm.txt
