From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V7 3/5] i2c: tegra: Add DMA Support
Date: Thu, 31 Jan 2019 07:01:20 +0300
Message-ID: <20190131070120.33127cd8@dimatab>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
        <1548864096-20974-3-git-send-email-skomatineni@nvidia.com>
        <1f10cb76-59a1-93c5-ae03-ccc0cd8db1a3@gmail.com>
        <BYAPR12MB3398B845E97674BE93CCD7D9C2910@BYAPR12MB3398.namprd12.prod.outlook.com>
        <f3282ada-56a8-b5c7-c400-38483eab2d06@gmail.com>
        <BYAPR12MB3398CE89D24AC71BF7DAF43CC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
        <725aece7-d3f2-c26f-4af4-200d8b507123@gmail.com>
        <BYAPR12MB3398C3E7C5842C698B5CA1CCC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398C3E7C5842C698B5CA1CCC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Thu, 31 Jan 2019 03:34:59 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > I2C_INT_ALL_PACKETS_XFER_COMPLETE shall be masked for the PIO mode
> > I2C_INT_PACKET_XFER_COMPLETE shall be masked for the DMA mode, if
> > I'm not missing something.=20
> for packets with repeated start or continue xfer,
> PACKET_XFER_COMPLETE will be triggers for packets with stop bit, both
> PACKET_XFER_COMPLETE and ALL_PACKET_XFER_COMPLETE will be triggered.
> To be align with what PIO mode is doing, will not use
> ALL_PACKETS_XFER_COMPLETE for DMA in next version.=20

Sounds good.

> >
> > Handle the error-case here:
> >
> >	if (i2c_dev->msg_err !=3D I2C_ERR_NONE) {
> >		dev_err(i2c_dev->dev, "i2c dma transfer failed\n");
> >		goto i2c_recover;
> >	}
> >
> >...
> >	<--- end of tegra_i2c_xfer_msg() -->
> >
> >	if (likely(i2c_dev->msg_err =3D=3D I2C_ERR_NONE))
> >		return 0;
> >
> > i2c_recover:
> >	tegra_i2c_init(i2c_dev);
> >	/* start recovery upon arbitration loss in single master
> >	mode */ if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> >		if (!i2c_dev->is_multimaster_mode)
> >			return tegra_i2c_issue_bus_clear(i2c_dev);
> >		return -EAGAIN;
> >	}
> >	if (i2c_dev->msg_err =3D=3D I2C_ERR_NO_ACK) {
> >		if (msg->flags & I2C_M_IGNORE_NAK)
> >			return 0;
> >		return -EREMOTEIO;
> >	}
> >
> >	return -EIO; =20
>=20
> When DMA transfer timeout, no need to check for ARB LOST or NO_ACK as
> if any of those interrupts trigger interrupt handler will terminate
> dmaengine and completes so DMA timeout will not be seen in those
> cases and falls thru msg_err check
>=20

Okay.
