From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
Date: Wed, 12 Jun 2019 16:55:22 +0300
Message-ID: <b6b24358-36a0-af98-1b29-9a622baa9600@gmail.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

11.06.2019 13:51, Bitan Biswas пишет:
> Fix expression for residual bytes(less than word) transfer
> in I2C PIO mode RX/TX.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..0596c12 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -514,7 +514,8 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * If there is a partial word at the end of buf, handle it manually to
>  	 * prevent overwriting past the end of buf
>  	 */
> -	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> +	if (rx_fifo_avail > 0 &&
> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {

The buf_remaining >= BYTES_PER_FIFO_WORD is not possible to happen
because there are three possible cases:

1) buf_remaining > rx_fifo_avail * 4:

	In this case rx_fifo_avail = 0

2) buf_remaining < rx_fifo_avail * 4;

	In this case buf_remaining is always < 4 because
	words_to_transfer is a buf_remaining rounded down to 4
	and then divided by 4. Hence:

	buf_remaining -= (buf_remaining / 4) * 4 always results
	into buf_remaining < 4.

3) buf_remaining == rx_fifo_avail * 4:

	In this case rx_fifo_avail = 0 and buf_remaining = 0.

Case 2 should never happen and means that something gone wrong.

>  		BUG_ON(buf_remaining > 3);
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
> @@ -557,11 +558,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  			words_to_transfer = tx_fifo_avail;
>  
>  		/*
> -		 * Update state before writing to FIFO.  If this casues us
> +		 * Update state before writing to FIFO.  If this causes us
>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
> -		 * not maskable).  We need to make sure that the isr sees
> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
> +		 * not maskable).
>  		 */
>  		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
>  		tx_fifo_avail -= words_to_transfer;
> @@ -580,7 +580,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent reading past the end of buf, which could cross a page
>  	 * boundary and fault.
>  	 */
> -	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> +	if (tx_fifo_avail > 0 &&
> +	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
>  		BUG_ON(buf_remaining > 3);
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
> 

Same as for RX.
