From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Fri, 7 Jun 2019 15:12:39 +0300
Message-ID: <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
 <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

07.06.2019 15:08, Dmitry Osipenko пишет:
> 07.06.2019 14:55, Bitan Biswas пишет:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 4dfb4c1..c407bd7 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -73,6 +73,7 @@
>>  #define I2C_ERR_NO_ACK				BIT(0)
>>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>  
>>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * prevent overwriting past the end of buf
>>  	 */
>>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>  		val = cpu_to_le32(val);
>>  		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  		rx_fifo_avail--;
>>  	}
>>  
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>  	i2c_dev->msg_buf_remaining = buf_remaining;
>>  	i2c_dev->msg_buf = buf;
>>  
>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * boundary and fault.
>>  	 */
>>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>  		memcpy(&val, buf, buf_remaining);
>>  		val = le32_to_cpu(val);
>>  
>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  
>>  	if (!i2c_dev->is_curr_dma_xfer) {
>>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> -			if (i2c_dev->msg_buf_remaining)
>> +			if (i2c_dev->msg_buf_remaining) {
>>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>> -			else
>> -				BUG();
>> +			} else {
>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>> +				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
>> +				goto err;
>> +			}
>>  		}
>>  
>>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>  		if (i2c_dev->is_curr_dma_xfer)
>>  			i2c_dev->msg_buf_remaining = 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>  		complete(&i2c_dev->msg_complete);
>>  	}
>>  	goto done;
>>
> 
> Very nice, thank you very much! BTW, I think it may worth to add another
> patch that will reset hardware state in a case of the warning since we
> know that something gone wrong.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

Something like that:

 	complete(&i2c_dev->msg_complete);

	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
		goto err;
