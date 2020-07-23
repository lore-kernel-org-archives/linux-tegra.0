From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 3/7] i2c: tegra: add flag for register write buffering
Date: Thu, 23 Jul 2020 16:17:40 +0300
Message-ID: <fd8d2650-6450-be61-cd78-f57871984e4f@gmail.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1595506733-10307-3-git-send-email-kyarlagadda@nvidia.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, smohammed@nvidia.com, rgumasta@nvidia.com
List-Id: linux-tegra@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> In chips earlier to Tegra186, register write gets buffered. So to make
> sure register writes are completed, there is need to readback the
> register. Adding flag to disable this readback for Tegra186 and later
> chips.
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a841d6c..bdbbca0 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -220,6 +220,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_mst_fifo;
>  	const struct i2c_adapter_quirks *quirks;
>  	bool supports_bus_clear;
> +	bool has_reg_write_buffering;
>  	bool has_apb_dma;
>  	u8 tlow_std_mode;
>  	u8 thigh_std_mode;
> @@ -325,8 +326,11 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>  
>  	/* Read back register to make sure that register writes completed */
> -	if (reg != I2C_TX_FIFO)
> -		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	if (i2c_dev->hw->has_reg_write_buffering) {
> +		if (reg != I2C_TX_FIFO)

Should be single line.

What problem does this solve? If there is no visible effect, then please
drop this patch.

> +			readl_relaxed(i2c_dev->base +
> +				      tegra_i2c_reg_addr(i2c_dev, reg));
> +	}
