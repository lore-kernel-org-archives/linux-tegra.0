From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] I2c: busses - Fix possible NULL derefrence.
Date: Thu, 9 Feb 2017 17:37:53 +0100
Message-ID: <20170209163753.66iuzdn65ygvgjg7@ninjato>
References: <CGME20170130050324epcas3p28c9adcffd7bc40e1733cdeef1e5240d5@epcas3p2.samsung.com>
 <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qaabbh466jnrp7o7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485752587-30107-1-git-send-email-shailendra.v@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shailendra Verma <shailendra.v@samsung.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, p.shailesh@samsung.com, ashish.kalra@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--qaabbh466jnrp7o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:33:07AM +0530, Shailendra Verma wrote:
> of_device_get_match_data could return NULL, and so can cause
> a NULL pointer dereference later.
>=20
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>

I don't mind either way, but since Thierry is the maintainer of this
driver, I respect his preference.


--qaabbh466jnrp7o7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlicmuAACgkQFA3kzBSg
KbYexw/+PvIlR6wBI8PYosq+0hKje99FH2o1k06pufhOsqv1WNwX8P7BF9/zT374
joSkGEns3LkPdX2sP+R8pSxOTcNLT4e7IjDwvwOyg9bjXvX2c34YUT4l8XUg8Vif
cggtCajivCWgGUVt73IfhJgVht7Mr1F+4q5ZGIIs0J127bmXf1VRrkbSIcRrh0C1
F9YB5hCgIMtHUBMvnq0HulOWaZppacH5ExcogomjCSvy9KfyK9WIF/fs5jZ2duVQ
xc2NChPyKsPc6VXNpzU2bcrKgcrqN4J/LzfCpgZbG97HdJx8TDxfCWPgYKLW80+6
mmQlOyKJe70SuR0U9mzm/9ThM2V4jF+kUd8636rPGLDV8a5wwyl2eyXN2F1F/l3X
8OM3Pk2GnwdivJvzWgu+GdWj1Pg5p2ZguBDotv74twVU62URpo1rreMYtQKMtyn1
dv2xeXZPsdwHmE6JxXw0igiPfU7es8WgANyDBLg2W+4VVtiWN6zeyhqqVfMPd9f3
sW7WcuxB3w6RHT8dea0BHLMQYf27XFUmRWP8jR6h1fZcj1/9hEQieKYytBBHv2Zj
qUmWO/8lAhd9FV0CO62oTItdCNf+eqIb6bCUOhPaM8QkeKZQVbzi8f4iye5hnSl7
LjLcARaZ5o9bmnszN06plFQzmpHznAxbHV/fagqGwAYSv9/yha4=
=N09y
-----END PGP SIGNATURE-----

--qaabbh466jnrp7o7--
