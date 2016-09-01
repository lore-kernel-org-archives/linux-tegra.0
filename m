From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] phy: mark tegra_xusb_lane_lookup_function() static
Date: Thu, 1 Sep 2016 13:34:46 +0200
Message-ID: <20160901113446.GB18255@ulmo.ba.sec>
References: <1472634319-11886-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472634319-11886-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 05:05:19PM +0800, Baoyou Xie wrote:
> We get 1 warning when building kernel with W=3D1:
> drivers/phy/tegra/xusb.c:104:5: warning: no previous prototype for 'tegra=
_xusb_lane_lookup_function' [-Wmissing-prototypes]
>=20
> In fact, this function is only used in the file in which it is
> declared and don't need a declaration, but can be made static.
> So this patch marks it 'static'.
>=20
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/phy/tegra/xusb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyBJVAAoJEN0jrNd/PrOhWQ4P/iw+fv3FIwvaQus0ePZjDVtu
qV6pG2GE1nKBU84sILCXUazU/xvRPFW2XwRgJhhVQrBJyq/6lY6OsNvgPi8jLikS
RSkCWOsEpPSXeAY1r+ZApP6X45nktHi1M5Nf0oXb/O1FvYNpbGdzbPqusUEo/qTH
k8F+ecejdjYfu3kuFn0hqzJiPz+D/OrilOId0y/Wi+E+jMC5Ez9rUXUKLmQILbU+
sBmwLQf89J8rWPYRTj+z6mCoZGG82UDcARl1RDOnBta/gvMqzyUqdaLyGkPWKUxl
3W4cPuiE/jQkymTLpKPe9Y6WCUsJmyqnbiugN65RCcWwEWHl1t/bGoGJFtknVOWt
e5DcU1/aSIMd3bPwEEf+xBDRCIJ0eoquFXNBZNwWYbDl+rzdfwRNqR5JN5CIiwZM
CAvIXqHVp80gZduzJHLBvTKBugViBDELqdh0246t29X0GtQlkl6+RbYQsgBfibKt
U+gFZNLDpPCnH9KccVO7Vk9I0BsB1NRQiQinfFQwF+OgP5xfT3UirAlORecVdZGy
PZAGEAs1vqqn3Uyk9o1K2ZumV+ERuUPNz+BTzaneJOwlu8pBf0l1Jo+NfPafax0B
8AjA2eFjl5ye6KOpP1SwB5iTuRtS9AQlpBb/+g+cP5PmRVoB6hETBZC8ZOo29sOz
opUmAgQnqLrwMklmF2zA
=qBgx
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--
