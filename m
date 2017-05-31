From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 05/22] drm/tegra: Correct copying of waitchecks and
 disable them in the 'submit' IOCTL
Date: Wed, 31 May 2017 21:43:40 +0300
Message-ID: <9f21def6-a388-411c-9dcc-711abaf9f164@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <380fc14d114ac9abb15e447c90a4363913d34a52.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <380fc14d114ac9abb15e447c90a4363913d34a52.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
> The waitchecks along with multiple syncpoints per submit are not ready for
> use yet, let's forbid them for now.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/drm/tegra/drm.c | 60 ++++++++++++++++++++++++++++++++++++++++++---
>   drivers/gpu/host1x/job.h    |  7 ------
>   include/linux/host1x.h      |  7 ++++++
>   3 files changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 7e4559ec824d..eae0c1512ab0 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -349,6 +349,36 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
>   	return 0;
>   }
>   
> +static int host1x_waitchk_copy_from_user(struct host1x_waitchk *dest,
> +					 struct drm_tegra_waitchk __user *src,
> +					 struct drm_file *file)
> +{
> +	u32 cmdbuf;
> +	int err;
> +
> +	err = get_user(cmdbuf, &src->handle);
> +	if (err < 0)
> +		return err;
> +
> +	err = get_user(dest->offset, &src->offset);
> +	if (err < 0)
> +		return err;
> +
> +	err = get_user(dest->syncpt_id, &src->syncpt);
> +	if (err < 0)
> +		return err;
> +
> +	err = get_user(dest->thresh, &src->thresh);
> +	if (err < 0)
> +		return err;
> +
> +	dest->bo = host1x_bo_lookup(file, cmdbuf);
> +	if (!dest->bo)
> +		return -ENOENT;
> +
> +	return 0;
> +}
> +
>   int tegra_drm_submit(struct tegra_drm_context *context,
>   		     struct drm_tegra_submit *args, struct drm_device *drm,
>   		     struct drm_file *file)
> @@ -370,6 +400,10 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>   	if (args->num_syncpts != 1)
>   		return -EINVAL;
>   
> +	/* We don't yet support waitchks */
> +	if (args->num_waitchks != 0)
> +		return -EINVAL;
> +
>   	job = host1x_job_alloc(context->channel, args->num_cmdbufs,
>   			       args->num_relocs, args->num_waitchks);
>   	if (!job)
> @@ -457,10 +491,28 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>   		}
>   	}
>   
> -	if (copy_from_user(job->waitchk, waitchks,
> -			   sizeof(*waitchks) * num_waitchks)) {
> -		err = -EFAULT;
> -		goto fail;
> +	/* copy and resolve waitchks from submit */
> +	while (num_waitchks--) {
> +		struct host1x_waitchk *wait = &job->waitchk[num_waitchks];
> +		struct tegra_bo *obj;
> +
> +		err = host1x_waitchk_copy_from_user(wait,
> +						    &waitchks[num_waitchks],
> +						    file);
> +		if (err < 0)
> +			goto fail;
> +
> +		obj = host1x_to_tegra_bo(wait->bo);
> +
> +		/*
> +		 * The unaligned offset will cause an unaligned write during
> +		 * of the waitchks patching, corrupting the commands stream.
> +		 */
> +		if (wait->offset & 3 ||
> +		    wait->offset >= obj->gem.size) {
> +			err = -EINVAL;
> +			goto fail;
> +		}
>   	}
>   
>   	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
> diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
> index 878239c476d2..0debd93a1849 100644
> --- a/drivers/gpu/host1x/job.h
> +++ b/drivers/gpu/host1x/job.h
> @@ -34,13 +34,6 @@ struct host1x_cmdbuf {
>   	u32 pad;
>   };
>   
> -struct host1x_waitchk {
> -	struct host1x_bo *bo;
> -	u32 offset;
> -	u32 syncpt_id;
> -	u32 thresh;
> -};
> -
>   struct host1x_job_unpin_data {
>   	struct host1x_bo *bo;
>   	struct sg_table *sgt;
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 3d04aa1dc83e..aa323e43ae4e 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -177,6 +177,13 @@ struct host1x_reloc {
>   	unsigned long shift;
>   };
>   
> +struct host1x_waitchk {
> +	struct host1x_bo *bo;
> +	u32 offset;
> +	u32 syncpt_id;
> +	u32 thresh;
> +};
> +
>   struct host1x_job {
>   	/* When refcount goes to zero, job can be freed */
>   	struct kref ref;
> 
