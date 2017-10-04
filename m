From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] soc/tegra: fuse: Explicitly request DMA channel
 from APB DMA driver
Date: Wed, 4 Oct 2017 14:11:46 +0300
Message-ID: <71f3dbe4-6de1-c864-18cc-28aa4734a414@gmail.com>
References: <cover.1507068874.git.digetx@gmail.com>
 <c2b55552d079f47564456ebfcd982116aad32be8.1507068874.git.digetx@gmail.com>
 <a877b502-9c26-d27f-ab29-14918afa030c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a877b502-9c26-d27f-ab29-14918afa030c-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04.10.2017 13:48, Jon Hunter wrote:
> 
> 
> On 03/10/17 23:35, Dmitry Osipenko wrote:
>> Currently fuse driver requests DMA channel from an arbitrary DMA device,
>> it is not a problem since there is only one DMA provider for Tegra20 yet,
>> but it will become troublesome once another provider will be added.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/soc/tegra/fuse/fuse-tegra20.c | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
>> index a33f48c06771..e9e127a24c70 100644
>> --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
>> +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
>> @@ -37,6 +37,11 @@
>>  #define FUSE_UID_LOW	0x08
>>  #define FUSE_UID_HIGH	0x0c
>>  
>> +static const struct of_device_id apbdma_of_match[] = {
>> +	{ .compatible = "nvidia,tegra20-apbdma" },
>> +	{ },
>> +};
>> +
>>  static u32 tegra20_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
>>  {
>>  	return readl_relaxed(fuse->base + FUSE_BEGIN + offset);
>> @@ -96,6 +101,11 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
>>  	return value;
>>  }
>>  
>> +static bool dma_filter(struct dma_chan *chan, void *filter_param)
>> +{
>> +	return of_match_device(apbdma_of_match, chan->device->dev) != NULL;
> 
> Is it simpler just to use of_device_is_compatible() here?
> 

Good point! I haven't noticed that function in the OF API.
