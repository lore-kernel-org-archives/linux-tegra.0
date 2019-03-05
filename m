From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH] gpu: host1x: avoid IOMMU_API build error
Date: Tue, 5 Mar 2019 13:44:10 +0200
Message-ID: <b966e099-d908-c5a6-6080-beced36a39d9@nvidia.com>
References: <20190304195338.989221-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304195338.989221-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 4.3.2019 21.53, Arnd Bergmann wrote:
> drivers/gpu/host1x/hw/channel_hw.c: In function 'host1x_channel_set_streamid':
> drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit declaration of function 'dev_iommu_fwspec_get'; did you mean 'iommu_fwspec_free'? [-Werror=implicit-function-declaration]
>    struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
>                                ^~~~~~~~~~~~~~~~~~~~
>                                iommu_fwspec_free
> drivers/gpu/host1x/hw/channel_hw.c:118:30: error: initialization of 'struct iommu_fwspec *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
> drivers/gpu/host1x/hw/channel_hw.c:119:23: error: 'struct iommu_fwspec' has no member named 'ids'
>    u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
>                         ^~
> cc1: all warnings being treated as errors
> 
> Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/host1x/hw/channel_hw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 27101c04a827..738dccf4ee3f 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -114,7 +114,7 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
>   
>   static void host1x_channel_set_streamid(struct host1x_channel *channel)
>   {
> -#if HOST1X_HW >= 6
> +#if HOST1X_HW >= 6 && defined(CONFIG_IOMMU_API)
>   	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
>   	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
>   
> 

We should always program the stream ID - if IOMMU API is not enabled 
then 0x7f (SMMU bypass) should always be programmed.

Mikko
