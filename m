From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/tegra: Set DMA ops
Date: Wed, 24 Feb 2016 17:30:54 +0900
Message-ID: <56CD6A3E.4090800@nvidia.com>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
 <20160223152815.GD27656@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160223152815.GD27656@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/24/2016 12:28 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Feb 23, 2016 at 03:25:53PM +0900, Alexandre Courbot wrote:
>> The current settings leaves the DRM device's dma_ops field NULL, which
>> makes it use the dummy DMA ops on arm64 and return an error whenever we
>> try to import a buffer. Call of_dma_configure() with a NULL node (since
>> the device is not spawn from the device tree) so that
>> arch_setup_dma_ops() is called and sets the default ioswtlb DMA ops.
>>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index d347188bf8f4..bc0555adecaf 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -9,6 +9,7 @@
>>
>>   #include <linux/host1x.h>
>>   #include <linux/iommu.h>
>> +#include <linux/of_device.h>
>>
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> @@ -990,6 +991,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>>   		return -ENOMEM;
>>
>>   	dev_set_drvdata(&dev->dev, drm);
>> +	of_dma_configure(drm->dev, NULL);
>
> Looking at the various pieces, I think this really belongs in
> host1x_device_add() (see drivers/gpu/host1x/bus.c) where it can replace
> the open-coded setting of DMA and coherent DMA masks. Also why can't we
> pass the correct device tree node here? The DRM device is a virtual
> device that hangs off the host1x device, so I think it could use the
> same device tree node as the host1x device.
>
> Something like the below (untested).

You're right, that looks like a much better place to do this. 
of_dma_configure() is called at the bus level (platform and PCI), so it 
makes sense to do it from host1x too.
