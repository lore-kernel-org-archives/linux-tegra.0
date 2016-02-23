From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/tegra: Set the DMA mask
Date: Tue, 23 Feb 2016 08:18:26 -0800
Message-ID: <56CC8652.8020208@nvidia.com>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
 <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
 <20160223160440.GE27656@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223160440.GE27656@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 02/23/2016 08:04 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key  > > On Tue, Feb 23, 2016 at 03:25:54PM +0900, Alexandre Courbot wrote: 
 >> The default DMA mask covers a 32 bits address range, but tegradrm >> 
can address more than that. Set the DMA mask to the actual >> 
addressable range to avoid the use of unneeded bounce buffers. >> >> 
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- Thierry, >> I 
am not absolutely sure whether the size is correct and applies to >> all 
Tegra generations - please let me know if this needs to be >> reworked. 
 >> >> drivers/gpu/drm/tegra/drm.c | 1 + 1 file changed, 1 insertion(+) 
 > > This kind of depends on whether or not the device is behind an 
IOMMU. > If it is, then the IOMMU DMA MASK would apply, which can be 
derived > from the number of address bits that the IOMMU can handle. The 
SMMU > supports 32 address bits on Tegra30 and Tegra114, 34 address bits 
on > more recent generations. > > I think for now it's safer to leave 
the DMA mask at the default (32 > bit) to avoid the need to distinguish 
between IOMMU and non-IOMMU > devices.

The GPUs after Tegra114 can choose per access whether they're using IOMMU
or not. The interface is 34 bits wide, so the physical addresses can be 
34 bits.
IOMMU addresses are limited by Tegra SMMU to 32-bit for gk20a. gm20b can use
34-bit if SMMU is configured to combine four ASIDs together.
