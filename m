From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: tps65090: remove usage of IS_ERR_OR_NULL
Date: Tue, 1 Oct 2013 10:22:58 +0100
Message-ID: <20131001092258.GJ19304@sirena.org.uk>
References: <1380600664-20649-1-git-send-email-badarkhe.manish@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t1cwe7X0UXDc61Gr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1380600664-20649-1-git-send-email-badarkhe.manish@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Badarkhe <badarkhe.manish@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, lgirdwood@gmail.com, rmk+kernel@arm.linux.org.uk
List-Id: linux-tegra@vger.kernel.org


--t1cwe7X0UXDc61Gr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2013 at 09:41:04AM +0530, Manish Badarkhe wrote:
> This patch changes the driver to avoid the usage of IS_ERR_OR_NULL()
> macro.

Why?

--t1cwe7X0UXDc61Gr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSSpRvAAoJELSic+t+oim9hjYP/i7SVX6VN20kcxecyEP0+m20
caj6EFEWJTVOQ4JrQDnvhzaQARHZ0ZHdmiIOKJ6M9bG8v/LL5HMExNqCBdF7/EEX
1PK42M7QtUpw7W5Paj+FCHgWJkjKNsfi0VOX4ooSxuyM8Grb94szulzy7NMeCXLa
joHz1A8Y0WNpexKuIPwWOqih5VFoCoip9h6Mz38ZSOpw7pTX0+G56oILKPfvhipJ
ZEnLW1guJfUbSqmw13shd+gqnUJ6u0z/vIF8upOx9BR2CuTRCgT6SNOuYyYpCUkc
oW1di4zXjXPDaf6C0eZ1KmAdQ0yIWelr2Gb7qxWkI09jn8nErjuBqBe3hFEWpkd1
+z/Q+ekDpVogMZObcssBVUI/GQ26l0gLlAB95ovwtBS23ranxDAAN31JBGr2MURt
YQf2L6n9PAYfNFMyD10ayRv+5IiF11C+ewj6Ez7aXjFbwdojj6BSWdiXcXmXWTIF
1fYuBtRbgg0/C/tOHn4uPvHlSzDdo3vF8vk2wIWsOiUAO7ezbW9gro3t/OqFInmS
zfuAc2yu6+AfFpbsh6dyJc2GpAT8X09rVTpsxdEL7c+60eBkzmogu5HZx9fqIePC
cSaX3RSSL3BELuTpJKEnZ9y0H1yb5/7QnfS808BuIft0FLyAPhDACrW7RpI3KAug
Y1cB5+0fKT+OECMYPYNd
=zrZI
-----END PGP SIGNATURE-----

--t1cwe7X0UXDc61Gr--
