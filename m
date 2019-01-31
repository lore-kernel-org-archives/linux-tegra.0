From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 5/5] i2c: tegra: Add I2C interface timing support
Date: Thu, 31 Jan 2019 07:30:14 +0300
Message-ID: <20190131073014.1ac6c35b@dimatab>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
        <1548864096-20974-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548864096-20974-5-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=D0=92 Wed, 30 Jan 2019 08:01:36 -0800
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> This patch adds I2C interface timing registers support for
> proper bus rate configuration along with meeting the i2c spec
> setup and hold times based on the tuning performed on Tegra210,
> Tegra186 and Tegra194 platforms.
>=20
> I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field
> and Tegra I2C controller design uses them as a part of internal
> clock divisor.
>=20
> I2C_INTERFACE_TIMING_1 register contains the setup and hold times
> for start and stop conditions.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V7] : Minor updates to timing implementation
>  [V5/V6] : Added this Interface timing patch in V5 of the patch
> series.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 192
> ++++++++++++++++++++++++++++++++++++----- 1 file changed, 169
> insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c
> b/drivers/i2c/busses/i2c-tegra.c index 623bf4f275cd..ad8eeac5a745
> 100644 --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -130,6 +130,15 @@
>  #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
>  #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
> =20
> +#define I2C_INTERFACE_TIMING_0			0x94
> +#define I2C_THIGH_SHIFT				8
> +#define I2C_INTERFACE_TIMING_1			0x98
> +
> +#define I2C_STANDARD_MODE			100000
> +#define I2C_FAST_MODE				400000
> +#define I2C_FAST_PLUS_MODE			1000000
> +#define I2C_HS_MODE				3500000
> +
>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
> =20
> @@ -167,7 +176,10 @@ enum msg_end_type {
>   * @has_config_load_reg: Has the config load register to load the new
>   *		configuration.
>   * @clk_divisor_hs_mode: Clock divisor in HS mode.
> - * @clk_divisor_std_fast_mode: Clock divisor in standard/fast mode.
> It is
> + * @clk_divisor_std_mode: Clock divisor in standard mode. It is
> + *		applicable if there is no fast clock source i.e.
> single clock
> + *		source.
> + * @clk_divisor_fast_mode: Clock divisor in fast mode. It is
>   *		applicable if there is no fast clock source i.e.
> single clock
>   *		source.
>   * @clk_divisor_fast_plus_mode: Clock divisor in fast mode plus. It
> is @@ -182,6 +194,16 @@ enum msg_end_type {
>   *		be transferred in one go.
>   * @supports_bus_clear: Bus Clear support to recover from bus hang
> during
>   *		SDA stuck low from device for some unknown reasons.
> + * @tlow_std_mode: Low period of the clock in standard mode.
> + * @thigh_std_mode: High period of the clock in standard mode.
> + * @tlow_fast_fastplus_mode: Low period of the clock in
> fast/fast-plus modes.
> + * @thigh_fast_fastplus_mode: High period of the clock in
> fast/fast-plus modes.
> + * @setup_hold_time_std_mode: Setup and hold time for start and stop
> conditions
> + *		in standard mode.
> + * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for
> start and stop
> + *		conditions in fast/fast-plus modes.
> + * @setup_hold_time_hs_mode: Setup and hold time for start and stop
> conditions
> + *		in HS mode.
>   */
>  struct tegra_i2c_hw_feature {
>  	bool has_continue_xfer_support;
> @@ -189,12 +211,20 @@ struct tegra_i2c_hw_feature {
>  	bool has_single_clk_source;
>  	bool has_config_load_reg;
>  	int clk_divisor_hs_mode;
> -	int clk_divisor_std_fast_mode;
> +	int clk_divisor_std_mode;
> +	int clk_divisor_fast_mode;
>  	u16 clk_divisor_fast_plus_mode;
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
>  	bool supports_bus_clear;
> +	u8 tlow_std_mode;
> +	u8 thigh_std_mode;
> +	u8 tlow_fast_fastplus_mode;
> +	u8 thigh_fast_fastplus_mode;
> +	u32 setup_hold_time_std_mode;
> +	u32 setup_hold_time_fast_fast_plus_mode;
> +	u32 setup_hold_time_hs_mode;
>  };
> =20
>  /**
> @@ -262,6 +292,7 @@ struct tegra_i2c_dev {
>  };
> =20
>  static struct dma_chan *chan;
> +static bool first_init;

Same as for the chan, please don't use global variables.

>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  		       unsigned long reg)
> @@ -639,6 +670,49 @@ static int tegra_i2c_wait_for_config_load(struct
> tegra_i2c_dev *i2c_dev) return 0;
>  }
> =20
> +static int tegra_i2c_set_timing(struct tegra_i2c_dev *i2c_dev)
> +{
> +	u32 val;
> +	u32 tsu_thd =3D 0;
> +	u8 tlow =3D 0;
> +	u8 thigh =3D 0;
> +	u32 clk_multiplier;
> +	int err =3D 0;
> +
> +	if ((i2c_dev->bus_clk_rate > I2C_STANDARD_MODE) &&
> +	    (i2c_dev->bus_clk_rate <=3D I2C_FAST_PLUS_MODE)) {
> +		tlow =3D i2c_dev->hw->tlow_fast_fastplus_mode;
> +		thigh =3D i2c_dev->hw->thigh_fast_fastplus_mode;
> +		tsu_thd =3D
> i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> +	} else {
> +		tlow =3D i2c_dev->hw->tlow_std_mode;
> +		thigh =3D i2c_dev->hw->thigh_std_mode;
> +		tsu_thd =3D i2c_dev->hw->setup_hold_time_std_mode;
> +	}
> +
> +	val =3D (thigh << I2C_THIGH_SHIFT) | tlow;
> +	if (val)
> +		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
> +
> +	if (tsu_thd)
> +		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
> +
> +	if (first_init) {

Just add first_init to the arguments of
tegra_i2c_init(i2c_dev, first_init) and pass it to here.

> +		clk_multiplier =3D (tlow + thigh + 2);
> +		clk_multiplier *=3D (i2c_dev->clk_divisor_non_hs_mode
> + 1); +
> +		err =3D clk_set_rate(i2c_dev->div_clk,
> +				   i2c_dev->bus_clk_rate *
> clk_multiplier);
> +		if (err)
> +			dev_err(i2c_dev->dev,
> +				"failed changing clock rate: %d\n",
> err);
> +		else
> +			first_init =3D false;
> +	}
> +
> +	return err;
> +}
> +
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val;
> @@ -673,6 +747,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev
> *i2c_dev) I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
>  	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
> =20
> +	err =3D tegra_i2c_set_timing(i2c_dev);
> +	if (err < 0)
> +		goto err;
> +
>  	if (!i2c_dev->is_dvc) {
>  		u32 sl_cfg =3D i2c_readl(i2c_dev, I2C_SL_CNFG);
> =20

[snip]
