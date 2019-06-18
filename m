From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 10/17] clk: tegra: add suspend resume support for DFLL
Date: Tue, 18 Jun 2019 13:59:13 +0200
Message-ID: <20190618115913.GM28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-11-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VB1oQhYtJt8uuzk+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-11-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VB1oQhYtJt8uuzk+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:24AM -0700, Sowjanya Komatineni wrote:
> This patch creates APIs for supporting Tegra210 clock driver to
> perform DFLL suspend and resume operation.
>=20
> During suspend, DFLL mode is saved and on resume Tegra210 clock driver
> invokes DFLL resume API to re-initialize DFLL to enable target device
> clock in open loop mode or closed loop mode.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-dfll.h |  2 ++
>  2 files changed, 80 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--VB1oQhYtJt8uuzk+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0I0hEACgkQ3SOs138+
s6EKmA/7BKKxe4K40G19IsWN0t2GnZNUe6alysAl7lWVuw4DHcAHG1DTpZGqAPJU
5eP6/jwJZYVC7cR1bDT4S/tnErF4ZJZSPGDPwtEPTpiX27hEGWnJl/PiFrAEf1m2
0XhBlK7P5j/n957G3pRJrvfz1RkSxT5J/0wZwkJIPaU43v6Sw1pxB/NiwHRW+eIT
PUaw2bNytrTJWoVmyyxDXHc9R8KCbtkJNtIAXxSE52Clde/uaSyDhBfqbbzBs4kV
YGZEqkh3uAG/Q9/ZGDd5XAFR3ZToNJqAac+QYVhV26Xo9UwV9Rsy7eLxYsLO3KvW
szw+frexcDuuV7Ecx75VeFhf7oaam33TvQPUcrWAO9NWfMiNzAzbtGVS41PjQM06
f+3y+4OnSSdc6z6RlfKqFzuzfs9b3qeOlsR0CRLDiD6/wgJ725UeFsbga3vqCD+3
AH0euxJCJCRkLjOuEXO/p/So/TA46OstJmJm6QZYgGwwVFWYjlUT756TVY7xrlqg
NAn4PxiJvaY+JkR+bWKH7+6KfpOzo6mbvQax43QsX0CmoKUHvCwKyY5/4jkZ25lI
QBQkmmXCMrgPlACpPjtcKfTlJ5ExDJQqW13r4wg9MIiSKGoXMuvUbuz+WPDDFxVq
ZdcJixDmfeYsrLm9eCwV5IaFy9V35f2M4Y7qfqL7KyDFTCE1WTg=
=BZR8
-----END PGP SIGNATURE-----

--VB1oQhYtJt8uuzk+--
