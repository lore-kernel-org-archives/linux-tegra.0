From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] drm/nouveau: disable caching for VRAM BOs on ARM
Date: Mon, 19 May 2014 12:16:22 +0200
Message-ID: <1400494582.8467.28.camel@weser.hi.pengutronix.de>
References: <1400492771-9746-1-git-send-email-acourbot@nvidia.com>
	 <1400493433.8467.24.camel@weser.hi.pengutronix.de>
	 <5379D7A0.3050509@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5379D7A0.3050509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 19.05.2014, 19:06 +0900 schrieb Alexandre Courbot:
> On 05/19/2014 06:57 PM, Lucas Stach wrote:
> > Am Montag, den 19.05.2014, 18:46 +0900 schrieb Alexandre Courbot:
> >> This patch is not meant to be merged, but rather to try and understand
> >> why this is needed and what a more suitable solution could be.
> >>
> >> Allowing BOs to be write-cached results in the following happening when
> >> trying to run any program on Tegra/GK20A:
> >>
> >> Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0036010
> >> ...
> >> (nouveau_bo_rd32) from [<c0357d00>] (nouveau_fence_update+0x5c/0x80)
> >> (nouveau_fence_update) from [<c0357d40>] (nouveau_fence_done+0x1c/0x38)
> >> (nouveau_fence_done) from [<c02c3d00>] (ttm_bo_wait+0xec/0x168)
> >> (ttm_bo_wait) from [<c035e334>] (nouveau_gem_ioctl_cpu_prep+0x44/0x100)
> >> (nouveau_gem_ioctl_cpu_prep) from [<c02aaa84>] (drm_ioctl+0x1d8/0x4f4)
> >> (drm_ioctl) from [<c0355394>] (nouveau_drm_ioctl+0x54/0x80)
> >> (nouveau_drm_ioctl) from [<c00ee7b0>] (do_vfs_ioctl+0x3dc/0x5a0)
> >> (do_vfs_ioctl) from [<c00ee9a8>] (SyS_ioctl+0x34/0x5c)
> >> (SyS_ioctl) from [<c000e6e0>] (ret_fast_syscall+0x0/0x30
> >>
> >> The offending nouveau_bo_rd32 is done over an IO-mapped BO, e.g. a BO
> >> mapped through the BAR.
> >>
> > Um wait, this memory is behind an already mapped bar? I think ioremap on
> > ARM defaults to uncached mappings, so if you want to access the memory
> > behind this bar as WC you need to map the BAR as a whole as WC by using
> > ioremap_wc.
> 
> Tried mapping the BAR using ioremap_wc(), but to no avail. On the other 
> hand, could it be that VRAM BOs end up creating a mapping over an 
> already-mapped region? I seem to remember that ARM might not like it...

Multiple mapping are generally allowed, as long as they have the same
caching state. It's conflicting mappings (uncached vs cached, or cached
vs wc), that are documented to yield undefined results.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
