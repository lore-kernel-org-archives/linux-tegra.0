From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] i2c: tegra: add separate function for config_load
Date: Tue, 19 Apr 2016 10:31:41 +0100
Message-ID: <5715FAFD.2070303@nvidia.com>
References: <1460985355-28901-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460985355-28901-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 18/04/16 14:15, Shardar Shariff Md wrote:
> - Define separate function for configuration load register handling
> to make it use by different functions later.
> - Instead of calculating timeout for the config load during init,
> calculate it when config load register is written. Also use the
> msecs_to_jiffies for timeout calculation instead of macro HZ.
> 
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Changes since v1:
> - Add separate function for config load handling
> ---
>  drivers/i2c/busses/i2c-tegra.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index d764d64..6235f16 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -423,12 +423,31 @@ static inline void tegra_i2c_clock_disable(struct tegra_i2c_dev *i2c_dev)
>  		clk_disable(i2c_dev->fast_clk);
>  }
>  
> +static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned long timeout;
> +
> +	if (i2c_dev->hw->has_config_load_reg) {
> +		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
> +		timeout = jiffies + msecs_to_jiffies(1000);
> +		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
> +			if (time_after(jiffies, timeout)) {
> +				dev_warn(i2c_dev->dev,
> +					 "timeout waiting for config load\n");
> +				return -ETIMEDOUT;
> +			}
> +			msleep(1);
> +		}

How about using the readx_poll_timeout() (include/linux/iopoll.h) here?

Cheers
Jon
