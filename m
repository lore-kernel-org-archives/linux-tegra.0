From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 3/3] i2c: tegra: Add DMA Support
Date: Sat, 26 Jan 2019 20:11:11 +0300
Message-ID: <fc6f3214-8418-1c4e-90e4-70dd32d253ef@gmail.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
 <1548475073-12408-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548475073-12408-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.01.2019 6:57, Sowjanya Komatineni пишет:
> This patch adds DMA support for Tegra I2C.
> 
> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
> transfer size of the max FIFO depth and DMA mode is used for
> transfer size higher than max FIFO depth to save CPU overhead.
> 
> PIO mode needs full intervention of CPU to fill or empty FIFO's
> and also need to service multiple data requests interrupt for the
> same transaction adding overhead on CPU for large transfers.
> 
> DMA mode is helpful for Large transfers during downloading or
> uploading FW over I2C to some external devices.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> 
> ---
>  [V3] : Updated without additional buffer allocation.
>  [V2] : Updated based on V1 review feedback along with code cleanup for
> 	proper implementation of DMA.
> 
>  drivers/i2c/busses/i2c-tegra.c | 341 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 316 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 3dcbc9960d9d..452358a77400 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -8,6 +8,9 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dmapool.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> @@ -45,6 +48,8 @@
>  #define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
>  #define I2C_FIFO_CONTROL_TX_TRIG_SHIFT		5
>  #define I2C_FIFO_CONTROL_RX_TRIG_SHIFT		2
> +#define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
> +#define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
>  #define I2C_FIFO_STATUS				0x060
>  #define I2C_FIFO_STATUS_TX_MASK			0xF0
>  #define I2C_FIFO_STATUS_TX_SHIFT		4
> @@ -119,6 +124,16 @@
>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
>  
> +#define DATA_DMA_DIR_TX				(1 << 0)
> +#define DATA_DMA_DIR_RX				(1 << 1)
> +
> +/*
> + * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
> + * above this, controller will use DMA to fill FIFO.
> + * MAX PIO len is 20 bytes excluding packet header.
> + */
> +#define I2C_PIO_MODE_MAX_LEN			20
> +
>  /*
>   * msg_end_type: The bus control which need to be send at end of transfer.
>   * @MSG_END_STOP: Send stop pulse at end of transfer.
> @@ -179,6 +194,7 @@ struct tegra_i2c_hw_feature {
>   * @fast_clk: clock reference for fast clock of I2C controller
>   * @rst: reset control for the I2C controller
>   * @base: ioremapped registers cookie
> + * @phys_addr: Physical address of I2C base address to use for DMA configuration
>   * @cont_id: I2C controller ID, used for packet header
>   * @irq: IRQ number of transfer complete interrupt
>   * @irq_disabled: used to track whether or not the interrupt is enabled
> @@ -192,6 +208,14 @@ struct tegra_i2c_hw_feature {
>   * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>   * @xfer_lock: lock to serialize transfer submission and processing
> + * @has_dma: indicated if controller supports DMA

AFAIK, all Terga's support DMA. Let's change to "@has_dma: can utilize DMA" for clarity.

> + * @tx_dma_chan: DMA transmit channel
> + * @rx_dma_chan: DMA receive channel
> + * @dma_phys: handle to DMA resources
> + * @dma_buf: pointer to allocated DMA buffer
> + * @dma_buf_size: DMA buffer size
> + * @is_curr_dma_xfer: indicates active DMA transfer
> + * @dma_complete: DMA completion notifier
>   */
>  struct tegra_i2c_dev {
>  	struct device *dev;
> @@ -201,6 +225,7 @@ struct tegra_i2c_dev {
>  	struct clk *fast_clk;
>  	struct reset_control *rst;
>  	void __iomem *base;
> +	phys_addr_t phys_addr;
>  	int cont_id;
>  	int irq;
>  	bool irq_disabled;
> @@ -214,8 +239,18 @@ struct tegra_i2c_dev {
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_multimaster_mode;
>  	spinlock_t xfer_lock;
> +	bool has_dma;
> +	struct dma_chan *tx_dma_chan;
> +	struct dma_chan *rx_dma_chan;
> +	dma_addr_t dma_phys;
> +	u32 *dma_buf;
> +	unsigned int dma_buf_size;
> +	bool is_curr_dma_xfer;
> +	struct completion dma_complete;
>  };
>  
> +static struct dma_chan *chan;
> +
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  		       unsigned long reg)
>  {
> @@ -282,6 +317,75 @@ static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>  	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
>  }
>  
> +static void tegra_i2c_dma_complete(void *args)
> +{
> +	struct tegra_i2c_dev *i2c_dev = args;
> +
> +	complete(&i2c_dev->dma_complete);
> +}
> +
> +static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
> +{
> +	struct dma_async_tx_descriptor *dma_desc;
> +	enum dma_transfer_direction dir;
> +
> +	dev_dbg(i2c_dev->dev, "Starting DMA for length: %zu\n", len);
> +	reinit_completion(&i2c_dev->dma_complete);
> +	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
> +	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
> +					       len, dir, DMA_PREP_INTERRUPT |
> +					       DMA_CTRL_ACK);
> +	if (!dma_desc) {
> +		dev_err(i2c_dev->dev, "Failed to get DMA descriptor\n");
> +		return -EIO;
> +	}
> +
> +	dma_desc->callback = tegra_i2c_dma_complete;
> +	dma_desc->callback_param = i2c_dev;
> +	dmaengine_submit(dma_desc);
> +	dma_async_issue_pending(chan);
> +	return 0;
> +}
> +
> +static int tegra_i2c_init_dma_param(struct tegra_i2c_dev *i2c_dev,
> +				    bool dma_to_memory)
> +{
> +	struct dma_chan *dma_chan;
> +	u32 *dma_buf;
> +	dma_addr_t dma_phys;
> +	int ret;
> +	const char *chan_name = dma_to_memory ? "rx" : "tx";
> +
> +	dma_chan = dma_request_slave_channel_reason(i2c_dev->dev, chan_name);
> +	if (IS_ERR(dma_chan))
> +		return PTR_ERR(dma_chan);
> +
> +	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> +				     &dma_phys, GFP_KERNEL);
> +
> +	if (!dma_buf) {
> +		dev_err(i2c_dev->dev, "Failed to allocate the DMA buffer\n");
> +		ret = -ENOMEM;
> +		goto scrub;
> +	}
> +
> +	if (dma_to_memory)
> +		i2c_dev->rx_dma_chan = dma_chan;
> +	else
> +		i2c_dev->tx_dma_chan = dma_chan;
> +
> +	i2c_dev->dma_buf = dma_buf;
> +	i2c_dev->dma_phys = dma_phys;
> +
> +	return 0;
> +
> +scrub:
> +	dma_free_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
> +			  dma_buf, dma_phys);

