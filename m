From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: rework pll_u
Date: Mon, 20 Mar 2017 14:20:21 +0100
Message-ID: <20170320132021.GH22463@ulmo.ba.sec>
References: <1489500769-28694-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489500769-28694-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2017 at 04:12:49PM +0200, Peter De Schrijver wrote:
> In normal operation pll_u is under hardware control and has a fixed rate =
of
> 480MHz. Hardware will turn on pll_u on whenever any of the XUSB
> powerdomains is on. From a software point of view we model this is if pll=
_u
> is always on using a fixed rate clock. However the bootloader might or
> might not have configured pll_u this way. So we will check the current
> state of pll_u at boot and reconfigure it if required.
>=20
> There are 3 possiblities at kernel boot:
> 1) pll_u is under hardware control: do nothing
> 2) pll_u is under hardware control and enabled: enable hardware control
> 3) pll_u is disabled: enable pll_u and enable hardware control
>=20
> In all cases we also check if UTMIPLL is under hardware control at boot
> and configure it for hardware control if that is not the case.
> The same is done during SC7 resume.
>=20
> Thanks to Joseph Lo <josephl@nvidia.com> for bug fixes.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c      | 174 -----------------------
>  drivers/clk/tegra/clk-tegra210.c | 295 +++++++++++++++++++++++++++++++++=
+++---
>  2 files changed, 272 insertions(+), 197 deletions(-)

Applied, thanks.

Do you think this actually fixes a bug? We've had a long standing issue
with booting Debian on a Jetson TX1 which is due to some USB related PLL
failing to lock. This sounds like it could fix that particular issue.

Thierry

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP1xUACgkQ3SOs138+
s6HZZxAAnD/+1Srk7zp8ptj3CqI3CZcjH8ESaUhjCsPQB/8tL14sQID42gqq7GJr
fTZ/CVjKvvVNH4IcNN2IMPm9xBswtH7Cxn6zWE36bEgqRpue78LSGxNtw+JOnsRT
mhTEezWu+0DDni4+kafiMp+4ugh6upcSZnXussSrMwp7NzBRrBy79Za/upBXVFS7
qfO20MMuc8OiDIKhCTpyuFjp8tVq4cf2wre1+HGWE2KBiWQkigrHy5fwEdEGdILP
Ysge7yIoX0tO/5TLxMeOxZHeVfoWXWKlhvm6Kkm1Kf6//xhAhYhInV7EwQkfvJ9s
4eRAycoxgNWjkYqexoUrJQgAxOj0q310e4noAG/jM5hI7E3HgGgOdLF0FFsUwFwm
MgYBCCgirUu2U8uDRSpkAx6TMgClFtp6t+Lu88fqqMbPKC6NSeAGp7XvpTmuJtGg
QIQjj0iBISue/TvuXDCs2TZktTn5qSXuaO9IrxKpLUUT75tlRdGjJSKSwC49Jlxd
kHcZgvbKSG1Ry6y+zW2VzZdxrpv+0TqNe9Wu7pIKV1YNdsvNDY9VG4SCNa+cJahU
3np2CKD/Gyw9gziVlY6x8E1TsVFLh78fvXV08TCqjiomgl3kEhVdSaFV7AuexKtR
kyyJvgD0eFHe96JwlKKc1Qc+R70jqNpSICMSCkf6ZYC4+9BP+s4=
=faJ3
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
