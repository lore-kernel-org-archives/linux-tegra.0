From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v2 1/6] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Fri, 22 Sep 2017 17:02:28 +0300
Message-ID: <179df5f9-86d5-b373-fda8-8523b4d13fe3@kapsi.fi>
References: <20170905081029.19769-1-mperttunen@nvidia.com>
 <20170905081029.19769-2-mperttunen@nvidia.com>
 <5cbadb84-31aa-ee3d-7b4b-e83afdfdcf7e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5cbadb84-31aa-ee3d-7b4b-e83afdfdcf7e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/05/2017 04:33 PM, Dmitry Osipenko wrote:
> On 05.09.2017 11:10, Mikko Perttunen wrote:
>> ... >> diff --git a/drivers/gpu/host1x/hw/channel_hw.c 
b/drivers/gpu/host1x/hw/channel_hw.c
>> index 8447a56c41ca..0161da331702 100644
>> --- a/drivers/gpu/host1x/hw/channel_hw.c
>> +++ b/drivers/gpu/host1x/hw/channel_hw.c
>> @@ -147,6 +147,9 @@ static int channel_submit(struct host1x_job *job)
>>   
>>   	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
>>   
>> +	/* assign syncpoint to channel */
>> +	host1x_hw_syncpt_assign_channel(host, sp, ch);
> 
> This function could be renamed to host1x_hw_assign_syncpt_to_channel() and then
> comment to it won't be needed.

Maybe host1x_hw_syncpt_assign_to_channel? I'd like to keep the current 
noun_verb format. Though IMHO even the current name is pretty 
descriptive in itself.

> 
> It is not very nice that channel would be re-assigned on each submit. Maybe that
> assignment should be done by host1x_syncpt_request() ?

host1x_syncpt_request doesn't know about the channel so we'd have to 
thread this information there and through each client driver in 
drm/tegra/, so I decided not to do this at this time. I'm planning a new 
channel allocation model which will change that side of the code anyway, 
so I'd like to revisit this at that point. For our current channel 
model, the current implementation doesn't have any functional downsides 
anyway.

> 
>> +
>>   	job->syncpt_end = syncval;
>>   
>>   	/* add a setclass for modules that require it */
>> diff --git a/drivers/gpu/host1x/hw/syncpt_hw.c b/drivers/gpu/host1x/hw/syncpt_hw.c
>> index 7b0270d60742..dc7a44614fef 100644
>> --- a/drivers/gpu/host1x/hw/syncpt_hw.c
>> +++ b/drivers/gpu/host1x/hw/syncpt_hw.c
>> @@ -106,6 +106,50 @@ static int syncpt_patch_wait(struct host1x_syncpt *sp, void *patch_addr)
>>   	return 0;
>>   }
>>   
>> +/**
>> + * syncpt_assign_channel() - Assign syncpoint to channel
>> + * @sp: syncpoint
>> + * @ch: channel
>> + *
>> + * On chips with the syncpoint protection feature (Tegra186+), assign @sp to
>> + * @ch, preventing other channels from incrementing the syncpoints. If @ch is
>> + * NULL, unassigns the syncpoint.
>> + *
>> + * On older chips, do nothing.
>> + */
>> +static void syncpt_assign_channel(struct host1x_syncpt *sp,
>> +				  struct host1x_channel *ch)
>> +{
>> +#if HOST1X_HW >= 6
>> +	struct host1x *host = sp->host;
>> +
>> +	if (!host->hv_regs)
>> +		return;
>> +
>> +	host1x_sync_writel(host,
>> +			   HOST1X_SYNC_SYNCPT_CH_APP_CH(ch ? ch->id : 0xff),
>> +			   HOST1X_SYNC_SYNCPT_CH_APP(sp->id));
>> +#endif
>> +}
>> +
>> +/**
>> + * syncpt_enable_protection() - Enable syncpoint protection
>> + * @host: host1x instance
>> + *
>> + * On chips with the syncpoint protection feature (Tegra186+), enable this
>> + * feature. On older chips, do nothing.
>> + */
>> +static void syncpt_enable_protection(struct host1x *host)
>> +{
>> +#if HOST1X_HW >= 6
>> +	if (!host->hv_regs)
>> +		return;
>> +
>> +	host1x_hypervisor_writel(host, HOST1X_HV_SYNCPT_PROT_EN_CH_EN,
>> +				 HOST1X_HV_SYNCPT_PROT_EN);
>> +#endif
>> +}
>> +
>>   static const struct host1x_syncpt_ops host1x_syncpt_ops = {
>>   	.restore = syncpt_restore,
>>   	.restore_wait_base = syncpt_restore_wait_base,
>> @@ -113,4 +157,6 @@ static const struct host1x_syncpt_ops host1x_syncpt_ops = {
>>   	.load = syncpt_load,
>>   	.cpu_incr = syncpt_cpu_incr,
>>   	.patch_wait = syncpt_patch_wait,
>> +	.assign_channel = syncpt_assign_channel,
>> +	.enable_protection = syncpt_enable_protection,
>>   };
>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
>> index 048ac9e344ce..4c7a4c8b2ad2 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -398,6 +398,13 @@ int host1x_syncpt_init(struct host1x *host)
>>   	for (i = 0; i < host->info->nb_pts; i++) {
>>   		syncpt[i].id = i;
>>   		syncpt[i].host = host;
>> +
>> +		/*
>> +		 * Unassign syncpt from channels for purposes of Tegra186
>> +		 * syncpoint protection. This prevents any channel from
>> +		 * accessing it until it is reassigned.
>> +		 */
>> +		host1x_hw_syncpt_assign_channel(host, &syncpt[i], NULL);
>>   	}
>>   
>>   	for (i = 0; i < host->info->nb_bases; i++)
>> @@ -408,6 +415,7 @@ int host1x_syncpt_init(struct host1x *host)
>>   	host->bases = bases;
>>   
>>   	host1x_syncpt_restore(host);
>> +	host1x_hw_syncpt_enable_protection(host);
>>   
>>   	/* Allocate sync point to use for clearing waits for expired fences */
>>   	host->nop_sp = host1x_syncpt_alloc(host, NULL, 0);
>>
> 
> 
