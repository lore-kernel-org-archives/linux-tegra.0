From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] i2c: tegra: enable multi master mode
Date: Mon, 14 Mar 2016 10:01:58 +0100
Message-ID: <20160314090158.GA1383@katana>
References: <1457945074-30020-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457945074-30020-1-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 02:14:33PM +0530, Shardar Shariff Md wrote:
> Enable multi-master mode in I2C_CNFG reg based on hw features.
> Using single/multi-master mode bit introduced for Tegra210,
> whereas multi-master mode is enabled by default in HW for T124 and
> earlier Tegra SOC. Enabling this bit doesn't explicitly start
> treating the bus has having multiple masters, but will start
> checking for arbitration lost and reporting when it occurs.
>=20
> The Tegra210 I2C controller supports single/multi master mode.
> Add chipdata for Tegra210 and its compatibility string so that
> Tegra210 will select data that enables multi master mode correctly.
>=20
> Add "nvidia,multimaster-mode" property to enable multimaster specific
> prerequisites:

Please check Documentation/devicetree/bindings/i2c/i2c.txt. There is a
generic "multi-master" binding already.

> 1. Enable 1st level clock always set.
> 2. Disable 2nd level clock gating (slcg which is supported from
>    T124 SOC and later chips)
>=20
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 70 ++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 64 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index efba1eb..ce99d02 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -38,6 +38,7 @@
>  #define I2C_CNFG_DEBOUNCE_CNT_SHIFT		12
>  #define I2C_CNFG_PACKET_MODE_EN			(1<<10)
>  #define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
> +#define I2C_CNFG_MULTI_MASTER_MODE		(1<<17)
>  #define I2C_STATUS				0x01C
>  #define I2C_SL_CNFG				0x020
>  #define I2C_SL_CNFG_NACK			(1<<1)
> @@ -133,6 +134,8 @@ struct tegra_i2c_hw_feature {
>  	bool has_single_clk_source;
>  	int clk_divisor_hs_mode;
>  	int clk_divisor_std_fast_mode;
> +	bool has_multi_master_mode;
> +	bool has_slcg_override_reg;
>  };
> =20
>  /**
> @@ -173,6 +176,7 @@ struct tegra_i2c_dev {
>  	int msg_read;
>  	u32 bus_clk_rate;
>  	bool is_suspended;
> +	bool is_multimaster_mode;
>  };
> =20
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned =
long reg)
> @@ -185,6 +189,9 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, u=
nsigned long reg)
>  	return readl(i2c_dev->base + reg);
>  }
> =20
> +#define I2C_CLKEN_OVERRIDE			0x090
> +#define I2C_MST_CORE_CLKEN_OVR			(1 << 0)
> +
>  /*
>   * i2c_writel and i2c_readl will offset the register if necessary to talk
>   * to the I2C block inside the DVC block
> @@ -424,6 +431,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_=
dev)
> =20
>  	val =3D I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
>  		(0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
> +
> +	if (i2c_dev->hw->has_multi_master_mode)
> +		val |=3D I2C_CNFG_MULTI_MASTER_MODE;
> +
>  	i2c_writel(i2c_dev, val, I2C_CNFG);
>  	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
> =20
> @@ -449,6 +460,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_d=
ev)
>  	if (tegra_i2c_flush_fifos(i2c_dev))
>  		err =3D -ETIMEDOUT;
> =20
> +	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
> +		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
> +
>  	tegra_i2c_clock_disable(i2c_dev);
> =20
>  	if (i2c_dev->irq_disabled) {
> @@ -660,6 +674,20 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
>  	return ret;
>  }
> =20
> +static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct device_node *np =3D i2c_dev->dev->of_node;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "clock-frequency",
> +			&i2c_dev->bus_clk_rate);
> +	if (ret)
> +		i2c_dev->bus_clk_rate =3D 100000; /* default clock rate */
> +
> +	i2c_dev->is_multimaster_mode =3D of_property_read_bool(np,
> +			"nvidia,multimaster-mode");
> +}
> +
>  static const struct i2c_algorithm tegra_i2c_algo =3D {
>  	.master_xfer	=3D tegra_i2c_xfer,
>  	.functionality	=3D tegra_i2c_func,
> @@ -671,6 +699,8 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_=
hw =3D {
>  	.has_single_clk_source =3D false,
>  	.clk_divisor_hs_mode =3D 3,
>  	.clk_divisor_std_fast_mode =3D 0,
> +	.has_multi_master_mode =3D false,
> +	.has_slcg_override_reg =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra30_i2c_hw =3D {
> @@ -679,6 +709,8 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_=
hw =3D {
>  	.has_single_clk_source =3D false,
>  	.clk_divisor_hs_mode =3D 3,
>  	.clk_divisor_std_fast_mode =3D 0,
> +	.has_multi_master_mode =3D false,
> +	.has_slcg_override_reg =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra114_i2c_hw =3D {
> @@ -687,10 +719,25 @@ static const struct tegra_i2c_hw_feature tegra114_i=
2c_hw =3D {
>  	.has_single_clk_source =3D true,
>  	.clk_divisor_hs_mode =3D 1,
>  	.clk_divisor_std_fast_mode =3D 0x19,
> +	.has_multi_master_mode =3D false,
> +	.has_slcg_override_reg =3D false,
>  };
> =20
> +static const struct tegra_i2c_hw_feature tegra210_i2c_hw =3D {
> +	.has_continue_xfer_support =3D true,
> +	.has_per_pkt_xfer_complete_irq =3D true,
> +	.has_single_clk_source =3D true,
> +	.clk_divisor_hs_mode =3D 1,
> +	.clk_divisor_std_fast_mode =3D 0x19,
> +	.has_config_load_reg =3D true,
> +	.has_multi_master_mode =3D true,
> +	.has_slcg_override_reg =3D true,
> +};
> +
> +
>  /* Match table for of_platform binding */
>  static const struct of_device_id tegra_i2c_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra210-i2c", .data =3D &tegra210_i2c_hw, },
>  	{ .compatible =3D "nvidia,tegra114-i2c", .data =3D &tegra114_i2c_hw, },
>  	{ .compatible =3D "nvidia,tegra30-i2c", .data =3D &tegra30_i2c_hw, },
>  	{ .compatible =3D "nvidia,tegra20-i2c", .data =3D &tegra20_i2c_hw, },
> @@ -745,10 +792,7 @@ static int tegra_i2c_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(i2c_dev->rst);
>  	}
> =20
> -	ret =3D of_property_read_u32(i2c_dev->dev->of_node, "clock-frequency",
> -					&i2c_dev->bus_clk_rate);
> -	if (ret)
> -		i2c_dev->bus_clk_rate =3D 100000; /* default clock rate */
> +	tegra_i2c_parse_dt(i2c_dev);
> =20
>  	i2c_dev->hw =3D &tegra20_i2c_hw;
> =20
> @@ -796,6 +840,13 @@ static int tegra_i2c_probe(struct platform_device *p=
dev)
>  		goto unprepare_fast_clk;
>  	}
> =20
> +	if (i2c_dev->is_multimaster_mode) {
> +		ret =3D clk_enable(i2c_dev->div_clk);
> +		dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
> +				ret);
> +		goto unprepare_div_clk;
> +	}
> +
>  	ret =3D tegra_i2c_init(i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize i2c controller");
> @@ -806,7 +857,7 @@ static int tegra_i2c_probe(struct platform_device *pd=
ev)
>  			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
> -		goto unprepare_div_clk;
> +		goto disable_div_clk;
>  	}
> =20
>  	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
> @@ -822,11 +873,15 @@ static int tegra_i2c_probe(struct platform_device *=
pdev)
>  	ret =3D i2c_add_numbered_adapter(&i2c_dev->adapter);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to add I2C adapter\n");
> -		goto unprepare_div_clk;
> +		goto disable_div_clk;
>  	}
> =20
>  	return 0;
> =20
> +disable_div_clk:
> +	if (i2c_dev->is_multimaster_mode)
> +		clk_disable(i2c_dev->div_clk);
> +
>  unprepare_div_clk:
>  	clk_unprepare(i2c_dev->div_clk);
> =20
> @@ -842,6 +897,9 @@ static int tegra_i2c_remove(struct platform_device *p=
dev)
>  	struct tegra_i2c_dev *i2c_dev =3D platform_get_drvdata(pdev);
>  	i2c_del_adapter(&i2c_dev->adapter);
> =20
> +	if (i2c_dev->is_multimaster_mode)
> +		clk_disable(i2c_dev->div_clk);
> +
>  	clk_unprepare(i2c_dev->div_clk);
>  	if (!i2c_dev->hw->has_single_clk_source)
>  		clk_unprepare(i2c_dev->fast_clk);
> --=20
> 1.8.1.5
>=20

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW5n4GAAoJEBQN5MwUoCm2LjQP/3h3HBbJyF4ArwNee3AAxfXm
hC8BblV5ZHyql5/M25OOQBr1IvAhw3zvKrv1TXk/dJ5w5b0TzUREoVZTz5ut7Qnq
BybfAIUYQptT5B+E5Xo9VM3Sgrq5rFs62MLP1KCc9vk5XXhVVr3EFooJqebxJ0WA
jRbAGio95Zco82Fh9fev+9ZYm4LjpVukPKhzSECay79gKtHfAFrUuJ4RERF5O3z7
VvfF7qsAZ/o9BLF3vu1QOuh1NU684vM3UZ6i2xJHIhN0TkB22a176U89JfIKMcE1
NyVYSTuSNwESonCST/h1LLWrbwnTzIu4skk6FcCYSHA4b4686PKhEzkzQ8dzVrZH
A61ru6E3C4EAqBkcZ6iTi3tPZX2cURMnpyUMxsaOtB1Ez+odAs+UJLmAVfbyxDnl
SM6cnP3GUy5BfhZk/ihWq2scZ3Gd0NmAu7N6pWTzFI3hWS0O2Y3ZR0/xPmSRDSWh
YSrpe7Me9CUuM7Estr9o4ts8jN1yqERSW+Uumsjhblqujv1w3CL9TsHgBZ2sInZb
/TBgYMf+epTesgKgNq4kxXjcn5lbahfnQYIV3a1AtECJz/aVtMBiQbZLg1UxhdEu
Pt402AzU6NRwAm0mnvMydfPgFJjqd9RfJoYnGawq3aA3sUfhKToNSNa6oOW+ckJl
vJ5WXDBctwZs7aM9pQx9
=Wfb9
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
