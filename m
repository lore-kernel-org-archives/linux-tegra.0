From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V8 3/5] i2c: tegra: Add DMA Support
Date: Fri, 1 Feb 2019 03:54:17 +0300
Message-ID: <20190201035417.737ff65f@dimatab>
References: <1548915387-28826-1-git-send-email-skomatineni@nvidia.com>
        <1548915387-28826-3-git-send-email-skomatineni@nvidia.com>
        <4663c7b9-d306-1cd4-1bdc-f7be84af0667@gmail.com>
        <8a88f8ee-24d3-00ac-f1fa-c43b576ed82c@gmail.com>
        <BYAPR12MB3398CFEE7E912513AE48DD2FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
        <e50a353c-94c4-1a47-92a4-5f41f4f64aa7@gmail.com>
        <c2676c08-83d7-2ac9-ce34-c7c7f86d798e@gmail.com>
        <BYAPR12MB3398D3DCD0DEACD67A58C75FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398D3DCD0DEACD67A58C75FC2910@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Thu, 31 Jan 2019 21:46:48 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > It works with this change:
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c
> > b/drivers/i2c/busses/i2c-tegra.c index fe5b89abc576..8e059e94b94e
> > 100644 --- a/drivers/i2c/busses/i2c-tegra.c +++
> > b/drivers/i2c/busses/i2c-tegra.c @@ -1170,10 +1170,11 @@ static int
> > tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev, time_left,
> > completion_done(&i2c_dev->msg_complete), i2c_dev->msg_err);
> >
> > +       tegra_i2c_init(i2c_dev, true);
> > +
> >         if (likely(i2c_dev->msg_err =3D=3D I2C_ERR_NONE))
> >                 return 0;
> > =20
> > -       tegra_i2c_init(i2c_dev, true);
> >         /* start recovery upon arbitration loss in single master
> > mode */ if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> >                 if (!i2c_dev->is_multimaster_mode)
> >
> >
> > Which means that HW state is kept dirty after DMA transfer. Please
> > check everything carefully. =20
>=20
> Identified issue, When I moved logic around for diff changes, INT
> enable isn=E2=80=99t correct for FIFO DATA REQ. Will have proper fix in n=
ext
> version.=20
>=20

Awesome :)
