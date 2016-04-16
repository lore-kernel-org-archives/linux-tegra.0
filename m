From: Shardar Mohammed <smohammed@nvidia.com>
Subject: RE: [PATCH] i2c: tegra: proper handling of error cases
Date: Sat, 16 Apr 2016 08:08:50 +0000
Message-ID: <73535dcc422441d3a981208dae1a2bad@bgmail102.nvidia.com>
References: <1460726507-9170-1-git-send-email-smohammed@nvdiia.com>
 <20160415141558.GC3472@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160415141558.GC3472@ulmo.ba.sec>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Shardar Mohammed <smohammed@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@the-dreams.de" <wsa@the-dreams.de>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Thanks for the review, updated with comments inline with Shardar.

> On Fri, Apr 15, 2016 at 06:51:47PM +0530, Shardar Shariff Md wrote:
> > From: Shardar Shariff Md <smohammed@nvidia.com>
> >
> > To summarize the issue observed in error cases:
> >
> > In SW: For i2c message transfer, packet header and data payload is
> > posted and then required error/packet completion interrupts are
> > enabled later.
> >
> > In HW flow: HW process the packet just after packet header is posted,
> > if ARB lost/NACK error occurs (SW will not handle immediately when
> > error happens as error interrupts are not enabled at this point). HW
> > assumes error is acknowledged and clears current data in FIFO, But SW
> > here posts the remaining data payload which still stays in FIFO as
> > stale data (data without packet header).
> >
> > Now once the interrupts are enabled, SW handles ARB lost/NACK error by
> > clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended
> > the error and will parse/process stale data (data without packet
> > header) present in FIFO which causes invalid NACK errors.
> >
> > Fix: Enable the error interrupts before posting the packet into FIFO
> > which make sure HW to not clear the fifo. Also disable the packet mode
> > before acknowledging errors (ARB lost/NACK error) to not process any
> > stale data.
> >
> > As error interrupts are enabled before posting the packet header use
> > spinlock to avoid preempting.
> 
> Please try to use up the full 78 characters per line in the commit message
> (with the exception being the subject line that should be shorter).

[Shardar] Will take care of this.

> > diff --git a/drivers/i2c/busses/i2c-tegra.c
> > b/drivers/i2c/busses/i2c-tegra.c
> [...]
> > @@ -423,12 +424,31 @@ static inline void tegra_i2c_clock_disable(struct
> tegra_i2c_dev *i2c_dev)
> >  		clk_disable(i2c_dev->fast_clk);
> >  }
> >
> > +static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev
> > +*i2c_dev) {
> > +	unsigned long timeout;
> > +
> > +	if (i2c_dev->hw->has_config_load_reg) {
> > +		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD,
> I2C_CONFIG_LOAD);
> > +		timeout = jiffies + msecs_to_jiffies(1000);
> > +		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
> > +			if (time_after(jiffies, timeout)) {
> > +				dev_warn(i2c_dev->dev,
> > +					"timeout waiting for config load\n");
> 
> Nit: since you're already changing this, perhaps make the arguments on
> subsequent lines align with the first argument on the first line? Like
> so:
> 
> 				dev_warn(i2c_dev->dev,
> 					 "timeout waiting for config load\n");
> 
> Note the extra space used for padding.
> 
[Shardar]  Will take care of this.

> > +				return -ETIMEDOUT;
> > +			}
> > +			msleep(1);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)  {
> >  	u32 val;
> >  	int err = 0;
> >  	u32 clk_divisor;
> > -	unsigned long timeout = jiffies + HZ;
> >
> >  	err = tegra_i2c_clock_enable(i2c_dev);
> >  	if (err < 0) {
> > @@ -477,20 +497,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev
> *i2c_dev)
> >  	if (i2c_dev->is_multimaster_mode && i2c_dev->hw-
> >has_slcg_override_reg)
> >  		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR,
> I2C_CLKEN_OVERRIDE);
> >
> > -	if (i2c_dev->hw->has_config_load_reg) {
> > -		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD,
> I2C_CONFIG_LOAD);
> > -		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
> > -			if (time_after(jiffies, timeout)) {
> > -				dev_warn(i2c_dev->dev,
> > -					"timeout waiting for config load\n");
> > -				return -ETIMEDOUT;
> > -			}
> > -			msleep(1);
> > -		}
> > -	}
> > +	err = tegra_i2c_wait_for_config_load(i2c_dev);
> >
> >  	tegra_i2c_clock_disable(i2c_dev);
> >
> > +	if (err)
> > +		return err;
> > +
> 
> The behaviour here is now different, though I assume it's really a fix that
> disables the I2C clock in case the timeout happens. Given that I suspect this
> would be better off in a separate patch (factor out the
> tegra_i2c_wait_for_config_load() function and return error after the clocks
> have been disabled).

