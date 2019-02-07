From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 23:22:48 +0300
Message-ID: <b72f8946-f921-f098-de36-e7f6203d6391@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <c6484ae8-65c7-885a-fe37-0666182cff29@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6484ae8-65c7-885a-fe37-0666182cff29@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.02.2019 22:14, Dmitry Osipenko пишет:
> 06.02.2019 22:16, Sowjanya Komatineni пишет:
>> +static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>> +				       size_t len)
>> +{
>> +	u32 val = 0, reg;
>> +	u8 dma_burst = 0;

There is no need to set dma_burst to zero as well. In general you only need to initialize variables if code uses the uninitialized variable.

>> +	struct dma_slave_config slv_config = {0};
>> +	struct dma_chan *chan;
>> +	int ret;
>> +	unsigned long reg_offset;
>> +
>> +	if (i2c_dev->hw->has_mst_fifo)
>> +		reg = I2C_MST_FIFO_CONTROL;
>> +	else
>> +		reg = I2C_FIFO_CONTROL;
>> +
>> +	if (i2c_dev->is_curr_dma_xfer) {
>> +		if (len & 0xF)
>> +			dma_burst = 1;
>> +		else if (len & 0x10)
>> +			dma_burst = 4;
>> +		else
>> +			dma_burst = 8;

In this case compiler just ignores the first initialization because it is explicitly initialized later on in the code path that actually uses the dma_burst variable. Avoiding unnecessary initialization helps to keep code a bit more clean.
