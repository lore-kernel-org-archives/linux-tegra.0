From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] i2c: tegra: change phrasing, "fallbacking" to
 "falling back"
Date: Fri, 15 Feb 2019 15:33:58 +0000
Message-ID: <da6cdd39-b021-7834-f3a4-46feceeb66c4@canonical.com>
References: <20190215153126.18575-1-colin.king@canonical.com>
 <20190215153245.GA7374@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="py9g8dSNFTOP9VgyMmapBVtGto0resIai"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215153245.GA7374@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--py9g8dSNFTOP9VgyMmapBVtGto0resIai
Content-Type: multipart/mixed; boundary="TciyCQDuoBWwCvwwCrafxO9WdjqqkozhV";
 protected-headers="v1"
From: Colin Ian King <colin.king@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <da6cdd39-b021-7834-f3a4-46feceeb66c4@canonical.com>
Subject: Re: [PATCH][next] i2c: tegra: change phrasing, "fallbacking" to
 "falling back"
References: <20190215153126.18575-1-colin.king@canonical.com>
 <20190215153245.GA7374@ulmo>
In-Reply-To: <20190215153245.GA7374@ulmo>

--TciyCQDuoBWwCvwwCrafxO9WdjqqkozhV
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 15/02/2019 15:32, Thierry Reding wrote:
> On Fri, Feb 15, 2019 at 03:31:26PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The phrasing in two dev_err messages is using fallbacking which
>> os less understandable than "falling back", so fix this up.
>=20
> os -> is, otherwise:

Oops, can that be fixed up when it's applied.

>=20
> Acked-by: Thierry Reding <treding@nvidia.com>
>=20



--TciyCQDuoBWwCvwwCrafxO9WdjqqkozhV--

--py9g8dSNFTOP9VgyMmapBVtGto0resIai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcGLapPABucZhZwDPaMKH38aoAiYFAlxm2+YACgkQaMKH38ao
AiZFGBAAo8ybfY7DoUCaX29wjYKjFqgZVEOJVV8Yk1Wa5iBOHCl+v/LIwJ4uIjmQ
2+PENd/urGB7xva7UOmLCXlEgljxu9Dni16oAh+YoDh33i0Bgda/2pJktMwzi/qE
nE8I8yiSiZgaqqUC4v8Wd/XKoIt/a54pGHqOUXGc+LiIq0xQnzghbhFWaKIXmUv1
+DJHGyIYq6PDmyokiqm/IEoER6H47se1n7cSYswMAH/Pwm28+B3MMbe6GomAqPak
4nb4JvlR/CBqMhvAZBZYNrFbefw6MDQhrDUUcGCu+iCGNCex+1KzOeAfNB3HrRgC
g7vzHWDDn9Ab4z4e0XDFw7kYQe8pqnec9kMh6e7srh2CWFFvluY2yWsnTddZTXHL
YQW38T9+1L0zQ2HF14fB+SANvJVzUxzGZzSMcPDAQXl63M3fiyCFyONNP0+nPX//
XYNaHpA0Igkg2dYEsNPXHEDnYhHiMtkVVfXwBp2DY6FeGW9ORWUYIAFQ6cPnZbpZ
KhFAxwHyKYd3FjMDL4gUsmmPAUXCeVcL/h0bRxQMO+h3Fn0XMdnvIucAI+OGK6+0
uRX6Or2UmTZCEQwrgk/IZJvYZTKqBZoxSvIFi1nu/UVyjUceeXbOG7/2FO3G4fR1
JiZj9Wh+koaxzBsCLNSnqRxn9fpSD7X2Vjv99A3LK/AuTF2P0yc=
=lOva
-----END PGP SIGNATURE-----

--py9g8dSNFTOP9VgyMmapBVtGto0resIai--
