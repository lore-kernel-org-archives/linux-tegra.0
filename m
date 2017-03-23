From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V2] i2c: tegra-bpmp: Enable Tegra BPMP I2C adapter
Date: Thu, 23 Mar 2017 21:10:44 +0100
Message-ID: <20170323201044.cpvt4ewjxvwsmo67@ninjato>
References: <1490270216-7234-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aylkrus223v636r7"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490270216-7234-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--aylkrus223v636r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 11:56:56AM +0000, Jon Hunter wrote:
> Enable the Tegra BPMP I2C adapter by default if the Tegra BPMP itself
> is enabled. This adapter is used as the I2C interface for the PMIC on
> the Tegra186 Jetson-TX2 platform.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--aylkrus223v636r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljUK8QACgkQFA3kzBSg
Kbba1hAAh/AVrs8B0P7X0oTqkYIiKHQhL0DlTlax8klcUQpLuUjawB4qSU9Gpt9V
xB9vW/uLnxUb0sSUdHtXrIVKBewdM0ywpwzt8l54z+J2iODpgtJBbX6oRp8f5S+W
+9mFl3wI+rW5mn25I21wncj2LVd20wj49t7pXzimwLF4rJiZAIXAtdOP9rIq6Ai/
XQYzlDqM3x0geH8YoaPhiLwRUMwoVKO9C3HtAFpUNbMeENDY/UzZsB/PgUZQq2ge
UdnrmQY5PaFIvKs/d92L+Zf9HHhQ6lLXISPSOJTzV2L8yD28SQiPBT5/i4LMfhzx
qpRdgQ4jmXpOjcPfhVPKiGwQnoXasrGiaPiMSgKJ647jkK1XVozcLZOKEvV34b77
xemI6QmYa5+cbUqkvpl9QEOWzEJiOGs0CZW/ybjsMbNbYXZjznsBU4Tj/hQv5+oY
0X5m/9bdNZ4GgQRZ1TuVdNVQCFoXhTsNmaIJnrGqy0C4Hsm2ePQj1MNtpUnoxeUQ
yaMZ7nuvCDxSBiZogW926sNVQmhh5pvCgaisBrfs++XF0nhbwjrE4t/67tGj9iji
HZTNu5kWIvOWFa8Q5Q6bgKpHXAuVwik2kDRyYxdeZeOVNChTJyqE/LTsefI4IKMq
ZEt2+e4XhdAxLw2owYbfEoHmBqf90rJdGkq8D9LgHI19346Qj3s=
=wq2Z
-----END PGP SIGNATURE-----

--aylkrus223v636r7--
