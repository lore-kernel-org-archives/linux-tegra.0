From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V18 2/6] i2c: tegra: add bus clear Master Support
Date: Mon, 11 Feb 2019 20:18:15 +0000
Message-ID: <BYAPR12MB3398A2CABD430EA15FE15CC3C2640@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549652382-5476-1-git-send-email-skomatineni@nvidia.com>
 <1549652382-5476-2-git-send-email-skomatineni@nvidia.com>
 <20190211124431.kys66uzp5hwa5ret@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211124431.kys66uzp5hwa5ret@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "peda@axentia.se" <peda@axentia.se>, "digetx@gmail.com" <digetx@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> > Bus clear feature of Tegra I2C controller helps to recover from bus=20
> > hang when I2C master loses the bus arbitration due to the slave device=
=20
> > holding SDA LOW continuously for some unknown reasons.
> >=20
> > Per I2C specification, the device that held the bus LOW should release=
=20
> > it within 9 clock pulses.
> >=20
> > During bus clear operation, Tegra I2C controller sends 9 clock pulses=20
> > and terminates the transaction with STOP condition.
> > Upon successful bus clear operation, bus goes to idle state and driver=
=20
> > retries the transaction.
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>
> We have a bus recovery infrastructure in the core. Tying your code into i=
t should be easy. You probably just need a 'struct i2c_bus_recovery_info', =
populate the 'recover_bus' callback with 'tegra_i2c_issue_bus_clear()', and=
 attach this struct to the 'struct adapter' if the IP core supports bus rec=
overy, otherwise leave it empty.
> Then, you can...
>
> > +static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev) {
> > +	int err;
> > +	unsigned long time_left;
> > +	u32 reg;
> > +
> > +	if (i2c_dev->hw->supports_bus_clear) {
>
>... remove the if here because the core will check for a valid i2c_bus_rec=
overy_info...
>
> > @@ -759,6 +818,13 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev=
 *i2c_dev,
> >  		return 0;
> > =20
> >  	tegra_i2c_init(i2c_dev);
> > +	/* start recovery upon arbitration loss in single master mode */
> > +	if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> > +		if (!i2c_dev->is_multimaster_mode)
> > +			return tegra_i2c_issue_bus_clear(i2c_dev);
>
>... and use simply i2c_recover_bus() here.
>
> This will help making bus recovery use consistent across drivers.
>
>
OK, Will update to use i2c_bus_recovery_info

Sowjanya
