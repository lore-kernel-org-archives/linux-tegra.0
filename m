From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc: tegra: match wait_for_completion_timeout return type
Date: Wed, 11 Mar 2015 09:05:18 +0100
Message-ID: <20150311080516.GA19124@ulmo.nvidia.com>
References: <1425885146-29065-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425885146-29065-1-git-send-email-hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 03:12:26AM -0400, Nicholas Mc Guire wrote:
> return type of wait_for_completion_timeout is unsigned long not int. An
> appropriately named unsigned long is added and the assignment fixed up.
>=20
> Signed-off-by: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
> ---
>=20
> This was only compile tested for tegra_defconfig=20
> (implies CONFIG_ARCH_TEGRA_2x_SOC=3Dy)
>=20
> Patch is against 4.0-rc2 linux-next (localversion-next is -next-20150306)
>=20
>  drivers/soc/tegra/fuse/fuse-tegra20.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU//c5AAoJEN0jrNd/PrOh4KUP/2uLvhPemTsmSS1+B9eA29BJ
mzJguv4vJoUmeOcq1knY8FTMoQQX5HeSEZXTcaJVqI8Hmbd6faoK6Kun+th3ecxL
H1Ibs236s/oYKj0UVTMjpqgU1UXKQedu0/1pGXUclSsatn60+khAhY7NUa/nhRpA
Dod3R2XirTiTy5xW1DIQlVzhhATcRYIde0sWYq46NILG22nHFHJNB+ovnHJV+J5Z
KaEyCFS0BlMKTgsVo7bg+1cwl/RWpi4J95V9PVdN15R6yGu/k+PMDhHDIMwpge9j
OiYxSpAg0tIhPUpQaEWCNEVs7eXYawkBEE76qI2wVwXD0eQsm8vWmChvX108HhPD
fPt5Ifm722EG/Y/nSPAAVBABMl6CPvfmeKclosl+qUWv5Z2XIhm5tkArZl2Xs/98
nvCtWL6vnbKlubmqfFWisxjLq5t4NRHJU4qsFdKBYIOYqTYiHTVos14dRnKbXdzA
6cTV5HO+VILP4QpK3iSBoM2SG0M6HUK35jR+QEvDXhrkCIyDXXKK565aiNodvBD5
Lv7GxNv7r1HTlbL6Qa7YnR4Mt6+F2EVC6PtNjEclwhR7RSuefTlcd0Z5XlZutcQY
HRXZJoY4kegFWfz3WHibLN1QSiXNB0FXx/pa/4gAiVb4Jcx5BJPgTDDfL92k4Wxx
gD6ZOqgxB6icvNu7bK4v
=r8dM
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
