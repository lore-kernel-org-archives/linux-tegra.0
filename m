From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
Date: Mon, 26 Aug 2019 18:28:18 +0300
Message-ID: <79dacfcc-9407-bac6-8e9b-bb8f890994ee@gmail.com>
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <58a8c62c-a45e-77e4-d2cb-99f95b847a73@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58a8c62c-a45e-77e4-d2cb-99f95b847a73@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robin.murphy@arm.com, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: linux-tegra@vger.kernel.org

26.08.2019 18:18, Dmitry Osipenko пишет:
> Hello Yue,
> 
> 26.08.2019 16:31, YueHaibing пишет:
>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>> to m will set IOMMU_IOVA to m, this fails the building of
>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>
>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>
>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>> index ba49ea5..a41d30c 100644
>> --- a/drivers/staging/media/tegra-vde/Kconfig
>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>> @@ -1,9 +1,9 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  config TEGRA_VDE
>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>> -	depends on ARCH_TEGRA || COMPILE_TEST
>> +	depends on ARCH_TEGRA
>>  	select DMA_SHARED_BUFFER
>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>  	select SRAM
>>  	help
>>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
>>
> 
> What about this variant:
> 
> 	select IOMMU_IOVA if (IOMMU_SUPPORT && !COMPILE_TEST)
> 
> which should fix the building and preserve compile-testing.
> 
> It shouldn't matter at all whether IOVA is enabled or not for
> compile-testing of the driver.
> 

Ah, actually this won't work if TEGRA_VDE=y and IOMMU_IOVA=m. I'm still
not sure that disabling compile-testing is a good solution, maybe
DRM_TEGRA and TEGRA_HOST1X should be fixed instead. Although, I'm fine
with both variants.

Acked-by: Dmitry Osipenko <digetx@gmail.com>
