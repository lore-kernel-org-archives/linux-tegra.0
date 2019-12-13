From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Date: Fri, 13 Dec 2019 16:20:17 +0100
Message-ID: <20191213152017.GA293199@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com>
 <20191213151208.GC222809@ulmo>
 <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5a2a9cef-f4ed-c5a4-1f35-c89c3b5106a6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 06:15:12PM +0300, Dmitry Osipenko wrote:
> 13.12.2019 18:12, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
> >> System shutdown may happen with interrupts being disabled and in this =
case
> >> I2C core rejects transfers if atomic transfer isn't supported by drive=
r.
> >>
> >> There were several occurrences where I found my Nexus 7 completely
> >> discharged despite of being turned off and then one day I spotted this=
 in
> >> the log:
> >>
> >>  reboot: Power down
> >>  ------------[ cut here ]------------
> >>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95=
/0x9c
> >>  No atomic I2C transfer handler for 'i2c-1'
> >>  Modules linked in: tegra30_devfreq
> >>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-0=
0120-gf7ecd80fb803-dirty #3195
> >>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> >>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x=
14)
> >>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
> >>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
> >>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
> >>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95=
/0x9c)
> >>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0=
x6c)
> >>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x=
99/0x1cc)
> >>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0=
x23/0x38)
> >>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/=
0xfc)
> >>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x=
87/0xc4)
> >>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_b=
its_base+0x39/0x50)
> >>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm=
_power_off+0x29/0x2c)
> >>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_rebo=
ot+0xe9/0x170)
> >>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x=
1/0x28)
> >>  Exception stack(0xde907fa8 to 0xde907ff0)
> >>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc =
00000000
> >>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 =
00000000
> >>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
> >>  ---[ end trace bdd18f87595b1a5e ]---
> >>
> >> The atomic transferring is implemented by enforcing PIO mode for the
> >> transfer and by polling interrupt status until transfer is completed or
> >> failed.
> >>
> >> Now system shuts down properly every time.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
> >>  1 file changed, 88 insertions(+), 7 deletions(-)
> >=20
> > I ran this on the test farm and the results are all green, so:
> >=20
> > Tested-by: Thierry Reding <treding@nvidia.com>
> >=20
>=20
> Thanks!
>=20
> Does the farm test board's shut down by verifying the
> hardware's power state?

No, that's not something we test. I was primarily running this to make
sure we don't regress anywhere else.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zrDEACgkQ3SOs138+
s6GYQQ//ahbs76xzIAUlts/MDie7XTbSsoyXAOp2kMoEfIn0nVo4ewTgmpx05ekN
Rw18GGGzFBjoLIpJLBclbKFrtyqq8Ztim+qoWdonDKDTGkTsXajen0tv6sjvQf8r
10eAPZ2MA0mVIUww/YAVace6Ao/WisHJ4xN9CgHAkCdKw2QCnl4C4RAqD2QK5Ks/
znryFOsJIZbHyVRT/KnaqFc765E9S6UMGh2kqkMc8WjZp+cjuFq2IfmSG+sQr09H
+LVL8HEJuBvVJTf38CT4hzlqJEXRYFwFcYpks/p+uefhfE51O9BCcEir+TeH8crc
1rbMXtuOFIrs2lU5l2u9dOBtd7qQxh0cbBf0Qvwmb2doZR8w4Mz7bAI07UB+OeSi
BeZBzheqo4/USxLqnhoBoUryFtJ60m8P49I80mIcmVUYPlEZEisszAW7j9eV//zE
3YXwZRDv6P5DqmZ3saXF4jkYeb8ZDWrfwQDsoXEgoYhanjZfkM3uC6wNtwXth/iN
/2QQN/+nmwoF3oKCBYao7u+KynYAhv9tkT1kmVtojXfGqSqCfJVs4+CVoc/SfftG
nkb6zEsH2aSfAH1LJCJodukRrTAbOoyVBmqB/BCc2NHkLLOxvP9zsc+1TfIC7Fkw
qLyMwgRrkVd6No9/0Y3Yje4tblRxM1SuGsp7RKUibHkQIO5dStQ=
=SwoH
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
