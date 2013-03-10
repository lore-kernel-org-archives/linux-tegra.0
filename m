From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V2 5/5] ARM: DT: tegra114: Add spi controller DT entry
Date: Sun, 10 Mar 2013 23:51:17 +0100
Message-ID: <20130310225117.GI4743@avionic-0098.mockup.avionic-design.de>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com>
 <1362852678-13421-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852678-13421-6-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:41:18PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has 6 spi controllers. These controllers are
> redesign on T114 with different register interface.
>=20
> Add DT entry for spi controllers and make it compatible with
> "nvidia,tegra114-spi".

Similarly, SPI is an abbreviation and should be in all uppercase
letters. I can't really comment on the rest since there's no TRM
available publicly to check against.

Thierry

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQ5lAAoJEN0jrNd/PrOhl3QP/Av24gaUtZdgUx0lPl2RY5DM
mBqTaLittlRHw0v6WLGiidS3ZIRN2lMn33XZUC6UTZs9Z8xoDokQ90gTPWJEFQe7
yAfV7b0xg5m6yZ4G2iV98wx2llJQcmXtYEBc/cxayYxLOwt36PAQfmUC3eeddUD3
wgKovUpbAT8cBkFYG85oMMbKfjf3ag52ipBrO3NqO8lt7nY2HlJDOsMOddlUUdG8
BoI5tvh4EFn5P15KDHdlZbSq5H05AwZuxCQaFqwKw4Kw+RZtyIHHtuLNlhXPqnOs
gVHA6hEpAKJJEKjfSdEygtzhb2EQBW/zatK5nhmmUjnIUwYecSWLIoL2OcIB51Mt
ZlHqajVgyhON9k66s9NfVxp25zmrh2CjcIEIYYTCKZkPedG8n1+jDBXVNONRfUWt
A+yM6N7sbUtT3tYPsS44psta0U6z/Vc2FG1V8xF+d4bYwgsHyf7lXxaC3hxDb7cl
GaI3yUBLhz6qLXrVvM+7u8fxsywJGoFm5G7ZnJsJmT/ROWBS2XNO9gXzjyODhg/a
ymPYP1c+9D/+E8kp5/0sFbeZ0i9syZMexyxW9QWJFJHyBL8NKj9xy3m60IKhjaIT
HW3jtzLKYZZrtwpyB3JhI1DtxgjGmlyspQliVEWWSx/zT7uSQDAN+u+BiOYBUyqE
2qsRIEH+Jg2SQE6BNmKQ
=zxVZ
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
