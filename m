From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] media: staging: tegra-vde: select DMA_SHARED_BUFFER
Date: Fri, 5 Jan 2018 15:03:56 +0300
Message-ID: <481fe121-8937-81a5-40d5-d8fe8a0036dd@gmail.com>
References: <20180105094343.2813148-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105094343.2813148-1-arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.01.2018 12:43, Arnd Bergmann wrote:
> Without CONFIG_DMA_SHARED_BUFFER we run into a link error for the
> dma_buf_* APIs:
> 
> ERROR: "dma_buf_map_attachment" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> ERROR: "dma_buf_attach" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> ERROR: "dma_buf_get" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> ERROR: "dma_buf_put" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> ERROR: "dma_buf_detach" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> ERROR: "dma_buf_unmap_attachment" [drivers/staging/media/tegra-vde/tegra-vde.ko] undefined!
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/staging/media/tegra-vde/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
> index ec3ddddebdaa..5c4914674468 100644
> --- a/drivers/staging/media/tegra-vde/Kconfig
> +++ b/drivers/staging/media/tegra-vde/Kconfig
> @@ -1,6 +1,7 @@
>  config TEGRA_VDE
>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>  	depends on ARCH_TEGRA || COMPILE_TEST
> +	select DMA_SHARED_BUFFER
>  	select SRAM
>  	help
>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
> 

Thanks!

Acked-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
