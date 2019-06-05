From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Date: Wed, 5 Jun 2019 14:33:27 +0200
Message-ID: <20190605123327.GB724@ulmo>
References: <20190605122613.21303-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605122613.21303-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 03:26:13PM +0300, Dmitry Osipenko wrote:
> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
> macro has no effect for the OF drivers since the alias is overridden by
> the drivers core to follow the OF naming convention of the driver's alias,
> which is based on the device-tree matching name.
>=20
> $ cat /sys/devices/soc0/7000e000.rtc/modalias
> of:NrtcT(null)Cnvidia,tegra20-rtc
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/rtc/rtc-tegra.c | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3tpcACgkQ3SOs138+
s6E+Ng//eZTxse0nIaE8yFtTYIk+8duVndMR5gjd4dlPfNlYj+22Mwbrkjdbwhaf
6UxRgSSDeEBIsRIogl7Js/UzxOhIDw6dT16DItWGUVNoX5CJ/kAXhimnis4x7guh
IHiLEBfJLmq1+x2tq+oIA/P7CpaVpSjII/27Be5ju84T94SDiGwCKqfCpLyWCePC
XNghQ1CUJWj9GXltqg2Amjbn49yGcYId16DwHHfbqeeQYmS/Du1IZnQEevMMy+92
1EEow8h4LmfBmb7mq97Xl+ozX7ADgwwF+3oEGLpuFrSKyInvND8VW8WG4zhPa2SX
TQ4NzyJe9AqJh6MXMT+zL9Jd3b150AE/+VHcDKb42IETXi4KIRg2dmBV1VxOvg0G
b/fDJtMtOI/XtCG4Eca6wc+F6y9KkJ07d53FTuja1CZmJ3nyYoeZS7OLWKOxmurR
2kire874EEt8R8WHX3P5yE/qz2+6LlShbluMMRy8OyxSETkandrjFZVyghT/LWp5
zi3NvxqmJw20IMODPMguloMBXqaN+ahLzZOcmzQu85w8lc++A2z53Oqd94JckOC3
9B04eXEzxDtz2rJ/K07JAt9SR0fV4cmMMTWbUh6OINjCOcOHsHLTlu6jW69ey15H
kt94WU6mhdsyImTx4glAK3hmhtF9xD4+GKkZ8k2veTLJZLoKzH8=
=Yr7G
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
