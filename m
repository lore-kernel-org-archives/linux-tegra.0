From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
Date: Thu, 29 Aug 2019 16:58:22 +0300
Message-ID: <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
 <20190829124034.GA19842@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829124034.GA19842@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, YueHaibing <yuehaibing@huawei.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, robin.murphy@arm.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: linux-tegra@vger.kernel.org

29.08.2019 15:40, Thierry Reding пишет:
> On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
>> On 8/26/19 3:31 PM, YueHaibing wrote:
>>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>>> to m will set IOMMU_IOVA to m, this fails the building of
>>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>>
>>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>>
>>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>>> index ba49ea5..a41d30c 100644
>>> --- a/drivers/staging/media/tegra-vde/Kconfig
>>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>>> @@ -1,9 +1,9 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>  config TEGRA_VDE
>>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>> -	depends on ARCH_TEGRA || COMPILE_TEST
>>> +	depends on ARCH_TEGRA
>>
>> What happens if you drop this change,
>>
>>>  	select DMA_SHARED_BUFFER
>>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>
>> but keep this change?
>>
>> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
>> work when compile testing this tegra-vde driver.
>>
>> Haven't tried it, but making sure that compile testing keep working is
>> really important.

The driver's code compilation works okay, it's the linkage stage which
fails during compile-testing.

> Yeah, that variant seems to work for me. I think it's also more correct
> because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
> IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
> then IOVA is not needed either, so the dummies will do just fine.

Am I understanding correctly that you're suggesting to revert [1][2] and
get back to the other problem?

[1]
https://lore.kernel.org/linux-media/dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com/T/
[2] https://patchwork.ozlabs.org/patch/1136619/

If we want to keep compile testing, I guess the only reasonable variant
right now is to select IOMMU_IOVA unconditionally in all of the drivers
(vde, host1x, drm and etc) and then just ignore that IOVA will be
compiled-and-unused if IOMMU_SUPPORT=n (note that IOMMU_SUPPORT=y in all
of default kernel configurations).
