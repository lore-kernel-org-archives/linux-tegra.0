From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/6] gpu: host1x: Fix incorrect comment for
 channel_request
Date: Tue, 5 Sep 2017 16:05:11 +0300
Message-ID: <b1d577a4-687a-31d9-a6b6-3d9d3827aba1@gmail.com>
References: <20170905081029.19769-1-mperttunen@nvidia.com>
 <20170905081029.19769-6-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905081029.19769-6-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.09.2017 11:10, Mikko Perttunen wrote:
> This function actually doesn't sleep in the version that was merged.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/channel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
> index db9b91d1384c..2fb93c27c1d9 100644
> --- a/drivers/gpu/host1x/channel.c
> +++ b/drivers/gpu/host1x/channel.c
> @@ -128,8 +128,7 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
>   * host1x_channel_request() - Allocate a channel
>   * @device: Host1x unit this channel will be used to send commands to
>   *
> - * Allocates a new host1x channel for @device. If there are no free channels,
> - * this will sleep until one becomes available. May return NULL if CDMA
> + * Allocates a new host1x channel for @device. May return NULL if CDMA
>   * initialization fails.
>   */
>  struct host1x_channel *host1x_channel_request(struct device *dev)
> 

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Dmitry
