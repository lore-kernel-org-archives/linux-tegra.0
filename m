From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] memory: tegra: Make terga20_mc_reset_ops static
Date: Thu, 11 Apr 2019 11:33:01 +0200
Message-ID: <20190411093301.GC4633@ulmo>
References: <20190410140450.31604-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190410140450.31604-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yue Haibing <yuehaibing@huawei.com>
Cc: jonathanh@nvidia.com, digetx@gmail.com, jroedel@suse.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2019 at 10:04:50PM +0800, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
>=20
> Fix sparse warning:
>=20
> drivers/memory/tegra/tegra20.c:277:33: warning:
>  symbol 'terga20_mc_reset_ops' was not declared. Should it be static?
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/memory/tegra/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied thanks. I noticed that you use a slightly different name in your
git author settings and your email setup. The only difference seems to
be a space between the first and last name, so you may want to look into
that to avoid having any inconsistencies.

Thierry

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyvCcsACgkQ3SOs138+
s6H3CxAAqu3KSq5VHxMoNXIIzmtxcijOO3c3p+9Lv1rYg6PrOWy1Pk9w8i76n4Bm
/GJn3cFbXh6w2fXd4ZovGYD//1RBjl4W4DIxn+3RFzGhV2VStkGRdm26IJqk7+A8
aizexYsa1pvboxmY9csoHl4nF2mCabO4MGVG9c3Y9Or+/K3wQXH6ivTxHi0m7y6Z
jHQCCz8mSgCiYQvG71vVQGY18N4UZuC/cSwPNTLdeq/8yydPKqD300WZSQkp27Ed
W9LLiqK4WCsRbzgkXkhv/7KBT2aqzD5T7OK18sMx9HOajkAqKarUzNJ19VPjG4t4
Hy+Q4L+iPJ3hHzx348BmPjb1/tVC/tHwKGQ4DRu68zaIo6dQEkmEXcYP1y3PJtBM
HrtLayZT1ISz6ynta3Im9UEErLZq4/W7NkEUMvTxPYrDIzQaAmCLtz3pRKYi1KsA
X0Dku5z1fQE2NnKQyNZ8/kqcuRfG4EIe9UtCV01Mafo1M16uO670lhoRdc83vYS5
5CJqEKYshH0DBMLfTaD21MNRtWbguGrdflw7/IF/fgDE4bz16zaFC/O01M+B3f+Q
z46XFks4O8wHGW4/Q+pZ9HRAcuI3oQtW+fm+5l08IcgKAn1FeD9lkQO9XnSCbRnK
qMswaMr5gRP+pmoQn01oBYo+fjS26sK3SS5jbN8OuX040ebSWi4=
=AsFa
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
