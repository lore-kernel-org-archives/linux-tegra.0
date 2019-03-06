From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH] [v2] gpu: host1x: avoid IOMMU_API build error
Date: Wed, 6 Mar 2019 16:00:04 +0200
Message-ID: <6692ec53-fb2f-e15c-88fe-33d13e0def8d@nvidia.com>
References: <20190306135800.3982681-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306135800.3982681-1-arnd@arndb.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 6.3.2019 15.57, Arnd Bergmann wrote:
> When the iommu API is disabled, the host1x driver fails to build:
> 
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
> As Mikko explains, we should program SMMU bypass (0x7f) if that
> happens.
> 
> Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
> Suggested-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> v2: fall back to 0x7f sid
> ---
>   drivers/gpu/host1x/hw/channel_hw.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 27101c04a827..0c0eb43abf65 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -115,8 +115,12 @@ static inline void synchronize_syncpt_base(struct host1x_job *job)
>   static void host1x_channel_set_streamid(struct host1x_channel *channel)
>   {
>   #if HOST1X_HW >= 6
> +	u32 sid = 0x7f;
> +#ifdef CONFIG_IOMMU_API
>   	struct iommu_fwspec *spec = dev_iommu_fwspec_get(channel->dev->parent);
> -	u32 sid = spec ? spec->ids[0] & 0xffff : 0x7f;
> +	if (spec)
> +		sid = spec->ids[0] & 0xffff;
> +#endif
>   
>   	host1x_ch_writel(channel, sid, HOST1X_CHANNEL_SMMU_STREAMID);
>   #endif
> 

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
