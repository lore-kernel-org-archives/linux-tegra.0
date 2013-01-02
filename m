From: Mark Zhang <nvmarkzhang@gmail.com>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Wed, 02 Jan 2013 15:40:10 +0800
Message-ID: <50E3E45A.5050003@gmail.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
	<1356089964-5265-4-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Terje Bergstrom <tbergstrom@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Just one minor issue. Check below.

On 12/21/2012 07:39 PM, Terje Bergstrom wrote:
> Add support for host1x client modules, and host1x channels to submit
> work to the clients. The work is submitted in GEM CMA buffers, so
> this patch adds support for them.
> 
> Signed-off-by: Terje Bergstrom <tbergstrom@nvidia.com>
> ---
[...]
> +/*
> + * Begin a cdma submit
> + */
> +int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
> +{
> +	struct host1x *host1x = cdma_to_host1x(cdma);
> +
> +	mutex_lock(&cdma->lock);
> +
> +	if (job->timeout) {
> +		/* init state on first submit with timeout value */
> +		if (!cdma->timeout.initialized) {
> +			int err;
> +			err = host1x->cdma_op.timeout_init(cdma,
> +					job->syncpt_id);
> +			if (err) {
> +				mutex_unlock(&cdma->lock);
> +				return err;
> +			}
> +		}
> +	}
> +	if (!cdma->running)
> +		host1x->cdma_op.start(cdma);
> +
> +	cdma->slots_free = 0;
> +	cdma->slots_used = 0;
> +	cdma->first_get = host1x->cdma_pb_op.putptr(&cdma->push_buffer);
> +
> +	trace_host1x_cdma_begin(job->ch->dev->name);

Seems missing "mutex_unlock(&cdma->lock);" here.

> +	return 0;
> +}
[...]
> +
>  #endif /*  _TRACE_HOST1X_H */
>  
>  /* This part must be outside protection */
> 
