From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1] i2c: tegra: Add Bus Clear Master Support
Date: Thu, 10 Jan 2019 16:21:48 +0100
Message-ID: <20190110152148.GE25353@ulmo>
References: <1546561418-10230-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546561418-10230-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2019 at 04:23:38PM -0800, Sowjanya Komatineni wrote:
> Bus Clear feature of tegra i2c controller helps to recover from
> bus hang when i2c master loses the bus arbitration due to the
> slave device holding SDA LOW continuously for some unknown reasons.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 65 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 437294ea2f0a..89a0c9fdc99e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -63,6 +63,7 @@
>  #define I2C_FIFO_STATUS_RX_SHIFT		0
>  #define I2C_INT_MASK				0x064
>  #define I2C_INT_STATUS				0x068
> +#define I2C_INT_BUS_CLR_DONE			BIT(11)
>  #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
>  #define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
>  #define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
> @@ -105,6 +106,15 @@
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
> @@ -154,6 +164,8 @@ enum msg_end_type {
>   * @clk_divisor_std_fast_mode: Clock divisor in standard/fast mode. It is
>   *		applicable if there is no fast clock source i.e. single clock
>   *		source.
> + * @has_bus_clr_support: Bus Clear support to recover from bus hang duri=
ng
> + *		SDA stuck low from device for some unknown reasons.

Might as well spell out clr as clear in the name. Or maybe to make it
shorter, call it supports_bus_clear.

>   */
> =20
>  struct tegra_i2c_hw_feature {
> @@ -167,6 +179,7 @@ struct tegra_i2c_hw_feature {
>  	bool has_multi_master_mode;
>  	bool has_slcg_override_reg;
>  	bool has_mst_fifo;
> +	bool has_bus_clr_support;
>  };
> =20
>  /**
> @@ -636,6 +649,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  		goto err;
>  	}
> =20
> +	if (i2c_dev->hw->has_bus_clr_support && (status & I2C_INT_BUS_CLR_DONE))
> +		goto err;
> +

This looks odd. If we support bus clear and the BUS_CLR_DONE interrupt
is set, shouldn't we still process all other potential interrupts? Or
was this meant to be inversed:

	if (!i2c_dev->hw->supports_bus_clear && (status & I2C_INT_BUS_CLR_DONE)

?

>  	if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>  		if (i2c_dev->msg_buf_remaining)
>  			tegra_i2c_empty_rx_fifo(i2c_dev);
> @@ -664,6 +680,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
>  		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
>  		I2C_INT_RX_FIFO_DATA_REQ);
> +	if (i2c_dev->hw->has_bus_clr_support)
> +		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> @@ -674,6 +692,41 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
> +{
> +	int time_left, err;
> +	u32 reg;
> +
> +	if (i2c_dev->hw->has_bus_clr_support) {
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

wait_for_completion_timeout() returns an unsigned long, so the type of
time_left should reflect that.

Thierry

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlw3YwwACgkQ3SOs138+
s6FGQxAArl1k+1KmJZK8dpKupCAtKqyLSawEH1u3kt2C9nX26FljY4uSdksWdK6o
plAjaQ8Lp11EMwxssE+auijlrtO/f7wgPmIHogskJ50UROyyI0elTaaGGBO4xHDv
zRdpfCol+YDUIZnys1PBJZTFI2jTWWPLZfNd4BnP8guGf6HX1VQCAXuph7NnR7Qm
DnY6Dy7TLThhfWBSjqlOe5MBIHItdUCJ+azfmcKRQNUxm88SWI9dku85c5N0f4Dz
7I7stCHPhQOXRZYERgQRF87hy0jOGbMe2R5jNMQCCKl6KyrTFFzNgnSj1DhtSPVN
KItt8VMtVB227hqXn8e4hdvkWXMUKtIFuwUfoAfpX57r2RmkP9F351Mro1O1tmz8
QNH1k4T3RYEYvftgtHrf8gzkaNHzTfqVEyvxiZNR583gBQ1ich6M8qEyP/IioYuc
GQbRtHjQdvpabJWaQ7nrs3UiIWctI4pRhCkb19JKZNXYDTl1/TBcnOdwchG7rOL/
S8ehcGmNspmOTDtssoHZF8Ys7a6qmrNO8WhK1hjLvbE8TzLb/jbmjQgUWcZv+jFJ
/ADDd7TgxYCPiployqawQNc0J47W9SLyV28+iIL3JIT+KNLBTlZKb4PAS61b7h6o
NDUwmB6y2c04ihllazSme/9fays4k8SswE10LjnMXby+HQpEfDU=
=Quu4
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
