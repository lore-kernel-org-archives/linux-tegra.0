From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3] i2c: tegra: Add Bus Clear Master Support
Date: Wed, 23 Jan 2019 02:39:02 +0300
Message-ID: <20190123023902.4bbf5c5c@dimatab>
References: <1548187338-6807-1-git-send-email-skomatineni@nvidia.com>
        <5405e9aa-d974-ca9d-dec1-32f8631a045d@gmail.com>
        <BYAPR12MB33984356AE1E279C7E0E880CC2980@BYAPR12MB3398.namprd12.prod.outlook.com>
        <20190123014042.6d64ee29@dimatab>
        <BYAPR12MB33986390C45475180381713FC2980@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33986390C45475180381713FC2980@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Tue, 22 Jan 2019 23:26:08 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> >> >> +	if (i2c_dev->msg_err =3D=3D I2C_ERR_ARBITRATION_LOST) {
> >> >> +		if (!i2c_dev->is_multimaster_mode)
> >> >> +			return
> >> >> tegra_i2c_issue_bus_clear(i2c_dev);
> >> >> +		return -EAGAIN; =20
> >> >
> >> >This changes the returned errno from -EIO to -EAGAIN for the=20
> >> >supports_bus_clear=3Dfalse case, is it okay and intentional?
> >> >   =20
> >>=20
> >> Yes EAGAIN is intentional to allow for transfer retry.
> >> During single master mode, ARBITRATION LOST notification happens
> >> when 1. I2C Master sees the bus is occupied by some other device
> >> when a transfer is initiated 2. I2C Master lost the bus during
> >> arbitration incase if slave device pulls SDA line low continuously
> >> for some unknown reason If arbitration lost is due to cause 1,
> >> retry helps to continue with transfer once bus is released by the
> >> slave and it just added delay in communication due to bus release
> >> delay by slave. In case of 2nd cause, retry never succeeds in
> >> cases where bus clear is not supported. =20
> >
> >It's unclear whether the "never succeeds retry" may fail with the
> >EAGAIN, causing an endless retry-loop. Could you please clarify this
> >moment? =20
>=20
> during master transmit mode, on arbitration lost and if master
> doesn=E2=80=99t support bus clear to recover then transfer will return
> EAGAIN. I2c core base driver performs retries if return code from
> i2c_transfer is EAGAIN up to specified retries in i2c adapter and
> returns the ret code from the last retry. Retry is not endless as i2c
> core base performs retry only up to specified adapter retries.
> Following return code from documentation
> https://www.kernel.org/doc/Documentation/i2c/fault-codes
>=20
>=20

Good, thanks for the clarification.
