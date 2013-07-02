From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH -next] spi: tegra114: remove redundant dev_err call in
 tegra_spi_probe()
Date: Tue, 2 Jul 2013 10:50:00 +0100
Message-ID: <20130702095000.GB27646@sirena.org.uk>
References: <CAPgLHd9XEH68ZnG2ou0K+EHn-ZWH7Ax_cmJOMBHjFcHgVscLDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DyGujRxquesowawl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd9XEH68ZnG2ou0K+EHn-ZWH7Ax_cmJOMBHjFcHgVscLDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DyGujRxquesowawl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2013 at 08:37:44AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied, thanks.

--DyGujRxquesowawl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR0qJEAAoJELSic+t+oim9zx8P/2PjCUosOoTYHJI20UzF4RKh
GRsdI0Df1Wue3Iw0jEb4q0RcyuQPONfY20rKa5M3wdnsOgU0+tRi81GRoSx7CzsH
fptieVQa4XZCj2TL1SNSPHjsGdjh+c1y4MQW2cNFUIZ2Ja3Uk9g44hSo3hCdKqz7
UdRQl5VJr4bh3FixFag6bvFXHhhM9XacCuWKD0SR83kr3Rq64VWkNK8ddq1yJpis
y4qFivOF6XYim5qK6urV7CYzN14iAzqj2aRvbIiTVv7IAilP4GFgK9P1I00sNSwY
sCmAF1C4rkCwTAwdZEd1BXKzjfA47BWNNXwysL5czcIa/Pw/D/2fCviU8HVHZFpd
bcHQLETh5RGBg52YLFoOl8KqpmdttlsuWI3X5q4pGNr7uS/uFkKzD/rTB9AIk6oR
Sut2QboDg+ihYOt6GaLunEuQWsEsVZerwHHWQKGT0IqzSJFwEL2y/BsDQs/OWuv3
xi09Rywfq1lCOOKrpdgPlHnC+DMLaUvl4ofW8L2o8bmwBqDlR8T+i2CCB+J9hxK6
eXzlORVARu5B4NWD142kBFjVuj8+IDliKNhErc7r+7M60IcBHyYLai4FrL4635cr
leSR49t0sHgBaEUotAA5p0tYNo95O+PTSm3vv4hcHYhQtUC3tH1ksSbTG8SikM0B
xALKUn3oF9TL/hJ7e7Ro
=d8es
-----END PGP SIGNATURE-----

--DyGujRxquesowawl--
