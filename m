From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 14/21] clk: tegra210: Add suspend and resume support
Date: Mon, 12 Aug 2019 12:17:19 +0200
Message-ID: <20190812101719.GL8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-15-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3xQkynibq3FKlJyM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-15-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--3xQkynibq3FKlJyM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:53PM -0700, Sowjanya Komatineni wrote:
> This patch adds support for clk: tegra210: suspend-resume.
>=20
> All the CAR controller settings are lost on suspend when core
> power goes off.
>=20
> This patch has implementation for saving and restoring all PLLs
> and clocks context during system suspend and resume to have the
> clocks back to same state for normal operation.
>=20
> Clock driver suspend and resume are registered as syscore_ops as clocks
> restore need to happen before the other drivers resume to have all their
> clocks back to the same state as before suspend.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 103 +++++++++++++++++++++++++++++++++=
++++--
>  drivers/clk/tegra/clk.c          |  64 ++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h          |   3 ++
>  3 files changed, 166 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3xQkynibq3FKlJyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RPK0ACgkQ3SOs138+
s6EALw//YUajBdPK4FtVwcA4OIK8GLJi4rRvPYUFKpGPdKoebx0XvmddXHMql1jz
Z/X4hPffkZ3qc7Dk849Dqqkr8pX3FFUKjIrn4HdlNYxXcHzGjtI3/FR5AA3VleFN
UcgaqzN248n5VL7QDw1xdwJ/OG1rluR9TbHx/Lqido8ohbGmeebrcSyqs9eeU92R
dpFqewgNOyBrr07g3yMgyV/ntGvFqBqjb48PLgZnXNhgt08N5F8P/hypIACSwE3N
o0q1GY/J8mzIRFWwOMRkw2I7NkHto07C+lumrq8R0UqtdVYC5j33lnnw6L7BhQcQ
ElQpej6y3XAMKTQt74Gf6bM3nYfJyiyh6c0MqGISkQOR5k6pBYXljOJlsIAOL3Qw
8adsNWCiEdaYPH6jWtm9I2PRRl2f2js9rMBla8RUW93e00lcN2JI4jLv/DkM/Rgf
0hiwsEn0UelnV0GlvecbbVMvWElj6OsdtkRprJ0tlu0UD9LEwvnkMlKikiJuFgq5
Bf1F89JCeMGixa+oLU1+R7zsSW5TiHuFcoUJZwB7okUIEN+i/3ZjfHlwh/iWOPx4
NffENeaDzZ/Pt0oMzEjNde9O5ezWXjOcOk5Hvq5b42CWoybtC+SLFV9MTNBYfaZb
hHwouuAzg/pvY2TBrNCm10lvbeoYBaINg+HwCcCxLZvUvBsQnEE=
=zcts
-----END PGP SIGNATURE-----

--3xQkynibq3FKlJyM--
