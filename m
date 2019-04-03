From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Fixes for v5.1-rc2
Date: Wed, 3 Apr 2019 18:06:59 +0200
Message-ID: <20190403160659.GL5238@ulmo>
References: <20190322131517.825-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1517154501=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190322131517.825-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1517154501==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0qVF/w3MHQqLSynd"
Content-Disposition: inline


--0qVF/w3MHQqLSynd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 02:15:17PM +0100, Thierry Reding wrote:
> Hi Dave,
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.1-rc2
>=20
> for you to fetch changes up to 509869a2fec36ecb2b841180915995f41d5a0219:
>=20
>   drm/tegra: vic: Fix implicit function declaration warning (2019-03-22 1=
4:08:55 +0100)
>=20
> I'm a little late sending this out, so I realize this will probably go
> into v5.1-rc3 despite the name of the tag.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> drm/tegra: Fixes for v5.1-rc2
>=20
> These are a couple of minor fixes for build issues and sparse warnings.
>=20
> ----------------------------------------------------------------
> Anders Roxell (1):
>       drm/tegra: vic: Fix implicit function declaration warning
>=20
> Thierry Reding (1):
>       drm/tegra: hub: Fix dereference before check
>=20
>  drivers/gpu/drm/tegra/hub.c | 4 +++-
>  drivers/gpu/drm/tegra/vic.c | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Ping. Can we get this into drm-fixes?

Thanks,
Thierry

--0qVF/w3MHQqLSynd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyk2iEACgkQ3SOs138+
s6HcJQ/9EnnX6hrqnT+E4F7YWLaonzL2HmaaOWQqQi2nhXRQU2qL9EmfSeDiv6bn
REAz2cUJ0EehkCWxng9KlUCiK4YxEfIKFNlzt9YYmWKl7UispMREN88qVuBbA8Or
GixcalwWXWBfgejimI4chrNfrR05vqu4NBBOUf6fp8m8zOv2UH8kmhmORB0N2KJX
b+pAqBESugXZWP0VADbFz8TrbJEZTkbmIR7aTEpz5ERCbjIFqyONBMrXoerrc/pM
hBFw3v97EB3PdxoAljCk7QINrH4Jmcu45wfN6OhAn7P2ohbfBVA/qPXlASqbzJbB
xkRwLI6BDudAlszpWtJd6+rRPPf2cnwy+nv7ykZhGqJzPkIo9fKFW/NrhPRqVAwd
h/UOJGnhYJN24dEDEBPLM4X8DLaQuZ+5Y8+m9xNcd2XDhCTHLOdDt5pFLAczADhb
8r0Hj5HUJ7Eg+wid1tLSXZV1vWsDKf3eQYDFvdCpac20g17jTyxvfdyX5zjKJBPS
Boy6M00Vg9rJ/WMK0ROkPjBUKhz1fncUtEGJnBs3mvmTYvjlaGFA2pPAKOGl2cDu
cV2D9E+UdAGngkrKE76fR7wFrH+X7SEoOpHCtJ4k2UEFOl4dtayo/jtOo+h+XHLG
JSe90ZAr+FxAMNEhRNmPGiYuBI4dOZddjlREH5jTWkFIyZ9lTXM=
=UtDD
-----END PGP SIGNATURE-----

--0qVF/w3MHQqLSynd--

--===============1517154501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1517154501==--
