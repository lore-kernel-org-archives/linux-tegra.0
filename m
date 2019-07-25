From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] trace: fix header include guards
Date: Wed, 24 Jul 2019 21:28:52 -0400
Message-ID: <20190724212852.070641d4@oasis.local.home>
References: <20190720103943.16982-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190720103943.16982-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 20 Jul 2019 19:39:43 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> These include guards are broken.
> 
> Match the #if !define() and #define lines so that they work correctly.

Thanks, this all looks legit to me. I'll pull this in through my tree.

-- Steve

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  include/trace/events/dma_fence.h     | 2 +-
>  include/trace/events/napi.h          | 4 ++--
>  include/trace/events/qdisc.h         | 4 ++--
>  include/trace/events/tegra_apb_dma.h | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 2212adda8f77..64e92d56c6a8 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -2,7 +2,7 @@
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM dma_fence
>  
> -#if !defined(_TRACE_FENCE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#if !defined(_TRACE_DMA_FENCE_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_DMA_FENCE_H
>  
>  #include <linux/tracepoint.h>
> diff --git a/include/trace/events/napi.h b/include/trace/events/napi.h
> index f3a12566bed0..6678cf8b235b 100644
> --- a/include/trace/events/napi.h
> +++ b/include/trace/events/napi.h
> @@ -3,7 +3,7 @@
>  #define TRACE_SYSTEM napi
>  
>  #if !defined(_TRACE_NAPI_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _TRACE_NAPI_H_
> +#define _TRACE_NAPI_H
>  
>  #include <linux/netdevice.h>
>  #include <linux/tracepoint.h>
> @@ -38,7 +38,7 @@ TRACE_EVENT(napi_poll,
>  
>  #undef NO_DEV
>  
> -#endif /* _TRACE_NAPI_H_ */
> +#endif /* _TRACE_NAPI_H */
>  
>  /* This part must be outside protection */
>  #include <trace/define_trace.h>
> diff --git a/include/trace/events/qdisc.h b/include/trace/events/qdisc.h
> index 60d0d8bd336d..0d1a9ebf55ba 100644
> --- a/include/trace/events/qdisc.h
> +++ b/include/trace/events/qdisc.h
> @@ -2,7 +2,7 @@
>  #define TRACE_SYSTEM qdisc
>  
>  #if !defined(_TRACE_QDISC_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _TRACE_QDISC_H_
> +#define _TRACE_QDISC_H
>  
>  #include <linux/skbuff.h>
>  #include <linux/netdevice.h>
> @@ -44,7 +44,7 @@ TRACE_EVENT(qdisc_dequeue,
>  		  __entry->txq_state, __entry->packets, __entry->skbaddr )
>  );
>  
> -#endif /* _TRACE_QDISC_H_ */
> +#endif /* _TRACE_QDISC_H */
>  
>  /* This part must be outside protection */
>  #include <trace/define_trace.h>
> diff --git a/include/trace/events/tegra_apb_dma.h b/include/trace/events/tegra_apb_dma.h
> index 0818f6286110..971cd02d2daf 100644
> --- a/include/trace/events/tegra_apb_dma.h
> +++ b/include/trace/events/tegra_apb_dma.h
> @@ -1,5 +1,5 @@
>  #if !defined(_TRACE_TEGRA_APB_DMA_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _TRACE_TEGRA_APM_DMA_H
> +#define _TRACE_TEGRA_APB_DMA_H
>  
>  #include <linux/tracepoint.h>
>  #include <linux/dmaengine.h>
> @@ -55,7 +55,7 @@ TRACE_EVENT(tegra_dma_isr,
>  	TP_printk("%s: irq %d\n",  __get_str(chan), __entry->irq)
>  );
>  
> -#endif /*  _TRACE_TEGRADMA_H */
> +#endif /* _TRACE_TEGRA_APB_DMA_H */
>  
>  /* This part must be outside protection */
>  #include <trace/define_trace.h>
