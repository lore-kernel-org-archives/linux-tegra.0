From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V18 4/6] i2c: tegra: Add DMA support
Date: Mon, 11 Feb 2019 16:26:04 +0000
Message-ID: <BYAPR12MB3398E24A9C3AC87F601DA1A2C2640@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549652382-5476-1-git-send-email-skomatineni@nvidia.com>
 <1549652382-5476-4-git-send-email-skomatineni@nvidia.com>
 <20190211125509.tnsgfl3yoobdpnmj@ninjato>
 <ed92df42-459e-26fd-ce4e-f4530bf30783@gmail.com>
 <20190211132851.pxrawigdgggoc32k@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211132851.pxrawigdgggoc32k@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "peda@axentia.se" <peda@axentia.se>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> > > I am not sure if you are aware of this document, so I mention it:
> > >=20
> > > Documentation/i2c/DMA-considerations
> > >=20
> > > I am not pushing you to use the i2c_get_dma_safe_msg_buf() helpers,=20
> > > just wanted to make sure you know about them. I am also fine with an=
=20
> > > incremental patch on top of this if you want to add usage of those=20
> > > helpers somewhen later.
> >=20
> > At least I was not aware of those helpers. It looks to me that the=20
> > approach of having a statically allocated buffer is more optimal than=20
> > having to allocate and map the buffer on each transfer.
>
> Can be argued, yes.
>
> > >>  /* Match table for of_platform binding */  static const struct=20
> > >> of_device_id tegra_i2c_of_match[] =3D {
> > >>  	{ .compatible =3D "nvidia,tegra194-i2c", .data =3D &tegra194_i2c_h=
w,=20
> > >> },
> > >> +	{ .compatible =3D "nvidia,tegra186-i2c", .data =3D &tegra186_i2c_h=
w,=20
> > >> +},
> > >>  	{ .compatible =3D "nvidia,tegra210-i2c", .data =3D &tegra210_i2c_h=
w, },
> > >>  	{ .compatible =3D "nvidia,tegra124-i2c", .data =3D &tegra124_i2c_h=
w, },
> > >>  	{ .compatible =3D "nvidia,tegra114-i2c", .data =3D &tegra114_i2c_h=
w,=20
> > >> },
> > >=20
> > > Shouldn't this be a seperate patch?
> >=20
> > I asked for this change and no, it shouldn't be a separate patch as it=
=20
> > adds "has_apb_dma =3D false" property for T186 that older Tegra's have=
=20
> > as "true". Without this change T186 uses tegra_i2c_hw_feature of T210,=
=20
> > see [0]. Hence this change is absolutely correct and appropriate for=20
> > this patch.
>
> Then please update the patch description to contain this information.
>
Will update commit message about the reason for adding has_apb_dma
>
>
> > > This should definately be a seperate patch. While I am all for=20
> > > taking it, are you sure it does not regress on older Tegra platforms?
> > >=20
> >=20
> > All the patches are tested on older Tegra's (T20/T30 specifically by
> > me) and we fixed several bugs that were regressing them over the few=20
> > versions of the patchset. I specifically asked for this change for=20
> > older Tegra's because the APBDMA driver (T20-T210) is getting=20
> > registered from the module-init level and hence I2C driver probe is=20
> > always getting deferred. I'm not sure that it's worth to factor out=20
> > this hunk into a separate patch as it's directly related to the DMA=20
> > support addition, maybe worth to mention why this is needed in the=20
> > commit message.
>
> At least, this, yes.
>
Will update commit message to reflect this...
>
>
