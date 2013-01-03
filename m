From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: tegra: update the cache maintenance order
 for CPU shutdown
Date: Thu, 3 Jan 2013 12:48:44 +0200
Message-ID: <20130103104844.GV19766@tbergstrom-lnx.Nvidia.com>
References: <1357195380-5494-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357195380-5494-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 03, 2013 at 07:42:59AM +0100, Joseph Lo wrote:
> Updating the cache maintenance order before CPU shutdown when doing CPU
> hotplug.
> The old order:
> * clean L1 by flush_cache_all
> * exit SMP
> * CPU shutdown
> Adapt to:
> * disable L1 data cache by clear C bit
> * clean L1 by v7_flush_dcache_louis
> * exit SMP
> * CPU shutdown
> 
> For CPU hotplug case, it's no need to do "flush_cache_all". And we should
> disable L1 data cache before clean L1 data cache. Then leaving the SMP
> coherency.
> 

Both patches

Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
