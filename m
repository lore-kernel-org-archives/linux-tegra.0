From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: pmc: add power on function for
 secondary CPUs
Date: Sat, 23 Feb 2013 12:59:33 +0800
Message-ID: <1361595573.1804.46.camel@jlo-ubuntu-64.nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
	 <1361515491-16199-3-git-send-email-josephl@nvidia.com>
	 <20130222130051.GV23234@tbergstrom-lnx.Nvidia.com>
	 <1361587135.1804.16.camel@jlo-ubuntu-64.nvidia.com>
	 <51284660.8060002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51284660.8060002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2013-02-23 at 12:32 +0800, Stephen Warren wrote:
> On 02/22/2013 07:38 PM, Joseph Lo wrote:
> > On Fri, 2013-02-22 at 21:00 +0800, Peter De Schrijver wrote:
> >> On Fri, Feb 22, 2013 at 07:44:49AM +0100, Joseph Lo wrote:
> >>> Adding the power on function for secondary CPUs in PMC driver, this can
> >>> help us to remove legacy powergate driver and add generic power domain
> >>> support later.
> 
> >>> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
> 
> >>> +static u8 tegra_cpu_domains[] = {
> >>> +	0xFF,			/* not available for CPU0 */
> >>
> >> On Tegra114 we can also powergate CPU0, so this needs to be defined then.
> >>
> > No, DON'T DO THAT!!
> > We don't allow any code to power gate CPU0 manually here or elsewhere.
> > 
> > The function here only for SMP and hotplug bring up for secondary CPU.
> 
> Doesn't Tegra114 have improved HW that does actually allow
> power-gating/hot-unplugging/... CPU 0, even though older HW didn't?

Indeed. It support CPU0 be power gated. But the power up sequence does
not through here by toggling PMC directly. Just like the CPU idle
"powered-down" mode. The CPU0's power gating/un-gating sequence should
set up some event flags in flow-controller and controlled by
flow-controller.

Thanks,
Joseph
