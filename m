From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
Date: Tue, 30 Jun 2020 12:07:26 +0200
Message-ID: <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
        <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
        <20200619103636.11974-32-m.szyprowski@samsung.com>
        <20200621070015.0cf833ab@dimatab>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20200621070015.0cf833ab@dimatab>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: linux-tegra@vger.kernel.org

On 21.06.2020 06:00, Dmitry Osipenko wrote:
> В Fri, 19 Jun 2020 12:36:31 +0200
> Marek Szyprowski <m.szyprowski@samsung.com> пишет:
>
>> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
>> function returns the number of the created entries in the DMA address
>> space. However the subsequent calls to the
>> dma_sync_sg_for_{device,cpu}() and dma_unmap_sg must be called with
>> the original number of the entries passed to the dma_map_sg().
>>
>> struct sg_table is a common structure used for describing a
>> non-contiguous memory buffer, used commonly in the DRM and graphics
>> subsystems. It consists of a scatterlist with memory pages and DMA
>> addresses (sgl entry), as well as the number of scatterlist entries:
>> CPU pages (orig_nents entry) and DMA mapped pages (nents entry).
>>
>> It turned out that it was a common mistake to misuse nents and
>> orig_nents entries, calling DMA-mapping functions with a wrong number
>> of entries or ignoring the number of mapped entries returned by the
>> dma_map_sg() function.
>>
>> To avoid such issues, lets use a common dma-mapping wrappers operating
>> directly on the struct sg_table objects and use scatterlist page
>> iterators where possible. This, almost always, hides references to the
>> nents and orig_nents entries, making the code robust, easier to follow
>> and copy/paste safe.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/staging/media/tegra-vde/iommu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/iommu.c
>> b/drivers/staging/media/tegra-vde/iommu.c index
>> 6af863d92123..adf8dc7ee25c 100644 ---
>> a/drivers/staging/media/tegra-vde/iommu.c +++
>> b/drivers/staging/media/tegra-vde/iommu.c @@ -36,8 +36,8 @@ int
>> tegra_vde_iommu_map(struct tegra_vde *vde,
>>   	addr = iova_dma_addr(&vde->iova, iova);
>>   
>> -	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
>> -			    IOMMU_READ | IOMMU_WRITE);
>> +	size = iommu_map_sgtable(vde->domain, addr, sgt,
>> +				 IOMMU_READ | IOMMU_WRITE);
>>   	if (!size) {
>>   		__free_iova(&vde->iova, iova);
>>   		return -ENXIO;
> Ahh, I saw the build failure report. You're changing the DMA API in
> this series, while DMA API isn't used by this driver, it uses IOMMU
> API. Hence there is no need to touch this code. Similar problem in the
> host1x driver patch.

The issue is caused by the lack of iommu_map_sgtable() stub when no 
IOMMU support is configured. I've posted a patch for this:

https://lore.kernel.org/lkml/20200630081756.18526-1-m.szyprowski@samsung.com/

The patch for this driver is fine, we have to wait until the above fix 
gets merged and then it can be applied during the next release cycle.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
