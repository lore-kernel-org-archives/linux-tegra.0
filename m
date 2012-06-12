From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] i2c: tegra: make sure register writes completes
Date: Tue, 12 Jun 2012 15:46:41 +0530
Message-ID: <4FD71709.9040208@nvidia.com>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com> <1338901800-23968-2-git-send-email-ldewangan@nvidia.com> <20120612075422.GB9230@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120612075422.GB9230-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 12 June 2012 01:24 PM, Wolfram Sang wrote:
> * PGP Signed by an unknown key
>
> On Tue, Jun 05, 2012 at 06:39:57PM +0530, Laxman Dewangan wrote:
>> @@ -430,6 +430,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>   	if (i2c_dev->is_dvc)
>>   		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>>
>> +	/*
>> +	 * Register write get queued in the PPSB bus and write can
>> +	 * happen later. Read back register to make sure that register
>> +	 * write is completed.
>> +	 */
>> +	i2c_readl(i2c_dev, I2C_INT_STATUS);
> Does it make sense to put the read into i2c_writel?
>
We can not put in i2c_writel() as we also do fifo write using this and 
writing and reading back fifo can drainout the fifo.
hence putting this here seems more appropriate.
>> +
>>   	if (status&  I2C_INT_PACKET_XFER_COMPLETE) {
>>   		BUG_ON(i2c_dev->msg_buf_remaining);
>>   		complete(&i2c_dev->msg_complete);
>> @@ -444,6 +451,9 @@ err:
>>   	if (i2c_dev->is_dvc)
>>   		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>>
>> +	/* Read back register to make sure that register writes completed */
>> +	i2c_readl(i2c_dev, I2C_INT_STATUS);
>> +
>>   	complete(&i2c_dev->msg_complete);
>>   	return IRQ_HANDLED;
>>   }
>> @@ -505,6 +515,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>   	ret = wait_for_completion_timeout(&i2c_dev->msg_complete, TEGRA_I2C_TIMEOUT);
>>   	tegra_i2c_mask_irq(i2c_dev, int_mask);
>>
>> +	/* Read back register to make sure that register writes completed */
>> +	i2c_readl(i2c_dev, I2C_INT_MASK);
>> +
> It definately makes sense to put this read into tegra_i2c_mask_irq()?
>
Ok, fine with me. I put the read back logic inside mask_irq() and 
unmask_irq().
Will send the fix in next patch.
>>   	if (WARN_ON(ret == 0)) {
>>   		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
> Regards,
>
>     Wolfram
>
