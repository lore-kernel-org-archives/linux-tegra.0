From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 21/22] drm/tegra: Don't use IOMMU on Tegra20
Date: Thu, 1 Jun 2017 20:57:41 +0300
Message-ID: <a8c47884-7727-af0c-de5d-eb5f0bb3919a@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <fb3b357fbbdf61a20609f38a817c3f45ebc238fc.1495498184.git.digetx@gmail.com>
 <a61919f1-df1f-9cd0-3059-53daa3a88ff7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a61919f1-df1f-9cd0-3059-53daa3a88ff7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/01/2017 11:36 AM, Dmitry Osipenko wrote:
> On 23.05.2017 03:16, Dmitry Osipenko wrote:
>> There is no IOMMU on Tegra20, instead a GART would be picked as an IOMMU
>> provider.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 5 ++++-
>>   drivers/gpu/host1x/dev.c    | 5 ++++-
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 17416e1c219a..ac8f76d9475f 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -15,6 +15,8 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   
>> +#include <soc/tegra/fuse.h>
>> +
>>   #include "drm.h"
>>   #include "gem.h"
>>   
>> @@ -131,7 +133,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>   	if (!tegra)
>>   		return -ENOMEM;
>>   
>> -	if (iommu_present(&platform_bus_type)) {
>> +	if (iommu_present(&platform_bus_type) &&
>> +	    tegra_get_chip_id() != TEGRA20) {
>>   		u64 carveout_start, carveout_end, gem_start, gem_end;
>>   		struct iommu_domain_geometry *geometry;
>>   		unsigned long order;
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index 5c1c711a21af..56b7e6d51894 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -25,6 +25,8 @@
>>   #include <linux/of.h>
>>   #include <linux/slab.h>
>>   
>> +#include <soc/tegra/fuse.h>
>> +
>>   #define CREATE_TRACE_POINTS
>>   #include <trace/events/host1x.h>
>>   #undef CREATE_TRACE_POINTS
>> @@ -177,7 +179,8 @@ static int host1x_probe(struct platform_device *pdev)
>>   		return err;
>>   	}
>>   
>> -	if (iommu_present(&platform_bus_type)) {
>> +	if (iommu_present(&platform_bus_type) &&
>> +	    tegra_get_chip_id() != TEGRA20) {
>>   		struct iommu_domain_geometry *geometry;
>>   		unsigned long order;
>>   
>>
> 
> Nicolas noticed that this breaks driver module compilation, as the
> `tegra_get_chip_id` is not an exported symbol. I'll consider alternatives to
> symbol exporting and will fix it in the new revision of the patch.
> 

My recommendation is of_machine_is_compatible()

Cheers,
Mikko
