From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 16:41:03 +0000
Message-ID: <BYAPR12MB3398734126428AC5881D0B28C2910@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
 <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
 <20190131124423.GG23438@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131124423.GG23438@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> > +static int tegra_i2c_init_dma_param(struct tegra_i2c_dev *i2c_dev) {
> > +	struct dma_chan *dma_chan;
> > +	u32 *dma_buf;
> > +	dma_addr_t dma_phys;
> > +
> > +	if (!i2c_dev->has_dma)
> > +		return -EINVAL;
> > +
> > +	if (!i2c_dev->rx_dma_chan) {
> > +		dma_chan =3D dma_request_slave_channel_reason(i2c_dev->dev, "rx");
> > +		if (IS_ERR(dma_chan))
> > +			return PTR_ERR(dma_chan);
>
> I think we want to fallback to PIO here if dma_chan is -ENODEV.

Checking if dmas property is in device tree before channel requests. So ENO=
DEV will not be returned.
Incase if dmas property is not there in device tree, we fall back to PIO as=
 init_dma_params returns invalid

> Although, I'm not exactly sure I understand what you're trying to achieve=
 here. Shouldn't we move the channel request parts into probe and remove th=
em from here? Otherwise it seems like we could get into a state where we ke=
ep trying to get the slave channels everytime we set up a DMA transfer, eve=
n if we already failed to do so during probe.
>

This patch tries to get channel request during probe but buffer allocation =
will not happen till xfer is needed in dma mode.
During xfer message, this function is called again for dma buffer allocatio=
n only for dma mode.

> > +
> > +	if (!i2c_dev->dma_buf && i2c_dev->msg_buf_remaining) {
> > +		dma_buf =3D dma_alloc_coherent(i2c_dev->dev,
> > +					     i2c_dev->dma_buf_size,
> > +					     &dma_phys, GFP_KERNEL);
> > +
> > +		if (!dma_buf) {
> > +			dev_err(i2c_dev->dev,
> > +				"failed to allocate the DMA buffer\n");
> > +			dma_release_channel(i2c_dev->tx_dma_chan);
> > +			dma_release_channel(i2c_dev->rx_dma_chan);
> > +			i2c_dev->tx_dma_chan =3D NULL;
> > +			i2c_dev->rx_dma_chan =3D NULL;
> > +			return -ENOMEM;
> > +		}
> > +
> > +		i2c_dev->dma_buf =3D dma_buf;
> > +		i2c_dev->dma_phys =3D dma_phys;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>
>
> > @@ -749,19 +939,69 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_de=
v *i2c_dev,
> >  	i2c_dev->msg_read =3D (msg->flags & I2C_M_RD);
> >  	reinit_completion(&i2c_dev->msg_complete);
> > =20
> > +	if (i2c_dev->msg_read)
> > +		xfer_size =3D msg->len;
> > +	else
> > +		xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> > +
> > +	xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> > +	dma =3D (xfer_size > I2C_PIO_MODE_MAX_LEN);
> > +	if (dma) {
> > +		err =3D tegra_i2c_init_dma_param(i2c_dev);
> > +		if (err < 0) {
> > +			dev_dbg(i2c_dev->dev, "switching to PIO transfer\n");
> > +			dma =3D false;
> > +		}
>
>
> If we successfully got DMA channels at probe time, doesn't this turn into=
 an error condition that is worth reporting? It seems to me like the only r=
eason it could fail is if we fail the allocation, but then again, why don't=
 we move the DMA buffer allocation into probe()? We already use a fixed siz=
e for that allocation, so there's no reason it couldn't be allocated at pro=
be time.
>
> Seems like maybe you just overlooked that as you were moving around the c=
ode pieces.

Checking for dmas property is inside init_dma_param and if dmas property do=
esn't exist init_dma_param returns err EINVAL
Also init_dma_param fails for if buffer allocation fails. In both of those =
cases it will switch to PIO Mode
As per review feedback, performing channel request allocation during probe =
and buffer allocation is postponed till there is need for DMA and buffer al=
location happens during 1st DMA mode xfer if it is not already allocated

>
>
>
> >  static const struct i2c_algorithm tegra_i2c_algo =3D { @@ -1002,11=20
> > +1293,13 @@ static int tegra_i2c_probe(struct platform_device *pdev)
> >  	struct clk *div_clk;
> >  	struct clk *fast_clk;
> >  	void __iomem *base;
> > +	phys_addr_t base_phys;
> >  	int irq;
> >  	int ret =3D 0;
> >  	int clk_multiplier =3D I2C_CLK_MULTIPLIER_STD_FAST_MODE;
> > =20
> >  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	base_phys =3D res->start;
> >  	base =3D devm_ioremap_resource(&pdev->dev, res);
> >  	if (IS_ERR(base))
> >  		return PTR_ERR(base);
> > @@ -1029,6 +1322,7 @@ static int tegra_i2c_probe(struct platform_device=
 *pdev)
> >  		return -ENOMEM;
> > =20
> >  	i2c_dev->base =3D base;
> > +	i2c_dev->base_phys =3D base_phys;
>
> We could probably do without the extra local variable by just moving the =
assignment here. res is still valid at this point.
Same res is used for both IORESOURCE_MEM ad IORESOURCE_IRQ and i2c_dev allo=
cation happens later so I had to use temp variable
