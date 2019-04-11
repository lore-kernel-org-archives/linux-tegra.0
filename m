From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] gpu: host1x: fix compile error when IOMMU API is not
 available
Date: Thu, 11 Apr 2019 12:57:07 +0200
Message-ID: <53b179ccdc64326438a1335db9ecd916@agner.ch>
References: <4c3d021c73c001f633803e364cfbc6ace3381205.1554936354.git.stefan@agner.ch>
 <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: thierry.reding@gmail.com, digetx@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11.04.2019 10:23, Ben Dooks wrote:
> On 2019-04-10 23:47, Stefan Agner wrote:
>> In case the IOMMU API is not available compiling host1x fails with
>> the following error:
>>   In file included from drivers/gpu/host1x/hw/host1x06.c:27:
>>   drivers/gpu/host1x/hw/channel_hw.c: In function ‘host1x_channel_set_streamid’:
>>   drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit
>> declaration of function
>>     ‘dev_iommu_fwspec_get’; did you mean ‘iommu_fwspec_free’?
>> [-Werror=implicit-function-declaration]
>>   struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
>>                               ^~~~~~~~~~~~~~~~~~~~
>>                               iommu_fwspec_free
>>
>> Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> would it be better to provide something like this i nthe header that
> defines dev_iommu_fwspec_get() to be:
> 
> static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device
> *dev) { return NULL; }
> 
> although returning an PTR_ERR would have been better.
> 

The problem is that the code also accesses fields of struct iommu_fwspec
which are not defined in the !CONFIG_IOMMU_API case.

--
Stefan

>> ---
>>  drivers/gpu/host1x/hw/channel_hw.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/host1x/hw/channel_hw.c
>> b/drivers/gpu/host1x/hw/channel_hw.c
>> index 27101c04a827..4030d64916f0 100644
>> --- a/drivers/gpu/host1x/hw/channel_hw.c
>> +++ b/drivers/gpu/host1x/hw/channel_hw.c
>> @@ -114,7 +114,7 @@ static inline void synchronize_syncpt_base(struct
>> host1x_job *job)
>>
>>  static void host1x_channel_set_streamid(struct host1x_channel *channel)
>>  {
>> -#if HOST1X_HW >= 6
>> +#if IS_ENABLED(CONFIG_IOMMU_API) &&  HOST1X_HW >= 6
>>  	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
>>  	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
