From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: mark PM funtions as
 __maybe_unused
Date: Wed, 10 Jul 2019 09:42:13 +0100
Message-ID: <b61434c4-12e6-0c50-79cc-ac15f19d23e6@nvidia.com>
References: <20190709185703.3298951-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709185703.3298951-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Sameer Pujar <spujar@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 09/07/2019 19:56, Arnd Bergmann wrote:
> Without the CONFIG_PM_CLK dependency, we can now build this file
> in kernels that don't have CONFIG_PM at all, resulting in a harmless
> warning from code that was always there since it got merged:
> 
> drivers/dma/tegra210-adma.c:747:12: error: 'tegra_adma_runtime_resume' defined but not used [-Werror=unused-function]
>  static int tegra_adma_runtime_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/tegra210-adma.c:715:12: error: 'tegra_adma_runtime_suspend' defined but not used [-Werror=unused-function]
>  static int tegra_adma_runtime_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Mark them __maybe_unused to let the compiler silently drop
> those two functions.
> 
> Fixes: 3145d73e69ba ("dmaengine: tegra210-adma: remove PM_CLK dependency")
> Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/tegra210-adma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index 2805853e963f..2b4be5557b37 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -712,7 +712,7 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
>  	return chan;
>  }
>  
> -static int tegra_adma_runtime_suspend(struct device *dev)
> +static __maybe_unused int tegra_adma_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_adma *tdma = dev_get_drvdata(dev);
>  	struct tegra_adma_chan_regs *ch_reg;
> @@ -744,7 +744,7 @@ static int tegra_adma_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_adma_runtime_resume(struct device *dev)
> +static __maybe_unused int tegra_adma_runtime_resume(struct device *dev)
>  {
>  	struct tegra_adma *tdma = dev_get_drvdata(dev);
>  	struct tegra_adma_chan_regs *ch_reg;
> 

Thanks Arnd, but looks like Yue has beaten you to it again ;-)

https://www.lkml.org/lkml/2019/7/9/209

Cheers
Jon

-- 
nvpublic
