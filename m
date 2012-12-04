From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra20: cpuidle: apply coupled cpuidle for
 powered-down mode
Date: Tue, 4 Dec 2012 14:41:59 +0200
Message-ID: <20121204124159.GO19258@tbergstrom-lnx.Nvidia.com>
References: <1354503607-13707-1-git-send-email-josephl@nvidia.com>
 <1354503607-13707-6-git-send-email-josephl@nvidia.com>
 <50BCF4F8.60606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50BCF4F8.60606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> 
> > @@ -258,6 +256,9 @@ int __init tegra20_cpuidle_init(void)
> 
> > +#ifdef CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED
> > +		dev->coupled_cpus = *cpu_online_mask;
> > +#endif
> 
> What if that changes; I assume couple cpuidle handles that by
> registering a notifier?
> 

Yes. see drivers/cpuidle/coupled.c:651

> Is there any way that the kernel can boot with only CPU 0 "plugged in",
> but later have the other CPU hotplugged in? In other words, should that
> hard-code a mask (3?) that describes the HW, rather than relying on the
> runtime hotplug status? (think about what happens when this idle code is
> moved into drivers/cpuidle/ and built as a module, and hence could be
> initialized with only 1 CPU hotplugged in).

Using the cpu_possible_mask might be a better idea. The only other user
of coupled cpuidle (OMAP4) also uses cpu_online_mask however.

Cheers,

Peter.
