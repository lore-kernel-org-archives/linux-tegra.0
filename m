From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 3/3] i2c: tegra: Add DMA Support
Date: Sat, 26 Jan 2019 21:16:21 +0300
Message-ID: <a2ea9d8e-e2ab-5e43-912f-dc4888e509a6@gmail.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
 <1548475073-12408-3-git-send-email-skomatineni@nvidia.com>
 <fc6f3214-8418-1c4e-90e4-70dd32d253ef@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fc6f3214-8418-1c4e-90e4-70dd32d253ef@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.01.2019 20:11, Dmitry Osipenko пишет:
> 26.01.2019 6:57, Sowjanya Komatineni пишет:
>> This patch adds DMA support for Tegra I2C.
>>
>> Tegra I2C TX and RX FIFO depth is 8 words. PIO mode is used for
>> transfer size of the max FIFO depth and DMA mode is used for
>> transfer size higher than max FIFO depth to save CPU overhead.
>>
>> PIO mode needs full intervention of CPU to fill or empty FIFO's
>> and also need to service multiple data requests interrupt for the
>> same transaction adding overhead on CPU for large transfers.
>>
>> DMA mode is helpful for Large transfers during downloading or
>> uploading FW over I2C to some external devices.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>
>> ---
>>  [V3] : Updated without additional buffer allocation.
>>  [V2] : Updated based on V1 review feedback along with code cleanup for
>> 	proper implementation of DMA.
>>
>>  drivers/i2c/busses/i2c-tegra.c | 341 ++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 316 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 3dcbc9960d9d..452358a77400 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -8,6 +8,9 @@
>>  
>>  #include <linux/clk.h>
>>  #include <linux/delay.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dmapool.h>
>> +#include <linux/dma-mapping.h>
>>  #include <linux/err.h>
>>  #include <linux/i2c.h>
>>  #include <linux/init.h>
>> @@ -45,6 +48,8 @@
>>  #define I2C_FIFO_CONTROL_RX_FLUSH		BIT(0)
>>  #define I2C_FIFO_CONTROL_TX_TRIG_SHIFT		5
>>  #define I2C_FIFO_CONTROL_RX_TRIG_SHIFT		2
>> +#define I2C_FIFO_CONTROL_TX_TRIG(x)		(((x) - 1) << 5)
>> +#define I2C_FIFO_CONTROL_RX_TRIG(x)		(((x) - 1) << 2)
>>  #define I2C_FIFO_STATUS				0x060
>>  #define I2C_FIFO_STATUS_TX_MASK			0xF0
>>  #define I2C_FIFO_STATUS_TX_SHIFT		4
>> @@ -119,6 +124,16 @@
>>  /* Packet header size in bytes */
>>  #define I2C_PACKET_HEADER_SIZE			12
>>  
>> +#define DATA_DMA_DIR_TX				(1 << 0)
>> +#define DATA_DMA_DIR_RX				(1 << 1)
>> +
>> +/*
>> + * Upto I2C_PIO_MODE_MAX_LEN bytes, controller will use PIO mode,
>> + * above this, controller will use DMA to fill FIFO.
>> + * MAX PIO len is 20 bytes excluding packet header.
>> + */
>> +#define I2C_PIO_MODE_MAX_LEN			20
>> +
>>  /*
>>   * msg_end_type: The bus control which need to be send at end of transfer.
>>   * @MSG_END_STOP: Send stop pulse at end of transfer.
>> @@ -179,6 +194,7 @@ struct tegra_i2c_hw_feature {
>>   * @fast_clk: clock reference for fast clock of I2C controller
>>   * @rst: reset control for the I2C controller
>>   * @base: ioremapped registers cookie
>> + * @phys_addr: Physical address of I2C base address to use for DMA configuration
>>   * @cont_id: I2C controller ID, used for packet header
>>   * @irq: IRQ number of transfer complete interrupt
>>   * @irq_disabled: used to track whether or not the interrupt is enabled
>> @@ -192,6 +208,14 @@ struct tegra_i2c_hw_feature {
>>   * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>>   * @xfer_lock: lock to serialize transfer submission and processing
>> + * @has_dma: indicated if controller supports DMA
> 
> AFAIK, all Terga's support DMA. Let's change to "@has_dma: can utilize DMA" for clarity.
> 
>> + * @tx_dma_chan: DMA transmit channel
>> + * @rx_dma_chan: DMA receive channel
>> + * @dma_phys: handle to DMA resources
>> + * @dma_buf: pointer to allocated DMA buffer
>> + * @dma_buf_size: DMA buffer size
>> + * @is_curr_dma_xfer: indicates active DMA transfer
>> + * @dma_complete: DMA completion notifier
>>   */
>>  struct tegra_i2c_dev {
>>  	struct device *dev;
>> @@ -201,6 +225,7 @@ struct tegra_i2c_dev {
>>  	struct clk *fast_clk;
>>  	struct reset_control *rst;
>>  	void __iomem *base;
>> +	phys_addr_t phys_addr;
>>  	int cont_id;
>>  	int irq;
>>  	bool irq_disabled;
>> @@ -214,8 +239,18 @@ struct tegra_i2c_dev {
>>  	u16 clk_divisor_non_hs_mode;
>>  	bool is_multimaster_mode;
>>  	spinlock_t xfer_lock;
>> +	bool has_dma;
>> +	struct dma_chan *tx_dma_chan;
>> +	struct dma_chan *rx_dma_chan;
>> +	dma_addr_t dma_phys;
>> +	u32 *dma_buf;
>> +	unsigned int dma_buf_size;
>> +	bool is_curr_dma_xfer;
>> +	struct completion dma_complete;
>>  };
>>  
>> +static struct dma_chan *chan;
>> +
>>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>  		       unsigned long reg)
>>  {
>> @@ -282,6 +317,75 @@ static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>>  	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
>>  }
>>  
>> +static void tegra_i2c_dma_complete(void *args)
>> +{
>> +	struct tegra_i2c_dev *i2c_dev = args;
>> +
>> +	complete(&i2c_dev->dma_complete);
>> +}
>> +
>> +static int tegra_i2c_dma_submit(struct tegra_i2c_dev *i2c_dev, size_t len)
>> +{
>> +	struct dma_async_tx_descriptor *dma_desc;
>> +	enum dma_transfer_direction dir;
>> +
>> +	dev_dbg(i2c_dev->dev, "Starting DMA for length: %zu\n", len);
>> +	reinit_completion(&i2c_dev->dma_complete);
>> +	dir = i2c_dev->msg_read ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
>> +	dma_desc = dmaengine_prep_slave_single(chan, i2c_dev->dma_phys,
>> +					       len, dir, DMA_PREP_INTERRUPT |
>> +					       DMA_CTRL_ACK);
>> +	if (!dma_desc) {
>> +		dev_err(i2c_dev->dev, "Failed to get DMA descriptor\n");
>> +		return -EIO;
>> +	}
>> +
>> +	dma_desc->callback = tegra_i2c_dma_complete;
>> +	dma_desc->callback_param = i2c_dev;
>> +	dmaengine_submit(dma_desc);
>> +	dma_async_issue_pending(chan);
>> +	return 0;
>> +}
>> +
>> +static int tegra_i2c_init_dma_param(struct tegra_i2c_dev *i2c_dev,
>> +				    bool dma_to_memory)
>> +{
>> +	struct dma_chan *dma_chan;
>> +	u32 *dma_buf;
>> +	dma_addr_t dma_phys;
>> +	int ret;
>> +	const char *chan_name = dma_to_memory ? "rx" : "tx";
>> +
>> +	dma_chan = dma_request_slave_channel_reason(i2c_dev->dev, chan_name);
>> +	if (IS_ERR(dma_chan))
>> +		return PTR_ERR(dma_chan);
>> +
>> +	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
>> +				     &dma_phys, GFP_KERNEL);
>> +
>> +	if (!dma_buf) {
>> +		dev_err(i2c_dev->dev, "Failed to allocate the DMA buffer\n");
>> +		ret = -ENOMEM;
>> +		goto scrub;
>> +	}
>> +
>> +	if (dma_to_memory)
>> +		i2c_dev->rx_dma_chan = dma_chan;
>> +	else
>> +		i2c_dev->tx_dma_chan = dma_chan;
>> +
>> +	i2c_dev->dma_buf = dma_buf;
>> +	i2c_dev->dma_phys = dma_phys;
>> +
>> +	return 0;
>> +
>> +scrub:
>> +	dma_free_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
>> +			  dma_buf, dma_phys);
> 
> Will dma_free_coherent() handle NULL ptr which will happen when dma_buf allocation fails for the RX init'ing?
> 
>> +	dma_release_channel(dma_chan);
>> +	return ret;
>> +}
>> +
>>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  {
>>  	unsigned long timeout = jiffies + HZ;
>> @@ -641,25 +745,45 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  		goto err;
>>  	}
>>  
>> -	if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> -		if (i2c_dev->msg_buf_remaining)
>> -			tegra_i2c_empty_rx_fifo(i2c_dev);
>> -		else
>> -			BUG();
>> -	}
>> +	if (!i2c_dev->is_curr_dma_xfer) {
>> +		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> +			if (i2c_dev->msg_buf_remaining)
>> +				tegra_i2c_empty_rx_fifo(i2c_dev);
>> +			else
>> +				BUG();
>> +		}
>>  
>> -	if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> -		if (i2c_dev->msg_buf_remaining)
>> -			tegra_i2c_fill_tx_fifo(i2c_dev);
>> -		else
>> -			tegra_i2c_mask_irq(i2c_dev, I2C_INT_TX_FIFO_DATA_REQ);
>> +		if (!i2c_dev->msg_read &&
>> +		   (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> +			if (i2c_dev->msg_buf_remaining)
>> +				tegra_i2c_fill_tx_fifo(i2c_dev);
>> +			else
>> +				tegra_i2c_mask_irq(i2c_dev,
>> +						   I2C_INT_TX_FIFO_DATA_REQ);
>> +		}
>>  	}
>>  
>>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>>  	if (i2c_dev->is_dvc)
>>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>>  
>> -	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>> +	if (status & I2C_INT_ALL_PACKETS_XFER_COMPLETE) {
>> +	/*
>> +	 * During message read XFER_COMPLETE interrupt is triggered prior to
>> +	 * DMA complete notification and during message write XFER_COMPLETE
>> +	 * interrupt is triggered after DMA complete notification.
>> +	 * PACKETS_XFER_COMPLETE indicates completion of all bytes of transfer.
>> +	 * so forcing msg_buf_remaining to 0.
>> +	 */
>> +		if (i2c_dev->is_curr_dma_xfer)
>> +			i2c_dev->msg_buf_remaining = 0;
>> +		status |= I2C_INT_PACKET_XFER_COMPLETE;
>> +		i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>> +		if (!i2c_dev->msg_buf_remaining)
>> +			complete(&i2c_dev->msg_complete);
>> +	} else if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>> +		if (i2c_dev->is_curr_dma_xfer)
>> +			i2c_dev->msg_buf_remaining = 0;
>>  		BUG_ON(i2c_dev->msg_buf_remaining);
>>  		complete(&i2c_dev->msg_complete);
>>  	}
>> @@ -668,17 +792,68 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  	/* An error occurred, mask all interrupts */
>>  	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
>>  		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
>> -		I2C_INT_RX_FIFO_DATA_REQ);
>> +		I2C_INT_RX_FIFO_DATA_REQ | I2C_INT_ALL_PACKETS_XFER_COMPLETE);
>>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>>  	if (i2c_dev->is_dvc)
>>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>>  
>> +	if (i2c_dev->is_curr_dma_xfer) {
>> +		dmaengine_terminate_all(chan);
>> +		complete(&i2c_dev->dma_complete);
>> +	}
>> +
>>  	complete(&i2c_dev->msg_complete);
>>  done:
>>  	spin_unlock(&i2c_dev->xfer_lock);
>>  	return IRQ_HANDLED;
>>  }
>>  
>> +static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
>> +				       size_t len, int direction)
>> +{
>> +	u32 val, reg;
>> +	u8 dma_burst = 0;
>> +	struct dma_slave_config dma_sconfig;
>> +
>> +	if (i2c_dev->hw->has_mst_fifo)
>> +		reg = I2C_MST_FIFO_CONTROL;
>> +	else
>> +		reg = I2C_FIFO_CONTROL;
>> +	val = i2c_readl(i2c_dev, reg);
>> +
>> +	if (len & 0xF)
>> +		dma_burst = 1;
>> +	else if (len & 0x10)
>> +		dma_burst = 4;
>> +	else
>> +		dma_burst = 8;
> 
> I'm still wondering whether dma_burst < 8 negatively affects transfer efficiency. Could you please clarify?
> 
>> +
>> +	if (direction == DATA_DMA_DIR_TX) {
>> +		if (i2c_dev->hw->has_mst_fifo)
>> +			val |= I2C_MST_FIFO_CONTROL_TX_TRIG(dma_burst);
>> +		else
>> +			val |= I2C_FIFO_CONTROL_TX_TRIG(dma_burst);
>> +	} else {
>> +		if (i2c_dev->hw->has_mst_fifo)
>> +			val |= I2C_MST_FIFO_CONTROL_RX_TRIG(dma_burst);
>> +		else
>> +			val |= I2C_FIFO_CONTROL_RX_TRIG(dma_burst);
>> +	}
>> +	i2c_writel(i2c_dev, val, reg);
>> +
>> +	if (direction == DATA_DMA_DIR_TX) {
>> +		dma_sconfig.dst_addr = i2c_dev->phys_addr + I2C_TX_FIFO;
>> +		dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +		dma_sconfig.dst_maxburst = dma_burst;
>> +	} else {
>> +		dma_sconfig.src_addr = i2c_dev->phys_addr + I2C_RX_FIFO;
>> +		dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +		dma_sconfig.src_maxburst = dma_burst;
>> +	}
>> +
>> +	dmaengine_slave_config(chan, &dma_sconfig);
>> +}
>> +
>>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>  	struct i2c_msg *msg, enum msg_end_type end_state)
>>  {
>> @@ -688,6 +863,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>  	unsigned long flags;
>>  	u16 xfer_time = 100;
>>  	size_t xfer_size = 0;
>> +	u32 *buffer = 0;
>> +	int ret = 0;
>> +	bool dma = false;
>>  
>>  	if (msg->flags & I2C_M_RD)
>>  		xfer_size = ALIGN(msg->len, BYTES_PER_FIFO_WORD);
>> @@ -698,6 +876,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>  	xfer_time += DIV_ROUND_CLOSEST((xfer_size * 9) * 1000,
>>  					i2c_dev->bus_clk_rate);
>>  
>> +	dma = ((xfer_size > I2C_PIO_MODE_MAX_LEN) &&
>> +		i2c_dev->tx_dma_chan && i2c_dev->rx_dma_chan);
> 
> There is no need to allocate resources for DMA until dma==true, let's postpone channels requesting and dma_buf allocation until they are really needed.

Although DMA channels shall be requested during the probe to maintain suspend-resume order, but dma_buf allocation could be postponed.
