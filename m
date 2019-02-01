From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V9 4/5] i2c: tegra: update transfer timeout
Date: Fri, 1 Feb 2019 22:16:07 +0300
Message-ID: <53b3f00f-b3a8-e1ef-b04b-1bdd5f5473ce@gmail.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549040867-18149-4-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.02.2019 20:07, Sowjanya Komatineni пишет:
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
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  [V9] : Rebased to 5.0-rc4
> 	Minor updates for readability of xfer time
>  [V8] : Added comment with explaination of xfer time calculation
>  [V5/V6/V7] : Same as V4
>  [V4] : V4 series includes bus clear support and this patch is updated with
> 	fixed timeout of 1sec for bus clear operation.
>  [V3] : Same as V2
>  [V2] : Added this patch in V2 series to allow enough time for data transfer
> 	to happen.
> 	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
> 	takes argument with this patch.
> 
>  drivers/i2c/busses/i2c-tegra.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ac8009c35863..43449495bfaa 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -25,7 +25,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  
> -#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
>  #define BYTES_PER_FIFO_WORD 4
>  
>  #define I2C_CNFG				0x000
> @@ -893,8 +892,9 @@ static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
>  		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>  
> -		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
> -							TEGRA_I2C_TIMEOUT);
> +		time_left = wait_for_completion_timeout(
> +						&i2c_dev->msg_complete,
> +						msecs_to_jiffies(1000));

So potentially tegra_i2c_xfer_msg() could take more than 1 second and then fail with -EAGAIN, correct? In that case we should set adapter.timeout in probe to a larger value:

  i2c_dev->adapter.timeout = 3 * HZ;



Otherwise looks good to me:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
