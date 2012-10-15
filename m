From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] iommu: tegra: remove include of <mach/iomap.h>
Date: Mon, 15 Oct 2012 11:42:44 -0600
Message-ID: <507C4B14.4070809@wwwdotorg.org>
References: <1349216149-858-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349216149-858-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/02/2012 04:15 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Nothing from this file is used, and the file will hopefully be deleted
> soon.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Joerg, if this patch can get into 3.7 (it's late, I know) then that
> would be great. If not, may I please request an ack so I can take the
> change through the Tegra tree in 3.8, since I will probably have cleanup
> patches that depend on this change. Thanks.

Joerg, given 3.7-rc1 is now out, I'd like to take this through the Tegra
tree due to other patches depending on it.

Given the patch is so trivial, I'll probably just apply it anyway soon -
this is more of a heads-up to avoid it being taken through the IOMMU tree.

Thanks.

> This is based on the IOMMU arm/tegra branch.
> ---
>  drivers/iommu/tegra-smmu.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index e1d17fe..e7b56da 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -38,7 +38,6 @@
>  #include <asm/page.h>
>  #include <asm/cacheflush.h>
>  
> -#include <mach/iomap.h>
>  #include <mach/tegra-ahb.h>
>  
>  enum smmu_hwgrp {
