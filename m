From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 08/12] i2c: tegra: use core to detect 'no zero length'
 quirk
Date: Fri, 5 Oct 2018 14:52:05 +0100
Message-ID: <8eb3d00b-0275-30ec-ef44-5e859dd9242f@nvidia.com>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
 <20180723202617.15230-9-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723202617.15230-9-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 23/07/18 21:26, Wolfram Sang wrote:
> And don't reimplement in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Only build tested.
> 
>  drivers/i2c/busses/i2c-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 60c8561fbe65..437294ea2f0a 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -684,9 +684,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  
>  	tegra_i2c_flush_fifos(i2c_dev);
>  
> -	if (msg->len == 0)
> -		return -EINVAL;
> -
>  	i2c_dev->msg_buf = msg->buf;
>  	i2c_dev->msg_buf_remaining = msg->len;
>  	i2c_dev->msg_err = I2C_ERR_NONE;
> @@ -831,6 +828,7 @@ static const struct i2c_algorithm tegra_i2c_algo = {
>  
>  /* payload size is only 12 bit */
>  static const struct i2c_adapter_quirks tegra_i2c_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN,
>  	.max_read_len = 4096,
>  	.max_write_len = 4096,
>  };

Sorry for missing this, but looks fine to me, so ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
