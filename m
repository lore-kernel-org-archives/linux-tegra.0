From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [Patch v1 2/4] dma: tegra: Adding Tegra GPC DMA controller driver
Date: Mon, 20 Jul 2020 08:42:03 -0700
Message-ID: <a0e8fca8-da72-bafa-9980-6d5ffd1af6e3@infradead.org>
References: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
 <1595226856-19241-3-git-send-email-rgumasta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595226856-19241-3-git-send-email-rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Pavan Kunapuli <pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 7/19/20 11:34 PM, Rajesh Gumasta wrote:
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index e9ed916..be4c395 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -639,6 +639,18 @@ config TEGRA210_ADMA
>  	  peripheral and vice versa. It does not support memory to
>  	  memory data transfer.
>  
> +config TEGRA_GPC_DMA
> +	tristate "NVIDIA Tegra GPC DMA support"
> +	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || COMPILE_TEST
> +	select DMA_ENGINE
> +	help
> +	  Support for the NVIDIA Tegra186 and Tegra194 GPC DMA controller
> +	  driver. The DMA controller is having multiple DMA channel which

	          The DMA controller has multiple DMA channels which

> +	  can be configured for different peripherals like UART, SPI, etc
> +	  which are on APB bus.
> +	  This DMA controller transfers data from memory to peripheral fifo

	                                                               FIFO

> +	  or vice versa. It also supports memory to memory data transfer.
> +
>  config TIMB_DMA
>  	tristate "Timberdale FPGA DMA support"
>  	depends on MFD_TIMBERDALE || COMPILE_TEST


thanks.
-- 
~Randy
