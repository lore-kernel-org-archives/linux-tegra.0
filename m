From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] gpu: host1x: Don't fail on NULL bo physical address
Date: Wed, 2 Aug 2017 14:29:08 +0300
Message-ID: <6b73ec8a-0875-dfbb-fe3e-cd0ed615d5df@gmail.com>
References: <20170802095505.27250-1-mperttunen@nvidia.com>
 <523b922e-e29c-ab49-2fb6-9f24f33971d4@gmail.com>
 <bada917f-10ed-cdf1-baeb-167fb38ec617@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bada917f-10ed-cdf1-baeb-167fb38ec617-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02.08.2017 14:16, Mikko Perttunen wrote:
> On 08/02/2017 02:06 PM, Dmitry Osipenko wrote:
>> On 02.08.2017 12:55, Mikko Perttunen wrote:
>>> Pinning a Host1x BO currently cannot fail and zero is a valid address
>>> for a BO when IOMMU is enabled. To avoid false errors remove checks
>>> for NULL BO physical addresses.
>>>
>>> Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")
>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   drivers/gpu/host1x/job.c | 8 --------
>>>   1 file changed, 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>>> index bee504406cfc..db509ab8874e 100644
>>> --- a/drivers/gpu/host1x/job.c
>>> +++ b/drivers/gpu/host1x/job.c
>>> @@ -197,10 +197,6 @@ static unsigned int pin_job(struct host1x *host, struct
>>> host1x_job *job)
>>>           }
>>>             phys_addr = host1x_bo_pin(reloc->target.bo, &sgt);
>>> -        if (!phys_addr) {
>>> -            err = -EINVAL;
>>> -            goto unpin;
>>> -        }
>>>             job->addr_phys[job->num_unpins] = phys_addr;
>>>           job->unpins[job->num_unpins].bo = reloc->target.bo;
>>> @@ -225,10 +221,6 @@ static unsigned int pin_job(struct host1x *host, struct
>>> host1x_job *job)
>>>           }
>>>             phys_addr = host1x_bo_pin(g->bo, &sgt);
>>> -        if (!phys_addr) {
>>> -            err = -EINVAL;
>>> -            goto unpin;
>>> -        }
>>>             if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
>>>               for_each_sg(sgt->sgl, sg, sgt->nents, j)
>>>
>>
>> I think 'Fixes' tag isn't really needed for this patch since it's not a bug fix,
>> but a cleanup.
>>
>> Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
> 
> Actually without this, host1x_test fails for me on the first try on TX1 :) So
> it's a bugfix.

Right, my bad.

> 
> Thanks for the reviews and tests.
> 

I haven't tested this patch, only the the second because I've tested it on top
of grate's kernel which has a conflicting patch being applied.

-- 
Dmitry
