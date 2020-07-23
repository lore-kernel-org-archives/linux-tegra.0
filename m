From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/7] i2c: tegra: add high speed mode support
Date: Thu, 23 Jul 2020 16:27:28 +0300
Message-ID: <f0d23b7c-e371-4d44-99b1-cb66e3735e5a@gmail.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-4-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595506733-10307-4-git-send-email-kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> From: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add high speed mode support
> 
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bdbbca0..2f654ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -85,12 +85,14 @@
>  #define PACKET_HEADER0_PROTOCOL_I2C		1
>  #define PACKET_HEADER0_CONT_ID_MASK		0xF
>  
> +#define I2C_HEADER_HIGHSPEED_MODE		BIT(22)
>  #define I2C_HEADER_CONT_ON_NAK			BIT(21)
>  #define I2C_HEADER_READ				BIT(19)
>  #define I2C_HEADER_10BIT_ADDR			BIT(18)
>  #define I2C_HEADER_IE_ENABLE			BIT(17)
>  #define I2C_HEADER_REPEAT_START			BIT(16)
>  #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_MASTER_ADDR_SHIFT		12
>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>  
>  #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -136,6 +138,7 @@
>  
>  /* configuration load timeout in microseconds */
>  #define I2C_CONFIG_LOAD_TIMEOUT			1000000
> +#define I2C_HS_MODE				3500000

The I2C_MAX_HIGH_SPEED_MODE_FREQ is 3400000, what is 3500000 then?

https://elixir.bootlin.com/linux/v5.8-rc4/source/include/linux/i2c.h#L42

>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
> @@ -215,12 +218,14 @@ struct tegra_i2c_hw_feature {
>  	int clk_divisor_std_mode;
>  	int clk_divisor_fast_mode;
>  	u16 clk_divisor_fast_plus_mode;
> +	int clk_multiplier_hs_mode;
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
>  	bool has_reg_write_buffering;
> +	bool has_hs_mode_support;
>  	bool has_apb_dma;
>  	u8 tlow_std_mode;
>  	u8 thigh_std_mode;
> @@ -293,6 +298,7 @@ struct tegra_i2c_dev {
>  	bool is_curr_dma_xfer;
>  	struct completion dma_complete;
>  	bool is_curr_atomic_xfer;
> +	int clk_divisor_hs_mode;
>  };
>  
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> @@ -778,8 +784,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  	if (i2c_dev->is_dvc)
>  		tegra_dvc_init(i2c_dev);
>  
> -	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
> -	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
> +	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN;
> +	if (i2c_dev->bus_clk_rate != I2C_HS_MODE)
> +		val |= FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 0x2);
>  
>  	if (i2c_dev->hw->has_multi_master_mode)
>  		val |= I2C_CNFG_MULTI_MASTER_MODE;
> @@ -791,6 +798,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  		tegra_i2c_vi_init(i2c_dev);
>  
>  	/* Make sure clock divisor programmed correctly */
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
> +		i2c_dev->clk_divisor_hs_mode = i2c_dev->hw->clk_divisor_hs_mode;
> +	} else {
> +		val = i2c_readl(i2c_dev, I2C_CLK_DIVISOR);
> +		i2c_dev->clk_divisor_hs_mode = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE, val);

FIELD_PREP?

clk_divisor_hs_mode should be a local variable and I don't think its
value needs to be read out from hardware.

> +	}
> +
>  	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
>  				 i2c_dev->hw->clk_divisor_hs_mode) |
>  		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
> @@ -822,8 +836,13 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>  
>  	if (!clk_reinit) {
> -		clk_multiplier = (tlow + thigh + 2);
> -		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
> +		if (i2c_dev->bus_clk_rate == I2C_HS_MODE) {
> +			clk_multiplier = i2c_dev->hw->clk_multiplier_hs_mode;
> +			clk_multiplier *= (i2c_dev->clk_divisor_hs_mode + 1);

Actually, clk_divisor_hs_mode variable shouldn't be needed at all, use
hw->clk_divisor_hs_mode directly.

> +		} else {
> +			clk_multiplier = (tlow + thigh + 2);
> +			clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
> +		}
>  		err = clk_set_rate(i2c_dev->div_clk,
>  				   i2c_dev->bus_clk_rate * clk_multiplier);
>  		if (err) {
> @@ -1244,6 +1263,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		packet_header |= I2C_HEADER_CONT_ON_NAK;
>  	if (msg->flags & I2C_M_RD)
>  		packet_header |= I2C_HEADER_READ;
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE)
> +		packet_header |= I2C_HEADER_HIGHSPEED_MODE;
>  	if (dma && !i2c_dev->msg_read)
>  		*buffer++ = packet_header;
>  	else
> @@ -1448,6 +1469,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.clk_divisor_std_mode = 0,
>  	.clk_divisor_fast_mode = 0,
>  	.clk_divisor_fast_plus_mode = 0,
> +	.clk_multiplier_hs_mode = 12,
>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1455,6 +1477,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1474,6 +1497,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>  	.clk_divisor_std_mode = 0,
>  	.clk_divisor_fast_mode = 0,
>  	.clk_divisor_fast_plus_mode = 0,
> +	.clk_multiplier_hs_mode = 12,
>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1481,6 +1505,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = false,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1500,6 +1525,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>  	.clk_divisor_std_mode = 0x19,
>  	.clk_divisor_fast_mode = 0x19,
>  	.clk_divisor_fast_plus_mode = 0x10,
> +	.clk_multiplier_hs_mode = 3,

3?

>  	.has_config_load_reg = false,
>  	.has_multi_master_mode = false,
>  	.has_slcg_override_reg = false,
> @@ -1507,6 +1533,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>  	.quirks = &tegra_i2c_quirks,
>  	.supports_bus_clear = true,
>  	.has_reg_write_buffering = true,
> +	.has_hs_mode_support = false,
>  	.has_apb_dma = true,
>  	.tlow_std_mode = 0x4,
>  	.thigh_std_mode = 0x2,
> @@ -1522,10 +1549,11 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>  	.has_continue_xfer_support = true,
>  	.has_per_pkt_xfer_complete_irq = true,
>  	.has_single_clk_source = true,
> -	.clk_divisor_hs_mode = 1,
> +	.clk_divisor_hs_mode = 2,

Why are you changing this?


...
> +	if (i2c_dev->bus_clk_rate == I2C_HS_MODE &&
> +	    !i2c_dev->hw->has_hs_mode_support) {
> +		dev_info(i2c_dev->dev, "HS mode not supported\n");
> +		i2c_dev->bus_clk_rate = 100000; /* default clock rate */

 I2C_MAX_STANDARD_MODE_FREQ
