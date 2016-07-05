From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: tegra: Correct error path in probe
Date: Wed, 6 Jul 2016 00:22:09 +0900
Message-ID: <20160705152208.GC3641@tetsubishi>
References: <1465936007-18599-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465936007-18599-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Shardar Shariff Md <smohammed@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 09:26:46PM +0100, Jon Hunter wrote:
> Commit 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")
> enables the Tegra I2C 'div_clk' for adapters using the multi-master mode
> during the device probe. Although the probe error path was updated to
> disable the clock on probe failure, there is one place after calling
> tegra_i2c_init() where the clock will not be disabled on failure. Correct
> the error path so that the 'div_clk' is disabled if calling
> tegra_i2c_init() fails.
>=20
> Fixes: 497fbe24987b ("i2c: tegra: enable multi master mode for tegra210")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied to for-current, thanks!


--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXe9CgAAoJEBQN5MwUoCm2+2wQAK9j2Bvh9dqorxuWTk8kpJ9D
HT2XZaCn5mb68Gr62O9v1MCcHtEoYv0/f+bzPjxlkaQRxClZrJNHiSEne63t0ht1
ITx+x+cNjrDyZH9+X7atXy/EUauaB426/CfqJBIXWyeZJguZRWCckzbBq2OY0wWq
Qo/kTH0r4Xno0BG/t0bmlnuj+Qwafx//qTzxD6Udo3hD4qvEaPv8mn1kCNBHm4vK
bACqg0XGtS6UHKUVqUWXrrq4bhvpVZs8s1bt6AHsHHIeQpCWdbnp5aArfWlHhZun
+S1wA0VVYVnOGvioG7HEJNw0F1BGX/LjzjxVfMNRHRl9uuRk9srLph+rLxkBQa6a
1oXB4fFS1l5+igHkwND7XECMHpHszxa4wzf5g8LC/eAFcD7AoitJyAUIUcTZK+wJ
8L5zOWMFV+Il5JE4N5tTmTBThDkZBwcfBgmRr83xVctF3TI3tHkcBJGLrR8Cbqd7
HT3KXXHeSyMZHCYlQXjktJ3dS8jD7AYOmUk8t3GG6zVmJXyAd0mOWbWkxJeZdsB+
rD5sqlL8+aed/sQ3dQR9NL5L3joiDAzmxsRcQqskRF8u+Rf/L1wzajZiAg64uwRZ
yf8kbcrKFB6xJ/jSx+f/AnbQxMgru6vlWIFbwzfclxHqoSVDSUhAY1cAbJlUXlHR
WUcoYgY17GRbmYdb/0FN
=ttie
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
