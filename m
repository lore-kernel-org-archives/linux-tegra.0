From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8] i2c: tegra: remove BUG() macro
Date: Tue, 18 Jun 2019 12:13:32 +0300
Message-ID: <a438eb6c-4f27-a667-b1bb-a789b3a8c1fc@gmail.com>
References: <1560832186-17001-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560832186-17001-1-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

18.06.2019 7:29, Bitan Biswas пишет:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 49 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..6fb545e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -489,6 +490,13 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	size_t buf_remaining = i2c_dev->msg_buf_remaining;
>  	int words_to_transfer;
>  
> +	/*
> +	 * Catch overflow due to message fully sent before
> +	 * check for RX FIFO availability.
> +	 */
> +	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
> +		return -EINVAL;
> +
>  	if (i2c_dev->hw->has_mst_fifo) {
>  		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
>  		rx_fifo_avail = (val & I2C_MST_FIFO_STATUS_RX_MASK) >>
> @@ -515,7 +523,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/*
> +		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function.
> +		 */
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +535,12 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	/*
> +	 * RX FIFO must be drained in Overflow case.
> +	 */
> +	if (WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
> +

The comment is incorrect because RX FIFO is *not* drained in a case of overflow. Also,
please use a single-line comment style if multi-line is
not needed.

Let's change it to:

	/* RX FIFO must be drained, otherwise it's an Overflow case */
	if (WARN_ON_ONCE(rx_fifo_avail))
		return -EINVAL;

Otherwise looking good to me. Please address this minor comment and it should be done.
Looking forward to v9!
