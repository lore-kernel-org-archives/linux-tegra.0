From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/22] drm/tegra: Check whether page belongs to BO in
 tegra_bo_kmap()
Date: Thu, 1 Jun 2017 21:32:43 +0300
Message-ID: <44ee1a86-fe5e-ef18-94e2-2b7e787312ef@gmail.com>
References: <cover.1495498184.git.digetx@gmail.com>
 <04637a55694493bdd8267a7f19798d7968568087.1495498184.git.digetx@gmail.com>
 <451c46eb-7e5e-8f3a-9197-adffba014559@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <451c46eb-7e5e-8f3a-9197-adffba014559-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01.06.2017 21:01, Mikko Perttunen wrote:
> On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
>> This fixes an OOPS in case of out-of-bounds accessing of a kmap'ed cmdbuf
>> (non-IOMMU allocation) while patching the relocations in do_relocs().
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/gem.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index 424569b53e57..ca0d4439e97b 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -74,6 +74,9 @@ static void *tegra_bo_kmap(struct host1x_bo *bo, unsigned
>> int page)
>>   {
>>       struct tegra_bo *obj = host1x_to_tegra_bo(bo);
>>   +    if (page * PAGE_SIZE >= obj->gem.size)
>> +        return NULL;
>> +
> 
> The multiplication here could overflow, so it needs the same u64 treatment to
> catch all problem situations. I'm not sure if this is required, though, with the
> other bounds check patches in this series.
> 

Right, I'll checks once more if this patch is still needed, thank you.

>>       if (obj->vaddr)
>>           return obj->vaddr + page * PAGE_SIZE;
>>       else if (obj->gem.import_attach)
>>


-- 
Dmitry
