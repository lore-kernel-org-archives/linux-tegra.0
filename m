From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 20/31] i2c: tegra: use reset framework
Date: Fri, 15 Nov 2013 23:20:44 +0100
Message-ID: <20131115222044.GA2672@katana>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-21-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-21-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:15PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>


--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJShp48AAoJEBQN5MwUoCm2hh8P/Ah0NLAhqtoRx5UQujvcrKIS
3ji95Yg0t4+72tdEaxhjrJKVV+Sv6AEzO5kqs+2jyIaDFFYCo02pNJayAiNVrWw7
taY9dBkQDCYXmofYmG96DSIllMLy3XHBtLeBwU/+k0ZbwIE/wrkZuXBA+Q/qyNDf
GMaM2w0Up+1LxnLUIdZWifK9DkeSv+WIf8BEd+/77aBsuzcmLeB0yOfoG9TK0kkb
czMAQVpHDIweHxIjFUDd2iI5lxgvjvVOHRM5qKJHNvnab4LtU0RZjp5zlBIxeqvv
Mfh/RKs1YTHaOmKx9VwRfYqh/TNvo7r2uG/jsbeyx8aLHzUJt6YMj+XpN+SuAV8U
JwQIiIvh0o6YU3wiPKyZUwAo7RychlrCCkGTHX3l9sM4OItHtruwbDk38xhXZUVE
rAwE5eX+tZ1cif1H0GDu68KhLut8GWGDH5PaWJHbe8zn/K9bTDRPvzzboPeVRCJo
IZMJMIdO0F4aYYMjYby/M5ZkljVA2Skjy/retnuyA34aCr0FaQa+ts0FwyrvJjnp
kXTTjg2pHeMd+hyhwwMvcZlygtC1ZXzMvKYIwS6cF3QESXt92x2zHb9cjspLUbd8
sNQW82EthbYzNytVouP7TEQcvT19VeAku4tn6OLsr0HbEY3++cGmjRBcHJQd+lW9
GFEKQOM5bznq9jUeQ20R
=4sRt
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
