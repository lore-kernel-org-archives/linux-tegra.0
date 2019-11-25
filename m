From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 08/15] drm/tegra: Remove dma_buf->k(un)map
Date: Mon, 25 Nov 2019 12:06:06 +0100
Message-ID: <20191125110606.GJ1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-9-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1040076768=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191118103536.17675-9-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1040076768==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Content-Disposition: inline


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:29AM +0100, Daniel Vetter wrote:
> No in-tree users left.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/gem.c | 12 ------------
>  1 file changed, 12 deletions(-)

Same as before, I don't see any regressions when running some of the
grate tests, and there's obviously no longer any reason to keep these
functions around given that they are no longer used, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--MzdA25v054BPvyZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btZ4ACgkQ3SOs138+
s6EBQA//fk5PmctnVvlQOE/mbBb4DbiuQwzB80jnUxJzXO6zy+zkPP6rbQ/EMps3
FOJ0tXH+IW0sqNtNut1nuBFounofQejEt+Km2mDa8EAXf7Eq2cckxZjP0kRIJUGb
sjsB3GtJmt/lte/Nni/TRKuZ4vvCG8F2cYUHXR11USBx4POjAP4E8uACGjejlYHZ
8RtGO19/7PbdyADTDqJkh0Q6c96cvWbc8sXAud8hJrBgc4IjX1Hq/alRvqqwj6ET
5nWQvflhdzcwMurhY+FtItmUBkUCXSRU+c+dqhhEbjwOmjodJqrqDW5eUYDfvA0p
26NCb8svcq0vuTzOLkP+++UBxL2ZM1ZpS15NZ4nCh7z5ilZHupK8gqXQCBU2CKTC
xqqtwZcjsPp5H57gDjBAJ8NkORLbL9GyTxTIJ29tUHf6LJYf9pKSoUk9lyWuYb/4
cWJlzCXVS3brX6jhFBozE4MHjstiDnWi3au/IIrgWAjiFEGQihMvGV70fMg/pTUn
LX+qb6oJzZuPLco2x8kNoYVEbDA2RNYDaj74VsIHxLCu/4EAB+STkzj4iaM92WoG
FNMaMdx1QU22xy806UUA5G5iV3JQU8kuoy0BqmXiNc5O6E/zFH/YWYKXct89YU8G
WpAwoNdRCNByLGSOBk3yJymyzrNAQDPadju66SN5f/WS5zOKiv8=
=KGzu
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--

--===============1040076768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1040076768==--
