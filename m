From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/6] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 30 Sep 2017 05:41:44 +0300
Message-ID: <8391dc88-36a1-0b3c-9ffa-42ce0238dc3f@gmail.com>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
 <20170928125044.32516-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928125044.32516-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 15:50, Mikko Perttunen wrote:
> Since Tegra186 the Host1x hardware allows syncpoints to be assigned to
> specific channels, preventing any other channels from incrementing
> them.
> 
> Enable this feature where available and assign syncpoints to channels
> when submitting a job. Syncpoints are currently never unassigned from
> channels since that would require extra work and is unnecessary with
> the current channel allocation model.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Only one minor comment below.

>  drivers/gpu/host1x/dev.h           | 15 +++++++++++++
>  drivers/gpu/host1x/hw/channel_hw.c |  3 +++
>  drivers/gpu/host1x/hw/syncpt_hw.c  | 46 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/host1x/syncpt.c        |  8 +++++++
>  4 files changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index def802c0a6bf..502769726480 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -79,6 +79,9 @@ struct host1x_syncpt_ops {
>  	u32 (*load)(struct host1x_syncpt *syncpt);
>  	int (*cpu_incr)(struct host1x_syncpt *syncpt);
>  	int (*patch_wait)(struct host1x_syncpt *syncpt, void *patch_addr);
> +	void (*assign_to_channel)(struct host1x_syncpt *syncpt,
> +	                          struct host1x_channel *channel);
> +	void (*enable_protection)(struct host1x *host);
>  };
>  
>  struct host1x_intr_ops {
> @@ -186,6 +189,18 @@ static inline int host1x_hw_syncpt_patch_wait(struct host1x *host,
>  	return host->syncpt_op->patch_wait(sp, patch_addr);
>  }
>  
> +static inline void host1x_hw_syncpt_assign_to_channel(
> +	struct host1x *host, struct host1x_syncpt *sp,
> +	struct host1x_channel *ch)
> +{
> +	return host->syncpt_op->assign_to_channel(sp, ch);
> +}
> +
> +static inline void host1x_hw_syncpt_enable_protection(struct host1x *host)
> +{
> +	return host->syncpt_op->enable_protection(host);
> +}
> +
>  static inline int host1x_hw_intr_init_host_sync(struct host1x *host, u32 cpm,
>  			void (*syncpt_thresh_work)(struct work_struct *))
>  {
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 8447a56c41ca..b929d7f1e291 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -147,6 +147,9 @@ static int channel_submit(struct host1x_job *job)
>  
>  	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
>  
> +	/* assign syncpoint to channel */
> +	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
> +

Since you've preserved the comment, what about to extend it with a brief
explanation of what actually the 'assignment' does? Like that CDMA will stop
execution on touching any syncpoint other then the assigned one.

>  	job->syncpt_end = syncval;
>  
>  	/* add a setclass for modules that require it */
> diff --git a/drivers/gpu/host1x/hw/syncpt_hw.c b/drivers/gpu/host1x/hw/syncpt_hw.c
> index 7b0270d60742..7dfd47d74f89 100644
> --- a/drivers/gpu/host1x/hw/syncpt_hw.c
> +++ b/drivers/gpu/host1x/hw/syncpt_hw.c
> @@ -106,6 +106,50 @@ static int syncpt_patch_wait(struct host1x_syncpt *sp, void *patch_addr)
>  	return 0;
>  }
>  
> +/**
> + * syncpt_assign_to_channel() - Assign syncpoint to channel
> + * @sp: syncpoint
> + * @ch: channel
> + *
> + * On chips with the syncpoint protection feature (Tegra186+), assign @sp to
> + * @ch, preventing other channels from incrementing the syncpoints. If @ch is
> + * NULL, unassigns the syncpoint.
> + *
> + * On older chips, do nothing.
> + */
> +static void syncpt_assign_to_channel(struct host1x_syncpt *sp,
> +				  struct host1x_channel *ch)
> +{
> +#if HOST1X_HW >= 6
> +	struct host1x *host = sp->host;
> +
> +	if (!host->hv_regs)
> +		return;
> +
> +	host1x_sync_writel(host,
> +			   HOST1X_SYNC_SYNCPT_CH_APP_CH(ch ? ch->id : 0xff),
> +			   HOST1X_SYNC_SYNCPT_CH_APP(sp->id));
> +#endif
> +}
> +
> +/**
> + * syncpt_enable_protection() - Enable syncpoint protection
> + * @host: host1x instance
> + *
> + * On chips with the syncpoint protection feature (Tegra186+), enable this
> + * feature. On older chips, do nothing.
> + */
> +static void syncpt_enable_protection(struct host1x *host)
> +{
> +#if HOST1X_HW >= 6
> +	if (!host->hv_regs)
> +		return;
> +
> +	host1x_hypervisor_writel(host, HOST1X_HV_SYNCPT_PROT_EN_CH_EN,
> +				 HOST1X_HV_SYNCPT_PROT_EN);
> +#endif
> +}
> +
>  static const struct host1x_syncpt_ops host1x_syncpt_ops = {
>  	.restore = syncpt_restore,
>  	.restore_wait_base = syncpt_restore_wait_base,
> @@ -113,4 +157,6 @@ static const struct host1x_syncpt_ops host1x_syncpt_ops = {
>  	.load = syncpt_load,
>  	.cpu_incr = syncpt_cpu_incr,
>  	.patch_wait = syncpt_patch_wait,
> +	.assign_to_channel = syncpt_assign_to_channel,
> +	.enable_protection = syncpt_enable_protection,
>  };
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 048ac9e344ce..bce7cd6db724 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -398,6 +398,13 @@ int host1x_syncpt_init(struct host1x *host)
>  	for (i = 0; i < host->info->nb_pts; i++) {
>  		syncpt[i].id = i;
>  		syncpt[i].host = host;
> +
> +		/*
> +		 * Unassign syncpt from channels for purposes of Tegra186
> +		 * syncpoint protection. This prevents any channel from
> +		 * accessing it until it is reassigned.
> +		 */
> +		host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
>  	}
>  
>  	for (i = 0; i < host->info->nb_bases; i++)
> @@ -408,6 +415,7 @@ int host1x_syncpt_init(struct host1x *host)
>  	host->bases = bases;
>  
>  	host1x_syncpt_restore(host);
> +	host1x_hw_syncpt_enable_protection(host);
>  
>  	/* Allocate sync point to use for clearing waits for expired fences */
>  	host->nop_sp = host1x_syncpt_alloc(host, NULL, 0);
> 
