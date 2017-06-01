From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 19/22] gpu: host1x: Remove unused host1x_cdma_stop()
 definition
Date: Thu, 1 Jun 2017 20:52:58 +0300
Message-ID: <50d6f977-7167-31ce-82e1-516b46e59429@kapsi.fi>
References: <cover.1495498184.git.digetx@gmail.com>
 <2c22b2d1cedcfe75f66aa8500c2b9425e10724d0.1495498184.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2c22b2d1cedcfe75f66aa8500c2b9425e10724d0.1495498184.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 05/23/2017 03:14 AM, Dmitry Osipenko wrote:
> There is no host1x_cdma_stop() in the code, let's remove its definition
> from the header file.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   drivers/gpu/host1x/cdma.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
> index ec170a78f4e1..286d49386be9 100644
> --- a/drivers/gpu/host1x/cdma.h
> +++ b/drivers/gpu/host1x/cdma.h
> @@ -88,7 +88,6 @@ struct host1x_cdma {
>   
>   int host1x_cdma_init(struct host1x_cdma *cdma);
>   int host1x_cdma_deinit(struct host1x_cdma *cdma);
> -void host1x_cdma_stop(struct host1x_cdma *cdma);
>   int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job);
>   void host1x_cdma_push(struct host1x_cdma *cdma, u32 op1, u32 op2);
>   void host1x_cdma_end(struct host1x_cdma *cdma, struct host1x_job *job);
> 
