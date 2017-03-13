From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/tegra: Support for sync file-based fences in
 submit
Date: Mon, 13 Mar 2017 11:07:28 +0200
Message-ID: <f531a54a-40a8-3047-2fa9-2f751257ce13@kapsi.fi>
References: <20170309175718.14843-1-mperttunen@nvidia.com>
 <20170309175718.14843-4-mperttunen@nvidia.com>
 <20170313071500.GB15513@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313071500.GB15513-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 13.03.2017 09:15, Thierry Reding wrote:
> On Thu, Mar 09, 2017 at 07:57:18PM +0200, Mikko Perttunen wrote:
>> Add support for sync file-based prefences and postfences
>> to job submission. Fences are passed to the Host1x implementation.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/drm.c | 69 ++++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 64dff8530403..bf4a2a13c17d 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/bitops.h>
>>  #include <linux/host1x.h>
>>  #include <linux/iommu.h>
>> +#include <linux/sync_file.h>
>>
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_atomic_helper.h>
>> @@ -344,6 +345,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>  		     struct drm_tegra_submit *args, struct drm_device *drm,
>>  		     struct drm_file *file)
>>  {
>> +	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>>  	unsigned int num_cmdbufs = args->num_cmdbufs;
>>  	unsigned int num_relocs = args->num_relocs;
>>  	unsigned int num_waitchks = args->num_waitchks;
>> @@ -361,6 +363,11 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>  	if (args->num_syncpts != 1)
>>  		return -EINVAL;
>>
>> +	/* Check for unrecognized flags */
>> +	if (args->flags & ~(DRM_TEGRA_SUBMIT_WAIT_FENCE_FD |
>> +	                    DRM_TEGRA_SUBMIT_CREATE_FENCE_FD))
>> +		return -EINVAL;
>> +
>>  	job = host1x_job_alloc(context->channel, args->num_cmdbufs,
>>  			       args->num_relocs, args->num_waitchks);
>>  	if (!job)
>> @@ -372,19 +379,27 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>  	job->class = context->client->base.class;
>>  	job->serialize = true;
>>
>> +	if (args->flags & DRM_TEGRA_SUBMIT_WAIT_FENCE_FD) {
>> +		job->prefence = sync_file_get_fence(args->fence);
>> +		if (!job->prefence) {
>> +			err = -ENOENT;
>> +			goto put_job;
>> +		}
>> +	}
>> +
>>  	while (num_cmdbufs) {
>>  		struct drm_tegra_cmdbuf cmdbuf;
>>  		struct host1x_bo *bo;
>>
>>  		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
>>  			err = -EFAULT;
>> -			goto fail;
>> +			goto put_fence;
>>  		}
>>
>>  		bo = host1x_bo_lookup(file, cmdbuf.handle);
>>  		if (!bo) {
>>  			err = -ENOENT;
>> -			goto fail;
>> +			goto put_fence;
>>  		}
>>
>>  		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
>> @@ -398,19 +413,19 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>  						  &relocs[num_relocs], drm,
>>  						  file);
>>  		if (err < 0)
>> -			goto fail;
>> +			goto put_fence;
>>  	}
>>
>>  	if (copy_from_user(job->waitchk, waitchks,
>>  			   sizeof(*waitchks) * num_waitchks)) {
>>  		err = -EFAULT;
>> -		goto fail;
>> +		goto put_fence;
>>  	}
>>
>>  	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
>>  			   sizeof(syncpt))) {
>>  		err = -EFAULT;
>> -		goto fail;
>> +		goto put_fence;
>>  	}
>>
>>  	job->is_addr_reg = context->client->ops->is_addr_reg;
>> @@ -423,20 +438,54 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>>
>>  	err = host1x_job_pin(job, context->client->base.dev);
>>  	if (err)
>> -		goto fail;
>> +		goto put_fence;
>>
>>  	err = host1x_job_submit(job);
>>  	if (err)
>> -		goto fail_submit;
>> +		goto unpin_job;
>
> Shouldn't all error-unwinding gotos after this jump to the unpin_job
> label as well? Seems like they all jump to put_fence instead, which I
> think would leave the job pinned on failure.

After host1x_job_submit is succesfully called, host1x's job tracking 
owns the job and will call unpin on it once it finishes or times out, so 
we cannot unpin it from here.

>
>>
>> -	args->fence = job->syncpt_end;
>> +	if (args->flags & DRM_TEGRA_SUBMIT_CREATE_FENCE_FD) {
>> +		struct dma_fence *fence;
>> +		struct sync_file *file;
>> +
>> +		fence = host1x_fence_create(
>> +			host1x, host1x_syncpt_get(host1x, job->syncpt_id),
>> +			job->syncpt_end);
>> +		if (!fence) {
>> +			err = -ENOMEM;
>> +			goto put_fence;
>> +		}
>> +
>> +		file = sync_file_create(fence);
>> +		if (!file) {
>> +			dma_fence_put(fence);
>> +			err = -ENOMEM;
>> +			goto put_fence;
>> +		}
>> +
>> +		err = get_unused_fd_flags(O_CLOEXEC);
>> +		if (err < 0) {
>> +			dma_fence_put(fence);
>> +			goto put_fence;
>> +		}
>> +
>> +		fd_install(err, file->file);
>> +		args->fence = err;
>> +	} else {
>> +		args->fence = job->syncpt_end;
>> +	}
>>
>> +	if (job->prefence)
>> +		dma_fence_put(job->prefence);
>>  	host1x_job_put(job);
>>  	return 0;
>>
>> -fail_submit:
>> +unpin_job:
>>  	host1x_job_unpin(job);
>> -fail:
>> +put_fence:
>> +	if (job->prefence)
>> +		dma_fence_put(job->prefence);
>
> Since we already have a conditional to check for usage of fence, I'm
> wondering if we can simplify this a little and leave out the put_fence
> label altogether, like so:
>
> 	unpin_job:
> 		host1x_job_unpin(job);
> 	put_job:
> 		if (job->prefence)
> 			dma_fence_put(job->prefence);
>
> 		host1x_job_put(job);

Yes, that seems like a good idea.

>
> Thierry
>

Cheers,
Mikko.
