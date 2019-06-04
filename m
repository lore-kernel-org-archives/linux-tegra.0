From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 10/16] PM / devfreq: tegra: Mark ACTMON's governor as
 immutable
Date: Tue, 4 Jun 2019 13:15:15 +0200
Message-ID: <20190604111515.GJ16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-11-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-11-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:09AM +0300, Dmitry Osipenko wrote:
> The ACTMON's governor supports only the Tegra's devfreq device and there
> is no need to use any other governor, hence let's mark Tegra governor as
> immutable to permanently stick it with Tegra's devfreq device.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Kconfig         | 1 -
>  drivers/devfreq/tegra-devfreq.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2UsMACgkQ3SOs138+
s6FeHw/8DpennipWHJZs16Spe8PMpTRqUEUMRe1bA6x36n7C9dP3gYROw09b5ySi
a1Eea+j8bPt59BB3FRWjQbGVkiR4ckSWzbcfwNtAjk3ISpte8YzzQppnbgMaOkmt
SgAIhvFKKcC27260sSn0VSpWjU4I4ruXUO5Y52YcRrNdxBodObcV1AcTNrlZbrdd
S9rK9pQT7WAJfMjRAEeAbWQ5Vqg8PS4jvxPHygqUoZxmh3ZVTJLPsiASYfRt83TQ
7ynFRYWqi6JKyMw/S0dRUSKG38vZdeAQyeiPMdh3so31GItLD5Vwy3Hfpbrkiqg1
wFveOrtgQIonYmk487eWDu5EgqQUnlpDclU0XL5t0v0Y0lBpNm58G58mxptelK0I
cf8IwAtwucgEltpfFpxuOHOZfaKfS199gqlYAUlUVtZcrx/PDf1FNRDFDhAj5MZY
fnXevxW9x4nHx8DBoEsUufIfSbOIFUgff9I1VrqprtHY7X5f+t+S/5dT8oc+r8yF
03J7+unNywVR9y5I9tQMbgpnGn3Sb/vklqjU3Yik00cPyqaZG9khBftCJ4EpOe2W
c2rAosrAR19aiSoCNJN+Ttrwa8xvSXIj957e8+uocM0QNN9K/vU8HanC9iAFNCp2
Ea3NL3AhomKLeGF/gIEUX6FxFlWVqPZuISutPTHNujZQafevTXM=
=2pq8
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
