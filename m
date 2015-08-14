From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 0/5] Host1x/TegraDRM fixes/improvements
Date: Fri, 14 Aug 2015 12:59:15 +0300
Message-ID: <55CDBBF3.3010405@kapsi.fi>
References: <1436354868-24309-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436354868-24309-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Bump.

On 07/08/2015 02:27 PM, Mikko Perttunen wrote:
> Hi, this series has a few small improvements for Host1x and TegraDRM
> that the VIC series will build upon.
> 
> 1/5 is a bug fix to host1x.
> 2/5 is required by VIC code to implement ->is_addr_reg().
> 3/5 deduplicates handling of HOST1X class address registers
>     and fixes the checked registers.
> 4/5 is required for the host1x firewall to work when bo's are
>     mapped using IOMMU.
> 5/5 adds a TegraDRM allocator that allows drivers to allocate
>     non-GEM memory that is still mapped to the TegraDRM domain.
> 
> Arto Merilainen (3):
>   host1x: Store device address to all bufs
>   host1x: Pass register value in firewall
>   drm/tegra: Support kernel mappings with IOMMU
> 
> Mikko Perttunen (2):
>   host1x: Handle HOST1X class address registers directly
>   drm/tegra: Add Tegra DRM allocation API
> 
>  drivers/gpu/drm/tegra/drm.c  | 99 +++++++++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/tegra/drm.h  | 13 +++++-
>  drivers/gpu/drm/tegra/gem.c  | 34 +++++++++++++--
>  drivers/gpu/drm/tegra/gr2d.c | 25 ++++-------
>  drivers/gpu/drm/tegra/gr3d.c | 24 ++++-------
>  drivers/gpu/host1x/job.c     | 54 +++++++++++++++++-------
>  include/linux/host1x.h       |  4 +-
>  7 files changed, 193 insertions(+), 60 deletions(-)
> 
