From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3] i2c: tegra: Add Bus Clear Master Support
Date: Wed, 23 Jan 2019 01:40:42 +0300
Message-ID: <20190123014042.6d64ee29@dimatab>
References: <1548187338-6807-1-git-send-email-skomatineni@nvidia.com>
        <5405e9aa-d974-ca9d-dec1-32f8631a045d@gmail.com>
        <BYAPR12MB33984356AE1E279C7E0E880CC2980@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33984356AE1E279C7E0E880CC2980@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Tue, 22 Jan 2019 22:13:53 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >> Bus clear feature of tegra i2c controller helps to recover from
> >> bus hang when i2c master loses the bus arbitration due to the
> >> slave device holding SDA LOW continuously for some unknown reasons.
> >>=20
> >> Per I2C specification, the device that held the bus LOW should
> >> release it within 9 clock pulses.
> >>=20
> >> During bus clear operation, Tegra I2C controller sends 9 clock
> >> pulses and terminates the transaction with STOP condition.
> >> Upon successful bus clear operation, bus goes to idle state and
> >> driver retries the transaction.
> >>=20
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >> ---
> >>  [V3]: Updated comments and commit message to be clear on the
> >> change [V2]: Same as V1 rebased to 5.0-rc1
> >>=20
> >>  drivers/i2c/busses/i2c-tegra.c | 70=20
> >> ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 70 insertions(+)
> >>=20
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c=20
> >> b/drivers/i2c/busses/i2c-tegra.c index e417ebf7628c..b1b920b4a203=20
> >> 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -54,6 +54,7 @@
> >>  #define I2C_FIFO_STATUS_RX_SHIFT		0
> >>  #define I2C_INT_MASK				0x064
> >>  #define I2C_INT_STATUS				0x068
> >> +#define I2C_INT_BUS_CLR_DONE			BIT(11)
> >>  #define I2C_INT_PACKET_XFER_COMPLETE		BIT(7)
> >>  #define I2C_INT_ALL_PACKETS_XFER_COMPLETE	BIT(6)
> >>  #define I2C_INT_TX_FIFO_OVERFLOW		BIT(5)
> >> @@ -96,6 +97,15 @@
> >>  #define I2C_HEADER_MASTER_ADDR_SHIFT		12
> >>  #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
> >> =20
> >> +#define I2C_BUS_CLEAR_CNFG			0x084
> >> +#define I2C_BC_SCLK_THRESHOLD			9
> >> +#define I2C_BC_SCLK_THRESHOLD_SHIFT		16
> >> +#define I2C_BC_STOP_COND			BIT(2)
> >> +#define I2C_BC_TERMINATE			BIT(1)
> >> +#define I2C_BC_ENABLE				BIT(0)
> >> +#define I2C_BUS_CLEAR_STATUS			0x088
> >> +#define I2C_BC_STATUS				BIT(0)
> >> +
> >>  #define I2C_CONFIG_LOAD				0x08C
> >>  #define I2C_MSTR_CONFIG_LOAD			BIT(0)
> >>  #define I2C_SLV_CONFIG_LOAD			BIT(1)
> >> @@ -155,6 +165,8 @@ enum msg_end_type {
> >>   * @has_mst_fifo: The I2C controller contains the new MST FIFO
> >> interface that
> >>   *		provides additional features and allows for
> >> longer messages to
> >>   *		be transferred in one go.
> >> + * @supports_bus_clear: Bus Clear support to recover from bus
> >> hang during
> >> + *		SDA stuck low from device for some unknown
> >> reasons. */
> >>  struct tegra_i2c_hw_feature {
> >>  	bool has_continue_xfer_support;
> >> @@ -167,6 +179,7 @@ struct tegra_i2c_hw_feature {
> >>  	bool has_multi_master_mode;
> >>  	bool has_slcg_override_reg;
> >>  	bool has_mst_fifo;
> >> +	bool supports_bus_clear;
> >>  };
> >> =20
> >>  /**
> >> @@ -639,6 +652,12 @@ static irqreturn_t tegra_i2c_isr(int irq,
> >> void *dev_id) i2c_dev->msg_err |=3D I2C_ERR_ARBITRATION_LOST;
> >>  		goto err;
> >>  	}
> >> +	/*
> >> +	 * I2C transfer is terminated during the bus clear so skip
> >> +	 * processing the other interrupts.
> >> +	 */
> >> +	if (i2c_dev->hw->supports_bus_clear && (status &
> >> I2C_INT_BUS_CLR_DONE))
> >> +		goto err;
> >> =20
> >>  	if (i2c_dev->msg_read && (status &
> >> I2C_INT_RX_FIFO_DATA_REQ)) { if (i2c_dev->msg_buf_remaining)
> >> @@ -668,6 +687,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void
> >> *dev_id) tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK |
> >> I2C_INT_ARBITRATION_LOST | I2C_INT_PACKET_XFER_COMPLETE |
> >> I2C_INT_TX_FIFO_DATA_REQ | I2C_INT_RX_FIFO_DATA_REQ);
> >> +	if (i2c_dev->hw->supports_bus_clear)
> >> +		tegra_i2c_mask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
> >>  	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
> >>  	if (i2c_dev->is_dvc)
> >>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR,
> >> DVC_STATUS); @@ -678,6 +699,43 @@ static irqreturn_t
> >> tegra_i2c_isr(int irq, void *dev_id) return IRQ_HANDLED;
> >>  }
> >> =20
> >> +static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev
> >> *i2c_dev) {
> >> +	int err;
> >> +	unsigned long time_left;
> >> +	u32 reg;
> >> +
> >> +	if (i2c_dev->hw->supports_bus_clear) {
> >> +		reinit_completion(&i2c_dev->msg_complete);
> >> +		reg =3D (I2C_BC_SCLK_THRESHOLD <<
> >> I2C_BC_SCLK_THRESHOLD_SHIFT) |
> >> +		      I2C_BC_STOP_COND | I2C_BC_TERMINATE;
> >> +		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
> >> +		if (i2c_dev->hw->has_config_load_reg) {
> >> +			err =3D
> >> tegra_i2c_wait_for_config_load(i2c_dev);
> >> +			if (err)
> >> +				return err;
> >> +		}
> >> +		reg |=3D I2C_BC_ENABLE;
> >> +		i2c_writel(i2c_dev, reg, I2C_BUS_CLEAR_CNFG);
> >> +		tegra_i2c_unmask_irq(i2c_dev,
> >> I2C_INT_BUS_CLR_DONE); +
> >> +		time_left =3D
> >> wait_for_completion_timeout(&i2c_dev->msg_complete,
> >> +
> >> TEGRA_I2C_TIMEOUT);
> >> +		if (time_left =3D=3D 0) {
> >> +			dev_err(i2c_dev->dev, "timed out for bus
> >> clear\n");
> >> +			return -ETIMEDOUT;
> >> +		}
> >> +		reg =3D i2c_readl(i2c_dev, I2C_BUS_CLEAR_STATUS);
> >> +		if (!(reg & I2C_BC_STATUS)) {
> >> +			dev_err(i2c_dev->dev,
> >> +				"Un-recovered arbitration
> >> lost\n");
> >> +			return -EIO;
> >> +		}
> >> +	}
> >> +
> >> +	return -EAGAIN;
> >> +}
> >> +
> >>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> >>  	struct i2c_msg *msg, enum msg_end_type end_state)  { @@
> >> -759,6 +817,12 @@ static int tegra_i2c_xfer_msg(struct
> >> tegra_i2c_dev *i2c_dev, return 0;
> >> =20
> >>  	tegra_i2c_init(i2c_dev);
> >> +	/* start recovery upon arbitration loss in single master
> >> mode */
> >> +	if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> >> +		if (!i2c_dev->is_multimaster_mode)
> >> +			return tegra_i2c_issue_bus_clear(i2c_dev);
> >> +		return -EAGAIN; =20
> >
> >This changes the returned errno from -EIO to -EAGAIN for the
> >supports_bus_clear=3Dfalse case, is it okay and intentional?
> > =20
>=20
> Yes EAGAIN is intentional to allow for transfer retry.
> During single master mode, ARBITRATION LOST notification happens when=20
> 1. I2C Master sees the bus is occupied by some other device when a
> transfer is initiated 2. I2C Master lost the bus during arbitration
> incase if slave device pulls SDA line low continuously for some
> unknown reason If arbitration lost is due to cause 1, retry helps to
> continue with transfer once bus is released by the slave and it just
> added delay in communication due to bus release delay by slave. In
> case of 2nd cause, retry never succeeds in cases where bus clear is
> not supported.

It's unclear whether the "never succeeds retry" may fail with the
EAGAIN, causing an endless retry-loop. Could you please clarify this
moment?
