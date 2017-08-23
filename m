From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: trace: Fix path to include
Date: Wed, 23 Aug 2017 22:56:14 +0300
Message-ID: <e5f78b7f-68b2-957a-baf9-f69ba704163f@gmail.com>
References: <20170823171326.23620-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170823171326.23620-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 23.08.2017 20:13, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The TRACE_INCLUDE_FILE macro needs to specify the path relative to the
> define_trace.h header rather than relative to the file defining it.
> 
> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/trace.h b/drivers/gpu/drm/tegra/trace.h
> index e9b7cdad5c4c..5a1ab4046e92 100644
> --- a/drivers/gpu/drm/tegra/trace.h
> +++ b/drivers/gpu/drm/tegra/trace.h
> @@ -63,6 +63,6 @@ DEFINE_EVENT(register_access, sor_readl,
>  
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH .
> +#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/tegra
>  #define TRACE_INCLUDE_FILE trace
>  #include <trace/define_trace.h>
> 

This variant works too!

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Dmitry
