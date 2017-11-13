From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: cros ec: spi: Simplify delay handling between
 SPI messages
Date: Mon, 13 Nov 2017 13:22:47 -0800
Message-ID: <20171113212247.GB126873@google.com>
References: <1510607140-30582-1-git-send-email-jonathanh@nvidia.com>
 <1510607140-30582-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510607140-30582-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 13, 2017 at 09:05:40PM +0000, Jon Hunter wrote:
> The EC SPI driver prevents SPI transfers being to rapidly by keeping
> track of the time the last transfer was issued via the
> 'last_transfer_ns' variable. Previously, if the 'last_transfer_ns'
> variable was zero, this indicated that no previous transfer had been
> sent and that no delay was needed. However, the EC SPI driver has
> been updated to always initialise the 'last_transfer_ns' variable
> during probe and therefore, it is no longer necessary to test if it
> is zero. Remove the code that checks if this variable is zero.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> ---
>  drivers/mfd/cros_ec_spi.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
> index a14196e95e9b..7849d781c6bb 100644
> --- a/drivers/mfd/cros_ec_spi.c
> +++ b/drivers/mfd/cros_ec_spi.c
> @@ -72,8 +72,7 @@
>   * struct cros_ec_spi - information about a SPI-connected EC
>   *
>   * @spi: SPI device we are connected to
> - * @last_transfer_ns: time that we last finished a transfer, or 0 if there
> - *	if no record
> + * @last_transfer_ns: time that we last finished a transfer.
>   * @start_of_msg_delay: used to set the delay_usecs on the spi_transfer that
>   *      is sent when we want to turn on CS at the start of a transaction.
>   * @end_of_msg_delay: used to set the delay_usecs on the spi_transfer that
> @@ -378,18 +377,15 @@ static int cros_ec_pkt_xfer_spi(struct cros_ec_device *ec_dev,
>  	u8 *rx_buf;
>  	u8 sum;
>  	int ret = 0, final_ret;
> +	unsigned long delay;
>  
>  	len = cros_ec_prepare_tx(ec_dev, ec_msg);
>  	dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
>  
>  	/* If it's too soon to do another transaction, wait */
> -	if (ec_spi->last_transfer_ns) {
> -		unsigned long delay;	/* The delay completed so far */
> -
> -		delay = ktime_get_ns() - ec_spi->last_transfer_ns;
> -		if (delay < EC_SPI_RECOVERY_TIME_NS)
> -			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
> -	}
> +	delay = ktime_get_ns() - ec_spi->last_transfer_ns;
> +	if (delay < EC_SPI_RECOVERY_TIME_NS)
> +		ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
>  
>  	rx_buf = kzalloc(len, GFP_KERNEL);
>  	if (!rx_buf)
> @@ -510,18 +506,15 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>  	u8 *rx_buf;
>  	int sum;
>  	int ret = 0, final_ret;
> +	unsigned long delay;
>  
>  	len = cros_ec_prepare_tx(ec_dev, ec_msg);
>  	dev_dbg(ec_dev->dev, "prepared, len=%d\n", len);
>  
>  	/* If it's too soon to do another transaction, wait */
> -	if (ec_spi->last_transfer_ns) {
> -		unsigned long delay;	/* The delay completed so far */
> -
> -		delay = ktime_get_ns() - ec_spi->last_transfer_ns;
> -		if (delay < EC_SPI_RECOVERY_TIME_NS)
> -			ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
> -	}
> +	delay = ktime_get_ns() - ec_spi->last_transfer_ns;
> +	if (delay < EC_SPI_RECOVERY_TIME_NS)
> +		ndelay(EC_SPI_RECOVERY_TIME_NS - delay);
>  
>  	rx_buf = kzalloc(len, GFP_KERNEL);
>  	if (!rx_buf)
> -- 
> 2.7.4
> 
