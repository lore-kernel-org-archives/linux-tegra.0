From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/4] i2c: tegra: make sure register writes completes
Date: Wed, 13 Jun 2012 09:55:40 -0600
Message-ID: <4FD8B7FC.3060708@wwwdotorg.org>
References: <1339582359-7911-1-git-send-email-ldewangan@nvidia.com> <1339582359-7911-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339582359-7911-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/13/2012 04:12 AM, Laxman Dewangan wrote:
> The Tegra PPSB (an peripheral bus) queues writes transactions.
> In order to guarantee that writes have completed before a
> certain time, a read transaction to a register on the same
> bus must be executed.
> This is necessary in situations such as when clearing an
> interrupt status or enable, so that when returning from an
> interrupt handler, the HW has already de-asserted its
> interrupt status output, which will avoid spurious interrupts.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c

> @@ -165,6 +165,10 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  	unsigned long reg)
>  {
>  	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +
> +	/* Read back register to make sure that register writes completed */
> +	if (reg != I2C_TX_FIFO)
> +		readl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));

I guess that's fine, but it sure does seem rather heavy-weight. Don't
you only need to do the readback if you just wrote to the IRQ status or
mask registers, rather than if you wrote to /any/ register other than
the FIFO?
