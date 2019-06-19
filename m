From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Date: Wed, 19 Jun 2019 12:10:54 +0300
Message-ID: <30386276-d5cc-7a74-9f2f-b773b9f3e7a4@gmail.com>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
 <cda89c10-c597-ce90-98dd-5cc13ee9b83d@gmail.com>
 <d29aa32d-55ef-c98b-00cd-f836bf003662@nvidia.com>
 <698b4903-0580-8a68-88f8-fba3e2cbe6c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <698b4903-0580-8a68-88f8-fba3e2cbe6c7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

19.06.2019 12:02, Dmitry Osipenko пишет:
> 19.06.2019 11:58, Jon Hunter пишет:
>>
>> On 18/06/2019 19:26, Dmitry Osipenko wrote:
>>> 18.06.2019 11:42, Bitan Biswas пишет:
>>>> tegra_i2c_xfer_msg initiates the I2C transfer in DMA
>>>> or PIO mode. It involves steps that need FIFO register
>>>> access, DMA API calls like dma_sync_single_for_device, etc.
>>>> Tegra I2C ISR has calls to tegra_i2c_empty_rx_fifo in PIO mode
>>>> and in DMA/PIO mode writes different I2C registers including
>>>> I2C interrupt status. ISR cannot start processing
>>>> before the preparation step at tegra_i2c_xfer_msg is complete.
>>>> Hence, a synchronization between ISR and tegra_i2c_xfer_msg
>>>> is in place today using spinlock.
>>>
>>> Please use full 75 chars per-line, this should make commit message to look better.
>>>
>>>> Spinlock busy waits and can add avoidable delays.
>>>>
>>>> In this patch needed synchronization is achieved by disabling
>>>> I2C interrupt during preparation step and enabling interrupt
>>>> once preparation is over and spinlock is no longer needed.
>>>>
>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
>>>>  1 file changed, 8 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>> index 6fb545e..ccc7fae 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
>>>>   * @bus_clk_rate: current I2C bus clock rate
>>>>   * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>>>>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>>>> - * @xfer_lock: lock to serialize transfer submission and processing
>>>>   * @tx_dma_chan: DMA transmit channel
>>>>   * @rx_dma_chan: DMA receive channel
>>>>   * @dma_phys: handle to DMA resources
>>>> @@ -270,8 +269,6 @@ struct tegra_i2c_dev {
>>>>  	u32 bus_clk_rate;
>>>>  	u16 clk_divisor_non_hs_mode;
>>>>  	bool is_multimaster_mode;
>>>> -	/* xfer_lock: lock to serialize transfer submission and processing */
>>>> -	spinlock_t xfer_lock;
>>>>  	struct dma_chan *tx_dma_chan;
>>>>  	struct dma_chan *rx_dma_chan;
>>>>  	dma_addr_t dma_phys;
>>>> @@ -835,7 +832,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>>  
>>>>  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>>>>  
>>>> -	spin_lock(&i2c_dev->xfer_lock);
>>>>  	if (status == 0) {
>>>>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>>>>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
>>>> @@ -935,7 +931,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>>>  
>>>>  	complete(&i2c_dev->msg_complete);
>>>>  done:
>>>> -	spin_unlock(&i2c_dev->xfer_lock);
>>>>  	return IRQ_HANDLED;
>>>>  }
>>>>  
>>>> @@ -1054,7 +1049,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>>  	u32 packet_header;
>>>>  	u32 int_mask;
>>>>  	unsigned long time_left;
>>>> -	unsigned long flags;
>>>>  	size_t xfer_size;
>>>>  	u32 *buffer = NULL;
>>>>  	int err = 0;
>>>> @@ -1085,7 +1079,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>>>  	 */
>>>>  	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
>>>>  					i2c_dev->bus_clk_rate);
>>>> -	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
>>>> +	if (!i2c_dev->irq_disabled) {
>>>> +		disable_irq_nosync(i2c_dev->irq);
>>>> +		i2c_dev->irq_disabled = true;
>>>> +	}
>>>
>>> 1) Peter correctly pointed out in the other email that the disabling should be synced.
>>> But see more below in 3.
>>>
>>> 2) i2c_dev->irq_disabled == true can't ever be the case here because tegra_i2c_init()
>>> re-enables interrupt in a case of error condition. Hence interrupt always enabled at
>>> the beginning of the transfer.
>>>
>>> 3) In my previous answer I was suggesting to request IRQ in a disabled state, this
>>> will allow to remove i2c_dev->irq_disabled completely.
>>>
>>> Then the tegra_i2c_xfer_msg() will have to enable IRQ after completion of the
>>> transfer-preparation process and disable IRQ once transfer is done (both success and
>>> failure cases). This is actually not a bad additional motivation for this patch, to
>>> keep CPU's interrupt disabled while idling and not to only rely on interrupt masking
>>> of the I2C hardware.
>>>
>>> 4) ISR should simply return IRQ_NONE when interrupt status is 0 and allow kernel core
>>> to disable the faulty interrupt itself. There will be "unhandled interrupt" error
>>> message in KMSG log, following the disabling.
>>>
>>> 5) In order to request IRQ in a disabled state, the IRQ_NOAUTOEN flag need to be set
>>> before the requesting, like this:
>>>
>>>     irq_set_status_flags(irq, IRQ_NOAUTOEN);
>>>
>>>     devm_request_irq(&pdev->dev, irq...);
>>>
>>> In a result of combining 3-5, both i2c_dev->irq_disabled and i2c_dev->irq variables
>>> become obsolete and could be removed in addition to xfer_lock. That all is a good
>>> cleanup in my opinion.


Ah, actually looks like i2c_dev->irq won't be obsoleted, but not a big deal.

Also, please note that it won't be the least to change the type of "irq" to unsigned int for
consistency. I know that Thierry is picky about it.
