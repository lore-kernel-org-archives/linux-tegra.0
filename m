From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Check whether size of unpin isn't 0
Date: Mon, 9 Jul 2018 10:31:52 +0200
Message-ID: <20180709083152.GA13963@ulmo>
References: <20180706180236.27896-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1760441480=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180706180236.27896-1-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1760441480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 06, 2018 at 09:02:36PM +0300, Dmitry Osipenko wrote:
> Only gather pins are mapped by the Host1x driver, regular BO relocations
> are not. Check whether size of unpin isn't 0, otherwise IOVA allocation at
> 0x0 could be erroneously released.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/job.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to drm/tegra/fixes, thanks.

Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDHXUACgkQ3SOs138+
s6Fkeg//UWOj65He6hUyHtB7P5dlMypgb/rDk6WBs0tm3Lpgb3dAcmgfv3VHBAcv
iGizXZI+IiMJGTi3gACglJ8f5jvSsn+ff16XK9wkpw36b+uuv2p6zMq3GgkEJNsH
oYvVZfdWsZtejtOaU6OWJaPawIHPtZUgGWIZn/8FpO0fIpF5ckPd7bAvCqPOb/kr
tWWd7WODZQXen6mYjIqqfBqDq57k/9J/arppcBxq6UQoOgBuR38XQdyLvVKznXqw
kjOIoHkZJ7LMIWkYFr5iUiQR/qlHosTVzwjKrxU90NJfEOYcMXM5gIs7561wnfbI
XCtl5Jfb37fdJ1EyFjYYUTdY3kXv0ZYPhIvwF5lGDCJFr+GugE9l5BfLFwt8FiUH
aJ4pb3GsCOaxboiCF40M4QSi91B1eWj4AaMWtY4+hcNDwKGK0QRjS/PzyHkWOkbJ
0CoWnWiip+DQgIy1P4RNrrk18sfBrN4bhZ5qZ+zSmlSEHQ95qr0BEwqZmyiuD4I3
laevMjqeJqAMtK3IJ+FtC3yYJu/Qwf66VqXhvHLOwKnlxAXJdxjNteNOpVsak8iB
NisGWDU0I4g8fx6NTQn4EqZyumtwJ6I7W4IelTjef/fSEUoPjVhGO1mZa15rouKO
UdwR339JRl+g76on2XeRHtSXBO5Qp0hb96e8lIAo84buMZOV+5g=
=GsXO
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--

--===============1760441480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1760441480==--
