From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V15 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 15:46:50 +0300
Message-ID: <a57f0374-8468-f24a-1743-b446b8260a46@gmail.com>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-3-git-send-email-skomatineni@nvidia.com>
 <1202cc91-cacf-673e-c32b-b4d1c78b71f2@gmail.com>
 <515cb722-c345-8dd6-dbe5-557dec0d1384@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <515cb722-c345-8dd6-dbe5-557dec0d1384@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.02.2019 1:25, Dmitry Osipenko пишет:
>> 08.02.2019 1:16, Sowjanya Komatineni пишет:> 
>>>> This is wrong, 65535 = 64 * 1024 - 1.
>>>>
>>>> Let's just use size-constants provided by kernel:
>>>>
>>>> static const struct i2c_adapter_quirks tegra_i2c_quirks = {
>>>> 	.flags = I2C_AQ_NO_ZERO_LEN,
>>>> 	.max_read_len = SZ_4K,
>>>> 	.max_write_len = SZ_4K - I2C_PACKET_HEADER_SIZE, };
>>>>
>>>> static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
>>>> 	.flags = I2C_AQ_NO_ZERO_LEN,
>>>> 	.max_read_len = SZ_64K,
>>>> 	.max_write_len = SZ_64K - I2C_PACKET_HEADER_SIZE, };
>>>>
>>>>
>>>> I'll take a look at other patches later today, no need to send out new version right now.
>>>>
>>>>
>>>
>>> SIZE_64K is 0x00010000 (65536)
>>>
>>> msg len is u16 and max that can be set to msg.len is 65535
> 
> Ah, okay. Then it looks about right, maybe it's time to change u16 to u32 in the I2C core.
> 

Here is my suggestion:

1) Use SZ_4K / SZ_64K that I suggested above.

2) Squash this patch into the DMA-patch.

3) Add another patch (before the DMA-patch) that changes max_read_len/max_write_len types to u32 in the include/linux/i2c.h
