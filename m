From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V1] i2c: tegra: fix tegra186 hw supported features
Date: Mon, 18 Feb 2019 16:13:46 +0000
Message-ID: <BYAPR12MB3398E17BB92CC0D33996FBD4C2630@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1550334787-27703-1-git-send-email-skomatineni@nvidia.com>
 <20190218084227.GB19363@ulmo>
 <42aa92c1-309e-88c1-1cd6-07592990730b@nvidia.com>
 <20190218145002.GC19190@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218145002.GC19190@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Timo Alho <talho@nvidia.com>, "wsa@the-dreams.de" <wsa@the-dreams.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> >=20
> > On 18/02/2019 08:42, Thierry Reding wrote:
> > > On Sat, Feb 16, 2019 at 08:33:07AM -0800, Sowjanya Komatineni wrote:
> > >> Tegra186 does not support multi-master mode and also there is no=20
> > >> master fifo control register.
> > >>
> > >> This patch fixes supported features of Tegra186 and prevents=20
> > >> crashing during boot as master fifo control register are not=20
> > >> present on Tegra186 and prior.
> > >>
> > >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > >> ---
> > >>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > We really should've caught this earlier. Jon, let's think about ways=
=20
> > > to make it easier to catch these things in the future on our test sys=
tem.
> >=20
> > Indeed. This has fixed the boot regression I was seeing over the=20
> > weekend on -next for Tegra186. However, I am bit confused here,=20
> > because when I look at the Tegra186 TRM it states that the I2C=20
> > supports multi-master mode which disagrees with this patch.=20
> > Furthermore, it seems odd that
> > Tegra210 and Tegra194 would support multi-master mode but Tegra186=20
> > does not. So is this really correct?
> >
> > I would expect at least the missing master FIFO registers to cause a cr=
ash on Tegra186. The internal architecture specification also says that mul=
ti-master is supported.
> >
> > Sowjanya: do you have other documents that suggest we don't support mul=
ti-master on Tegra186 specifically? Or is this to work around an issue spec=
ific to Tegra186?
> >
> > As it is this contradicts documentation, so we need to either fix the c=
ommit to remove only master FIFO support or we need to fix the docs to refl=
ect reality.
> >
> > Thierry

Thierry/Jonathan,

Design wise we support but due to known hw bugs we defeatured multi-master =
mode. TRM docs also says no multi master support for T210, T186 and multi-m=
aster is supported only on T194.

T210 also has multi master enabled in driver. We should disable that also.

Thanks
sowjanya
