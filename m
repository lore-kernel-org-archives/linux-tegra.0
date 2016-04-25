From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 1/4] i2c: tegra: disable clock before returning error
Date: Mon, 25 Apr 2016 13:35:17 +0100
Message-ID: <571E0F05.60507@nvidia.com>
References: <1461585458-23948-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461585458-23948-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/04/16 12:57, Shardar Shariff Md wrote:
> Disable clock before returning error in tegra_i2c_init()

May be explain why we should do this? It looks like currently we will
leave the clock on in the case of an error and so we may never turn it
off again as now we have an unbalanced enable/disable, etc.

> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes in v5:
> - Move current patch as separate patch
> 
> Changes in v6:
> - Remove unnecessary line
> ---
>  drivers/i2c/busses/i2c-tegra.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index d764d64..445398c3 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -483,19 +483,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  			if (time_after(jiffies, timeout)) {
>  				dev_warn(i2c_dev->dev,
>  					"timeout waiting for config load\n");
> -				return -ETIMEDOUT;
> +				err = -ETIMEDOUT;
> +				goto err;
>  			}
>  			msleep(1);
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

Thierry, Stephen, thinking about this some more I wonder if we should
not change the order here, in case of a potential race between an
interrupt and disabling the clock. May be it is safer to disable the
clock first? However, this is in the init and so may be that is not likely?

Cheers
Jon
