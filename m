From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3] dmaengine: tegra210-adma: fix transfer failure
Date: Mon, 16 Sep 2019 14:57:48 +0530
Message-ID: <447057ae-235f-823c-b3a9-d1500e4f10f6@nvidia.com>
References: <1568623038-20879-1-git-send-email-spujar@nvidia.com>
 <05b78209-5e9a-410a-9307-21dc1410180a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <05b78209-5e9a-410a-9307-21dc1410180a@nvidia.com>
Content-Language: en-GB
Sender: stable-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, vkoul@kernel.org, ldewangan@nvidia.com
Cc: thierry.reding@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 9/16/2019 2:54 PM, Jon Hunter wrote:
> On 16/09/2019 09:37, Sameer Pujar wrote:
>>  From Tegra186 onwards OUTSTANDING_REQUESTS field is added in channel
>> configuration register(bits 7:4) which defines the maximum number of reads
>> from the source and writes to the destination that may be outstanding at
>> any given point of time. This field must be programmed with a value
>> between 1 and 8. A value of 0 will prevent any transfers from happening.
>>
>> Thus added 'has_outstanding_reqs' bool member in chip data structure and is
>> set to false for Tegra210, since the field is not applicable. For Tegra186
>> it is set to true and channel configuration is updated with maximum
>> outstanding requests.
>>
>> Fixes: 433de642a76c ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")
>> Cc: stable@vger.kernel.org
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   drivers/dma/tegra210-adma.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
>> index 5f8adf5..e19732f 100644
>> --- a/drivers/dma/tegra210-adma.c
>> +++ b/drivers/dma/tegra210-adma.c
>> @@ -66,6 +66,8 @@
>>   #define TEGRA186_FIFO_CTRL_DEFAULT (TEGRA186_ADMA_CH_FIFO_CTRL_TXSIZE(3) | \
>>   				    TEGRA186_ADMA_CH_FIFO_CTRL_RXSIZE(3))
>>   
>> +#define TEGRA186_ADMA_CH_CONFIG_OUTSTANDING_REQS(reqs)	(reqs << 4)
>> +
> Shouldn't we place this under the defines for ADMA_CH_CONFIG register?
> This would be consistent with how we organise the definitions today.
yes, will move.
>
>>   #define ADMA_CH_REG_FIELD_VAL(val, mask, shift)	(((val) & mask) << shift)
>>   
>>   struct tegra_adma;
>> @@ -77,6 +79,7 @@ struct tegra_adma;
>>    * @ch_req_tx_shift: Register offset for AHUB transmit channel select.
>>    * @ch_req_rx_shift: Register offset for AHUB receive channel select.
>>    * @ch_base_offset: Register offset of DMA channel registers.
>> + * @has_outstanding_reqs: If DMA channel can have outstanding requests.
>>    * @ch_fifo_ctrl: Default value for channel FIFO CTRL register.
>>    * @ch_req_mask: Mask for Tx or Rx channel select.
>>    * @ch_req_max: Maximum number of Tx or Rx channels available.
>> @@ -95,6 +98,7 @@ struct tegra_adma_chip_data {
>>   	unsigned int ch_req_max;
>>   	unsigned int ch_reg_size;
>>   	unsigned int nr_channels;
>> +	bool has_outstanding_reqs;
>>   };
>>   
>>   /*
>> @@ -594,6 +598,8 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
>>   			 ADMA_CH_CTRL_FLOWCTRL_EN;
>>   	ch_regs->config |= cdata->adma_get_burst_config(burst_size);
>>   	ch_regs->config |= ADMA_CH_CONFIG_WEIGHT_FOR_WRR(1);
>> +	if (cdata->has_outstanding_reqs)
>> +		ch_regs->config |= TEGRA186_ADMA_CH_CONFIG_OUTSTANDING_REQS(8);
>>   	ch_regs->fifo_ctrl = cdata->ch_fifo_ctrl;
>>   	ch_regs->tc = desc->period_len & ADMA_CH_TC_COUNT_MASK;
>>   
>> @@ -778,6 +784,7 @@ static const struct tegra_adma_chip_data tegra210_chip_data = {
>>   	.ch_req_tx_shift	= 28,
>>   	.ch_req_rx_shift	= 24,
>>   	.ch_base_offset		= 0,
>> +	.has_outstanding_reqs	= false,
>>   	.ch_fifo_ctrl		= TEGRA210_FIFO_CTRL_DEFAULT,
>>   	.ch_req_mask		= 0xf,
>>   	.ch_req_max		= 10,
>> @@ -792,6 +799,7 @@ static const struct tegra_adma_chip_data tegra186_chip_data = {
>>   	.ch_req_tx_shift	= 27,
>>   	.ch_req_rx_shift	= 22,
>>   	.ch_base_offset		= 0x10000,
>> +	.has_outstanding_reqs	= true,
>>   	.ch_fifo_ctrl		= TEGRA186_FIFO_CTRL_DEFAULT,
>>   	.ch_req_mask		= 0x1f,
>>   	.ch_req_max		= 20,
>>
> Otherwise ...
>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>
> Cheers
> Jon
>
