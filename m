From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: add missing include
Date: Fri, 1 Jul 2016 15:17:44 +0200
Message-ID: <20160701131744.GA21768@ulmo.ba.sec>
References: <20160701101630.3063718-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1130354697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160701101630.3063718-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1130354697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 12:16:20PM +0200, Arnd Bergmann wrote:
> A newly merged patch to configure the XBAR caused a build failure
> in some configurations:
>=20
> drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_set_pinmux':
> drivers/gpu/drm/tegra/sor.c:252:10: error: implicit declaration of functi=
on 'pinctrl_lookup_state' [-Werror=3Dimplicit-function-declaration]
>   state =3D pinctrl_lookup_state(sor->pinctrl, name);
>           ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tegra/sor.c:252:8: error: assignment makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
>   state =3D pinctrl_lookup_state(sor->pinctrl, name);
>=20
> The functions are declared in linux/pinctrl/consumer.h, so we need
> to include that file instead of relying on the inclusion to happen
> through another header.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 9e9d1315f4f4 ("drm/tegra: sor: Make XBAR configurable per SoC")
> ---
>  drivers/gpu/drm/tegra/sor.c | 1 +
>  1 file changed, 1 insertion(+)

This was actually introduced in 035f79bcd5e5 ("drm/tegra: sor: Support
DPAUX pin control"), which is causing other problems at runtime, so I've
backed it out again.

Thanks,
Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXdm11AAoJEN0jrNd/PrOhJ0UQAJecCUrUq/L4Mw6KyEw5JWfG
HZyIPUG6esMe4Ip2kCm0ChihT4RE2xtem1e6rqgiBj2U3Iao7DPTi3oSoLSWV4tj
1XjCxZoZIFnbLj/y2MGtaNBsN/1eq7hgLxhMkCZ+8hzihmRbvFkkUg4H8qWudcN3
XO1MT1F5HpAyJfQ+7ysTWMSMYAX8Ng7WgTiPxJtuCdCEmWCWCqM3u61G6TzDnZat
OjSF2LM90nJMm5/QQnFfKBo3F99X4tFFZOQd6Ix3gbxXJF+HJ0xD/8+2Fe6vIbym
RDRPnzSJLK8t/lto+iSrfLa8lNYNMwKWo8h/OMeKOGev6A+Bcm+FXLz/QSRj5AnZ
2jAWTRoEREZhmqAqhqoW1OvW6tS3dMb5JRZdyO/T0p72F2pQok/Ts8M9GxVWuuhW
R7XG9zqvasDcmn5R2OX2G76ltdXVa0TfxgYDNchuPQGjGiIhTMwSQUPpjwcrXM6R
mP7c2bJWfq5r5uD2DTdfrsT5bGTbXjMC3xyjVhJWaiK31V3HcQU+gnUdTsDf85lF
bvE9IM9VnfTiaSnEjpKpHT4HtPrMlPPVACiajRnGoiOyyMDycVaeIwYF9NujvD6q
UgqF3laT7rvJG48n3Q464cqwsbuy+JNbb5Gw7/yosDNpGeTLAfiSyYIN8hL47ZDv
WAgebLPJEBdvg+KFvDT6
=Akzc
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--

--===============1130354697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1130354697==--
