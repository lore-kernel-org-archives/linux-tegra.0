From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/4] staging: media: tegra-vde: Add IOMMU support
Date: Mon, 17 Jun 2019 16:36:57 +0300
Message-ID: <06a73666-8985-68a6-66cf-cf9cc00d6929@gmail.com>
References: <20190602213712.26857-1-digetx@gmail.com>
 <20190602213712.26857-7-digetx@gmail.com>
 <5c274249-6c88-b4bd-70fe-0751f5bbfdfc@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5c274249-6c88-b4bd-70fe-0751f5bbfdfc@xs4all.nl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 16:31, Hans Verkuil пишет:
> On 6/2/19 11:37 PM, Dmitry Osipenko wrote:
>> All Tegra's could provide memory isolation for the video decoder
>> hardware using IOMMU, it is also required for Tegra30+ in order
>> to handle sparse dmabuf's which GPU exports in a default kernel
>> configuration.
>>
>> Inspired-by: Thierry Reding <thierry.reding@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/Kconfig       |   1 +
>>  drivers/staging/media/tegra-vde/Makefile      |   1 +
>>  drivers/staging/media/tegra-vde/iommu.c       | 148 ++++++++++++++
>>  drivers/staging/media/tegra-vde/trace.h       |   1 +
>>  .../media/tegra-vde/{tegra-vde.c => vde.c}    | 188 +++++++++---------
>>  drivers/staging/media/tegra-vde/vde.h         |  89 +++++++++
>>  6 files changed, 335 insertions(+), 93 deletions(-)
>>  create mode 100644 drivers/staging/media/tegra-vde/iommu.c
>>  rename drivers/staging/media/tegra-vde/{tegra-vde.c => vde.c} (91%)
>>  create mode 100644 drivers/staging/media/tegra-vde/vde.h
>>
>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>> index ff8e846cd15d..2e7f644ae591 100644
>> --- a/drivers/staging/media/tegra-vde/Kconfig
>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>> @@ -3,6 +3,7 @@ config TEGRA_VDE
>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>  	depends on ARCH_TEGRA || COMPILE_TEST
>>  	select DMA_SHARED_BUFFER
>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>  	select SRAM
>>  	help
>>  	    Say Y here to enable support for the NVIDIA Tegra video decoder
>> diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
>> index 7f9020e634f3..c11867e28233 100644
>> --- a/drivers/staging/media/tegra-vde/Makefile
>> +++ b/drivers/staging/media/tegra-vde/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +tegra-vde-y := vde.o iommu.o
>>  obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
>> diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
>> new file mode 100644
>> index 000000000000..295c3d7cccd3
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra-vde/iommu.c
>> @@ -0,0 +1,148 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * NVIDIA Tegra Video decoder driver
>> + *
>> + * Copyright (C) 2016-2019 GRATE-DRIVER project
>> + */
>> +
>> +#include <linux/iommu.h>
>> +#include <linux/iova.h>
>> +#include <linux/kernel.h>
>> +#include <linux/platform_device.h>
>> +
>> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> +#include <asm/dma-iommu.h>
>> +#endif
>> +
>> +#include "vde.h"
>> +
>> +int tegra_vde_iommu_map(struct tegra_vde *vde,
>> +			struct sg_table *sgt,
>> +			struct iova **iovap,
>> +			dma_addr_t *addrp,
>> +			size_t size)
>> +{
>> +	struct iova *iova;
>> +	unsigned long shift;
>> +	unsigned long end;
>> +	dma_addr_t addr;
>> +
>> +	end = vde->domain->geometry.aperture_end;
>> +	size = iova_align(&vde->iova, size);
>> +	shift = iova_shift(&vde->iova);
>> +
>> +	iova = alloc_iova(&vde->iova, size >> shift, end >> shift, true);
>> +	if (!iova)
>> +		return -ENOMEM;
>> +
>> +	addr = iova_dma_addr(&vde->iova, iova);
>> +
>> +	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
>> +			    IOMMU_READ | IOMMU_WRITE);
>> +	if (!size) {
>> +		__free_iova(&vde->iova, iova);
>> +		return -ENXIO;
>> +	}
>> +
>> +	*iovap = iova;
>> +	*addrp = addr;
>> +
>> +	return 0;
>> +}
>> +
>> +void tegra_vde_iommu_unmap(struct tegra_vde *vde, struct iova *iova)
>> +{
>> +	unsigned long shift = iova_shift(&vde->iova);
>> +	unsigned long size = iova_size(iova) << shift;
>> +	dma_addr_t addr = iova_dma_addr(&vde->iova, iova);
>> +
>> +	iommu_unmap(vde->domain, addr, size);
>> +	__free_iova(&vde->iova, iova);
>> +}
>> +
>> +int tegra_vde_iommu_init(struct tegra_vde *vde)
>> +{
>> +	struct iova *iova;
>> +	unsigned long order;
>> +	unsigned long shift;
>> +	int err;
>> +
>> +	vde->group = iommu_group_get(vde->miscdev.parent);
>> +	if (!vde->group)
>> +		return 0;
>> +
>> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> +	if (dev->archdata.mapping) {
> 
> 'dev' doesn't exist, so this fails to compile!

Oh, indeed! I actually didn't even try to compile with CONFIG_ARM_DMA_USE_IOMMU. Will
fix it in v2, thanks!
