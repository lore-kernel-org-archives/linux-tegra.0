From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v4 14/14] dmaengine: tegra-apb: Remove MODULE_ALIAS
Date: Wed, 15 Jan 2020 10:11:11 +0000
Message-ID: <7cd815b6-00ac-bf81-440d-0d8100e2948f@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200112173006.29863-15-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/01/2020 17:30, Dmitry Osipenko wrote:
> Tegra APB DMA driver is an Open Firmware driver and thus it uses OF alias
> naming scheme which overrides MODULE_ALIAS, meaning that MODULE_ALIAS does
> nothing and could be removed safely.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/dma/tegra20-apb-dma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index fbbb6a60901e..0a45dd77618c 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1688,7 +1688,6 @@ static struct platform_driver tegra_dmac_driver = {
>  
>  module_platform_driver(tegra_dmac_driver);
>  
> -MODULE_ALIAS("platform:tegra20-apbdma");
>  MODULE_DESCRIPTION("NVIDIA Tegra APB DMA Controller driver");
>  MODULE_AUTHOR("Laxman Dewangan <ldewangan@nvidia.com>");
>  MODULE_LICENSE("GPL v2");

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
