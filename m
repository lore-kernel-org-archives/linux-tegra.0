From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] i2c: tegra: Add Bus Clear Master Support
Date: Mon, 21 Jan 2019 11:48:50 +0100
Message-ID: <20190121104850.GF16756@ulmo>
References: <1547177806-23769-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547177806-23769-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 07:36:46PM -0800, Sowjanya Komatineni wrote:
> Bus Clear feature of tegra i2c controller helps to recover from
> bus hang when i2c master loses the bus arbitration due to the
> slave device holding SDA LOW continuously for some unknown reasons.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 66 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)

Can you extend the commit message with some of the information that you
had provided as a reply to my question on v1? There was some really good
clarifying information in that reply, which I think is really good
commit message material.

>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index e417ebf7628c..11bc43ed08e9 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -54,6 +54,7 @@
>  #define I2C_FIFO_STATUS_RX_SHIFT		0
>  #define I2C_INT_MASK				0x064
>  #define I2C_INT_STATUS				0x068
> +#define I2C_INT_BUS_CLR_DONE			BIT(11)
>  #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
>  #define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
>  #define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
> @@ -96,6 +97,15 @@
>  #define I2C_HEADER_MASTER_ADDR_SHIFT		12
>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
> =20
> +#define I2C_BUS_CLEAR_CNFG			0x084
> +#define I2C_BC_SCLK_THRESHOLD			9
> +#define I2C_BC_SCLK_THRESHOLD_SHIFT		16
> +#define I2C_BC_STOP_COND			BIT(2)
> +#define I2C_BC_TERMINATE			BIT(1)
> +#define I2C_BC_ENABLE				BIT(0)
> +#define I2C_BUS_CLEAR_STATUS			0x088
> +#define I2C_BC_STATUS				BIT(0)
> +
>  #define I2C_CONFIG_LOAD				0x08C
>  #define I2C_MSTR_CONFIG_LOAD			BIT(0)
>  #define I2C_SLV_CONFIG_LOAD			BIT(1)
> @@ -155,6 +165,8 @@ enum msg_end_type {
>   * @has_mst_fifo: The I2C controller contains the new MST FIFO interface=
 that
>   *		provides additional features and allows for longer messages to
>   *		be transferred in one go.
> + * @supports_bus_clear: Bus Clear support to recover from bus hang during
> + *		SDA stuck low from device for some unknown reasons.
>   */
>  struct tegra_i2c_hw_feature {
>  	bool has_continue_xfer_support;
> @@ -167,6 +179,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
> +	bool supports_bus_clear;
>  };
> =20
>  /**
> @@ -640,6 +653,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  		goto err;
>  	}
> =20
> +	if (i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE))
> +		goto err;

Maybe also add a clarifying comment here as to why we're done processing
interrupts here.

> +
>  	if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>  		if (i2c_dev->msg_buf_remaining)
>  			tegra_i2c_empty_rx_fifo(i2c_dev);
> @@ -668,6 +684,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
>  		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
>  		I2C_INT_RX_FIFO_DATA_REQ);
> +	if (i2c_dev->hw->supports_bus_clear)
> +		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> @@ -678,6 +696,42 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
> +{
> +	int err;
> +	unsigned long time_left;
> +	u32 reg;
> +
> +	if (i2c_dev->hw->supports_bus_clear) {
> +		reinit_completion(&i2c_dev->msg_complete);
> +		reg =3D (I2C_BC_SCLK_THRESHOLD << I2C_BC_SCLK_THRESHOLD_SHIFT) |
> +		      I2C_BC_STOP_COND | I2C_BC_TERMINATE;
> +		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
> +		if (i2c_dev->hw->has_config_load_reg) {
> +			err =3D tegra_i2c_wait_for_config_load(i2c_dev);
> +			if (err)
> +				return err;
> +		}
> +		reg |=3D I2C_BC_ENABLE;
> +		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
> +		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
> +
> +		time_left =3D wait_for_completion_timeout(&i2c_dev->msg_complete,
> +							TEGRA_I2C_TIMEOUT);
> +		if (time_left =3D=3D 0) {
> +			dev_err(i2c_dev->dev, "timed out for bus clear\n");
> +			return -ETIMEDOUT;
> +		}
> +		reg =3D i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
> +		if (!(reg & I2C_BC_STATUS)) {
> +			dev_err(i2c_dev->dev, "Un-recovered Arb lost\n");

s/Arb/arbitration/

> +			return -EIO;
> +		}
> +	}
> +
> +	return -EAGAIN;
> +}
> +
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	struct i2c_msg *msg, enum msg_end_type end_state)
>  {
> @@ -759,6 +813,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *=
i2c_dev,
>  		return 0;
> =20
>  	tegra_i2c_init(i2c_dev);
> +	/* Start recovery upon Arbitration loss in Single-Master Mode */

I think this should either say "arbitration loss" or "Arbitration Loss"
but not mixed case. Same for "Single-Master Mode". I'd personally make
all of them lower case. But it's fine with me as long as it is
consistent.

Thierry

> +	if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> +		if (!i2c_dev->is_multimaster_mode)
> +			return tegra_i2c_issue_bus_clear(i2c_dev);
> +		return -EAGAIN;
> +	}
>  	if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
>  		if (msg->flags & I2C_M_IGNORE_NAK)
>  			return 0;
> @@ -848,6 +908,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_=
hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.supports_bus_clear =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra30_i2c_hw =3D {
> @@ -861,6 +922,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_=
hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.supports_bus_clear =3D false,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra114_i2c_hw =3D {
> @@ -874,6 +936,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c=
_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D false,
>  	.has_mst_fifo =3D false,
> +	.supports_bus_clear =3D true,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra124_i2c_hw =3D {
> @@ -887,6 +950,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c=
_hw =3D {
>  	.has_multi_master_mode =3D false,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
> +	.supports_bus_clear =3D true,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra210_i2c_hw =3D {
> @@ -900,6 +964,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c=
_hw =3D {
>  	.has_multi_master_mode =3D true,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D false,
> +	.supports_bus_clear =3D true,
>  };
> =20
>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw =3D {
> @@ -913,6 +978,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c=
_hw =3D {
>  	.has_multi_master_mode =3D true,
>  	.has_slcg_override_reg =3D true,
>  	.has_mst_fifo =3D true,
> +	.supports_bus_clear =3D true,
>  };
> =20
>  /* Match table for of_platform binding */
> --=20
> 2.7.4
>=20

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxFo5IACgkQ3SOs138+
s6G69hAAwjppGuoo3GWNHL3PB3HLWsAxyDV5AVATqhFlfozIqeklBzWtMEnkWLY2
ryAWiydTaW3D3dAS6TJfUViI8PDxLbm0s0IDwxlULa4ie8mbDWHlVhtugaN2BGxs
9XB7JnkYySgTggrd+F1AaamYwu6y4gWSVI7Y+auThSMgPrOoLeCwcCJOVgvJyHTo
3UK//efxbETE/cYTRZGcA8zO2fSaYxjbUAM9LU17kyHcmaviZLmo0CqBzF3xE4OR
gaMNRLMVR/a96/JRdLp7WdtDg7RTkCdsmku1VaJazOEnLTnaU1bVQcisgmN84MOq
ud4hATX9JybFoWJspeHNQdd8bKNjGqb5hZC2CxT0H9rnqlXqdSfhjzNLpa1Rhmna
h/AYuWplY6Nc5ZiBYsY6oLWqPbe7xc0W0kRa86ENCd2QWe9P+44ZBuZMj9Wt9hxy
2uTAQtDzVB2EgmEsidEuYS2mj3VSbRHTDvweIREC6naui89keP1HUlDd2iGenhQK
40cMEGl+oilIe1I/R3xjRoWUZuXi3hpX/VM8q6zSWviuky+JYo2Jqhx36hWudvgs
t89DyMXWWuxvifEGyOcZIctH/flli2kOhGJJk8CQG3ALPCGoB/kRuWdjSgg8eXVh
c1OP1rhSvG49QODzH8HdsxjvpEYzbpi+FrTwLtpkB/WIoaUe64o=
=R3/0
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
