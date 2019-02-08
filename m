From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V15 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 17:32:00 +0300
Message-ID: <96a3955f-ef4f-e4df-4907-6ec760fad3fe@gmail.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-3-git-send-email-skomatineni@nvidia.com>
 <1202cc91-cacf-673e-c32b-b4d1c78b71f2@gmail.com>
 <515cb722-c345-8dd6-dbe5-557dec0d1384@gmail.com>
 <a57f0374-8468-f24a-1743-b446b8260a46@gmail.com>
 <9e8f26bb-2159-6ca4-783e-91a73dac0823@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e8f26bb-2159-6ca4-783e-91a73dac0823@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mkarthik@nvidia.com" <mkarthik@nvidia.com>, "smohammed@nvidia.com" <smohammed@nvidia.com>, "talho@nvidia.com" <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.02.2019 17:12, Peter Rosin пишет:
> On 2019-02-08 13:46, Dmitry Osipenko wrote:
>> 08.02.2019 1:25, Dmitry Osipenko пишет:
>>>> 08.02.2019 1:16, Sowjanya Komatineni пишет:> 
>>>>>> This is wrong, 65535 = 64 * 1024 - 1.
>>>>>>
>>>>>> Let's just use size-constants provided by kernel:
>>>>>>
>>>>>> static const struct i2c_adapter_quirks tegra_i2c_quirks = {
>>>>>> 	.flags = I2C_AQ_NO_ZERO_LEN,
>>>>>> 	.max_read_len = SZ_4K,
>>>>>> 	.max_write_len = SZ_4K - I2C_PACKET_HEADER_SIZE, };
>>>>>>
>>>>>> static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
>>>>>> 	.flags = I2C_AQ_NO_ZERO_LEN,
>>>>>> 	.max_read_len = SZ_64K,
>>>>>> 	.max_write_len = SZ_64K - I2C_PACKET_HEADER_SIZE, };
>>>>>>
>>>>>>
>>>>>> I'll take a look at other patches later today, no need to send out new version right now.
>>>>>>
>>>>>>
>>>>>
>>>>> SIZE_64K is 0x00010000 (65536)
>>>>>
>>>>> msg len is u16 and max that can be set to msg.len is 65535
>>>
>>> Ah, okay. Then it looks about right, maybe it's time to change u16 to u32 in the I2C core.
>>>
>>
>> Here is my suggestion:
>>
>> 1) Use SZ_4K / SZ_64K that I suggested above.
>>
>> 2) Squash this patch into the DMA-patch.
>>
>> 3) Add another patch (before the DMA-patch) that changes max_read_len/max_write_len types to u32 in the include/linux/i2c.h
> 
> That is a bit naive and will not fly since the I2C core has a max message
> size of 65535. Which is exposed to user space...
> 
> Given the above, saying .max_read_len = 65535 a NOP (and is in fact omitted
> in places where it would be needed if the type is changed). I suggest that
> it is omitted here as well. But SZ_64K - I2C_PACKET_HEADER_SIZE is still
> needed of course. At least if I2C_PACKET_HEADER_SIZE is guaranteed to be
> non-zero?

Ah, I missed that message len is also u16 and then we indeed could just drop the "max_read_len" for T194. Thank you Peter.

Sowjanya, given the above, it probably better to define dma_buf max-size in the tegra_i2c_hw_feature.
