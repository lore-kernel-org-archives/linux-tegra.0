From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 04/17] clk: tegra: save and restore divider rate
Date: Tue, 18 Jun 2019 13:40:46 +0200
Message-ID: <20190618114046.GG28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DNUSDXU7R7AVVM8C"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-5-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DNUSDXU7R7AVVM8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:18AM -0700, Sowjanya Komatineni wrote:
> This patch implements context save and restore for clock divider.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry the context of clock divider is saved and
> on resume context is restored back for normal operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 23 +++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |  2 ++
>  2 files changed, 25 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--DNUSDXU7R7AVVM8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Izb4ACgkQ3SOs138+
s6GtwxAAviO/ThuX4ybgSd/ZL/GOirDmu02i4uTsQ5Wm4kTRBo3Jc8aeblP0Kszo
Ox1mHplhKTN89iKlj3GmvojZg/xCWMgxvBwCuwQq4LFi/6gdqqOGswf8l3TTr6tT
kKedG8pIp6ATttA9oj8OULPfNDgqvW9vllrCg9mMlHN97NwRND0QNQCiAML2WBV9
BrH/idFUGJrbr/0rYDbtUt3laRIqh52D/iTT2SQyOmLySiqCMnYRL/X7t9sENj8u
VS8CVRaOqOFDUMLhf8a8FULq03cmS003N39gWJ6MTmbF3CRpEFGoCtnWhkGeQ3Dh
pjEqHfOVmLFxYweDIZApplLuQOPSiqQ939ylThCefvKfgDtjkNYVxOE6MK6KmLc1
EYWf4vYx3OQhT8a3FhvPSvxkdeRkLQ/1B+YPFBG03//b5Dr3gc4hPssoLbMF5fYg
IBY1iyX+9Iblg/pbGX89kSnC4fEuIwnKno0cs7X23r3sCINUSujTJ4loTNAt9cwJ
V/kK3o4Znb0zNJkmM3tO+R/yyVZDIKZFvE8Rdzr08EtLYKxsDm8mN5b4u1uWlsg3
OT+mdPggLc12ZEVaQ/TwHaFE3lYEMir8aDqfB0nLgIB97g12Dp+psgbAhuZd0193
yocFb7wxUT5a7f3myqobBZF8oTmG3gTS5fDo7XoLd1sPUzyj+ok=
=NUzB
-----END PGP SIGNATURE-----

--DNUSDXU7R7AVVM8C--
