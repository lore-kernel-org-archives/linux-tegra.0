From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V2 1/9] clk: tegra: Fix divider on VI_I2C
Date: Mon, 25 Jan 2016 13:30:57 +0100
Message-ID: <20160125123057.GD20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452799478-14791-2-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:30PM -0500, Rhyland Klein wrote:
> VI-I2C has 16 bits available for its divider. Switch the divider
> width to 16 instead of 8 so correct rates can be set.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphWAAAoJEN0jrNd/PrOhDXsP/2d0Bcr6tfkePb9iFKYVyaQQ
oFVAHHRjxNGz0WmZvfASN5XeV66Kqp4yHvQivb9K33O59uJy4HYTx9BKsY/ah6dz
KjEWwl/0yTJYQ2sLHukbwERecZyDwamEkZ1KlNu6tdomsweVzK9MuK/60gvYY4kY
p2jnCZ/C5n0sSPIPWqpaGPSpOoKvqKMzo26hng9d9Q8qk++3fXaMAjWM7gBDnZod
FFpByrNWtWuMmK0wSEbR0iGCvgWOm+mS17qRIm/oMEL4IjisW/8ZlLoCq8qShASb
5B+R+OYBOUuiNw/6bKup2ajofMmKJsaIAx3s+Xs3h+fZHyBNC03tFZ3giXy6MAj4
xlIUEzoD9r3TWAoq7AOxDHZBnU/KlPW6cMWKrskdbdGfgYgEh7YSBOlPS7sjTufb
/vkuq8yVUdDt92R2oyBYfd+NY6FGW6m76U7WxiV533Nzmyye2DMbxQekuqchGje0
FEpONhz/h3v4wIJ9+T4NyUbFGPOQubuwTv+paKVqVTV8ZHDNObqKFx0RThYGOJIe
LRcoIhlM6pcLJPid1RJ2hyu2mTjnvXvOHw0asOxppfUmr3SItcTAT0+PK8FsVLgS
a16+Rh3sieFKk1bSzMRuqFdoL+Ouht9XVqJrffj15tanchxiShfVYQZcnB+IBY6p
pziDwUEII8+JXnjPKtmF
=iIvJ
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
