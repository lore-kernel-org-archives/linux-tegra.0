From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] drm/tegra: dc: Free syncpoint on errors
Date: Fri, 4 May 2018 17:16:46 +0200
Message-ID: <20180504151646.GB31229@ulmo>
References: <20180504133707.22451-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1182704412=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180504133707.22451-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1182704412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 03:37:04PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> If an error happens during display controller initialization, the host1x
> syncpoint previously requested would be leaked. Properly clean up the
> syncpoint along with the other resources.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 2 ++
>  1 file changed, 2 insertions(+)

Patches 1-4 applied.

Thierry

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrseV4ACgkQ3SOs138+
s6FMKw/7B09Xq16ahvkWgxAJK847htmmf8Txrsp/0RlIttjO8wZ7uIe5HF+2C2Rj
ZRE44RfZow4jxinZVp54bBdx45P5eglWvJCYoPIXk2s9HM2KknAoypJw8SXOmqGG
C/bVH31IK7uNRiiOND3wo7I8Z3zRx1ous753wzIKK8nSb3i5mMnd0bzuP/KTk0i4
j9g4RZtdkBbpAQvMmtu6PWjiOQU2diZt7EDkfgsgwHhycPSCru76nmy3o/CKlqUV
B5jLB11Zr6C+qPNtelKn4PS0RBJdqS6eJ56+wIID1pvh9/wpVdPjMg0R5DjORNkC
ZXWrIRtRBU9riIqsTWIRGA46KNPHo3xdOfZuD3Za0Cdd5I9fp4qKcXSxmChtVuey
RujtdSKdLP//M24VcyaQN2CojG1B4izeL3KLjvr8eI3AOow27n8COeEXqEST/YLs
9n0KWU47IXgzA+Ypt3tSm/4+KWOwLWsf4x55WGGfkkHkmsjuGu/I4Tt3UexIaxhz
Acmco+YuHFUCnrQbdRx3RPFPbMAb+nRPOsMaXe7hIs8ka8I+wBzhly4/JayeM81F
RXPjMaGKOCVIMjejr6flszP1HKa0TIHxeBgat0YOrVS8ms2HqFPrg00mLaL6gY7i
IMPcBEOfWqjzPLJC+lj9HMLGSJgEFIxb3TncSZP5dpmEY9OcscU=
=lvwI
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--

--===============1182704412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1182704412==--
