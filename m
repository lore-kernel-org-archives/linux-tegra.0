From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 19 Aug 2017 15:02:53 +0300
Message-ID: <3818913a-ec8f-f939-a71c-6f7b9ccd4be8@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818161553.27597-2-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 18.08.2017 19:15, Mikko Perttunen wrote:
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
[snip]
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index 048ac9e344ce..fe4d963b3e2a 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -398,6 +398,8 @@ int host1x_syncpt_init(struct host1x *host)
>  	for (i = 0; i < host->info->nb_pts; i++) {
>  		syncpt[i].id = i;
>  		syncpt[i].host = host;
> +
> +		host1x_hw_syncpt_assign_channel(host, &syncpt[i], NULL);
>  	}

What about to factor out that assignment and add a comment, something like this:

/* clear syncpoint-channel assignments on Tegra186+ */
for (i = 0; i < host->info->nb_pts; i++)
	host1x_hw_syncpt_assign_channel(host, &syncpt[i], NULL);

And maybe even add an inline function for clarity, like:

static inline void host1x_hw_syncpt_deassign_channel(struct host1x *host,
						     struct host1x_syncpt *sp)
{
	return host->syncpt_op->assign_channel(sp, NULL);
}

-- 
Dmitry
