From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: tegra-xusb: Check that of_match_node
 returns a valid pointer
Date: Tue, 19 May 2015 16:18:37 +0200
Message-ID: <20150519141836.GB26748@ulmo.nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
 <1432044863-2035-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432044863-2035-4-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 03:14:23PM +0100, Jon Hunter wrote:
> of_match_node() will return NULL if no match is found and so check for
> this before dereferencing the pointer.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/pinctrl/pinctrl-tegra-xusb.c | 3 +++
>  1 file changed, 3 insertions(+)

This isn't necessary. The driver is probed from DT only and therefore
=2Eprobe() will only be called if there's a matching entry in the OF
device ID table. match can never be NULL.

Thierry

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0Y8AAoJEN0jrNd/PrOh46QP/2GrbxPujpPWZdG6L3Kb5v8K
luCNsTatHlIo1qFVZYvIMASMahJEAT8eLODziFCWpKtGeknenPpLuX9Bhm/IzIy3
3Zwl+8whgyEvEGxxhjYB9QyVOHHT4kP7Ao+XhfIHxFQke4bYXvPoCdDbRfBPJ418
V73MIznhDqdMjTdtctXdlOnGwg7X1+Lkas97jxsbPJU/mUqUXJExEaIg9iFjtk5x
3dzsExzpLtX2f4K5n19k999Twc+H/JwSppgn5VIQ+TU1sOyN98ORxuaeBEbNTius
kWPA+PXTSnW9Gvg/K/9/fmfXUVxzrdUA5AwjtZ5FvBkbGrDtA7gttTrOcjLFjHoC
CZMlvTyL5WzfGsIjB4jUHM0qj+PT6VMviZ/bwLXstjKi7tq8SwbGzKtEKRhVxpib
uU8DkaFRCXapajrLKxeqpA9QGNynRFwyS09qzdkQnAv6tU2CfeCCguQ8hlSO1eFO
AuSPgBt+p5BMKfvXhinBND+lLa9Vf8oWPY/yDshKLlzLqokeqQcnhQT34q7d6v3Z
belOkvbxJROb5BQnq0McpL0Uxs09QtwaG5YpmGR2V5ENqAyGV4biTZuOYtH5MjhA
U25kyFoP3S4IqJXyXsuUb6Vs3J7WjA5Gyr/9cJPqd5i2RRC14xNRLJ8FxJjlFdhs
7eBeNHXaRHs6jtubn0/S
=qva3
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
