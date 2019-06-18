From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 05/17] clk: tegra: pllout: save and restore pllout
 context
Date: Tue, 18 Jun 2019 13:41:49 +0200
Message-ID: <20190618114149.GH28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FLPM4o+7JoHGki3m"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-6-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--FLPM4o+7JoHGki3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:19AM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore of pllout context.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry the state of pllout is saved and on resume
> it is restored back to have pllout in same state as before suspend.
>=20
> pllout rate is saved and restore in clock divider so it will be at
> same rate as before suspend when pllout state is restored.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll-out.c | 28 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |  3 +++
>  2 files changed, 31 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--FLPM4o+7JoHGki3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Izf0ACgkQ3SOs138+
s6HACRAAoY2W4UsKZljxr2IYcO5jw3l6eed1Pi5LyaUGbDHH9gVYo2xPr4WVid2t
MYuTEaFNH8Okh4+F8YC/HjfxcixZvmHCWRD7u3s89gdN3ElUv/jpHuQ9KKn7xsql
AC5mdlK6pqlOJK3hlFFsiiWVxegzGKHoVpfOscMmWJS10SlyMbp2WVX0IhPmz7Bp
swDcc18qxhHP7CVHBPf0CTosYqvwcBPQpY7/KnXyN4ayHJmAINl4xA1iZiuUxh/G
IKC9c4mK1a3x6QPP4YL4XLtnIVdzbE4Aw7fwQ0YEz/bKPQzLoIk9ZT1id1YaoRXJ
TGEVYVB42SmTpgIJxhOSIbjBxZl9m9KyCrTxAH2vJgRQ0f19mO9JFGzCG9vUKP6/
deO9943vDMKAh72qxQPbwd1+QEqje/O1N56NTR2IedFoiuiax8SrgssXo7J64nGO
62lzo7OSo3EAeipyK0kO74NP0K7BJ/3iae2ntE73u+1o25WlXRjsMzc9hfm8boIE
oG16ybi1XGKxeaqIo9p7YjovIttveS76TRWv/CEXL1X6XPnbnejYPIzZdrTr4qIE
ohLWgWKxu/zVuoPZtdn1QdS4sVo0bgWsBHzDSyeNEZxsSpRdJn3ZqRSjJgKlTRVt
0ok9Wdv+5sxWqVPZf4puIloLQVD3QRbFWDGSfpo2yKNHFrqyjTk=
=vltX
-----END PGP SIGNATURE-----

--FLPM4o+7JoHGki3m--
