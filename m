From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6] i2c: tegra: remove BUG, BUG_ON
Date: Fri, 14 Jun 2019 20:51:51 +0300
Message-ID: <504e19d0-05dd-dc80-3aaf-cdab8f88002d@gmail.com>
References: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

14.06.2019 18:50, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Remove BUG() and mask Rx interrupt similar as Tx
> for message fully sent case. Add WARN_ON_ONCE check
> for non-zero rx_fifo_avail in tegra_i2c_empty_rx_fifo()
> after all processing. Error handling in tegra_i2c_empty_rx_fifo
> caller is also added.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..26a7c8c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)

What about I2C_ERR_RX_BUFFER_OVERFLOW?

>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -515,15 +516,23 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/* buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function
> +		 */

Please start all multiline comments with an empty "/*", it should be the correct
style. There are some places in the kernel where style like yours is used, but I
assume they are not very correct. Besides, yours variant is not consistent with the
style of the rest of comments in this source file. And put a dot in the end for
completeness. Same for the other comments in this patch.

>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
>  		buf_remaining = 0;
>  		rx_fifo_avail--;
>  	}

Please add a newline here. All logical parts of the code should be separated to ease
reading and following.

> +	if (WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	/* buf_remaining > 0 at this point can only have rx_fifo_avail == 0
> +	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
> +	 * case earlier in this function
> +	 */
>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;
>  
> @@ -581,7 +590,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * boundary and fault.
>  	 */
>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/* buf_remaining > 3 check not needed as tx_fifo_avail == 0
> +		 * when (words_to_transfer was > tx_fifo_avail) earlier
> +		 * in this function for non-zero words_to_transfer
> +		 */
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
>  
> @@ -811,6 +823,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	u32 status;
>  	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	struct tegra_i2c_dev *i2c_dev = dev_id;
> +	int err_val;
>  
>  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>  
> @@ -847,10 +860,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  
>  	if (!i2c_dev->is_curr_dma_xfer) {
>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> -			if (i2c_dev->msg_buf_remaining)
> -				tegra_i2c_empty_rx_fifo(i2c_dev);
> -			else
> -				BUG();
> +			err_val = tegra_i2c_empty_rx_fifo(i2c_dev);
> +			if ((!(i2c_dev->msg_buf_remaining)) &&

Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL for that case.
This will make code to look cleaner.

> +			    (!(status & I2C_INT_PACKET_XFER_COMPLETE)) &&

It shouldn't matter that XFER_COMPLETE is set if RX FIFO isn't fully emptied because
it always shall be emptied. Hence this check is not needed and we should error out
regardless.

> +			    err_val) {
> +				/*
> +				 * Overflow error condition: message fully sent,
> +				 * with no XFER_COMPLETE interrupt but hardware
> +				 * asks to transfer more.
> +				 */
> +				tegra_i2c_mask_irq(i2c_dev,
> +						   I2C_INT_RX_FIFO_DATA_REQ);

No need to mask RX_FIFO_DATA_REQ here because all interrupts are masked on "goto
err:", hence just remove the tegra_i2c_mask_irq().

> +				i2c_dev->msg_err |=
> +					I2C_ERR_UNEXPECTED_STATUS;

No need to split this into two lines because it's less than 80 chars, write this in a
single line.

> +				goto err;
> +			}
>  		}
>  
>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> @@ -876,7 +900,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		/* Underflow error condition: XFER_COMPLETE before message
> +		 * fully sent.
> +		 */
> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
> +			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
> +			goto err;
> +		}
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> 

Please address comments in the next revision.
