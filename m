From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] gpu: host1x: Enable gather filter
Date: Sun, 20 Aug 2017 19:24:59 +0300
Message-ID: <78e11be6-1e4f-18e0-cdc0-13db4bf57bf6@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-3-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170818161553.27597-3-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 18.08.2017 19:15, Mikko Perttunen wrote:
> The gather filter is a feature present on Tegra124 and newer where the
> hardware prevents GATHERed command buffers from executing commands
> normally reserved for the CDMA pushbuffer which is maintained by the
> kernel driver.
> 
> This commit enables the gather filter on all supporting hardware.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/hw/channel_hw.c          | 22 ++++++++++++++++++++++
>  drivers/gpu/host1x/hw/hw_host1x04_channel.h | 12 ++++++++++++
>  drivers/gpu/host1x/hw/hw_host1x05_channel.h | 12 ++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
> index 0161da331702..5c0dc6bb51d1 100644
> --- a/drivers/gpu/host1x/hw/channel_hw.c
> +++ b/drivers/gpu/host1x/hw/channel_hw.c
> @@ -181,10 +181,32 @@ static int channel_submit(struct host1x_job *job)
>  	return err;
>  }
>  
> +static void enable_gather_filter(struct host1x *host,
> +				 struct host1x_channel *ch)
> +{
> +#if HOST1X_HW >= 6
> +	u32 val;
> +
> +	if (!host->hv_regs)
> +		return;

Is it really possible that gather filter could be not present on HW without
hypervisor? Maybe there is other way to enable it in that case?

Is possible at all that hypervisor could be missed?

> +
> +	val = host1x_hypervisor_readl(
> +		host, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
> +	val |= BIT(ch->id % 32);
> +	host1x_hypervisor_writel(
> +		host, val, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
> +#elif HOST1X_HW >= 4
> +	host1x_ch_writel(ch,
> +			 HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(1),
> +			 HOST1X_CHANNEL_CHANNELCTRL);
> +#endif
> +}
> +
>  static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
>  			       unsigned int index)
>  {
>  	ch->regs = dev->regs + index * HOST1X_CHANNEL_SIZE;
> +	enable_gather_filter(dev, ch);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/host1x/hw/hw_host1x04_channel.h b/drivers/gpu/host1x/hw/hw_host1x04_channel.h
> index 95e6f96142b9..2e8b635aa660 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x04_channel.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x04_channel.h
> @@ -117,5 +117,17 @@ static inline u32 host1x_channel_dmactrl_dmainitget(void)
>  }
>  #define HOST1X_CHANNEL_DMACTRL_DMAINITGET \
>  	host1x_channel_dmactrl_dmainitget()
> +static inline u32 host1x_channel_channelctrl_r(void)
> +{
> +	return 0x98;
> +}
> +#define HOST1X_CHANNEL_CHANNELCTRL \
> +	host1x_channel_channelctrl_r()
> +static inline u32 host1x_channel_channelctrl_kernel_filter_gbuffer_f(u32 v)
> +{
> +	return (v & 0x1) << 2;
> +}
> +#define HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(v) \
> +	host1x_channel_channelctrl_kernel_filter_gbuffer_f(v)
>  
>  #endif
> diff --git a/drivers/gpu/host1x/hw/hw_host1x05_channel.h b/drivers/gpu/host1x/hw/hw_host1x05_channel.h
> index fce6e2c1ff4c..abbbc2641ce6 100644
> --- a/drivers/gpu/host1x/hw/hw_host1x05_channel.h
> +++ b/drivers/gpu/host1x/hw/hw_host1x05_channel.h
> @@ -117,5 +117,17 @@ static inline u32 host1x_channel_dmactrl_dmainitget(void)
>  }
>  #define HOST1X_CHANNEL_DMACTRL_DMAINITGET \
>  	host1x_channel_dmactrl_dmainitget()
> +static inline u32 host1x_channel_channelctrl_r(void)
> +{
> +	return 0x98;
> +}
> +#define HOST1X_CHANNEL_CHANNELCTRL \
> +	host1x_channel_channelctrl_r()
> +static inline u32 host1x_channel_channelctrl_kernel_filter_gbuffer_f(u32 v)
> +{
> +	return (v & 0x1) << 2;
> +}
> +#define HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(v) \
> +	host1x_channel_channelctrl_kernel_filter_gbuffer_f(v)
>  
>  #endif
> 


-- 
Dmitry
