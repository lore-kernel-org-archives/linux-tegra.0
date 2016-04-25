From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/3] i2c: tegra: calculate timeout for config load when
 needed
Date: Mon, 25 Apr 2016 10:37:51 +0100
Message-ID: <571DE56F.1030806@nvidia.com>
References: <1461409439-32385-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461409439-32385-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 23/04/16 12:03, Shardar Shariff Md wrote:
> Instead of calculating timeout for the config load during init,
> calculate it after config load register is written by using
> readx_poll_timeout().
> 
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Changes since v1:
> - Split timeout calculation to seperate patch
> ---
>  drivers/i2c/busses/i2c-tegra.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index d764d64..c1b02c7 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -28,6 +28,7 @@
>  #include <linux/of_device.h>
>  #include <linux/module.h>
>  #include <linux/reset.h>
> +#include <linux/iopoll.h>
>  
>  #include <asm/unaligned.h>
>  
> @@ -110,6 +111,8 @@
>  #define I2C_CLKEN_OVERRIDE			0x090
>  #define I2C_MST_CORE_CLKEN_OVR			(1 << 0)
>  
> +#define I2C_CONFIG_LOAD_TIMEOUT			1000000
> +
>  /*
>   * msg_end_type: The bus control which need to be send at end of transfer.
>   * @MSG_END_STOP: Send stop pulse at end of transfer.
> @@ -428,7 +431,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  	u32 val;
>  	int err = 0;
>  	u32 clk_divisor;
> -	unsigned long timeout = jiffies + HZ;
>  
>  	err = tegra_i2c_clock_enable(i2c_dev);
>  	if (err < 0) {
> @@ -478,24 +480,27 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
>  
>  	if (i2c_dev->hw->has_config_load_reg) {
> +		u32 val;
> +
>  		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> -		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
> -			if (time_after(jiffies, timeout)) {
> -				dev_warn(i2c_dev->dev,
> -					"timeout waiting for config load\n");
> -				return -ETIMEDOUT;
> -			}
> -			msleep(1);
> +		err = readx_poll_timeout(readl, i2c_dev->base +
> +					 tegra_i2c_reg_addr(i2c_dev,
> +					 I2C_CONFIG_LOAD), val, val == 0,
> +					 1000, I2C_CONFIG_LOAD_TIMEOUT);
> +		if (err) {
> +			dev_warn(i2c_dev->dev,
> +				 "timeout waiting for config load\n");
> +			goto err;
>  		}
>  	}
>  
> -	tegra_i2c_clock_disable(i2c_dev);
> -
>  	if (i2c_dev->irq_disabled) {
>  		i2c_dev->irq_disabled = 0;
>  		enable_irq(i2c_dev->irq);
>  	}
>  
> +err:
> +	tegra_i2c_clock_disable(i2c_dev);
>  	return err;

Minor comment ... moving the clock disable here looks like the right
thing to do, but this is not mentioned in the changelog and it seems
that if this is a fix, then it should be a separate patch?

Cheers
Jon
