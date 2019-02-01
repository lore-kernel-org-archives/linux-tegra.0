From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Fri, 1 Feb 2019 06:14:14 +0300
Message-ID: <20190201061414.05443ea1@dimatab>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
        <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
        <20190131124423.GG23438@ulmo>
        <20190201035249.5b1cdfe2@dimatab>
        <BYAPR12MB33986DDF4267ED1F499317B0C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33986DDF4267ED1F499317B0C2920@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Fri, 1 Feb 2019 01:11:06 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > > > +	if (dma) {
> > > > +		if (i2c_dev->msg_read) {
> > > > +			chan =3D i2c_dev->rx_dma_chan;
> > > > +			tegra_i2c_config_fifo_trig(i2c_dev,
> > > > xfer_size,
> > > > +
> > > > DATA_DMA_DIR_RX);
> > > > +
> > > > dma_sync_single_for_device(i2c_dev->dev, +
> > > > i2c_dev->dma_phys,
> > > > +						   xfer_size,
> > > > +
> > > > DMA_FROM_DEVICE); =20
> > >=20
> > > Do we really need this? We're not actually passing the device any=20
> > > data, so no caches to flush here. I we're cautious about flushing=20
> > > caches when we do write to the buffer (and I think we do that
> > > properly already), then there should be no need to do it here
> > > again.=20
> >
> > IIUC, DMA API has a concept of buffer handing which tells to use =20
> dma_sync_single_for_device() before issuing hardware job that touches
> the buffer and to use dma_sync_single_for_cpu() after hardware done
> the execution. In fact the CPU caches are getting flushed or
> invalidated as appropriate in a result.
> >
> > dma_sync_single_for_device(DMA_FROM_DEVICE) invalidates buffer in
> > the CPU cache, probably to avoid CPU evicting data from cache to
> > DRAM while hardware writes to the buffer. Hence this hunk is
> > correct.=20
> > > > +			err =3D tegra_i2c_dma_submit(i2c_dev,
> > > > xfer_size);
> > > > +			if (err < 0) {
> > > > +				dev_err(i2c_dev->dev,
> > > > +					"starting RX DMA
> > > > failed, err %d\n",
> > > > +					err);
> > > > +				goto unlock;
> > > > +			}
> > > > +		} else {
> > > > +			chan =3D i2c_dev->tx_dma_chan;
> > > > +			tegra_i2c_config_fifo_trig(i2c_dev,
> > > > xfer_size,
> > > > +
> > > > DATA_DMA_DIR_TX);
> > > > +			dma_sync_single_for_cpu(i2c_dev->dev,
> > > > +
> > > > i2c_dev->dma_phys,
> > > > +						xfer_size,
> > > > +
> > > > DMA_TO_DEVICE); =20
> > >=20
> > > This, on the other hand seems correct because we need to
> > > invalidate the caches for this buffer to make sure the data that
> > > we put there doesn't get overwritten. =20
> >
> > As I stated before in a comment to v6, this particular case of
> > dma_sync_single_for_cpu() usage is incorrect because CPU should
> > take ownership of the buffer after completion of hardwate job. But
> > in fact dma_sync_single_for_cpu(DMA_TO_DEVICE) is a NO-OP because
> > CPU doesn't need to flush or invalidate anything to take ownership
> > of the buffer if hardware did a read-only access.=20
> > >  =20
> > > > +	if (!i2c_dev->msg_read) {
> > > > +		if (dma) {
> > > > +			memcpy(buffer, msg->buf, msg->len);
> > > > +
> > > > dma_sync_single_for_device(i2c_dev->dev, +
> > > > i2c_dev->dma_phys,
> > > > +						   xfer_size,
> > > > +
> > > > DMA_TO_DEVICE); =20
> > >=20
> > > Again, here we properly flush the caches to make sure the data
> > > that we've written to the DMA buffer is visible to the DMA engine.
> > >  =20
> >
> > +1 this is correct
> >
> >
> > =20
> > > > +
> > > > +		if (i2c_dev->msg_read) {
> > > > +			if (likely(i2c_dev->msg_err =3D=3D
> > > > I2C_ERR_NONE)) {
> > > > +
> > > > dma_sync_single_for_cpu(i2c_dev->dev,
> > > > +
> > > > i2c_dev->dma_phys,
> > > > +
> > > > xfer_size, +
> > > > DMA_FROM_DEVICE); =20
> > >=20
> > > Here we invalidate the caches to make sure we don't get stale
> > > data that may be in the caches for data that we're copying out of
> > > the DMA buffer. I think that's about all the cache maintenance
> > > that we real need. =20
> >
> > Correct.
> >
> > And technically here should be
> > dma_sync_single_for_cpu(DMA_TO_DEVICE) for the TX. But again, it's
> > a NO-OP. =20
>=20
> Is my below understanding correct? Can you please confirm?
>=20
> During Transmit to device:
> - Before writing msg data into dma buf by CPU, giving DMA ownership
> to CPU dma_sync_single_for_cpu with dir DMA_TO_DEVICE
>=20

I tried to take a look at it again and now thinking that your variant
is more correct. Still it's a bit difficult to judge because this case
is no-op.

> - After writing to dma buf by CPU, giving back the ownership to
> device to access buffer to send during DMA transmit
> dma_sync_single_for_device with dir DMA_TO_DEVICE

Correct.

> During Receiving from Device:
> - before submitting RX DMA to give buffer access to DMAengine
> 	dma_sync_single_for_Device(DMA_FROM_DEVICE)=20

Correct.

> - after DMA RX completion, giving dma ownership to CPU for reading
> dmabuf data written by DMA from device dma_sync_single_for_cpu with
> dir DMA_FROM_DEVICE
>=20

Correct.
