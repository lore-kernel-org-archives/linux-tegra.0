From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/8] clocksource/drivers/tegra: Restore timer rate on
 Tegra210
Date: Wed, 19 Jun 2019 10:17:56 +0200
Message-ID: <20190619081756.GB3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:51PM +0300, Dmitry Osipenko wrote:
> The clocksource rate is initialized only for the first per-CPU clocksource
> and then that rate shall be replicated for the rest of clocksource's
> because they are initialized manually in the code.
>=20
> Fixes: 3be2a85a0b61 ("clocksource/drivers/tegra: Support per-CPU timers o=
n all Tegra's")
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J77QACgkQ3SOs138+
s6HKVhAAuoQ7z7ZRf/w81QpPE0Mf9qG1XtWwgG6PU35inY2dU2m9a/e/wOLskJuc
rMBaK6kTTdVGtq1r0l96KxATZ3B8YDrsGgXJUyzAdy1Q72Vn/AUdbuqjIlanYx4P
XN64XA7FqbqzAn+IF3s2ZoUcZ9zrvpWs2KGYGBd2BmJyMwy7z3FMRNj3XbO10GiH
LkN0fHSgm85qb7kudxyPirCmUfdcG1qHGb54P/5m5jRHnBckeotQat4BTFZ+sO+z
HRQFxbvhmfyqwvrtSo6UqnmDtVuW9+R1Qgff/u4jLQj35KfMnqfTHRQJNwwTUnOF
bcRDx0zB4Hesrtk9mllDh4iJqOxiIHJ+Wtu780kKZgBIa7P4qOxRdnkaNwgsLJyO
5pkVAx8ETwrx6+Q6lXM5Gw8NTB84zEDfJifV84tYimn/qeBrkN16i2qOpRToRcnl
/UW8I6CtINNUDTX+cLloHWt10ztX/J/OphEP74gqG9/tELeVLddYoh2PgmynNdUu
93bu6h8q42qOHTPbz2mlVKii2e6mfpyklGqXVCQV68TchEeNccsXvzy/YEnPuLgI
srAI6Mj8nshjXQCLoHpjSHKuv1TibwrLf0LLPtraCt5shg6wwEqPtiJsFzgxUBbe
pdmqNGR6Qf8pHWXrv5Kqhib/+VyqWQ96m0Q5Bv/AN5bmf8kJQ2c=
=evgu
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
