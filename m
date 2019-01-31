From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 4/5] i2c: tegra: Update transfer timeout
Date: Thu, 31 Jan 2019 04:38:01 +0300
Message-ID: <80d5072c-b8b8-c263-bcda-ad008597469e@gmail.com>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548864096-20974-4-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.01.2019 19:01, Sowjanya Komatineni пишет:
> Tegra194 allows max of 64K bytes and Tegra186 and prior allows
> max of 4K bytes of transfer per packet.
> 
> one sec timeout is not enough for transfers more than 10K bytes
> at STD bus rate.
> 
> This patch updates I2C transfer timeout based on the transfer size
> and I2C bus rate to allow enough time during max transfer size at
> lower bus speed.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V5/V6/V7] : Same as V4
>  [V4] : V4 series includes bus clear support and this patch is updated with
> 	fixed timeout of 1sec for bus clear operation.
>  [V3] : Same as V2
>  [V2] : Added this patch in V2 series to allow enough time for data transfer
> 	to happen.
> 	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
> 	takes argument with this patch.
> 
>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index b30b5da5ce6b..623bf4f275cd 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -25,7 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> -#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +#define TEGRA_I2C_TIMEOUT(ms) (msecs_to_jiffies(ms))
>  #define BYTES_PER_FIFO_WORD 4
>  
>  #define I2C_CNFG				0x000
> @@ -901,8 +901,9 @@ static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
>  		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>  
> -		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> -							TEGRA_I2C_TIMEOUT);
> +		time_left = wait_for_completion_timeout(
> +						&i2c_dev->msg_complete,
> +						TEGRA_I2C_TIMEOUT(1000));
>  		if (time_left == 0) {
>  			dev_err(i2c_dev->dev, "timed out for bus clear\n");
>  			return -ETIMEDOUT;
> @@ -929,6 +930,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	u32 *buffer = 0;
>  	int ret = 0;
>  	bool dma = false;
> +	u16 xfer_time = 100;
>  
>  	if (msg->flags & I2C_M_RD)
>  		xfer_size = msg->len;
> @@ -936,6 +938,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		xfer_size = msg->len + I2C_PACKET_HEADER_SIZE;
>  
>  	xfer_size = ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> +	xfer_time += DIV_ROUND_CLOSEST((xfer_size * 9) * 1000,
> +					i2c_dev->bus_clk_rate);

Could you please add a clarifying comment for the equation?

Shouldn't it be something like this?

xfer_time = (P clocks) * DIV_ROUND_UP(xfer_size, (N bytes per P clocks)) / (bus_clk_rate / 1000)
