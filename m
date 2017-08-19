From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/tegra: Use u64_to_user_ptr helper
Date: Sat, 19 Aug 2017 11:06:31 +0300
Message-ID: <433b4cb7-8011-fe50-9afb-09e6ead0196e@kapsi.fi>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-5-mperttunen@nvidia.com>
 <f16347d6-991e-4d61-eb55-cca24bcf5625@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f16347d6-991e-4d61-eb55-cca24bcf5625-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2017 01:05 AM, Dmitry Osipenko wrote:
> On 18.08.2017 19:15, Mikko Perttunen wrote:
>> Use the u64_to_user_ptr helper macro to cast IOCTL argument u64 values
>> to user pointers instead of writing out the cast manually.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index e3331a2bc082..78c98736b0a5 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -389,11 +389,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>   	unsigned int num_relocs = args->num_relocs;
>>   	unsigned int num_waitchks = args->num_waitchks;
>>   	struct drm_tegra_cmdbuf __user *cmdbufs =
>> -		(void __user *)(uintptr_t)args->cmdbufs;
>> -	struct drm_tegra_reloc __user *relocs =
>> -		(void __user *)(uintptr_t)args->relocs;
>> +		u64_to_user_ptr(args->cmdbufs);
>> +	struct drm_tegra_reloc __user *relocs = u64_to_user_ptr(args->relocs);
>>   	struct drm_tegra_waitchk __user *waitchks =
>> -		(void __user *)(uintptr_t)args->waitchks;
>> +		u64_to_user_ptr(args->waitchks);
> 
> What about to factor out 'u64_to_user_ptr()' assignments to reduce messiness a
> tad? Like this:
> 
> 	struct drm_tegra_waitchk __user *waitchks;
> 	struct drm_tegra_cmdbuf __user *cmdbufs;
> 	struct drm_tegra_reloc __user *relocs;
> ...
> 	waitchks = u64_to_user_ptr(args->waitchks);
> 	cmdbufs = u64_to_user_ptr(args->cmdbufs);
> 	relocs = u64_to_user_ptr(args->relocs);
> 
> 
>>   	struct drm_tegra_syncpt syncpt;
>>   	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>>   	struct host1x_syncpt *sp;
>> @@ -520,7 +519,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>   		}
>>   	}
>>   
>> -	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
>> +	if (copy_from_user(&syncpt, u64_to_user_ptr(args->syncpts),
> 
> What about to define and use 'struct drm_tegra_reloc __user *syncpts' for
> consistency with other '__user' definitions?
> 
>>   			   sizeof(syncpt))) {
>>   		err = -EFAULT;
>>   		goto fail;
>>
> 

Yeah, these are good ideas. I'll post a v2 at some point with these 
changes. Thanks!

Mikko
