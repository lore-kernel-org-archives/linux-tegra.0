From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio-tegra: Do not create the debugfs entry by default
Date: Mon, 16 Nov 2015 17:49:01 +0100
Message-ID: <20151116164901.GA21467@ulmo.nvidia.com>
References: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2015 at 04:07:10PM +0000, Suzuki K. Poulose wrote:
> The tegra gpio driver creates the debugfs entry irrespective of
> whether the device exists or not. This is enabled on an arm64_defconfig
> and leaves an entry in debugfs on all platforms where it is not
> useful. This patch fixes the issue by creating the entry only when
> a device exists.
>=20
> Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/gpio/gpio-tegra.c |  105 ++++++++++++++++++++++++---------------=
------
>  1 file changed, 56 insertions(+), 49 deletions(-)

Yikes, good catch!

Acked-by: Thierry Reding <treding@nvidia.com>

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWSgj6AAoJEN0jrNd/PrOh6awP/RqXZ3eKWAAhDByJB0VTxW9g
hQW2Wds8p3fuAfmJOxriRWBSZjy4dwDbbUzEmPbLw4dLQvCA9XGRrltT+FSAAvAo
XFtG25uvD649nMCea9EDdh2tlVxSeKFH9clR4mipECR5Aq1b4jhGHyzMvfLzHCyO
j5JfZoNt4O/qn/Gp9Noa2FQWQG4A/kLHaCG3AQY2LdO0p0kOpap/ZMRSoCdLios0
sNlLHpNxhqfJ2ywkUFfCJGLQLtqK3A6wiR3WstY0d+ZtQl6Q6EI9xdO6OOqsuHbd
2L7+Qave6HAxE4YRcKRRhJj5hH55ZTqX5lMJVD+S9yQMLtarl7U9GXQQb+qkuIsr
OVZ9HaL7MG9YRoEqFpldCaJ5liMmdZoh0YCjDRWHo1l7gHg9pm31f9K0gsBXNFLS
k+aAUh6TMUN9MQ4SA9V2D5dfPKANyTA9oj5WQQoZW4xaOcIa6lPKb1RrfAkLtkOC
kyRTE3IyGOWa4OdUAup/cpxkh7s4NYKAvj6yTeUshlqum1JVLHt9z6M1SuZ5wY2A
g04lT1q5Qs/OLxavEDNLZkwxA/W3zGQf1wSPOSMfaroqd0lG/ngn5dv8D3CMUsZS
uf+Hj1J71gvUNIoz9dK1ghIZ9kWMhGkQZtVsTpUn08DB1joE9iMaBoHpUCH6m2Eu
LuUNbvoncOC5TJDuTipP
=7yD9
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
