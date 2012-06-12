From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] i2c: tegra: make sure register writes completes
Date: Tue, 12 Jun 2012 10:07:03 -0600
Message-ID: <4FD76927.8040702@wwwdotorg.org>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com> <1338901800-23968-2-git-send-email-ldewangan@nvidia.com> <20120612075422.GB9230@pengutronix.de> <4FD71709.9040208@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FD71709.9040208-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/12/2012 04:16 AM, Laxman Dewangan wrote:
> On Tuesday 12 June 2012 01:24 PM, Wolfram Sang wrote:
>> * PGP Signed by an unknown key
>>
>> On Tue, Jun 05, 2012 at 06:39:57PM +0530, Laxman Dewangan wrote:
>>> @@ -430,6 +430,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void
>>> *dev_id)
>>>       if (i2c_dev->is_dvc)
>>>           dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
>>>
>>> +    /*
>>> +     * Register write get queued in the PPSB bus and write can
>>> +     * happen later. Read back register to make sure that register
>>> +     * write is completed.
>>> +     */
>>> +    i2c_readl(i2c_dev, I2C_INT_STATUS);
>>
>> Does it make sense to put the read into i2c_writel?
>
> We can not put in i2c_writel() as we also do fifo write using this and
> writing and reading back fifo can drainout the fifo.
> hence putting this here seems more appropriate.

You can put it inside i2c_writel(), but make the read-back conditional
depending on which register was just written. The Tegra SD driver has
similar conditional code in readl/writel to WAR some HW quirks.
