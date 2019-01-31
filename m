From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 20:11:29 +0300
Message-ID: <e50a353c-94c4-1a47-92a4-5f41f4f64aa7@gmail.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
 <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
 <BYAPR12MB3398CFEE7E912513AE48DD2FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398CFEE7E912513AE48DD2FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

31.01.2019 19:56, Sowjanya Komatineni пишет:
> 
>>>>  drivers/i2c/busses/Kconfig     |   2 +-
>>>>  drivers/i2c/busses/i2c-tegra.c | 362 
>>>> ++++++++++++++++++++++++++++++++++++++---
>>>>  2 files changed, 339 insertions(+), 25 deletions(-)
>>>
>>> Tegra20 crashes because of this patch:
>>>
>> [snip]
>>> <4>[    3.395915] ------------[ cut here ]------------
>>> <2>[    3.395919] kernel BUG at drivers/i2c/busses/i2c-tegra.c:810!
>> The BUG line is from:
>>
>> 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>> 		if (i2c_dev->is_curr_dma_xfer)
>> 			i2c_dev->msg_buf_remaining = 0;
>> 		BUG_ON(i2c_dev->msg_buf_remaining);
>> 		complete(&i2c_dev->msg_complete);
>> 	}
>>
> BUG_ON line is not part of this change. It was already there in existing driver.
> Based on log, I see DMA transfer is done for 224 bytes followed by 1 successful PIO transfer and then on next PIO transfer it received packet xfer complete interrupt with incomplete transfer bytes and that where it hit BUG_ON condition.
> 
> 

Yes, that BUG_ON is caused by the DMA transferring. Everything works fine be setting dma=false in the code, hence it's likely not a bug in the code (at least for now it looks fine), but likely that HW is not programmed correctly.
