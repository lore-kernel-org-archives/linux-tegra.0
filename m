From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Prevent BOs from being freed during job
 submission
Date: Sat, 12 Aug 2017 19:01:17 +0300
Message-ID: <301e6612-de3e-93eb-5805-8d4b551d71f5@gmail.com>
References: <20170811175926.24317-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170811175926.24317-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.08.2017 20:59, Thierry Reding wrote:
> From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Since DRM IOCTL's are lockless, there is a chance that BOs could be
> released while a job submission is in progress. To avoid that, keep the
> GEM reference until the job has been pinned, part of which will be to
> take another reference.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 42 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index f01db33fa20f..e5d19e1c9bc8 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -320,8 +320,6 @@ host1x_bo_lookup(struct drm_file *file, u32 handle)
>  	if (!gem)
>  		return NULL;
>  
> -	drm_gem_object_unreference_unlocked(gem);
> -
>  	bo = to_tegra_bo(gem);
>  	return &bo->base;
>  }
> @@ -410,8 +408,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		(void __user *)(uintptr_t)args->waitchks;
>  	struct drm_tegra_syncpt syncpt;
>  	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
> +	struct drm_gem_object **refs;

Should be "**refs = NULL" in conjunction with a missed kfree() below.

>  	struct host1x_syncpt *sp;
>  	struct host1x_job *job;
> +	unsigned int num_refs;
>  	int err;
>  
>  	/* We don't yet support other than one syncpt_incr struct per submit */
> @@ -433,6 +433,26 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	job->class = context->client->base.class;
>  	job->serialize = true;
>  
> +	/*
> +	 * Track referenced BOs so that they can be unreferenced after the
> +	 * submission is complete.
> +	 */
> +	num_refs = num_cmdbufs + num_relocs * 2 + num_waitchks;
> +
> +	if (sizeof(*refs) * num_refs > ULONG_MAX) {
> +		err = -EINVAL;
> +		goto fail;
> +	}
> +
> +	refs = kmalloc_array(num_refs, sizeof(*refs), GFP_KERNEL);
> +	if (!refs) {
> +		err = -ENOMEM;
> +		goto fail;
> +	}
> +
> +	/* reuse as an iterator later */
> +	num_refs = 0;
> +
>  	while (num_cmdbufs) {
>  		struct drm_tegra_cmdbuf cmdbuf;
>  		struct host1x_bo *bo;
> @@ -461,6 +481,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  
>  		offset = (u64)cmdbuf.offset + (u64)cmdbuf.words * sizeof(u32);
>  		obj = host1x_to_tegra_bo(bo);
> +		refs[num_refs++] = &obj->gem;
>  
>  		/*
>  		 * Gather buffer base address must be 4-bytes aligned,
> @@ -490,6 +511,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  
>  		reloc = &job->relocarray[num_relocs];
>  		obj = host1x_to_tegra_bo(reloc->cmdbuf.bo);
> +		refs[num_refs++] = &obj->gem;
>  
>  		/*
>  		 * The unaligned cmdbuf offset will cause an unaligned write
> @@ -503,6 +525,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		}
>  
>  		obj = host1x_to_tegra_bo(reloc->target.bo);
> +		refs[num_refs++] = &obj->gem;
>  
>  		if (reloc->target.offset >= obj->gem.size) {
>  			err = -EINVAL;
> @@ -522,6 +545,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  			goto fail;
>  
>  		obj = host1x_to_tegra_bo(wait->bo);
> +		refs[num_refs++] = &obj->gem;
>  
>  		/*
>  		 * The unaligned offset will cause an unaligned write during
> @@ -561,17 +585,17 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		goto fail;
>  
>  	err = host1x_job_submit(job);
> -	if (err)
> -		goto fail_submit;
> +	if (err) {
> +		host1x_job_unpin(job);
> +		goto fail;
> +	}
>  
>  	args->fence = job->syncpt_end;
>  
> -	host1x_job_put(job);
> -	return 0;
> -
> -fail_submit:
> -	host1x_job_unpin(job);
>  fail:
> +	while (num_refs--)
> +		drm_gem_object_put_unlocked(refs[num_refs]);
> +

kfree(refs) is missed here.

>  	host1x_job_put(job);
>  	return err;
>  }
> 


-- 
Dmitry
