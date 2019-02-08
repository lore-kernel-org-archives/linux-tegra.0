From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V17 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 21:06:54 +0300
Message-ID: <0c30dfe0-1174-0056-5ef6-432b75de2353@gmail.com>
References: <1549648195-3989-1-git-send-email-skomatineni@nvidia.com>
 <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549648195-3989-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: wsa@the-dreams.de, peda@axentia.se, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.02.2019 20:49, Sowjanya Komatineni пишет:
> Tegra194 supports maximum 64K bytes transfer per packet.
> Tegra186 and prior supports maximum 4K bytes transfer per packet.
> 
> This includes 12 bytes of packet header and this limit is
> applicable irrespective of PIO or DMA mode transfers.
> 
> This patch fixes max write length to account for packet header size
> for transfers.
> 
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V16/V17] : I2C core max message size is 65536. So, max_read_len of 65535 is NOP.
> 	  Removed it leaving max_write_len
>  [V15]	: This is new patch in this series.
> 
> 
>  drivers/i2c/busses/i2c-tegra.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 3758c7a2c781..e4bf85e8dc14 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -125,6 +125,9 @@
>  #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
>  #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
>  
> +/* Packet header size in bytes */
> +#define I2C_PACKET_HEADER_SIZE			12
> +
>  /*
>   * msg_end_type: The bus control which need to be send at end of transfer.
>   * @MSG_END_STOP: Send stop pulse at end of transfer.
> @@ -899,12 +902,13 @@ static const struct i2c_algorithm tegra_i2c_algo = {
>  /* payload size is only 12 bit */
>  static const struct i2c_adapter_quirks tegra_i2c_quirks = {
>  	.flags = I2C_AQ_NO_ZERO_LEN,
> -	.max_read_len = 4096,
> -	.max_write_len = 4096,
> +	.max_read_len = SZ_4K,
> +	.max_write_len = SZ_4K - I2C_PACKET_HEADER_SIZE,
>  };
>  
>  static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
>  	.flags = I2C_AQ_NO_ZERO_LEN,
> +	.max_write_len = 65535 - I2C_PACKET_HEADER_SIZE,

Ideally it should be SZ_64K - I2C_PACKET_HEADER_SIZE to not miss the one byte, otherwise good to me:

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
