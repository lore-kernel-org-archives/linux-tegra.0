From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 18/22] gpu: host1x: Remove unused 'struct host1x_cmdbuf'
Date: Thu, 1 Jun 2017 20:52:09 +0300
Message-ID: <56a67414-c1aa-f1f6-5674-8b1d8f178a2c@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <f744341274b5749761550d14e37cac57cd0e63fc.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f744341274b5749761550d14e37cac57cd0e63fc.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
> The struct host1x_cmdbuf is unused, let's remove it.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/host1x/job.h | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
> index 0debd93a1849..4bda51d503ec 100644
> --- a/drivers/gpu/host1x/job.h
> +++ b/drivers/gpu/host1x/job.h
> @@ -27,13 +27,6 @@ struct host1x_job_gather {
>   	bool handled;
>   };
>   
> -struct host1x_cmdbuf {
> -	u32 handle;
> -	u32 offset;
> -	u32 words;
> -	u32 pad;
> -};
> -
>   struct host1x_job_unpin_data {
>   	struct host1x_bo *bo;
>   	struct sg_table *sgt;
> 
