From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Thu, 17 Oct 2013 10:20:38 +0800
Message-ID: <1381976438.4120.10.camel@jlo-ubuntu-64.nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
	 <1381850883-12722-14-git-send-email-treding@nvidia.com>
	 <525DB8B2.2050203@wwwdotorg.org> <20131016104848.GE21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016104848.GE21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-10-16 at 18:48 +0800, Thierry Reding wrote:
> On Tue, Oct 15, 2013 at 03:50:42PM -0600, Stephen Warren wrote:
> > On 10/15/2013 09:28 AM, Thierry Reding wrote:
> > > -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
> > 
> > I expect that was added deliberately. Perhaps Peter or Joseph can
> > comment? Admittedly, it's not used right now.
> > 
> > BTW, while you're fiddling with powergate.c, I note that
> > mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than including
> > tegra-powergate.h. Can you fix that?
> 
> There's more: quite a bit of the powergate functionality seems to be
> implemented in both powergate.c and pmc.c. I should probably unify both
> while at it. Not sure if I can make it before the deadline on Thursday
> though, so I'll focus on the refactoring of the power domain stuff first
> because that's actually needed for Tegra114 support.

The powergate driver should only touch the power function of devices not
CPU. Actually I had done the same thing you did here when Tegra114
brought up in March this year. But it was being rejected and asked for
using a generic framework if the kernel had one. I kept the driver but
moved all the CPU power control function to pmc.c.

So you may not need to unify them, just keep the devices power control
function in powergate.c and the CPU part in pmc.c. (The CPU part was
already there. You may just need to remove them in powergate.c.)

Thanks,
Joseph
