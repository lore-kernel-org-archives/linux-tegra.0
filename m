From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] i2c: i2c-tegra: replace spin_lock_irqsave with spin_lock
 in ISR
Date: Tue, 27 Nov 2018 21:13:15 +0300
Message-ID: <9d98e98f-c4e6-f202-659b-288be5358117@gmail.com>
References: <20180911145446.53621-1-hangdianqj@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911145446.53621-1-hangdianqj@163.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: jun qian <hangdianqj@163.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11.09.2018 17:54, jun qian wrote:
> As you are already in ISR, it is unnecessary to call spin_lock_irqsave.
> 
> Signed-off-by: jun qian <hangdianqj@163.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 60c8561fbe65..59f31d3a508f 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -608,11 +608,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	u32 status;
>  	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	struct tegra_i2c_dev *i2c_dev = dev_id;
> -	unsigned long flags;
>  
>  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>  
> -	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
> +	spin_lock(&i2c_dev->xfer_lock);
>  	if (status == 0) {
>  		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
>  			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
> @@ -670,7 +669,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  
>  	complete(&i2c_dev->msg_complete);
>  done:
> -	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
> +	spin_unlock(&i2c_dev->xfer_lock);
>  	return IRQ_HANDLED;
>  }
>  
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
