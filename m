From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 16:06:45 +0300
Message-ID: <d3414641-5f5f-18b8-196f-50b3b9f26c58@gmail.com>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
 <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
 <BYAPR12MB33983AF91EA28744B7614971C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33983AF91EA28744B7614971C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 15:49, Sowjanya Komatineni пишет:
> 
>> 		TEGRA_I2C_TIMEOUT);
>>>  	tegra_i2c_mask_irq(i2c_dev, int_mask); @@ -814,6 +1133,7 @@ static 
>>> int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>  		time_left, completion_done(&i2c_dev->msg_complete),
>>>  		i2c_dev->msg_err);
>>>  
>>> +	i2c_dev->is_curr_dma_xfer = false;
>>
>> This line could be removed because there is no need to clear "is_curr_dma_xfer" at this point.
>>
> 
> It is needed because in case of ARB_LOST, we terminate dmaengine and then we perform bus clear operation. 
> On bus clear done interrupt, it again goes thru I2C error section to mask all interrupts and when curr_dma_xfer is true it does dmaengine terminate again so setting curr_dma_xfer as false when transfer in dma mode is done.

Ah, okay. Thank you for the clarification.

>>
>>
>> Sowjanya, I tried to enforce DMA transferring + setting DMA burst to a one word and this combination doesn't work well while it should, if I'm not missing something. Could >you please take a look at the problem or explain why that happens?
>>
>>
>> [    1.017496] tegra-i2c 7000c000.i2c: starting DMA for length: 120
>> [    1.017504] tegra-i2c 7000c000.i2c: unmasked irq: 0c
>> [    1.020896] tegra-i2c 7000c000.i2c: transfer complete: 11 0 0
>> [    1.020909] tegra-i2c 7000c000.i2c: starting DMA for length: 16
>> [    1.020918] tegra-i2c 7000c000.i2c: unmasked irq: 0c
>> [    1.021055] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
>> [    1.032230] tegra-i2c 7000c000.i2c: starting DMA for length: 16
>> [    1.032239] tegra-i2c 7000c000.i2c: unmasked irq: 0c
>> [    1.032359] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
>> [    1.032368] tegra-i2c 7000c000.i2c: starting DMA for length: 12
>> [    1.032376] tegra-i2c 7000c000.i2c: unmasked irq: 0c
>> [    1.032704] tegra-i2c 7000c000.i2c: transfer complete: 10 0 0
>> [    1.049224] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>
>>
> I don’t see any issue with dma burst of 1 word irrespective of transfers in always dma mode.
> One strange thing is in your above log, for last transaction after transfer complete, there is i2c transfer timed which doesn’t make sense.
> If transfer timeout happens, it returns from i2c transfer but shouldn’t go thru transfer complete

For now I don't have any good ideas about what is wrong, will take a closer look.

>> I'm now also wondering whether that putting packet_header into the dma_buf is really needed at all.. Isn't possible to push packet_header using PIO regardless of whether > the rest of the transfer will be in DMA or PIO modes?
>>
>> Actually I tried to always push packet_header using PIO and apparently DMA works just fine with that:
>>
> Ofcourse it will work using PIO for packet header and dma only for data bytes. But packet header is just 12 bytes so why not we transfer it along with data together thru dma.
> 

Okay!
