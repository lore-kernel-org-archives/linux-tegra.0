From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Mon, 10 Jun 2019 21:18:16 +0300
Message-ID: <e41fc7cc-6e7f-4c29-6650-d984bb26336c@gmail.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
 <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

10.06.2019 21:12, Dmitry Osipenko пишет:
> 10.06.2019 20:08, Bitan Biswas пишет:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Remove BUG() and make Rx and Tx case handling
>> similar.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> Looks that this is still not correct. What if it transfer-complete flag
> is set and buffer is full on RX? In this case the transfer will succeed
> while it was a failure.
> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 4dfb4c1..30619d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * prevent overwriting past the end of buf
>>  	 */
>>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
> 
> Actually error should be returned here since out-of-bounds memory
> accesses must be avoided, hence:
> 
> 	if (WARN_ON_ONCE(buf_remaining > 3))
> 		return -EINVAL;
> 
>>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>  		val = cpu_to_le32(val);
>>  		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  		rx_fifo_avail--;
>>  	}
>>  
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> 
> Better not to ignore this as well:
> 
> 	if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
> 			 buf_remaining > 0))
> 		return -EINVAL;
> 
>>  	i2c_dev->msg_buf_remaining = buf_remaining;
>>  	i2c_dev->msg_buf = buf;
>>  
>> @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * boundary and fault.
>>  	 */
>>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
> 
> And here, cause this will corrupt stack:
> 
> 		if (WARN_ON_ONCE(buf_remaining > 3))
> 			return -EINVAL;
> 
>>  		memcpy(&val, buf, buf_remaining);
>>  		val = le32_to_cpu(val);
>>  
>> @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  			if (i2c_dev->msg_buf_remaining)
>>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>>  			else
>> -				BUG();
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_RX_FIFO_DATA_REQ);
> 
> Then here:
> 
> 	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||

Also note that this check could be moved out to the beginning of
tegra_i2c_empty_rx_fifo().
