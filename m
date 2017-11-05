From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] gpu: host1x: Lock classes during job submission
Date: Sun, 5 Nov 2017 19:46:29 +0300
Message-ID: <97ce4873-fdc1-5197-17bc-74505beadfc4@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-5-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171105110118.15142-5-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.11.2017 14:01, Mikko Perttunen wrote:
> Host1x has a feature called MLOCKs which allow a certain class
> (~HW unit) to be locked (in the mutex sense) and unlocked during
> command execution, preventing other channels from accessing the
> class while it is locked. This is necessary to prevent concurrent
> jobs from messing up class state.
> 
> This has not been necessary so far since due to our channel allocation
> model, there has only been a single hardware channel submitting
> commands to each class. Future patches, however, change the channel
> allocation model to allow hardware-scheduled concurrency, and as such
> we need to start locking.
> 
> This patch implements locking on all platforms from Tegra20 to
> Tegra186.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/cdma.c                      |   1 +
>  drivers/gpu/host1x/cdma.h                      |   1 +
>  drivers/gpu/host1x/hw/cdma_hw.c                | 122 +++++++++++++++++++++++++
>  drivers/gpu/host1x/hw/channel_hw.c             |  71 ++++++++++----
>  drivers/gpu/host1x/hw/host1x01_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x02_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x04_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x05_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/host1x06_hardware.h      |  10 ++
>  drivers/gpu/host1x/hw/hw_host1x01_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x02_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x04_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x05_sync.h       |   6 ++
>  drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h |   5 +
>  14 files changed, 257 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index 28541b280739..f787cfe69c11 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -232,6 +232,7 @@ static void cdma_start_timer_locked(struct host1x_cdma *cdma,
>  	}
>  
>  	cdma->timeout.client = job->client;
> +	cdma->timeout.class = job->class;
>  	cdma->timeout.syncpt = host1x_syncpt_get(host, job->syncpt_id);
>  	cdma->timeout.syncpt_val = job->syncpt_end;
>  	cdma->timeout.start_ktime = ktime_get();
> diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
> index 286d49386be9..e72660fc83c9 100644
> --- a/drivers/gpu/host1x/cdma.h
> +++ b/drivers/gpu/host1x/cdma.h
> @@ -59,6 +59,7 @@ struct buffer_timeout {
>  	ktime_t start_ktime;		/* starting time */
>  	/* context timeout information */
>  	int client;
> +	u32 class;
>  };
>  
>  enum cdma_event {
> diff --git a/drivers/gpu/host1x/hw/cdma_hw.c b/drivers/gpu/host1x/hw/cdma_hw.c
> index ce320534cbed..4d5970d863d5 100644
> --- a/drivers/gpu/host1x/hw/cdma_hw.c
> +++ b/drivers/gpu/host1x/hw/cdma_hw.c
> @@ -16,6 +16,7 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/iopoll.h>
>  #include <linux/slab.h>
>  #include <linux/scatterlist.h>
>  #include <linux/dma-mapping.h>
> @@ -243,6 +244,125 @@ static void cdma_resume(struct host1x_cdma *cdma, u32 getptr)
>  	cdma_timeout_restart(cdma, getptr);
>  }
>  
> +static int mlock_id_for_class(unsigned int class)
> +{
> +#if HOST1X_HW >= 6
> +	switch (class)
> +	{
> +	case HOST1X_CLASS_HOST1X:
> +		return 0;
> +	case HOST1X_CLASS_VIC:
> +		return 17;

What is the meaning of returned ID values that you have defined here? Why VIC
should have different ID on T186?

> +	default:
> +		return -EINVAL;
> +	}
> +#else
> +	switch (class)
> +	{
> +	case HOST1X_CLASS_HOST1X:
> +		return 0;
> +	case HOST1X_CLASS_GR2D:
> +		return 1;
> +	case HOST1X_CLASS_GR2D_SB:
> +		return 2;

Note that we are allowing to switch 2d classes in the same jobs context and
currently jobs class is somewhat hardcoded to GR2D.

Even though that GR2D and GR2D_SB use different register banks, is it okay to
trigger execution of different classes simultaneously? Would syncpoint
differentiate classes on OP_DONE event?

I suppose that MLOCK (the module lock) implies the whole module locking,
wouldn't it make sense to just use the module ID's defined in the TRM?

> +	case HOST1X_CLASS_VIC:
> +		return 3;
> +	case HOST1X_CLASS_GR3D:
> +		return 4;
> +	default:
> +		return -EINVAL;
> +	}
> +#endif
> +}
> +
> +static void timeout_release_mlock(struct host1x_cdma *cdma)
> +{
> +#if HOST1X_HW >= 6
> +	struct host1x_channel *ch = cdma_to_channel(cdma);
> +	struct host1x *host = cdma_to_host1x(cdma);
> +	u32 pb_pos, pb_temp[3], val;
> +	int err, mlock_id;
> +
> +	if (!host->hv_regs)
> +		return;
> +
> +	mlock_id = mlock_id_for_class(cdma->timeout.class);
> +	if (WARN(mlock_id < 0, "Invalid class ID"))
> +		return;
> +
> +	val = host1x_hypervisor_readl(host, HOST1X_HV_MLOCK(mlock_id));
> +	if (!HOST1X_HV_MLOCK_LOCKED_V(val) ||
> +	    HOST1X_HV_MLOCK_CH_V(val) != ch->id)
> +	{
> +		/* Channel is not holding the MLOCK, nothing to release. */
> +		return;
> +	}
> +
> +	/*
> +	 * On Tegra186, there is no register to unlock an MLOCK (don't ask me
> +	 * why). As such, we have to execute a release_mlock instruction to
> +	 * do it. We do this by backing up the first three opcodes of the
> +	 * pushbuffer and replacing them with our own short sequence to do
> +	 * the unlocking. We set the .pos field to 12, which causes DMAEND
> +	 * to be set accordingly such that only the three opcodes we set
> +	 * here are executed before CDMA stops. Finally we restore the value
> +	 * of pos and pushbuffer contents.
> +	 */
> +
> +	pb_pos = cdma->push_buffer.pos;
> +	memcpy(pb_temp, cdma->push_buffer.mapped, ARRAY_SIZE(pb_temp) * 4);
> +
> +	{
> +		u32 *pb = cdma->push_buffer.mapped;
> +		pb[0] = host1x_opcode_acquire_mlock(cdma->timeout.class);
> +		pb[1] = host1x_opcode_setclass(cdma->timeout.class, 0, 0);
> +		pb[2] = host1x_opcode_release_mlock(cdma->timeout.class);
> +	}
> +
> +	/* Flush writecombine buffer */
> +	wmb();
> +
> +	cdma->push_buffer.pos = ARRAY_SIZE(pb_temp) * 4;
> +
> +	cdma_resume(cdma, 0);
> +
> +	/* Wait until the release_mlock opcode has been executed */
> +	err = readl_relaxed_poll_timeout(
> +		host->hv_regs + HOST1X_HV_MLOCK(mlock_id), val,
> +		!HOST1X_HV_MLOCK_LOCKED_V(val) ||
> +			HOST1X_HV_MLOCK_CH_V(val) != ch->id,
> +		10, 10000);
> +	WARN(err, "Failed to unlock mlock %u\n", mlock_id);
> +
> +	cdma_freeze(cdma);
> +
> +	/* Restore original pushbuffer state */
> +	cdma->push_buffer.pos = pb_pos;
> +	memcpy(cdma->push_buffer.mapped, pb_temp, ARRAY_SIZE(pb_temp) * 4);
> +	wmb();
> +#else
> +	struct host1x_channel *ch = cdma_to_channel(cdma);
> +	struct host1x *host = cdma_to_host1x(cdma);
> +	int mlock_id;
> +	u32 val;
> +
> +	mlock_id = mlock_id_for_class(cdma->timeout.class);
> +	if (WARN(mlock_id < 0, "Invalid class ID"))
> +		return;
> +
> +	val = host1x_sync_readl(host, HOST1X_SYNC_MLOCK_OWNER(mlock_id));
> +	if (!HOST1X_SYNC_MLOCK_OWNER_CH_OWNS_V(val) ||
> +	    HOST1X_SYNC_MLOCK_OWNER_CHID_V(val) != ch->id)
> +	{
> +		/* Channel is not holding the MLOCK, nothing to release. */
> +		return;
> +	}
> +
> +	/* Unlock MLOCK */
> +	host1x_sync_writel(host, 0x0, HOST1X_SYNC_MLOCK(mlock_id));
> +#endif
> +}
> +
>  /*
>   * If this timeout fires, it indicates the current sync_queue entry has
>   * exceeded its TTL and the userctx should be timed out and remaining
> @@ -293,6 +413,8 @@ static void cdma_timeout_handler(struct work_struct *work)
>  	/* stop HW, resetting channel/module */
>  	host1x_hw_cdma_freeze(host1x, cdma);
>  
> +	timeout_release_mlock(cdma);
> +
>  	host1x_cdma_update_sync_queue(cdma, ch->dev);
>  	mutex_unlock(&cdma->lock);
>  }
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 246b78c41281..f80fb8be38e6 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -89,6 +89,34 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
>  			 HOST1X_UCLASS_LOAD_SYNCPT_BASE_VALUE_F(value));
>  }
>  
> +static void channel_submit_serialize(struct host1x_channel *ch,
> +				     struct host1x_syncpt *sp)
> +{
> +#if HOST1X_HW >= 6
> +	/*
> +	 * On T186, due to a hw issue, we need to issue an mlock acquire
> +	 * for HOST1X class. It is still interpreted as a no-op in
> +	 * hardware.
> +	 */
> +	host1x_cdma_push(&ch->cdma,
> +		host1x_opcode_acquire_mlock(HOST1X_CLASS_HOST1X),
> +		host1x_opcode_setclass(HOST1X_CLASS_HOST1X, 0, 0));
> +	host1x_cdma_push(&ch->cdma,
> +		host1x_opcode_nonincr(host1x_uclass_wait_syncpt_r(), 1),
> +		host1x_class_host_wait_syncpt(host1x_syncpt_id(sp),
> +					      host1x_syncpt_read_max(sp)));
> +	host1x_cdma_push(&ch->cdma,
> +		host1x_opcode_release_mlock(HOST1X_CLASS_HOST1X),
> +		HOST1X_OPCODE_NOP);
> +#else
> +	host1x_cdma_push(&ch->cdma,
> +		host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
> +				       host1x_uclass_wait_syncpt_r(), 1),
> +		host1x_class_host_wait_syncpt(host1x_syncpt_id(sp),
> +					      host1x_syncpt_read_max(sp)));
> +#endif
> +}
> +
>  static int channel_submit(struct host1x_job *job)
>  {
>  	struct host1x_channel *ch = job->channel;
> @@ -96,6 +124,7 @@ static int channel_submit(struct host1x_job *job)
>  	u32 user_syncpt_incrs = job->syncpt_incrs;
>  	u32 prev_max = 0;
>  	u32 syncval;
> +	u32 mlock;
>  	int err;
>  	struct host1x_waitlist *completed_waiter = NULL;
>  	struct host1x *host = dev_get_drvdata(ch->dev->parent);
> @@ -128,17 +157,12 @@ static int channel_submit(struct host1x_job *job)
>  		goto error;
>  	}
>  
> -	if (job->serialize) {
> -		/*
> -		 * Force serialization by inserting a host wait for the
> -		 * previous job to finish before this one can commence.
> -		 */
> -		host1x_cdma_push(&ch->cdma,
> -				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
> -					host1x_uclass_wait_syncpt_r(), 1),
> -				 host1x_class_host_wait_syncpt(job->syncpt_id,
> -					host1x_syncpt_read_max(sp)));
> -	}
> +	/*
> +	 * Force serialization by inserting a host wait for the
> +	 * previous job to finish before this one can commence.
> +	 */
> +	if (job->serialize)
> +		channel_submit_serialize(ch, sp);
>  
>  	/* Synchronize base register to allow using it for relative waiting */
>  	if (sp->base)
> @@ -149,16 +173,29 @@ static int channel_submit(struct host1x_job *job)
>  	/* assign syncpoint to channel */
>  	host1x_hw_syncpt_assign_channel(host, sp, ch);
>  
> -	job->syncpt_end = syncval;
> -
> -	/* add a setclass for modules that require it */
> -	if (job->class)
> +	/* acquire MLOCK and set channel class to specified class */
> +	mlock = HOST1X_HW >= 6 ? job->class : mlock_id_for_class(job->class);
> +	if (job->class) {
>  		host1x_cdma_push(&ch->cdma,
> -				 host1x_opcode_setclass(job->class, 0, 0),
> -				 HOST1X_OPCODE_NOP);
> +				 host1x_opcode_acquire_mlock(mlock),
> +				 host1x_opcode_setclass(job->class, 0, 0));
> +	}
>  
>  	submit_gathers(job);
>  
> +	if (job->class) {
> +		/*
> +		 * Push additional increment to catch jobs that crash before
> +		 * finishing their gather, not reaching the unlock opcode.
> +		 */
> +		syncval = host1x_syncpt_incr_max(sp, 1);
> +		host1x_cdma_push(&ch->cdma,
> +			host1x_opcode_imm_incr_syncpt(0, job->syncpt_id),
> +			host1x_opcode_release_mlock(mlock));
> +	}
> +
> +	job->syncpt_end = syncval;
> +
>  	/* end CDMA submit & stash pinned hMems into sync queue */
>  	host1x_cdma_end(&ch->cdma, job);
>  
> diff --git a/drivers/gpu/host1x/hw/host1x01_hardware.h b/drivers/gpu/host1x/hw/host1x01_hardware.h
> index 5f0fb866efa8..6a2c9f905acc 100644
> --- a/drivers/gpu/host1x/hw/host1x01_hardware.h
> +++ b/drivers/gpu/host1x/hw/host1x01_hardware.h
> @@ -138,6 +138,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
>  	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
>  }
>  
> +static inline u32 host1x_opcode_acquire_mlock(unsigned id)
> +{
> +	return (14 << 28) | id;
> +}
> +
> +static inline u32 host1x_opcode_release_mlock(unsigned id)
> +{
> +	return (14 << 28) | (1 << 24) | id;
> +}
> +
>  #define HOST1X_OPCODE_NOP host1x_opcode_nonincr(0, 0)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/host1x02_hardware.h b/drivers/gpu/host1x/hw/host1x02_hardware.h
> index 154901860bc6..c524c6c8d82f 100644
> --- a/drivers/gpu/host1x/hw/host1x02_hardware.h
> +++ b/drivers/gpu/host1x/hw/host1x02_hardware.h
> @@ -137,6 +137,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
>  	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
>  }
>  
> +static inline u32 host1x_opcode_acquire_mlock(unsigned id)
> +{
> +	return (14 << 28) | id;
> +}
> +
> +static inline u32 host1x_opcode_release_mlock(unsigned id)
> +{
> +	return (14 << 28) | (1 << 24) | id;
> +}
> +
>  #define HOST1X_OPCODE_NOP host1x_opcode_nonincr(0, 0)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/host1x04_hardware.h b/drivers/gpu/host1x/hw/host1x04_hardware.h
> index de1a38175328..8dedd77b7a1b 100644
> --- a/drivers/gpu/host1x/hw/host1x04_hardware.h
> +++ b/drivers/gpu/host1x/hw/host1x04_hardware.h
> @@ -137,6 +137,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
>  	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
>  }
>  
> +static inline u32 host1x_opcode_acquire_mlock(unsigned id)
> +{
> +	return (14 << 28) | id;
> +}
> +
> +static inline u32 host1x_opcode_release_mlock(unsigned id)
> +{
> +	return (14 << 28) | (1 << 24) | id;
> +}
> +
>  #define HOST1X_OPCODE_NOP host1x_opcode_nonincr(0, 0)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/host1x05_hardware.h b/drivers/gpu/host1x/hw/host1x05_hardware.h
> index 2937ebb6be11..6aafcb5e97e6 100644
> --- a/drivers/gpu/host1x/hw/host1x05_hardware.h
> +++ b/drivers/gpu/host1x/hw/host1x05_hardware.h
> @@ -137,6 +137,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
>  	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
>  }
>  
> +static inline u32 host1x_opcode_acquire_mlock(unsigned id)
> +{
> +	return (14 << 28) | id;
> +}
> +
> +static inline u32 host1x_opcode_release_mlock(unsigned id)
> +{
> +	return (14 << 28) | (1 << 24) | id;
> +}
> +
>  #define HOST1X_OPCODE_NOP host1x_opcode_nonincr(0, 0)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/host1x06_hardware.h b/drivers/gpu/host1x/hw/host1x06_hardware.h
> index 3039c92ea605..60147d26ad9b 100644
> --- a/drivers/gpu/host1x/hw/host1x06_hardware.h
> +++ b/drivers/gpu/host1x/hw/host1x06_hardware.h
> @@ -137,6 +137,16 @@ static inline u32 host1x_opcode_gather_incr(unsigned offset, unsigned count)
>  	return (6 << 28) | (offset << 16) | BIT(15) | BIT(14) | count;
>  }
>  
> +static inline u32 host1x_opcode_acquire_mlock(unsigned id)
> +{
> +	return (14 << 28) | id;
> +}
> +
> +static inline u32 host1x_opcode_release_mlock(unsigned id)
> +{
> +	return (14 << 28) | (1 << 24) | id;
> +}
> +
>  #define HOST1X_OPCODE_NOP host1x_opcode_nonincr(0, 0)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/hw_host1x01_sync.h b/drivers/gpu/host1x/hw/hw_host1x01_sync.h
> index 31238c285d46..4630fec2237a 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x01_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x01_sync.h
> @@ -125,6 +125,12 @@ static inline u32 host1x_sync_ip_busy_timeout_r(void)
>  }
>  #define HOST1X_SYNC_IP_BUSY_TIMEOUT \
>  	host1x_sync_ip_busy_timeout_r()
> +static inline u32 host1x_sync_mlock_r(unsigned int id)
> +{
> +	return 0x2c0 + id * REGISTER_STRIDE;
> +}
> +#define HOST1X_SYNC_MLOCK(id) \
> +	host1x_sync_mlock_r(id)
>  static inline u32 host1x_sync_mlock_owner_r(unsigned int id)
>  {
>  	return 0x340 + id * REGISTER_STRIDE;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x02_sync.h b/drivers/gpu/host1x/hw/hw_host1x02_sync.h
> index 540c7b65995f..dec8e812a114 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x02_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x02_sync.h
> @@ -125,6 +125,12 @@ static inline u32 host1x_sync_ip_busy_timeout_r(void)
>  }
>  #define HOST1X_SYNC_IP_BUSY_TIMEOUT \
>  	host1x_sync_ip_busy_timeout_r()
> +static inline u32 host1x_sync_mlock_r(unsigned int id)
> +{
> +	return 0x2c0 + id * REGISTER_STRIDE;
> +}
> +#define HOST1X_SYNC_MLOCK(id) \
> +	host1x_sync_mlock_r(id)
>  static inline u32 host1x_sync_mlock_owner_r(unsigned int id)
>  {
>  	return 0x340 + id * REGISTER_STRIDE;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x04_sync.h b/drivers/gpu/host1x/hw/hw_host1x04_sync.h
> index 3d6c8ec65934..9a951a4db07f 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x04_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x04_sync.h
> @@ -125,6 +125,12 @@ static inline u32 host1x_sync_ip_busy_timeout_r(void)
>  }
>  #define HOST1X_SYNC_IP_BUSY_TIMEOUT \
>  	host1x_sync_ip_busy_timeout_r()
> +static inline u32 host1x_sync_mlock_r(unsigned int id)
> +{
> +	return 0x2c0 + id * REGISTER_STRIDE;
> +}
> +#define HOST1X_SYNC_MLOCK(id) \
> +	host1x_sync_mlock_r(id)
>  static inline u32 host1x_sync_mlock_owner_r(unsigned int id)
>  {
>  	return 0x340 + id * REGISTER_STRIDE;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x05_sync.h b/drivers/gpu/host1x/hw/hw_host1x05_sync.h
> index ca10eee5045c..e29e2e19a60b 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x05_sync.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x05_sync.h
> @@ -125,6 +125,12 @@ static inline u32 host1x_sync_ip_busy_timeout_r(void)
>  }
>  #define HOST1X_SYNC_IP_BUSY_TIMEOUT \
>  	host1x_sync_ip_busy_timeout_r()
> +static inline u32 host1x_sync_mlock_r(unsigned int id)
> +{
> +	return 0x2c0 + id * REGISTER_STRIDE;
> +}
> +#define HOST1X_SYNC_MLOCK(id) \
> +	host1x_sync_mlock_r(id)
>  static inline u32 host1x_sync_mlock_owner_r(unsigned int id)
>  {
>  	return 0x340 + id * REGISTER_STRIDE;
> diff --git a/drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h b/drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h
> index c05dab8a178b..be73530c3585 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h
> @@ -18,6 +18,11 @@
>  #define HOST1X_HV_SYNCPT_PROT_EN			0x1ac4
>  #define HOST1X_HV_SYNCPT_PROT_EN_CH_EN			BIT(1)
>  #define HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(x)		(0x2020 + (x * 4))
> +#define HOST1X_HV_MLOCK(x)				(0x2030 + (x * 4))
> +#define HOST1X_HV_MLOCK_CH(x)				(((x) & 0x3f) << 2)
> +#define HOST1X_HV_MLOCK_CH_V(x)				(((x) >> 2) & 0x3f)
> +#define HOST1X_HV_MLOCK_LOCKED				BIT(0)
> +#define HOST1X_HV_MLOCK_LOCKED_V(x)			((x) & 0x1)
>  #define HOST1X_HV_CMDFIFO_PEEK_CTRL			0x233c
>  #define HOST1X_HV_CMDFIFO_PEEK_CTRL_ADDR(x)		(x)
>  #define HOST1X_HV_CMDFIFO_PEEK_CTRL_CHANNEL(x)		((x) << 16)
> 
