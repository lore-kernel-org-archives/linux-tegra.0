From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/4] staging: media: tegra-vde: Defer dmabuf's
 unmapping
Date: Mon, 17 Jun 2019 16:44:56 +0300
Message-ID: <9bc14323-6c7e-54ff-50d6-48260ad9ea8c@gmail.com>
References: <20190602213712.26857-1-digetx@gmail.com>
 <20190602213712.26857-8-digetx@gmail.com>
 <4c00cfe6-6598-2017-cce5-ce3c30fd14ba@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4c00cfe6-6598-2017-cce5-ce3c30fd14ba@xs4all.nl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 16:33, Hans Verkuil пишет:
> On 6/2/19 11:37 PM, Dmitry Osipenko wrote:
>> Frequent IOMMU remappings take about 50% of CPU usage because there is
>> quite a lot to remap. Defer dmabuf's unmapping by 5 seconds in order to
>> mitigate the mapping overhead which goes away completely and driver works
>> as fast as in a case of a disabled IOMMU. The case of a disabled IOMMU
>> should also benefit a tad from the caching since CPU cache maintenance
>> that happens on dmabuf's attaching takes some resources.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/Makefile      |   2 +-
>>  .../staging/media/tegra-vde/dmabuf-cache.c    | 223 ++++++++++++++++++
>>  drivers/staging/media/tegra-vde/iommu.c       |   2 -
>>  drivers/staging/media/tegra-vde/vde.c         | 143 +++--------
>>  drivers/staging/media/tegra-vde/vde.h         |  18 +-
>>  5 files changed, 273 insertions(+), 115 deletions(-)
>>  create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c
>>
>> diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
>> index c11867e28233..2827f7601de8 100644
>> --- a/drivers/staging/media/tegra-vde/Makefile
>> +++ b/drivers/staging/media/tegra-vde/Makefile
>> @@ -1,3 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -tegra-vde-y := vde.o iommu.o
>> +tegra-vde-y := vde.o iommu.o dmabuf-cache.o
>>  obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
>> diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/staging/media/tegra-vde/dmabuf-cache.c
>> new file mode 100644
>> index 000000000000..fcde8d1c37e7
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
>> @@ -0,0 +1,223 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * NVIDIA Tegra Video decoder driver
>> + *
>> + * Copyright (C) 2016-2019 GRATE-DRIVER project
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/iova.h>
>> +#include <linux/kernel.h>
>> +#include <linux/list.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include "vde.h"
>> +
>> +struct tegra_vde_cache_entry {
>> +	enum dma_data_direction dma_dir;
>> +	struct dma_buf_attachment *a;
>> +	struct delayed_work dwork;
>> +	struct tegra_vde *vde;
>> +	struct list_head list;
>> +	struct sg_table *sgt;
>> +	struct iova *iova;
>> +	unsigned int refcnt;
>> +};
>> +
>> +static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
>> +{
>> +	struct dma_buf *dmabuf = entry->a->dmabuf;
>> +
>> +	WARN_ON_ONCE(entry->refcnt);
>> +
>> +	if (entry->vde->domain)
>> +		tegra_vde_iommu_unmap(entry->vde, entry->iova);
>> +
>> +	dma_buf_unmap_attachment(entry->a, entry->sgt, entry->dma_dir);
>> +	dma_buf_detach(dmabuf, entry->a);
>> +	dma_buf_put(dmabuf);
>> +
>> +	list_del(&entry->list);
>> +	kfree(entry);
>> +}
>> +
>> +static void tegra_vde_delayed_unmap(struct work_struct *work)
>> +{
>> +	struct tegra_vde_cache_entry *entry;
>> +
>> +	entry = container_of(work, struct tegra_vde_cache_entry,
>> +			     dwork.work);
>> +
>> +	mutex_lock(&entry->vde->map_lock);
>> +	tegra_vde_release_entry(entry);
>> +	mutex_unlock(&entry->vde->map_lock);
> 
> From smatch:
> 
> drivers/staging/media/tegra-vde/dmabuf-cache.c:55 tegra_vde_delayed_unmap() error: dereferencing freed memory 'entry'

That's a very good catch, thanks you very much! I'm keep forgetting about smatch, it's
a useful tool. And unfortunately I can't KASAN the driver because ARM32 doesn't
support KASAN in upstream and Xorg hangs with the unofficial patch that adds support
for the KASAN.

[snip]

>> +	entry->dma_dir = dma_dir;
>> +	entry->iova = iova;
> 
> From smatch:
> 
> drivers/staging/media/tegra-vde/dmabuf-cache.c:133 tegra_vde_dmabuf_cache_map() error: uninitialized symbol 'iova'.

This is fine, but indeed won't hurt to explicitly initialize to NULL.

Thanks again!
