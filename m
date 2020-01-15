From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 13/14] dmaengine: tegra-apb: Allow to compile as a
 loadable kernel module
Date: Wed, 15 Jan 2020 10:10:44 +0000
Message-ID: <620aa569-b880-d226-8dee-382ea5143fa3@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112173006.29863-14-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/01/2020 17:30, Dmitry Osipenko wrote:
> The driver's removal was fixed by a recent commit and module load/unload
> is working well now, tested on Tegra30.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 6fa1eba9d477..9f43e2cae8b4 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -586,7 +586,7 @@ config TXX9_DMAC
>  	  integrated in chips such as the Toshiba TX4927/38/39.
>  
>  config TEGRA20_APB_DMA
> -	bool "NVIDIA Tegra20 APB DMA support"
> +	tristate "NVIDIA Tegra20 APB DMA support"
>  	depends on ARCH_TEGRA
>  	select DMA_ENGINE
>  	help

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic
