From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 17:24:55 +0300
Message-ID: <649cdfb4-214e-bf01-348d-f950628ecf9b@gmail.com>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
 <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
 <20190206130909.GJ21676@ulmo> <20190206131310.GK21676@ulmo>
 <d16dd60a-bfb4-75e8-3d19-97b565c815b0@gmail.com>
 <BYAPR12MB33983A0E93B17808DECFD0F2C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <6edef92d-66a7-0f70-e59e-7381b82516eb@gmail.com>
 <BYAPR12MB339826EB972C5DB7957E8A82C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB33989329D0E0C0049F1DEA6EC26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <20190206140141.GO21676@ulmo>
 <9b4bfee0-f3f2-bae7-5010-97a86bb5e03f@gmail.com>
 <BYAPR12MB3398D7685B5A7462161F9578C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398D7685B5A7462161F9578C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 17:19, Sowjanya Komatineni пишет:
>>>>> No, there are no timeout errors in PIO mode. I could post full log with the PIO-only mode if you want.
>>>>>
>>>> Yes please post full log of PIO only and DMA only Also, in above log, 
>>>> lots of DMA transfer went thru fine except this one transfer where 
>>>> DMA timed out.
>>>> DMA completion doesnt happen on DMA submit during this particular 
>>>> transaction timeframe for some reason.
>>>
>>> Dmitry, can you provide some background information on the setup that 
>>> you're using? I vaguely remember something about i2c@7000d000 being 
>>> special on older Tegra devices. Perhaps there's something additional 
>>> that we need to take into account?
>>>
>>> Aha! Look at tegra_i2c_reg_addr() which special-cases I2C_TX_FIFO on 
>>> the DVC variant of the controller, which is exactly the one that you 
>>> are seeing the timeouts on and it's exactly the register that we use 
>>> as destination for the DMA transfer.
>>>
>>> I think we need to do something like this:
>>>
>>> 	slv_config.dst_addr = i2c_dev->base_phys + 
>>> tegra_i2c_reg_addr(i2c_dev, I2C_TX_FIFO);
>>>
>>> to make sure we pass the right FIFO register address to DMA.
>>
>> I'm running it on T20 at the moment. I don't know about the DVC quirks, but sounds plausible. Please let me know if you need any other info.
>>
>> Here the full logs:
>>
>> PIO-only: http://dpaste.com/2MX3EAN.txt
>> DMA-only: http://dpaste.com/3VXZSSM.txt
>>
>> Note the "Failed to read T44 and T5 (-110)" error that happens in DMA-only. And it happens on i2c@7000c000, DVC is i2c@7000d000.
> 
> Yes this is due to same issue theirry mentioned.
> Prior to transfer timeout for touch, tps6586x regulator probe failed due to i2c timeout which uses DVC (7000D000) and since DMA mode is enforced all DVC/PWR I2C transactions also go thru DMA and FIFO register for DVC offset is not accounted when configure to dma slave.
> Will fix and send so you can see for repro with updated patch..
> 
> 
> [    0.925155] tegra-i2c 7000d000.i2c: starting DMA for length: 16
> [    0.925165] tegra-i2c 7000d000.i2c: unmasked irq: 0c
> [    1.028961] tegra-i2c 7000d000.i2c: i2c transfer timed out
> [    1.028968] tegra-i2c 7000c000.i2c: DMA transfer timeout
> [    1.028995] tps6586x 3-0034: Chip ID read failed: -110
> [    1.029029] tps6586x: probe of 3-0034 failed with error -5
> [    1.029045] atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-110)
> [    1.029051] atmel_mxt_ts 0-004c: Failed to read T44 and T5 (-110)
> 

I think tps6586x and atmel-touch should be independent issues, but will see. Thanks!