[Shardar] Will take care of this.
> 
> >  	if (i2c_dev->irq_disabled) {
> >  		i2c_dev->irq_disabled = 0;
> >  		enable_irq(i2c_dev->irq);
> > @@ -499,14 +512,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev
> *i2c_dev)
> >  	return err;
> >  }
> >
> > +static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev
> > +*i2c_dev) {
> > +	u32 cnfg;
> > +
> > +	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
> > +	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
> > +		i2c_writel(i2c_dev, cnfg & (~I2C_CNFG_PACKET_MODE_EN),
> 
> Parentheses are not necessary here.
> 
> > +				I2C_CNFG);
> 
> If you drop the parentheses above this can be moved into the previous line
> because it will fit within 80 columns.

[Shardar] Will take care of this.

> 
> > +
> > +	return tegra_i2c_wait_for_config_load(i2c_dev);
> > +}
> > +
> >  static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)  {
> >  	u32 status;
> >  	const u32 status_err = I2C_INT_NO_ACK |
> I2C_INT_ARBITRATION_LOST;
> >  	struct tegra_i2c_dev *i2c_dev = dev_id;
> > +	unsigned long flags;
> >
> >  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
> >
> > +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
> >  	if (status == 0) {
> >  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
> >  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
> @@ -522,6 +549,7
> > @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
> >  	}
> >
> >  	if (unlikely(status & status_err)) {
> > +		tegra_i2c_disable_packet_mode(i2c_dev);
> 
> If you don't care about the return value it'd be better to reflect that by
> making the function return void. I presume ignoring the error here is safe?

[Shardar] Will take care of handling the return valure.

> 
> > @@ -583,6 +614,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev
> *i2c_dev,
> >  	i2c_dev->msg_read = (msg->flags & I2C_M_RD);
> >  	reinit_completion(&i2c_dev->msg_complete);
> >
> > +	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
> > +
> > +	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> > +	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> > +
> >  	packet_header = (0 << PACKET_HEADER0_HEADER_SIZE_SHIFT) |
> >  			PACKET_HEADER0_PROTOCOL_I2C |
> >  			(i2c_dev->cont_id <<
> PACKET_HEADER0_CONT_ID_SHIFT) | @@ -612,14
> > +648,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> >  	if (!(msg->flags & I2C_M_RD))
> >  		tegra_i2c_fill_tx_fifo(i2c_dev);
> >
> > -	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> >  	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
> >  		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
> >  	if (msg->flags & I2C_M_RD)
> >  		int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
> >  	else if (i2c_dev->msg_buf_remaining)
> >  		int_mask |= I2C_INT_TX_FIFO_DATA_REQ;
> > +
> >  	tegra_i2c_unmask_irq(i2c_dev, int_mask);
> 
> Can this line be removed? The NO_ACK and ARBITRATION_LOST interrupts
> are already unmasked earlier.

[Shardar] unmask_irq() here is enabling other interrupts (PACKET_XFER_COMPLETE/TX_FIFO_DATA_REQ/RX_FIFO_DATA_REQ). please let me know if my understanding is wrong from your comment.

> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
