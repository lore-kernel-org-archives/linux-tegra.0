From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: apply size limit quirk
Date: Wed, 17 Jun 2015 16:33:40 +0200
Message-ID: <55818544.2020000@nokia.com>
References: <1434477449-8340-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434477449-8340-1-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi!

On 16/06/15 19:57, ext Wolfram Sang wrote:
> payload_size is a 12 bit field in the HW register, so add a limit for
> this size. That way we gracefully reject the message beforehand instead
> of generating an OOPS while transferring. Verified using some older
> Tegra2 documentation and a more recent Jetson TK1 board.
> 
> Signed-off-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

Looks good,
Reviewed-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/i2c/busses/i2c-tegra.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 0a1b6eacef0fba..78a36681469674 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -669,6 +669,12 @@ static const struct i2c_algorithm tegra_i2c_algo = {
>  	.functionality	= tegra_i2c_func,
>  };
>  
> +/* payload size is only 12 bit */
> +static struct i2c_adapter_quirks tegra_i2c_quirks = {
> +	.max_read_len = 4096,
> +	.max_write_len = 4096,
> +};
> +
>  static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.has_continue_xfer_support = false,
>  	.has_per_pkt_xfer_complete_irq = false,
> @@ -739,6 +745,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->base = base;
>  	i2c_dev->div_clk = div_clk;
>  	i2c_dev->adapter.algo = &tegra_i2c_algo;
> +	i2c_dev->adapter.quirks = &tegra_i2c_quirks;
>  	i2c_dev->irq = irq;
>  	i2c_dev->cont_id = pdev->id;
>  	i2c_dev->dev = &pdev->dev;

-- 
Best regards,
Alexander Sverdlin.
