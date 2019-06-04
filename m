From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 13/16] PM / devfreq: tegra: Support Tegra30
Date: Tue, 4 Jun 2019 13:18:08 +0200
Message-ID: <20190604111808.GM16519@ulmo>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190501233815.32643-14-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8c07nsHwQobhlezh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 02:38:12AM +0300, Dmitry Osipenko wrote:
> The devfreq driver can be used on Tegra30 without any code change and
> it works perfectly fine, the default Tegra124 parameters are good enough
> for Tegra30.
>=20
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/Kconfig         | 4 ++--
>  drivers/devfreq/tegra-devfreq.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2U3AACgkQ3SOs138+
s6EgCg//RWhW/x4dD2kG6xp3zwSVBovQVAQZakm4/20gtph1Ak6gBxzPVa9+8iIJ
9yYQF+yiAjfL3OCDSMJ9OOHVULKujR0KFrdV9Ui62DFXPT0TApvwf8jGu3rbsB2b
TvtL0iE4bEwzPMyQJWzWVqOiUbVb5Y9LrbslWnU2F6CeeV3Wp7Op7yscqwJtJ1Gb
IrvO7OohyV/1XlaZGrjQcNf8bWNADNiEF31nMZnTwRVd0H3nP5pMjPBTCBJcucFq
PmyNeL8AzNFGeAUYTFTQlxk2k7HoZcAVL0CWm28F32ln4Kt8phyj9qAx9An57hDc
2lUKTbph2r9SS2t0zkoqTLeHqspqepMwPpSuTc2pga/dOLC5OEnsadxDmgShG8E4
si9QOIf8sOUwYjQ2R1mVgQ9i7ytPhvoj/zHPz0LY2a/Zh9YBR6Omyas2OgRm3qC9
oedItj3W7Dlfkx7YDkZL4jlyBdUc2EdWgMQMFxKd3+38NWIdAJ1UUIl1rHopkg7y
F71vZp2r2ATKzKCp11pvLyrx1YA2505A+29tH4CEWuYA2yZHvnMuRD/0uaQz6GJP
8A1RYsU0lhVp86S/X8MD6Um1Ez29+p+E1j64rCd1uQbFqw4UoS4PwepXLJN9ln8v
4Nijuy1uktMhFtFouPdr7Sb8Tk1e0g2l9yn1U2RmRdmqA2rRSGU=
=mk8X
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--
