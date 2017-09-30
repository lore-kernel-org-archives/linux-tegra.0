From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/6] drm/tegra: Use u64_to_user_ptr helper
Date: Sat, 30 Sep 2017 05:44:46 +0300
Message-ID: <23bcc5c9-3706-1200-51c9-a48934254343@gmail.com>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
 <20170928125044.32516-7-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928125044.32516-7-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 15:50, Mikko Perttunen wrote:
> Use the u64_to_user_ptr helper macro to cast IOCTL argument u64 values
> to user pointers instead of writing out the cast manually. Also do
> some other cleanup with user pointers to make them stand out more
> and look cleaner.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>  drivers/gpu/drm/tegra/drm.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 130d193192ee..943bdf88c4a2 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -386,12 +386,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	unsigned int num_cmdbufs = args->num_cmdbufs;
>  	unsigned int num_relocs = args->num_relocs;
>  	unsigned int num_waitchks = args->num_waitchks;
> -	struct drm_tegra_cmdbuf __user *cmdbufs =
> -		(void __user *)(uintptr_t)args->cmdbufs;
> -	struct drm_tegra_reloc __user *relocs =
> -		(void __user *)(uintptr_t)args->relocs;
> -	struct drm_tegra_waitchk __user *waitchks =
> -		(void __user *)(uintptr_t)args->waitchks;
> +	struct drm_tegra_cmdbuf __user *user_cmdbufs;
> +	struct drm_tegra_reloc __user *user_relocs;
> +	struct drm_tegra_waitchk __user *user_waitchks;
> +	struct drm_tegra_syncpt __user *user_syncpt;
>  	struct drm_tegra_syncpt syncpt;
>  	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>  	struct drm_gem_object **refs;
> @@ -400,6 +398,11 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	unsigned int num_refs;
>  	int err;
>  
> +	user_cmdbufs = u64_to_user_ptr(args->cmdbufs);
> +	user_relocs = u64_to_user_ptr(args->relocs);
> +	user_waitchks = u64_to_user_ptr(args->waitchks);
> +	user_syncpt = u64_to_user_ptr(args->syncpts);
> +
>  	/* We don't yet support other than one syncpt_incr struct per submit */
>  	if (args->num_syncpts != 1)
>  		return -EINVAL;
> @@ -440,7 +443,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		struct tegra_bo *obj;
>  		u64 offset;
>  
> -		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
> +		if (copy_from_user(&cmdbuf, user_cmdbufs, sizeof(cmdbuf))) {
>  			err = -EFAULT;
>  			goto fail;
>  		}
> @@ -476,7 +479,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  
>  		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
>  		num_cmdbufs--;
> -		cmdbufs++;
> +		user_cmdbufs++;
>  	}
>  
>  	/* copy and resolve relocations from submit */
> @@ -485,7 +488,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		struct tegra_bo *obj;
>  
>  		err = host1x_reloc_copy_from_user(&job->relocarray[num_relocs],
> -						  &relocs[num_relocs], drm,
> +						  &user_relocs[num_relocs], drm,
>  						  file);
>  		if (err < 0)
>  			goto fail;
> @@ -519,9 +522,8 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		struct host1x_waitchk *wait = &job->waitchk[num_waitchks];
>  		struct tegra_bo *obj;
>  
> -		err = host1x_waitchk_copy_from_user(wait,
> -						    &waitchks[num_waitchks],
> -						    file);
> +		err = host1x_waitchk_copy_from_user(
> +			wait, &user_waitchks[num_waitchks], file);
>  		if (err < 0)
>  			goto fail;
>  
> @@ -539,8 +541,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  		}
>  	}
>  
> -	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
> -			   sizeof(syncpt))) {
> +	if (copy_from_user(&syncpt, user_syncpt, sizeof(syncpt))) {
>  		err = -EFAULT;
>  		goto fail;
>  	}
> 
