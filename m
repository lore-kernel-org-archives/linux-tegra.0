From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V13 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 16:56:15 +0000
Message-ID: <BYAPR12MB3398F7FB1337B788B7E53068C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549464441-1836-1-git-send-email-skomatineni@nvidia.com>
 <1549464441-1836-3-git-send-email-skomatineni@nvidia.com>
 <4ecd3894-a1cb-20dd-8675-26e6e84254e7@gmail.com>
 <BYAPR12MB3398A6C76EC731D259FC3EA4C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB33988DCC1F4997AAF2112447C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <9c6524ec-b40b-5b0f-eb70-f9ce2c426fd9@gmail.com>
 <8eccb125-b771-fe10-492f-41dcda00c3b0@gmail.com>
 <BYAPR12MB33980C126166D851B91AB187C26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
 <20190206164158.GA6205@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206164158.GA6205@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> > > >> Looking into timestamps and transactions, DMA timeouts after start=
 of DMA for I2C1 to touch during this transaction.
> > > >> While it is waiting for I2C1 DMA transfer, lots of DVC=20
> > > >> transactions happened thru DMA which are successful
> > > >>
> > > >> What is the I2C1 speed?
> > > >=20
> > > > 400KHz
> > > >=20
> > > >> Also incase if device is running slow for some reason, probably ti=
meout was not enough as this patch series changes timeout with base 100mS +=
 msg transfer time based on transfer size.
> > > >> Can you give quick try with increased timeout incase if device is =
running slow?
> > > >>
> > > >=20
> > > > Tried to increase the timeout to 1 second, doesn't help.
> > > >=20
> > > > What helped again is the I2C HW resetting after each transfer. Like=
ly that means that HW isn't programmed correctly, please carefully check ev=
ery bit.
> > > >=20
> > > > DMA-only + I2C HW reset: http://dpaste.com/26AQXFM.txt
> > >
> > > Seems I found what's the problem. Here is the fix, please include it =
to v14 if it is correct.
> > >
> > > diff --git a/drivers/i2c/busses/i2c-tegra.c=20
> > > b/drivers/i2c/busses/i2c-tegra.c index a9391c3646b6..5ad54da70304=20
> > > 100644
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -912,7 +912,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *d=
ev_id)  static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_de=
v,
> > >                                        size_t len)  {
> > > -       u32 val, reg;
> > > +       u32 val =3D 0, reg;
> > >         u8 dma_burst =3D 0;
> > >         struct dma_slave_config slv_config =3D {0};
> > >         struct dma_chan *chan;
> > > @@ -922,7 +922,6 @@ static void tegra_i2c_config_fifo_trig(struct teg=
ra_i2c_dev *i2c_dev,
> > >                 reg =3D I2C_MST_FIFO_CONTROL;
> > >         else
> > >                 reg =3D I2C_FIFO_CONTROL;
> > > -       val =3D i2c_readl(i2c_dev, reg);
> >  >
> >  >        if (i2c_dev->is_curr_dma_xfer) {
> >  >                if (len & 0xF)
> >=20
> > Thanks dmitry. Good catch. Didn't caught to my eyes. Yes FIFO_CONTROL=20
> > is set based on read value without masking and oring causing back-back =
DMA transfers resulting in incorrect trig levels We can directly set trig l=
evels.
>
> It might be safer to explicitly clear the trigger levels before we overwr=
ite them. Though, admittedly, this register hasn't changed in years, so it'=
s unlikely we'll ever see it change in a way that might result in breakage =
if we construct the register value from scratch.
>
> Thierry

FIFO_CONTROL has trig and flush for TX & RX and since we do TX/RX and flush=
 anyway prior to transfer, constructing from scratch should be fine as its =
same as doing mask-modify-write
