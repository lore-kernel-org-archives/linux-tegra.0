From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: dt: add L2 cache controller
Date: Mon, 29 Oct 2012 10:28:21 +0800
Message-ID: <1351477701.2779.70.camel@jlo-ubuntu-64.nvidia.com>
References: <1351247649-15859-1-git-send-email-josephl@nvidia.com>
	 <508AC294.7080506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <508AC294.7080506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2012-10-27 at 01:04 +0800, Stephen Warren wrote:
> On 10/26/2012 04:34 AM, Joseph Lo wrote:
> > Add L2 cache controller binding into DT for Tegra.
> 
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> 
> > +	L2: cache-controller@50043000 {
> > +		compatible = "arm,pl310-cache";
> > +		reg = <0x50043000 0x1000>;
> > +		arm,data-latency = <5 5 2>;
> > +		arm,tag-latency = <4 4 2>;
> > +		cache-unified;
> > +		cache-level = <2>;
> > +	};
> 

Stephen,

Thanks for review.
> Do you need to specify arm,filter-ranges here? It's certainly parsed by
> pl310_of_setup() and used if present, although I don't think we're
> programming the register in the existing code, so I guess we don't need it.
> 
Yes, we don't need it. Because there are HW reset value for it. We don't
need to configure it.
> The L2 label above isn't necessary unless something references those
> nodes. Usually, that something is the cpu nodes' next-level-cache
> property. I don't suppose you could amend this series to also fill in
> Tegra's /cpus nodes in these files too?
OK. Will remove the label.
> 
> Finally, is this series going to be a dependency for any of the cpuidle
> or other work you're submitting? I assume it's completely independent
> and hence I can throw it in any old branch in any order I feel like?

No. We need this before the "powered-down" cpuidle support. Because the
L2 init function didn't help to hook the resume API to "outer_cache_fns"
interface currently. If we don't apply this before the "powered-down"
cpuidle, we will lost L2 support after one successful powered-down
cpuidle sequence.

Thanks,
Joseph