Will dma_free_coherent() handle NULL ptr which will happen when dma_buf allocation fails for the RX init'ing?

> +	dma_release_channel(dma_chan);
> +	return ret;
> +}
> +
>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  {
>  	unsigned long timeout = jiffies + HZ;
> @@ -641,25 +745,45 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  		goto err;
>  	}
>  
> -	if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> -		if (i2c_dev->msg_buf_remaining)
> -			tegra_i2c_empty_rx_fifo(i2c_dev);
> -		else
> -			BUG();
> -	}
> +	if (!i2c_dev->is_curr_dma_xfer) {
> +		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> +			if (i2c_dev->msg_buf_remaining)
> +				tegra_i2c_empty_rx_fifo(i2c_dev);
> +			else
> +				BUG();
> +		}
>  
> -	if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> -		if (i2c_dev->msg_buf_remaining)
> -			tegra_i2c_fill_tx_fifo(i2c_dev);
> -		else
> -			tegra_i2c_mask_irq(i2c_dev, I2C_INT_TX_FIFO_DATA_REQ);
> +		if (!i2c_dev->msg_read &&
> +		   (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> +			if (i2c_dev->msg_buf_remaining)
> +				tegra_i2c_fill_tx_fifo(i2c_dev);
> +			else
> +				tegra_i2c_mask_irq(i2c_dev,
> +						   I2C_INT_TX_FIFO_DATA_REQ);
> +		}
>  	}
>  
>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>  
> -	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
> +	if (status & I2C_INT_ALL_PACKETS_XFER_COMPLETE) {
> +	/*
> +	 * During message read XFER_COMPLETE interrupt is triggered prior to
> +	 * DMA complete notification and during message write XFER_COMPLETE
> +	 * interrupt is triggered after DMA complete notification.
> +	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer.
> +	 * so forcing msg_buf_remaining to 0.
> +	 */
> +		if (i2c_dev->is_curr_dma_xfer)
> +			i2c_dev->msg_buf_remaining = 0;
> +		status |= I2C_INT_PACKET_XFER_COMPLETE;
> +		i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> +		if (!i2c_dev->msg_buf_remaining)
> +			complete(&i2c_dev->msg_complete);
> +	} else if (status & I2C_INT_PACKET_XFER_COMPLETE) {
> +		if (i2c_dev->is_curr_dma_xfer)
> +			i2c_dev->msg_buf_remaining = 0;
>  		BUG_ON(i2c_dev->msg_buf_remaining);
>  		complete(&i2c_dev->msg_complete);
>  	}
> @@ -668,17 +792,68 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	/* An error occurred, mask all interrupts */
>  	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
>  		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
> -		I2C_INT_RX_FIFO_DATA_REQ);
> +		I2C_INT_RX_FIFO_DATA_REQ | I2C_INT_ALL_PACKETS_XFER_COMPLETE);
>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>  
> +	if (i2c_dev->is_curr_dma_xfer) {
> +		dmaengine_terminate_all(chan);
> +		complete(&i2c_dev->dma_complete);
> +	}
> +
>  	complete(&i2c_dev->msg_complete);
>  done:
>  	spin_unlock(&i2c_dev->xfer_lock);
>  	return IRQ_HANDLED;
>  }
>  
> +static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
> +				       size_t len, int direction)
> +{
> +	u32 val, reg;
> +	u8 dma_burst = 0;
> +	struct dma_slave_config dma_sconfig;
> +
> +	if (i2c_dev->hw->has_mst_fifo)
> +		reg = I2C_MST_FIFO_CONTROL;
> +	else
> +		reg = I2C_FIFO_CONTROL;
> +	val = i2c_readl(i2c_dev, reg);
> +
> +	if (len & 0xF)
> +		dma_burst = 1;
> +	else if (len & 0x10)
> +		dma_burst = 4;
> +	else
> +		dma_burst = 8;

I'm still wondering whether dma_burst < 8 negatively affects transfer efficiency. Could you please clarify?

> +
> +	if (direction == DATA_DMA_DIR_TX) {
> +		if (i2c_dev->hw->has_mst_fifo)
> +			val |= I2C_MST_FIFO_CONTROL_TX_TRIG(dma_burst);
> +		else
> +			val |= I2C_FIFO_CONTROL_TX_TRIG(dma_burst);
> +	} else {
> +		if (i2c_dev->hw->has_mst_fifo)
> +			val |= I2C_MST_FIFO_CONTROL_RX_TRIG(dma_burst);
> +		else
> +			val |= I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
> +	}
> +	i2c_writel(i2c_dev, val, reg);
> +
> +	if (direction == DATA_DMA_DIR_TX) {
> +		dma_sconfig.dst_addr = i2c_dev->phys_addr + I2C_TX_FIFO;
> +		dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		dma_sconfig.dst_maxburst = dma_burst;
> +	} else {
> +		dma_sconfig.src_addr = i2c_dev->phys_addr + I2C_RX_FIFO;
> +		dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		dma_sconfig.src_maxburst = dma_burst;
> +	}
> +
> +	dmaengine_slave_config(chan, &dma_sconfig);
> +}
> +
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	struct i2c_msg *msg, enum msg_end_type end_state)
>  {
> @@ -688,6 +863,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	unsigned long flags;
>  	u16 xfer_time = 100;
>  	size_t xfer_size = 0;
> +	u32 *buffer = 0;
> +	int ret = 0;
> +	bool dma = false;
>  
>  	if (msg->flags & I2C_M_RD)
>  		xfer_size = ALIGN(msg->len, BYTES_PER_FIFO_WORD);
> @@ -698,6 +876,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	xfer_time += DIV_ROUND_CLOSEST((xfer_size * 9) * 1000,
>  					i2c_dev->bus_clk_rate);
>  
> +	dma = ((xfer_size > I2C_PIO_MODE_MAX_LEN) &&
> +		i2c_dev->tx_dma_chan && i2c_dev->rx_dma_chan);

There is no need to allocate resources for DMA until dma==true, let's postpone channels requesting and dma_buf allocation until they are really needed.

Please factor out DMA resorces allocation into something like this:

int tegra_i2c_init_dma_resorces(struct tegra_i2c_dev *i2c_dev)
{
	struct dma_chan *dma_rx, *dma_tx;
	dma_addr_t dma_phys;
	u32 *dma_buf;
	int err;

	if (i2c_dev->dma_buf)
		return 0;

	if (!i2c_dev->has_dma)
		return -EINVAL;

	dma_rx = dma_request_slave_channel_reason(i2c_dev->dev, "rx");
	if (IS_ERR(dma_rx))
		return PTR_ERR(dma_rx);

	dma_tx = dma_request_slave_channel_reason(i2c_dev->dev, "tx");
	if (IS_ERR(dma_tx)) {
		err = PTR_ERR(dma_tx);
		goto err_release_rx;
	}

	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
	if (!dma_buf) {
		dev_err(i2c_dev->dev, "Failed to allocate the DMA buffer\n");
		err = -ENOMEM;
		goto err_release_tx;
	}

	i2c_dev->dma_buf = dma_buf;
	i2c_dev->dma_phys = dma_phys;
	i2c_dev->rx_dma_chan = dma_rx;
	i2c_dev->tx_dma_chan = dma_tx;

err_release_tx:
	dma_release_channel(dma_tx);
err_release_rx:
	dma_release_channel(dma_rx);

	return err;
}

...

and then:

	dma = (xfer_size > I2C_PIO_MODE_MAX_LEN);
	if (dma) {
		err = tegra_i2c_init_dma_resorces(i2c_dev);
		if (err)
			dma = false;
	}

> +
> +	i2c_dev->is_curr_dma_xfer = dma;
> +
>  	tegra_i2c_flush_fifos(i2c_dev);
>  
>  	i2c_dev->msg_buf = msg->buf;
> @@ -711,14 +894,50 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	tegra_i2c_unmask_irq(i2c_dev, int_mask);
>  
> +	if (dma) {
> +		if (i2c_dev->msg_read) {
> +			chan = i2c_dev->rx_dma_chan;
> +			tegra_i2c_config_fifo_trig(i2c_dev, xfer_size,
> +						   DATA_DMA_DIR_RX);
> +			/* make the dma buffer to read by dma */
> +			dma_sync_single_for_device(i2c_dev->dev,
> +						   i2c_dev->dma_phys,
> +						   i2c_dev->dma_buf_size,

Why not use the size of transfer for the syncing?

> +						   DMA_FROM_DEVICE);
> +			ret = tegra_i2c_dma_submit(i2c_dev, xfer_size);
> +			if (ret < 0) {
> +				dev_err(i2c_dev->dev,
> +					"Starting RX DMA failed, err %d\n",
> +					ret);
> +				goto exit;
> +			}
> +		} else {
> +			chan = i2c_dev->tx_dma_chan;
> +			tegra_i2c_config_fifo_trig(i2c_dev, xfer_size,
> +						   DATA_DMA_DIR_TX);
> +			/* Make the dma buffer to read by cpu */
> +			dma_sync_single_for_cpu(i2c_dev->dev,
> +						i2c_dev->dma_phys,
> +						i2c_dev->dma_buf_size,> +						DMA_TO_DEVICE);
> +			buffer = (u32 *)i2c_dev->dma_buf;
> +		}
> +	}
> +
>  	packet_header = (0 << PACKET_HEADER0_HEADER_SIZE_SHIFT) |
>  			PACKET_HEADER0_PROTOCOL_I2C |
>  			(i2c_dev->cont_id << PACKET_HEADER0_CONT_ID_SHIFT) |
>  			(1 << PACKET_HEADER0_PACKET_ID_SHIFT);
> -	i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +	if (dma && !i2c_dev->msg_read)
> +		*buffer++ = packet_header;
> +	else
> +		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
>  
>  	packet_header = msg->len - 1;
> -	i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +	if (dma && !i2c_dev->msg_read)
> +		*buffer++ = packet_header;
> +	else
> +		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
>  
>  	packet_header = I2C_HEADER_IE_ENABLE;
>  	if (end_state == MSG_END_CONTINUE)
> @@ -735,29 +954,85 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		packet_header |= I2C_HEADER_CONT_ON_NAK;
>  	if (msg->flags & I2C_M_RD)
>  		packet_header |= I2C_HEADER_READ;
> -	i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> -
> -	if (!(msg->flags & I2C_M_RD))
> -		tegra_i2c_fill_tx_fifo(i2c_dev);
> -
> +	if (dma && !i2c_dev->msg_read)
> +		*buffer++ = packet_header;
> +	else
> +		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> +
> +	if (!i2c_dev->msg_read) {
> +		if (dma) {
> +			memcpy(buffer, msg->buf, msg->len);
> +			/* make the dma buffer to read by dma */
> +			dma_sync_single_for_device(i2c_dev->dev,
> +						   i2c_dev->dma_phys,
> +						   i2c_dev->dma_buf_size,
> +						   DMA_TO_DEVICE);
> +			ret = tegra_i2c_dma_submit(i2c_dev, xfer_size);
> +			if (ret < 0) {
> +				dev_err(i2c_dev->dev,
> +					"Starting TX DMA failed, err %d\n",
> +					ret);
> +				goto exit;
> +			}
> +		} else {
> +			tegra_i2c_fill_tx_fifo(i2c_dev);
> +		}
> +	}
>  	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
>  		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
> -	if (msg->flags & I2C_M_RD)
> -		int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
> -	else if (i2c_dev->msg_buf_remaining)
> -		int_mask |= I2C_INT_TX_FIFO_DATA_REQ;
> +	if (dma) {
> +		int_mask |= I2C_INT_ALL_PACKETS_XFER_COMPLETE;
> +	} else {
> +		if (msg->flags & I2C_M_RD)
> +			int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
> +		else if (i2c_dev->msg_buf_remaining)
> +			int_mask |= I2C_INT_TX_FIFO_DATA_REQ;
> +	}
>  
>  	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> -	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
>  	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
>  		i2c_readl(i2c_dev, I2C_INT_MASK));
>  
> +exit:
> +	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
> +	if (ret)
> +		return ret;
> +
> +	if (dma) {
> +		time_left = wait_for_completion_timeout(
> +						&i2c_dev->dma_complete,
> +						TEGRA_I2C_TIMEOUT(xfer_time));
> +
> +		if (time_left == 0) {
> +			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
> +			dmaengine_terminate_all(chan);
> +			tegra_i2c_init(i2c_dev);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c_dev->msg_read) {
> +			if (likely(i2c_dev->msg_err == I2C_ERR_NONE)) {
> +				dma_sync_single_for_cpu(i2c_dev->dev,
> +							i2c_dev->dma_phys,
> +							i2c_dev->dma_buf_size,
> +							DMA_FROM_DEVICE);
> +
> +				memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
> +					msg->len);
> +			}
> +		}
> +	}
> +
>  	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
>  						TEGRA_I2C_TIMEOUT(xfer_time));
>  	tegra_i2c_mask_irq(i2c_dev, int_mask);
>  
>  	if (time_left == 0) {
>  		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
> +		if (dma) {
> +			dmaengine_terminate_all(chan);
> +			complete(&i2c_dev->dma_complete);
> +		}
>  
>  		tegra_i2c_init(i2c_dev);
>  		return -ETIMEDOUT;
> @@ -835,6 +1110,8 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  
>  	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
>  			"multi-master");
> +
> +	i2c_dev->has_dma = of_property_read_bool(np, "dmas");
>  }
>  
>  static const struct i2c_algorithm tegra_i2c_algo = {
> @@ -947,11 +1224,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	struct clk *div_clk;
>  	struct clk *fast_clk;
>  	void __iomem *base;
> +	phys_addr_t phys_addr;
>  	int irq;
>  	int ret = 0;
>  	int clk_multiplier = I2C_CLK_MULTIPLIER_STD_FAST_MODE;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	phys_addr = res->start;
>  	base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> @@ -974,12 +1253,14 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	i2c_dev->base = base;
> +	i2c_dev->phys_addr = phys_addr;
>  	i2c_dev->div_clk = div_clk;
>  	i2c_dev->adapter.algo = &tegra_i2c_algo;
>  	i2c_dev->adapter.quirks = &tegra_i2c_quirks;
>  	i2c_dev->irq = irq;
>  	i2c_dev->cont_id = pdev->id;
>  	i2c_dev->dev = &pdev->dev;
> +	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len;
>  
>  	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
>  	if (IS_ERR(i2c_dev->rst)) {
> @@ -994,6 +1275,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  						  "nvidia,tegra20-i2c-dvc");
>  	init_completion(&i2c_dev->msg_complete);
>  	spin_lock_init(&i2c_dev->xfer_lock);
> +	init_completion(&i2c_dev->dma_complete);
>  
>  	if (!i2c_dev->hw->has_single_clk_source) {
>  		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
> @@ -1053,6 +1335,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (i2c_dev->has_dma) {
> +		ret = tegra_i2c_init_dma_param(i2c_dev, true);
> +		if (ret == -EPROBE_DEFER)
> +			goto disable_div_clk;

So now dma_buf has been allocated by initing the RX channel.

> +		ret = tegra_i2c_init_dma_param(i2c_dev, false);

And now dma_buf will be allocated second time for the TX?

> +		if (ret == -EPROBE_DEFER)
> +			goto disable_div_clk;

Where is RX channel releasing when TX init fails?

> +	}

No channels / dma_buf releasing in tegra_i2c_remove()? 

> +
>  	ret = tegra_i2c_init(i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
> 

Please collect performance stats before posting new version of the patch.
