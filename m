From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V2 2/5] ARM: DT: tegra114: Add i2c controller DT entry
Date: Sun, 10 Mar 2013 23:39:36 +0100
Message-ID: <20130310223936.GF4743@avionic-0098.mockup.avionic-design.de>
References: <1362852678-13421-1-git-send-email-ldewangan@nvidia.com>
 <1362852678-13421-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852678-13421-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:41:15PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has 5 i2c controllers. These controllers have
> additional feature/configurations to make it functional over
> Tegra30's i2c controller driver.
>=20
> Add DT entry for i2c controllers and make it compatible with
> "nvidia,tegra114-i2c".

Both the subject and description should probably use I2C instead of i2c.
Also I don't understand what "make it functional over" means. Perhaps,
since the entries aren't marked compatible with nvidia,tegra30-i2c you
meant to say that they are incompatible with Tegra30?

Thierry

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQuoAAoJEN0jrNd/PrOh8XQQAJbqkhIafoQ5nFE8DdE4Oz8Q
sq4WpAkEsYbOSQ2KB31yDqbttkFOEzphY4ooEN5ypUqGvk4v5mdfbtbPQkGopQ6a
IWiMym9g47KJNmolABAWixFCYFySyOiFQqRgOvlNtmR+0aG9+aSvzGYWBH4+SyKD
lj0KHj165VLsRg4DY5fAcyNNlNYsqXrJXpL3xcrDw9jW3pr6GjVnPPw/bXzW2T7n
3KU+U4wcfbIf8qNNbpO8Or+FqtKJtQbn/KNm1zeiJ4U1XLzE9kxiGY7RZkFu+NcV
b4u1wpL2FfUVwV3QeF8molVEiWvB8nwlyZ6YJME3NJYx6+dJesnkojypTXrMbYzP
B5yt7/ITd4z7HeAt/XonP5LAPHnDPilsHkPwYJbys+1Hwm7aVNltvvDZ3cX4Cgcq
8knCzLgCvURjdc1hcw3MsSfJ0//I82msp7SjEE8qrqTWJP37Wea9JoSGPB+kU/3h
Zkjxs0cLWn5PFaKGOl6PIsdBFKMjmOGeWfG4j7GulWEMqoYpjZz9d2UT5BspGCnt
HZUH6m3NIbTtfw7fhfwllKKrfE+mq/6gRTrUq9rsIz7SgkIehdZhN9IRGfwoze7R
RiNsRgJR0Ceukau6qlzL6QSNdksobtPnJj/HRNDwlpsC/hp8EM1JzlMMCy63hOPN
Q2ikQF2hgaiISsDtxGmp
=a+4Y
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
