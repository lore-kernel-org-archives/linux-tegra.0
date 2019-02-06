From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 16:34:52 +0300
Message-ID: <0cec3f47-6c47-b31d-74b5-696bd1f48596@gmail.com>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
 <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
 <c4f67e39-df72-cc56-216b-8e6014891b52@gmail.com>
 <BYAPR12MB3398E50ED1C6909D6BCB0DDFC26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <304c1916-e836-fa95-5cec-887fef8f3eb2@gmail.com>
 <BYAPR12MB33986680570EB919369000F3C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <82f38909-94f1-7984-2b0f-df6231aee58f@gmail.com>
 <BYAPR12MB3398B4A862E4BFA5344AE461C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB3398501ACBC54906F677C661C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398501ACBC54906F677C661C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 16:30, Sowjanya Komatineni пишет:
> 
> 
>>>
>>>>>> BTW, I'm seeing "atmel_mxt_ts 0-004c: Warning: Info CRC error - device=0xF436DC file=0x000000" whithout making any modifications to the original patch as well and it shall not happen, hence there is bug somewhere. Probably FIFO triggers are still not set up correctly... ?
>>>>>>
>>>>>>
>>>>> In snippet you sent, I see you are forcing dma_burst to 1 always which is what set for fifo trigger levels as well and also you are forcing dma all the time.
>>>>> So always it will be 1 word dma burst and 1 word trigger level and that should not be an issue.
>>>>>
>>>>
>>>> I reverted that snippet, this log is collected with the yours original patch.
>>>>
>>> From atmel driver, looks like this warning is from maxt_update_cfg 
>>> and due to CRC mismatch and above values shows read data CRC is 0Xf436dc which is compared against info_crc of all 0's Info_crc is based on raw config file and somehow its all 0's. this is not based on data read thru i2c.
>>> data->info_crc computed on data read is 0Xf436dc
>>>
>>> This warning is not related to I2C transfer
>>>
>>
>> It doesn't happen with the I2C PIO mode. Seems it means that the I2C reads out the 0xF436DC value instead of 0x000000.. if I'm not missing anything.
>>
> Log that you shared this warning, doesn’t show any i2c failures with atmel and CRC based on i2c read  data is 0Xf436dc.
> During this log, there are not DMA timeouts associated during this warning timeframe. So i2c read data is thru DMA which is non-zero.
> 
> Do you see DMA timeouts associated with this warning? I meant any DMA or I2C timeout during that time frame of warning?
> 

Actually you're right, my bad. That atmel error and atmel I2C timeout (due to I2C_ERR_NO_ACK) happens in the PIO mode too, hence that part is fine.

PIO log:

[    1.028889] atmel_mxt_ts 0-004c: Warning: Info CRC error - device=0xF436DC file=0x000000
[    1.078907] atmel_mxt_ts 0-004c: Resetting device
[    1.128646] usb 1-1: new full-speed USB device number 2 using tegra-ehci
[    1.198708] atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-121)
[    1.198732] atmel_mxt_ts 0-004c: Failed to read 28 messages (-121)
