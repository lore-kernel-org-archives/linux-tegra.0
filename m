From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: Fix build error
Date: Thu, 25 Jul 2019 10:19:13 +0300
Message-ID: <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
 <20190725024129.22664-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725024129.22664-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robin.murphy@arm.com, sakari.ailus@linux.intel.com
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: linux-tegra@vger.kernel.org

25.07.2019 5:41, YueHaibing пишет:
> If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
> IOMMU_IOVA may be set to m. So building will fails:
> 
> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
> iommu.c:(.text+0x56): undefined reference to `__free_iova'
> 
> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
> index 2e7f644..ba49ea5 100644
> --- a/drivers/staging/media/tegra-vde/Kconfig
> +++ b/drivers/staging/media/tegra-vde/Kconfig
> @@ -3,7 +3,7 @@ config TEGRA_VDE
>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	select DMA_SHARED_BUFFER
> -	select IOMMU_IOVA if IOMMU_SUPPORT
> +	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>  	select SRAM
>  	help
>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
> 

This results in missing the case of compile-testing !IOMMU_IOVA for the
driver, but probably that's not a big deal.

Acked-by: Dmitry Osipenko <digetx@gmail.com>
