From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Fri, 6 Jan 2012 16:18:03 +0000
Message-ID: <20120106161803.GQ19115@trinity.fluff.org>
References: <1324898081-10308-1-git-send-email-alokc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324898081-10308-1-git-send-email-alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org, dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 26, 2011 at 04:44:41PM +0530, Alok Chauhan wrote:
> From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> In NACK error condition, I2C controller violates
> clock-to-data setup time before stop. In Software,
> because of this reset of controller is happening
> before I2C controller could complete STOP condition.
> 
> Added delay of 2 clock period before reset the
> controller in case of NACK error.
> 
> Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Instead of setting constant value for delay as was in previous patch, now in
> the current modification delay will be calculated based on clock frequency of the bus.
>  drivers/i2c/busses/i2c-tegra.c |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 6381604..62e197c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -517,6 +517,14 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
>  		return 0;
>  
> +	/*
> +	 * In NACK error condition resetting of I2C controller happens
> +	 * before STOP condition is properly completed by I2C controller,
> +	 * so wait for 2 clock cycle to complete STOP condition.
> +	 */
> +	if (i2c_dev->msg_err == I2C_ERR_NO_ACK)
> +		udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
> +

Is a delay here good, would it be better to sleep so that some other
process can gain cpu time?

  	tegra_i2c_init(i2c_dev);
>  	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
>  		if (msg->flags & I2C_M_IGNORE_NAK)
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
