From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 14/22] gpu: host1x: Forbid relocation address shifting
 in the firewall
Date: Wed, 14 Jun 2017 12:06:06 +0300
Message-ID: <3d723511-45f2-3c80-58fe-c9050624ac94@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
 <5e6f06d3e57db40c1c4947282ef7336369c3360f.1497394243.git.digetx@gmail.com>
 <6db57dae-0de7-45a5-2ed5-1ebd84577742@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6db57dae-0de7-45a5-2ed5-1ebd84577742-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.06.2017 09:50, Mikko Perttunen wrote:
> On 14.06.2017 02:15, Dmitry Osipenko wrote:
>> Incorrectly shifted relocation address will cause a lower memory corruption
>> and likely a hang on a write or a read of an arbitrary data in case of IOMMU
>> absent. As of now there is no use for the address shifting (at least on
>> Tegra20) and adding a proper shifting / sizes validation is much more work.
>> Let's forbid it in the firewall till a proper validation is implemented.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/host1x/dev.c |  4 ++++
>>  drivers/gpu/host1x/dev.h |  1 +
>>  drivers/gpu/host1x/job.c | 24 ++++++++++++++++++++++++
>>  3 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index 6a805ed908c3..21da331ce092 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -72,6 +72,7 @@ static const struct host1x_info host1x01_info = {
>>      .init = host1x01_init,
>>      .sync_offset = 0x3000,
>>      .dma_mask = DMA_BIT_MASK(32),
>> +    .version = 1,
>>  };
>>
>>  static const struct host1x_info host1x02_info = {
>> @@ -82,6 +83,7 @@ static const struct host1x_info host1x02_info = {
>>      .init = host1x02_init,
>>      .sync_offset = 0x3000,
>>      .dma_mask = DMA_BIT_MASK(32),
>> +    .version = 2,
>>  };
>>
>>  static const struct host1x_info host1x04_info = {
>> @@ -92,6 +94,7 @@ static const struct host1x_info host1x04_info = {
>>      .init = host1x04_init,
>>      .sync_offset = 0x2100,
>>      .dma_mask = DMA_BIT_MASK(34),
>> +    .version = 4,
>>  };
>>
>>  static const struct host1x_info host1x05_info = {
>> @@ -102,6 +105,7 @@ static const struct host1x_info host1x05_info = {
>>      .init = host1x05_init,
>>      .sync_offset = 0x2100,
>>      .dma_mask = DMA_BIT_MASK(34),
>> +    .version = 5,
>>  };
>>
>>  static const struct of_device_id host1x_of_match[] = {
>> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
>> index 229d08b6a45e..c6997651b336 100644
>> --- a/drivers/gpu/host1x/dev.h
>> +++ b/drivers/gpu/host1x/dev.h
>> @@ -100,6 +100,7 @@ struct host1x_info {
>>      int (*init)(struct host1x *host1x); /* initialize per SoC ops */
>>      unsigned int sync_offset; /* offset of syncpoint registers */
>>      u64 dma_mask; /* mask of addressable memory */
>> +    unsigned int version; /* host1x's version */
>>  };
>>
>>  struct host1x {
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index 4208329ca2af..7825643da324 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -333,6 +333,27 @@ static bool check_reloc(struct host1x_reloc *reloc,
>> struct host1x_bo *cmdbuf,
>>      return true;
>>  }
>>
>> +static bool check_reloc_shift(struct device *dev, struct host1x_reloc *reloc)
>> +{
>> +    struct host1x *host = dev_get_drvdata(dev->parent);
>> +
>> +    /* skip newer Tegra's since IOMMU is supposed to be used by
>> +     * them and not all address registers with their shifts are
>> +     * publicly documented */
>> +    if (host->info->version > 1)
>> +        return true;
> 
> I don't like the firewall working differently per SoC - IOMMU can still be
> disabled on later SoCs and in this case there would be a security hole even if
> the firewall is enabled.
> 

Yes, it would be a security hole like it is is right now. Unfortunately we can't
fix it on later SoC's without knowing all the address registers and their shifts.

>> +
>> +    /* skip Tegra30 with IOMMU enabled */
>> +    if (host->domain)
>> +        return true;
>> +
> 
> So if we want to be able to test the firewall on all SoCs just having this check
> here for all SoCs would be better.
> 

I'm not sure what you are meaning here. You'll get a wrong address resolved in
HW if that address needs to be shifted.

As I wrote before, on later SoC's firewall could be used as a debug feature
without the shifts being validated.

>> +    /* relocation shift value validation isn't implemented yet */
>> +    if (reloc->shift)
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>  struct host1x_firewall {
>>      struct host1x_job *job;
>>      struct device *dev;
>> @@ -359,6 +380,9 @@ static int check_register(struct host1x_firewall *fw,
>> unsigned long offset)
>>          if (!check_reloc(fw->reloc, fw->cmdbuf, fw->offset))
>>              return -EINVAL;
>>
>> +        if (!check_reloc_shift(fw->dev, fw->reloc))
>> +            return -EINVAL;
>> +
>>          fw->num_relocs--;
>>          fw->reloc++;
>>      }
>>


-- 
Dmitry
