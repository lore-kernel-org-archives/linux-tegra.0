From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 18:24:26 +0300
Message-ID: <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.01.2019 18:12, Dmitry Osipenko пишет:
> 31.01.2019 9:16, Sowjanya Komatineni пишет:
>> This patch adds DMA support for Tegra I2C.
>>
>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
>> transfer size of the max FIFO depth and DMA mode is used for
>> transfer size higher than max FIFO depth to save CPU overhead.
>>
>> PIO mode needs full intervention of CPU to fill or empty FIFO's
>> and also need to service multiple data requests interrupt for the
>> same transaction. This adds delay between data bytes of the same
>> transfer when CPU is fully loaded and some slave devices has
>> internal timeout for no bus activity and stops transaction to
>> avoid bus hang. DMA mode is helpful in such cases.
>>
>> DMA mode is also helpful for Large transfers during downloading or
>> uploading FW over I2C to some external devices.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  [V8] : Moved back dma init to i2c probe, removed ALL_PACKETS_XFER_COMPLETE
>> 	interrupt and using PACKETS_XFER_COMPLETE interrupt only and some
>> 	other fixes
>> 	Updated Kconfig for APB_DMA dependency
>>  [V7] : Same as V6
>>  [V6] : Updated for proper buffer allocation/freeing, channel release.
>> 	Updated to use exact xfer size for syncing dma buffer.
>>  [V5] : Same as V4
>>  [V4] : Updated to allocate DMA buffer only when DMA mode.
>> 	Updated to fall back to PIO mode when DMA channel request or
>> 	buffer allocation fails.
>>  [V3] : Updated without additional buffer allocation.
>>  [V2] : Updated based on V1 review feedback along with code cleanup for
>> 	proper implementation of DMA.
>>
>>  drivers/i2c/busses/Kconfig     |   2 +-
>>  drivers/i2c/busses/i2c-tegra.c | 362 ++++++++++++++++++++++++++++++++++++++---
>>  2 files changed, 339 insertions(+), 25 deletions(-)
> 
> Tegra20 crashes because of this patch:
> 
[snip]
> <4>[    3.395915] ------------[ cut here ]------------
> <2>[    3.395919] kernel BUG at drivers/i2c/busses/i2c-tegra.c:810!
The BUG line is from:

	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
		if (i2c_dev->is_curr_dma_xfer)
			i2c_dev->msg_buf_remaining = 0;
		BUG_ON(i2c_dev->msg_buf_remaining);
		complete(&i2c_dev->msg_complete);
	}
