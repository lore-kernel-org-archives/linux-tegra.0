From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra: add missing error handling to probe
Date: Fri, 6 Dec 2013 22:08:28 +0100
Message-ID: <20131206210828.GB1685@mithrandir>
References: <1386362171-29311-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386362171-29311-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 01:36:11PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> The call to gpiochip_add() is not currently error-checked. Add the
> missing checking.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Perhaps this should be Cc: stable since Greg wants more stable patches,
> but it's not a bug that's likely to be hit...
> ---
>  drivers/gpio/gpio-tegra.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSojzLAAoJEN0jrNd/PrOhzBUP/0OdiiGt77GvXcI3rAUxu9sI
i6C60zBWDM+SAj3MfHO0jpk6ZLrAbBARXp+eV72TcH8TzXQ77fLF/zET6rHMYj88
h6nvTLzNAZ5eIXj54se2mqLWOHGras43gS3wld4PbLwkFjEfqgqo9h66FnE7ZAul
1ufjxB6ElLY8QnYUeglHR1PheCyWoNVNUZIpeM9nAqFnKVYruUYJICXu/GdxhHVZ
FHR2N0WGBbc7zjpHplba9pahDomq2RtFG9cNeX0GCPuuI1Vuf2Pgi3uBdDS7iVSf
/nmAzXQ9fK/vuO1FKzynPNvNwrWsNIjkpXg9zwt2nJKPfbkMLkv9PVIFu3PkDT6Z
C8fjhF9OZsforICcCk7L5qljSKO7VbCLe4bcPF3XegQ92Bb8+5Wvu2Xu9Tf5zhYo
Uoqlx2DB4WpgTDf1Vsiyz6yIqjGkpqxLkSjywhdAxGm6p/nYX3KsY6Vvj52ZkFbb
KV+v2z0iAz1YkGZAHtexKYYzTAQDzFPi15gXnX752+l8kC0Z1Lxcu/2jx1FTsXs3
HADBOnk7vNPzk6c9WE9PVVaODb6uexIvQAYV46hsv2RZDOJqxynQTjuZLJpdNz+t
sffu/WR6nnkXzGdtsNKJbhHMhfUajceYCYDPm8/UD9/6b7SvmdCO5hVtL8epuA+4
bCgXIfk2/wdgHtLF77vb
=euee
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
