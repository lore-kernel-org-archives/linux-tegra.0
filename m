From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Expose color key and plane blending controls
 to userspace
Date: Fri, 2 Sep 2016 17:51:20 +0200
Message-ID: <20160902155120.GB396@ulmo.ba.sec>
References: <20160902093359.9063-1-digetx@gmail.com>
 <20160902153219.GA396@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1729128422=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160902153219.GA396@ulmo.ba.sec>
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


--===============1729128422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2016 at 05:32:19PM +0200, Thierry Reding wrote:
> On Fri, Sep 02, 2016 at 12:33:42PM +0300, Dmitry Osipenko wrote:
> > Chromakey is a simple way of video overlay overlap implementation. This
> > patch adds 2 new IOCTL's: first - sets color key and is common across of
> > all Tegra SoC's, second - sets plane blending controls and allows to
> > utilize the color key, this one is exclusive to Tegra20/30.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c   | 150 +++++++++++++++++++++++++++++++++--=
-----
> >  drivers/gpu/drm/tegra/dc.h   |   6 ++
> >  drivers/gpu/drm/tegra/drm.c  | 159 +++++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/tegra/drm.h  |  14 ++++
> >  include/uapi/drm/tegra_drm.h |  34 +++++++++
> >  5 files changed, 337 insertions(+), 26 deletions(-)
>=20
> I think these are really nice features to have, but these would need to
> be exposed as properties, rather than custom driver-specific IOCTLs. It
> seems to me like the colorkey feature could be implemented in much the
> same way as in the Armada, RCar and Nouveau drivers.
>=20
> As for the blending options, I think they should be exposed in terms of
> the zpos property, to allow generic userspace to make use of them. Also
> can you explain why this needs to be exclusive to Tegra20 and Tegra30?

Ah... I just realized that the blending interface changed on Tegra124.
All the more reason to expose this more generically, that way we can
hide the differences between a property and support the same interface
across all generations of Tegra.

Also see this:

	https://chromium.googlesource.com/chromiumos/third_party/kernel/+/de9295aa=
bdb7f80555c9b77b29ac77bcdac3280b

Thierry

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXyZ/2AAoJEN0jrNd/PrOhI+UQAJK0lj2PTwGKzELJjZ8PlrgR
xoSt6q0hcX2KAcBZ+3NebnD3g2Gx5aQDZQ4Kyy8vptnSeLGhMQ8YWjscXwGAi2mQ
IWaTv8Tx9xEOwoXYQXNUL+qPvOIds1Hr9Rj2/wX9lld4DVqOA8XhkDhYg1wHpXEE
yxlhq8JDlu1hbw32e4xc/bortmO5B0BjUIitLpepUzRIwBvCdkK8UAkyjBGQNkHy
KrWA+vKNt+C1c5jxzoaE0I6uxB7ZQQgBCDBmnNm8AqkZmnAwaspnP6tSDXgiak8s
3UCMlPkHHN5CkVbdDeWCgzrYnbNZyNyCd5EzPYWBQkThonvfUpk7UWIXIbaHQuKq
lKS6OJTKha+DMOEacZuEin10WXCFwovjl6oqmD3QpTkVAmuRNKAl5ierFZxwLqkH
wq607Dtmg1tX2J3zzRrrQkio6c9lunFIY5Lx3/N02E5SqotGjPdje710voY/UexJ
7kQ+dPxCQledga1Km1M4Uk9A9br2nfBuwH1JpFo4ZC0tcWKiSDtR3nZ/46bEmfzK
X489REIS8v2tbWQQBYWOD5is0+dn1diwSUf2Ft5aI1D+EBo08y8aITf+8Yx5ES5U
yjNdQrjN4mChtXuPmBCGjJUcXRB0f5nSBUyt4ZiiUlww2xfvzqa6WkmJ2oMM14kw
UU6yyocYrLazA1s3LSlK
=gI9X
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--

--===============1729128422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1729128422==--
