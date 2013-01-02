From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpufreq: move clk_get/put out of function
 tegra_cpu_init/exit
Date: Wed, 2 Jan 2013 14:30:14 +0200
Message-ID: <20130102123014.GU19766@tbergstrom-lnx.Nvidia.com>
References: <1356084595-17800-1-git-send-email-linuxzsc@gmail.com>
 <50D4D44F.2080203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D4D44F.2080203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 21, 2012 at 10:27:43PM +0100, Stephen Warren wrote:
> On 12/21/2012 03:09 AM, Richard Zhao wrote:
> > tegra_cpu_init/exit will be called every time one cpu core is online or
> > offline. And all cpu cores share same clocks, redundant clk_get/put
> > wast time,  so I move them out.
> 
> I think this is reasonable.
> 
> Prashant, Peter, any comments?
> 
> Is any other work in tegra_cpu_init() redundant? Is tegra_cpu_init()
> supposed to be called due to hotplug, or is that a bug in the cpufreq core?

I think we want to keep target_cpu_speed[] as a possible input for the
(to be upstreamed) cluster switching logic. Yes, tegra_cpu_init() should be
called due to hotplug. Some systems might need specific initialization for
cpufreq when a new CPU comes online. Also the available frequencies might
be different per CPU. So this information needs to be provided for each
CPU.

Cheers,

Peter.
