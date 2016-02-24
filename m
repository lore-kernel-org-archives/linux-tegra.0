From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/tegra: Set the DMA mask
Date: Wed, 24 Feb 2016 17:38:09 +0900
Message-ID: <56CD6BF1.8040107@nvidia.com>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
 <1456208754-12362-2-git-send-email-acourbot@nvidia.com>
 <20160223160440.GE27656@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223160440.GE27656@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/24/2016 01:04 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Feb 23, 2016 at 03:25:54PM +0900, Alexandre Courbot wrote:
>> The default DMA mask covers a 32 bits address range, but tegradrm can
>> address more than that. Set the DMA mask to the actual addressable range
>> to avoid the use of unneeded bounce buffers.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Thierry, I am not absolutely sure whether the size is correct and applies
>> to all Tegra generations - please let me know if this needs to be
>> reworked.
>>
>>   drivers/gpu/drm/tegra/drm.c | 1 +
>>   1 file changed, 1 insertion(+)
>
> This kind of depends on whether or not the device is behind an IOMMU.  If
> it is, then the IOMMU DMA MASK would apply, which can be derived from
> the number of address bits that the IOMMU can handle. The SMMU supports
> 32 address bits on Tegra30 and Tegra114, 34 address bits on more recent
> generations.
>
> I think for now it's safer to leave the DMA mask at the default (32 bit)
> to avoid the need to distinguish between IOMMU and non-IOMMU devices.

Leaving it that way makes it (almost) impossible to import buffers on 
TX1. Patch 1 sets the DMA ops to swiotlb, so at least after this we 
actually try to import the buffer. However, any page that is higher than 
the 32 bits range will be bounced. If you are lucky, you won't notice it 
(even though I don't think it is acceptable to bounce data to be 
displayed), but most of the time the swiotlb bounce area will run full 
and import will fail with the following message:

drm drm: swiotlb buffer is full (sz: 294912 bytes)

So we should really try and fix this. The issue is, how do you detect 
whether you are behind a IOMMU? The DCs have an iommus property, but the 
drm device (which does the importing) does not. And when we import a 
buffer into tegradrm, nothing guarantees that it is for display. So far 
I cannot think of a better heuristics than "assume 32 bits on < t124 and 
34 bits afterwards".
