From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: pmc: add power on function for
 secondary CPUs
Date: Mon, 25 Feb 2013 10:39:20 +0200
Message-ID: <20130225083920.GZ23234@tbergstrom-lnx.Nvidia.com>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>
 <1361515491-16199-3-git-send-email-josephl@nvidia.com>
 <5127BAD2.8030904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5127BAD2.8030904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 22, 2013 at 07:37:06PM +0100, Stephen Warren wrote:
> On 02/21/2013 11:44 PM, Joseph Lo wrote:
> > Adding the power on function for secondary CPUs in PMC driver, this can
> > help us to remove legacy powergate driver and add generic power domain
> > support later.
> 
> > diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
> 
> > +static u8 tegra_cpu_domains[] = {
> > +	0xFF,			/* not available for CPU0 */
> > +	TEGRA_POWERGATE_CPU1,
> > +	TEGRA_POWERGATE_CPU2,
> > +	TEGRA_POWERGATE_CPU3,
> > +};
> 
> Per Peter's comment, you probably need SoC-specific arrays here, to
> support CPU0 having a valid value or not.

That was a mistake, we never use these functions on CPU0. Powergating uses
a different path. So this is ok.

Cheers,

Peter.
