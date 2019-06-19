From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/tegra: Cycles can't be 0
Date: Wed, 19 Jun 2019 10:19:07 +0200
Message-ID: <20190619081907.GH3187@ulmo>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190618140358.13148-8-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:03:57PM +0300, Dmitry Osipenko wrote:
> Tegra's timer uses n+1 scheme for the counter, i.e. timer will fire after
> one tick if 0 is loaded. The minimum and maximum numbers of oneshot ticks
> are defined by clockevents_config_and_register(min, max) invocation and
> the min value is set to 1 tick. Hence "cycles" value can't ever be 0,
> unless it's a bug in clocksource core.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J7/sACgkQ3SOs138+
s6G7MA/9G+CmXx9PZo3EMnR8P9HXMQopYOOzkDGXiZBqCTuZDW4Q+6YD5TXMXi0d
qcwWbqbB4vMcTqGZcIiBGKWMqybDx/KwmiZMugif+8em3lF5zcwsCQE/KUv6Imk9
LgKNB7lkMT12luQLydhUx5VwWFRLGtX7do43iR0MVxzqQlsArsstsBlU7YZYoOr/
QgCnJ+/MeqggTBv/DyURec7wDHcWBBWyrojNE07zPOVE2mMk661ayT8otdD8O4Il
vIore5FVcks3m5zrdTNgx5kb93/KYrlqF6XYED9HIY2a5cHRt3Fo46ykiiBrVgY5
rF9PoHd9KNRSZ5pDg2PbSZZLlOA53BLIneK6rEazlsHkOKUhMaX80Fse7HHUC4sO
7sdiHgn3FJIJiypxDyGK1dDQdPCsgboi4whEMU5ROemnDSgxKh2uCDEExa+Z6Fab
wxJMTNvQoxk6YJXg7sBRbhUCwCrBIx89RJY6pElZk5Ki/zSJyM502KZxxXCUeUG6
G/oHwQt53tkwwsW/6SdSrCuFCUGbY0T1g/GvoUulU3tCEt/gaExPoKGY0h2oLlY4
1j9Fsa3AG8yya+ZkQlVXtxofrV6S4P5C0sUuJ9+L6jaXvc+nHKoyav5j42O/YfAy
PsmucZmlDcK+6w67YJKd1cOYTkTpkWKb7cctNHIIcv4Ruq5US9M=
=vn0b
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--
