From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V17 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 21:21:09 +0300
Message-ID: <3e4db3e9-8198-f1bf-f909-492bf1ff8c56@gmail.com>
References: <1549648195-3989-1-git-send-email-skomatineni@nvidia.com>
 <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
 <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
 <BYAPR12MB339810D394AC0A50934DD5EAC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB339810D394AC0A50934DD5EAC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "wsa@the-dreams.de" <wsa@the-dreams.de>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.02.2019 21:17, Sowjanya Komatineni пишет:
> 
>>>  static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
>>>  	.flags = I2C_AQ_NO_ZERO_LEN,
>>> +	.max_write_len = 65535 - I2C_PACKET_HEADER_SIZE,
>>
>> Ideally it should be SZ_64K - I2C_PACKET_HEADER_SIZE to not miss the one byte, otherwise good to me:
>>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> With SZ_64K - I2C_PACKET_HEADR_Size, When we compute dma_buf_size = max_write_len + I2C_PACKET_HEADER_SIZE, dma_buf_size will be SZ_64K which is 0x10000 apbdma dma count limit should be < 64K meaning 65535 max is allowed
> 

But it's for the GPCDMA, does it have the same 64K limit as APB DMA?
