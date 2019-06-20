From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 17:02:54 +0100
Message-ID: <1f21a03d-4cb9-c0e3-588e-8183d6f31cae@nvidia.com>
References: <1561046059-15821-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561046059-15821-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, vkoul@kernel.org, dan.j.williams@intel.com
Cc: thierry.reding@gmail.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/06/2019 16:54, Sameer Pujar wrote:
> Tegra ADMA does not use pm-clk interface now and hence the dependency
> is removed from Kconfig.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 703275c..ba660e2 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -584,7 +584,7 @@ config TEGRA20_APB_DMA
>  
>  config TEGRA210_ADMA
>  	tristate "NVIDIA Tegra210 ADMA support"
> -	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST) && PM_CLK
> +	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST)
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
>  	help

Thanks. We should probably populate the 'Fixes:' tag for this to show
which commit this fixes. Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
