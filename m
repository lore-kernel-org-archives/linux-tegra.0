From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v2 2/3] gpu: host1x: Don't complete a completed job
Date: Tue, 9 Oct 2018 14:00:24 +0900
Message-ID: <4946d88d-f36c-b17e-59f6-5b7d626271a3@kapsi.fi>
References: <20180807130713.1016-1-digetx@gmail.com>
 <20180807130713.1016-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807130713.1016-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

On 07/08/2018 22.07, Dmitry Osipenko wrote:
> There is a chance that the last job has been completed at the time of
> CDMA timeout handler invocation. In this case there is no need to complete
> the completed job.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/gpu/host1x/cdma.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index 75f339f5df6f..6aa6fa1498e8 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -323,7 +323,7 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
>   {
>   	struct host1x *host1x = cdma_to_host1x(cdma);
>   	u32 restart_addr, syncpt_incrs, syncpt_val;
> -	struct host1x_job *job = NULL;
> +	struct host1x_job *job;
>   
>   	syncpt_val = host1x_syncpt_load(cdma->timeout.syncpt);
>   
> @@ -342,11 +342,16 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
>   
>   	list_for_each_entry(job, &cdma->sync_queue, list) {
>   		if (syncpt_val < job->syncpt_end)
> -			break;
> +			goto syncpt_incr;
>   
>   		host1x_job_dump(dev, job);
>   	}
>   
> +	/* all jobs have been completed */
> +	job = NULL;
> +
> +syncpt_incr:
> +
>   	/*
>   	 * Increment with CPU the remaining syncpts of a partially executed job.
>   	 *
> @@ -359,16 +364,16 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
>   	 * modified NOP-ed PB slots). This lets things appear to have completed
>   	 * properly for this buffer and resources are freed.
>   	 */
> -
> -	dev_dbg(dev, "%s: perform CPU incr on pending buffers\n", __func__);
> -
> -	if (!list_empty(&cdma->sync_queue))
> +	if (job)
>   		restart_addr = job->first_get;
>   	else
>   		restart_addr = cdma->last_pos;
>   
>   	/* do CPU increments for the remaining syncpts */
>   	if (job) {
> +		dev_dbg(dev, "%s: perform CPU incr on pending buffers\n",
> +			__func__);
> +
>   		/* won't need a timeout when replayed */
>   		job->timeout = 0;
>   
> @@ -381,9 +386,10 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
>   		host1x_hw_cdma_timeout_cpu_incr(host1x, cdma, job->first_get,
>   						syncpt_incrs, job->syncpt_end,
>   						job->num_slots);
> -	}
>   
> -	dev_dbg(dev, "%s: finished sync_queue modification\n", __func__);
> +		dev_dbg(dev, "%s: finished sync_queue modification\n",
> +			__func__);
> +	}
>   
>   	/* roll back DMAGET and start up channel again */
>   	host1x_hw_cdma_resume(host1x, cdma, restart_addr);
> 
