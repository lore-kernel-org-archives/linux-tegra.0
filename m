From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2 2/4] i2c: tegra: Update I2C transfer using buffer
Date: Fri, 25 Jan 2019 22:55:07 +0300
Message-ID: <185da588-1080-1589-46b6-5b63dff681eb@gmail.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
 <1548363113-25969-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548363113-25969-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

24.01.2019 23:51, Sowjanya Komatineni пишет:
> This patch prepares the buffer with the message bytes to be
> transmitted along with the packet header information and then
> performs i2c transfer in PIO mode.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V2] : DMA support changes include preparing buffer with message bytes and
> 	and header before sending them through DMA. So splitted the whole
> 	change into 2 seperate patches in this series.
> 
>  drivers/i2c/busses/i2c-tegra.c | 97 +++++++++++++++++++++++++++++-------------
>  1 file changed, 68 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ef854be4c837..13bce1411ddc 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -117,6 +117,9 @@
>  #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
>  #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
>  
> +/* Packet header size in bytes */
> +#define I2C_PACKET_HEADER_SIZE			12
> +
>  /*
>   * msg_end_type: The bus control which need to be send at end of transfer.
>   * @MSG_END_STOP: Send stop pulse at end of transfer.
> @@ -677,35 +680,69 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int tegra_i2c_start_pio_xfer(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 *buffer = (u32 *)i2c_dev->msg_buf;
> +	unsigned long flags;
> +	u32 int_mask;
> +
> +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
> +
> +	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> +	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> +
> +	i2c_writel(i2c_dev, *(buffer++), I2C_TX_FIFO);
> +	i2c_writel(i2c_dev, *(buffer++), I2C_TX_FIFO);
> +	i2c_writel(i2c_dev, *(buffer++), I2C_TX_FIFO);
> +
> +	i2c_dev->msg_buf = (u8 *) buffer;
> +
> +	if (!i2c_dev->msg_read)
> +		tegra_i2c_fill_tx_fifo(i2c_dev);
> +
> +	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
> +		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
> +	if (i2c_dev->msg_read)
> +		int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
> +	else if (i2c_dev->msg_buf_remaining)
> +		int_mask |= I2C_INT_TX_FIFO_DATA_REQ;
> +
> +	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> +	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
> +	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
> +		i2c_readl(i2c_dev, I2C_INT_MASK));
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	struct i2c_msg *msg, enum msg_end_type end_state)
>  {
>  	u32 packet_header;
>  	u32 int_mask;
>  	unsigned long time_left;
> -	unsigned long flags;
> +	u32 *buffer;
> +	int ret = 0;
> +
> +	buffer = kmalloc(ALIGN(msg->len, BYTES_PER_FIFO_WORD) +
> +					I2C_PACKET_HEADER_SIZE, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;

Isn't it possible to avoid "buffer" allocation / copying overhead and keep code as-is for the PIO mode?

[snip]
