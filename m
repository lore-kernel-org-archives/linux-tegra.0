From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V18 6/6] i2c: tegra: add i2c interface timing support
Date: Mon, 11 Feb 2019 16:23:37 +0000
Message-ID: <BYAPR12MB339842E44F370110CFA582FEC2640@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1549652382-5476-1-git-send-email-skomatineni@nvidia.com>
 <1549652382-5476-6-git-send-email-skomatineni@nvidia.com>
 <20190211130322.2kpoky3scnqnxulw@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211130322.2kpoky3scnqnxulw@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "peda@axentia.se" <peda@axentia.se>, "digetx@gmail.com" <digetx@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> On Fri, Feb 08, 2019 at 10:59:42AM -0800, Sowjanya Komatineni wrote:
> > This patch adds I2C interface timing registers support for proper bus=20
> > rate configuration along with meeting the I2C spec setup and hold=20
> > times based on the tuning performed on Tegra210,
> > Tegra186 and Tegra194 platforms.
> >=20
> > I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field and=20
> > Tegra I2C controller design uses them as a part of internal clock=20
> > divisor.
> >=20
> > I2C_INTERFACE_TIMING_1 register contains the setup and hold times for=20
> > start and stop conditions.
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>
> Are you aware that we also have DT bindings for various I2C timing values=
? They are usually board dependent and not so much SoC dependent.
> Please check here:
>
> Documentation/devicetree/bindings/i2c/i2c.txt
>
> (Oops, I noticed 'i2c-sda-hold-time-ns' is missing from the docs. Will fi=
x that ASAP)
>
> Just saying. The patch here is fine for me. DT support could be added lat=
er, if you want that.
>
Hi Wolfram,
Yes I looked into those and the reason I added them as part of hw_feature i=
nside driver are
1. property is in-terms of ns for fall time but the value we program in int=
erface timing is not exact ns time
2. Below are the timing parameters need to be programmed for tegra I2C and =
I don't see equivalent property for each of those
     TSU_STA : Setup time for repeated START condition
     THD_STA : Hold time for (repeated) START condition
     TSU_STO : Setup time for STOP condition
     TBUF: Bus free time b/w STOP and START conditions
3. All above Timing configuration settings are different for different spee=
d modes (STD/FM & FM+/HS Mode)=20
4. All tegra platforms of specific Tegra chip has the same timing configura=
tion at-least for now so added this info as part of hw feature inside the d=
river.

Sowjanya
