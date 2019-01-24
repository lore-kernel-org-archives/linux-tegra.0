From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V1] i2c: tegra: Add DMA Support
Date: Thu, 24 Jan 2019 02:39:54 +0000
Message-ID: <BYAPR12MB3398E0C5EE66FDE8F0813847C29A0@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1547578806-17923-1-git-send-email-skomatineni@nvidia.com>
 <20190121103932.GB16756@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121103932.GB16756@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org



> > This patch adds DMA support for Tegra I2C.
>
> In the subject: "Support" -> "support". And in the commit description per=
haps add some more details about why this is useful, maybe accompany with s=
ome performance numbers (if > you can come up with any) or describe why the=
re's a threshold for PIO vs. DMA transfers.
>
> As it is, it's not immediately clear why we need or want these 400+ extra=
 lines of code.
>
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 494=20
> > +++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 456 insertions(+), 38 deletions(-)
> >=20
>
>
> > @@ -658,7 +809,16 @@ static irqreturn_t tegra_i2c_isr(int irq, void *de=
v_id)
> >  	if (i2c_dev->is_dvc)
> >  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> > =20
> > -	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
> > +	if (status & I2C_INT_ALL_PACKETS_XFER_COMPLETE) {
> > +		if (i2c_dev->is_curr_dma_xfer)
> > +			i2c_dev->msg_buf_remaining =3D 0;
>
> Why are we forcing msg_buf_remaining to 0 here and below? Doesn't the res=
t of the code take care of that already? Is it always guaranteed that all b=
ytes will have been transferred in > DMA mode?

During the write (Memory to TX FIFO thru DMA), DMA completion happens prior=
 to XFER_PACKET_COMPLETE INT from I2C
During the read (RX_FIFO to Memory thru DMA), XFER_PACKET_COMPLETE I2C INT =
gets generated prior to DMA Completion
Receiving XFER_PACKET_COMPLETE interrupts from I2C confirms successful I2C =
transfer, so In DMA Mode, msg_buf_remaining is forced to 0

DMA callback notification happens only on successful transfer of all bytes.
In case of incomplete transfer by DMA, call back notification will not be g=
enerated and DMA timeouts.
Also, DMA timeout is verified prior to msg_complete timeout.
=20
Thanks
Sowjanya
