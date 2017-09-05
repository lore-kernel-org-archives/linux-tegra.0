From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 6/6] drm/tegra: Use u64_to_user_ptr helper
Date: Tue, 5 Sep 2017 15:41:57 +0300
Message-ID: <915293bc-2651-ede0-96af-4006f9a89e65@gmail.com>
References: <20170905081029.19769-1-mperttunen@nvidia.com>
 <20170905081029.19769-7-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905081029.19769-7-mperttunen@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05.09.2017 11:10, Mikko Perttunen wrote:
> Use the u64_to_user_ptr helper macro to cast IOCTL argument u64 values
> to user pointers instead of writing out the cast manually.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---

This patch doesn't apply to linux-next, you should probably rebase this series.

>  drivers/gpu/drm/tegra/drm.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index e3331a2bc082..72d5c0021540 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -388,18 +388,21 @@ int tegra_drm_submit(struct tegra_drm_context *context,
>  	unsigned int num_cmdbufs = args->num_cmdbufs;
>  	unsigned int num_relocs = args->num_relocs;
>  	unsigned int num_waitchks = args->num_waitchks;
> -	struct drm_tegra_cmdbuf __user *cmdbufs =
> -		(void __user *)(uintptr_t)args->cmdbufs;
> -	struct drm_tegra_reloc __user *relocs =
> -		(void __user *)(uintptr_t)args->relocs;
> -	struct drm_tegra_waitchk __user *waitchks =
> -		(void __user *)(uintptr_t)args->waitchks;
> +	struct drm_tegra_cmdbuf __user *cmdbufs;
> +	struct drm_tegra_reloc __user *relocs;
> +	struct drm_tegra_waitchk __user *waitchks;
> +	struct drm_tegra_syncpt __user *user_syncpt;
>  	struct drm_tegra_syncpt syncpt;
>  	struct host1x *host1x = dev_get_drvdata(drm->dev->parent);
>  	struct host1x_syncpt *sp;
>  	struct host1x_job *job;
>  	int err;
>  
> +	cmdbufs = u64_to_user_ptr(args->cmdbufs);
> +	relocs = u64_to_user_ptr(args->relocs);
> +	waitchks = u64_to_user_ptr(args->waitchks);

What about to prefix these variables with 'user_' for consistency?

> +	user_syncpt = u64_to_user_ptr(args->syncpts);
> +
>  	/* We don't yet support other than one syncpt_incr struct per submit */
>  	if (args->num_syncpts != 1)
>  		return -EINVAL;
> @@ -520,8 +523,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
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


-- 
Dmitry
