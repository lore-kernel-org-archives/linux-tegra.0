From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/4] i2c: tegra: make sure register writes completes
Date: Thu, 14 Jun 2012 18:05:56 +0530
Message-ID: <4FD9DAAC.5000709@nvidia.com>
References: <1339582359-7911-1-git-send-email-ldewangan@nvidia.com> <1339582359-7911-2-git-send-email-ldewangan@nvidia.com> <4FD8B7FC.3060708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FD8B7FC.3060708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 June 2012 09:25 PM, Stephen Warren wrote:
> On 06/13/2012 04:12 AM, Laxman Dewangan wrote:
> @@ -165,6 +165,10 @@ static void i2c_writel(struct tegra_i2c_dev 
> *i2c_dev, u32 val,
>>   	unsigned long reg)
>>   {
>>   	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>> +
>> +	/* Read back register to make sure that register writes completed */
>> +	if (reg != I2C_TX_FIFO)
>> +		readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> I guess that's fine, but it sure does seem rather heavy-weight. Don't
> you only need to do the readback if you just wrote to the IRQ status or
> mask registers, rather than if you wrote to /any/ register other than
> the FIFO?

That's what my second patch but based on your earlier review comment, I 
did for every register.

I think it will not matter much as we dont write all register with every 
transaction, only during initialization.
Then for each transfer we write manly on Tx fifo and interrupt 
mask/status register and hence not too much overweight.
