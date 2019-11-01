From: Yuehaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
Date: Fri, 1 Nov 2019 19:33:41 +0800
Message-ID: <01997f01-27d7-7468-c331-9b2920ad8193@huawei.com>
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
 <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
 <20191101094757.GA1167505@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191101094757.GA1167505@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, mperttunen@nvidia.com, arnd@arndb.de, seanpaul@chromium.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 2019/11/1 17:47, Thierry Reding wrote:
> On Thu, Oct 31, 2019 at 09:33:38PM +0800, Yuehaibing wrote:
>> On 2019/10/31 6:26, Dmitry Osipenko wrote:
>>> 30.10.2019 16:54, YueHaibing пишет:
>>>> If IOMMU_SUPPORT is not set, but IOMMU_IOVA is m and
>>>> COMPILE_TEST is y, building fails:
>>>>
>>>> drivers/gpu/host1x/dev.o: In function `host1x_remove':
>>>> dev.c:(.text+0x624): undefined reference to `put_iova_domain'
>>>> dev.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
>>>> dev.c:(.text+0x62c): undefined reference to `iova_cache_put'
>>>> dev.c:(.text+0x62c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'
>>>>
>>>> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Fixes: 52499a6ad2ae ("gpu: host1x: select IOMMU_IOVA")
>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>> ---
>>>>  drivers/gpu/host1x/Kconfig | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
>>>> index cf987a3..354232d 100644
>>>> --- a/drivers/gpu/host1x/Kconfig
>>>> +++ b/drivers/gpu/host1x/Kconfig
>>>> @@ -2,7 +2,7 @@
>>>>  config TEGRA_HOST1X
>>>>  	tristate "NVIDIA Tegra host1x driver"
>>>>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>>>> -	select IOMMU_IOVA if IOMMU_SUPPORT
>>>> +	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>>>  	help
>>>>  	  Driver for the NVIDIA Tegra host1x hardware.
>>>>  
>>>>
>>>
>>> It should be better to unconditionally select IOMMU_IOVA here.
>>>
>>> The same could be done for drivers/staging/media/tegra-vde/ and
>>> drivers/gpu/host1x/, please see [1].
>>
>> Yep, I will repost, thanks!
> 
> No need to resend, I already have patches for that.

Ok, thanks!

> 
> Thierry
> 
