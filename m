From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] i2c: tegra: Support atomic transfers
Date: Fri, 13 Dec 2019 16:12:08 +0100
Message-ID: <20191213151208.GC222809@ulmo>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191212233428.14648-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:34:26AM +0300, Dmitry Osipenko wrote:
> System shutdown may happen with interrupts being disabled and in this case
> I2C core rejects transfers if atomic transfer isn't supported by driver.
>=20
> There were several occurrences where I found my Nexus 7 completely
> discharged despite of being turned off and then one day I spotted this in
> the log:
>=20
>  reboot: Power down
>  ------------[ cut here ]------------
>  WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.h:40 i2c_transfer+0x95/0x=
9c
>  No atomic I2C transfer handler for 'i2c-1'
>  Modules linked in: tegra30_devfreq
>  CPU: 0 PID: 1 Comm: systemd-shutdow Not tainted 5.4.0-next-20191202-0012=
0-gf7ecd80fb803-dirty #3195
>  Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
>  [<c010e4b5>] (unwind_backtrace) from [<c010a0fd>] (show_stack+0x11/0x14)
>  [<c010a0fd>] (show_stack) from [<c09995e5>] (dump_stack+0x85/0x94)
>  [<c09995e5>] (dump_stack) from [<c011f3d1>] (__warn+0xc1/0xc4)
>  [<c011f3d1>] (__warn) from [<c011f691>] (warn_slowpath_fmt+0x61/0x78)
>  [<c011f691>] (warn_slowpath_fmt) from [<c069a8dd>] (i2c_transfer+0x95/0x=
9c)
>  [<c069a8dd>] (i2c_transfer) from [<c05667f1>] (regmap_i2c_read+0x4d/0x6c)
>  [<c05667f1>] (regmap_i2c_read) from [<c0563601>] (_regmap_raw_read+0x99/=
0x1cc)
>  [<c0563601>] (_regmap_raw_read) from [<c0563757>] (_regmap_bus_read+0x23=
/0x38)
>  [<c0563757>] (_regmap_bus_read) from [<c056293d>] (_regmap_read+0x3d/0xf=
c)
>  [<c056293d>] (_regmap_read) from [<c0562d3b>] (_regmap_update_bits+0x87/=
0xc4)
>  [<c0562d3b>] (_regmap_update_bits) from [<c0563add>] (regmap_update_bits=
_base+0x39/0x50)
>  [<c0563add>] (regmap_update_bits_base) from [<c056fd39>] (max77620_pm_po=
wer_off+0x29/0x2c)
>  [<c056fd39>] (max77620_pm_power_off) from [<c013bbdd>] (__do_sys_reboot+=
0xe9/0x170)
>  [<c013bbdd>] (__do_sys_reboot) from [<c0101001>] (ret_fast_syscall+0x1/0=
x28)
>  Exception stack(0xde907fa8 to 0xde907ff0)
>  7fa0:                   00000000 00000000 fee1dead 28121969 4321fedc 000=
00000
>  7fc0: 00000000 00000000 00000000 00000058 00000000 00000000 00000000 000=
00000
>  7fe0: 0045adf0 bed9abb8 004444a0 b6c666d0
>  ---[ end trace bdd18f87595b1a5e ]---
>=20
> The atomic transferring is implemented by enforcing PIO mode for the
> transfer and by polling interrupt status until transfer is completed or
> failed.
>=20
> Now system shuts down properly every time.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 95 +++++++++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 7 deletions(-)

I ran this on the test farm and the results are all green, so:

Tested-by: Thierry Reding <treding@nvidia.com>

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqkgACgkQ3SOs138+
s6F9NRAAhrADoRuLa9YvQLDZbxpA/Tnpsb8Qm67NM8YOmqAeKzOKlE3WRDH63mia
MgbZAOoO3x31sfcku/u71k0fVKdDW4XEmCyCmthqj1Sv1hP5F4ySpAlewQZ5xV29
O+TyJHpegVlBkO6m9cFUU3doeO081pUPf98vGrHjX+S/8eWMnFp836L+ZOPHJ7tg
qC9MTCNdnQCMd/9JAvnWFO3l4d62gvyF6quaYVmanzbXrVZjeYQqfqzem8IeUsC5
6XowmsO9xCUR030DVMnIhzFlno9L7rhZ16qA8ael7v6Ehu95JIJ5Ptoz4NPytk15
loSt1C398luYGOxlVOoqN5eMiy2dYsiqoe/LCnkT8W8GnCCRhptcczyOddA2LoB2
n6jrzgGFRqJgC4vKowqMTLQdZ4qKCPbQbo7DKRy+xWYVLp+B5TMQ7A8I8j2u6Baa
yPOEY0qffNiPgR0xCyEqFRf5l+nuGdUQAmWOv6Bax+uq7U4lApTf7Dlc5HKcvWKh
8+PzEsQ94lrORe/COI2BNCrVfoyqne1ltTrJmE7aryhY3FR8S+RBEQEmju9mB/JO
ScvvU/wzg5ncg5Fy8U6dv1dhcRiqLHk/0Ejc4/MAZSHgUEXwldqsxSUNguRBpeK1
SQhtkNgXOkCnjhQPDmKpbKGFobvSCf1ZH9gdehvvAMasyTykdeg=
=j5aV
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
