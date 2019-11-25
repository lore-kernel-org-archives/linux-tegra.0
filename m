From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 02/15] drm/tegra: Delete
 host1x_bo_ops->k(un)map
Date: Mon, 25 Nov 2019 12:04:48 +0100
Message-ID: <20191125110448.GI1409040@ulmo>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-3-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2061563830=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20191118103536.17675-3-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============2061563830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Content-Disposition: inline


--y96v7rNg6HAoELs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:35:23AM +0100, Daniel Vetter wrote:
> It doesn't have any callers anymore.
>=20
> Aside: The ->mmap/munmap hooks have a bit a confusing name, they don't
> do userspace mmaps, but a kernel vmap. I think most places use vmap
> for this, except ttm, which uses kmap for vmap for added confusion.
> mmap seems entirely for userspace mappings set up through mmap(2)
> syscall.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/gem.c | 28 ----------------------------
>  include/linux/host1x.h      | 13 -------------
>  2 files changed, 41 deletions(-)

Tested along with the rest of the series and this is obviously right now
that the only user is gone, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3btVAACgkQ3SOs138+
s6HurQ/+MXn8OlSu5QbsbZSspjukoOrC3YnOeqVypfDi8GqKAcziGCYlyqID4WXd
6hxDvTfaPMTCx8EX0lNuTfk6Y6ogax3U9wWbWq0q99p08oTTtK+HzoDkbW18x8Lq
GY1jAT4+b09LiNZf0bl5gK+xcRZA6vTwip72rK2jJmlXrJ5THdPPKGCG4vCJbcy5
tYWys+GWQPUw9GlkcqoyGHAX9Q9l1h+dT/vzE1CklJ/dYKMifnw7Gfj+IC7rQpBS
H5QXkEgcy2DER5y+QYAfTtwXDwHIGU0/Wh2iVLULKM6iOkpc1YSEWupoRMrC6X5G
BImoYA+ajOhwFYM7Sb5625v7IMEex2AYowVcDKaCewogkXD3P4M/gybuG7iKVqrG
N02M419+MjtWOltwkPksUYu5PAPEiJdo0IqfWOeCUi4y8BOVgDfgGTw+iBRBNyba
QrWD/4VOpIr1gAWhi0nR2/LiHHvm1oNekDcKUd16RYGNoXeKXW3ja5QaMVeetVDH
NNGFhq81aBPhe2s0bi17vX8jq7N2yna0kr/NgulAyCaaz+InczriQ/JaM99meL/H
vE1jKkihKl/bsGj7qPDOZWZU7QCujd4v9tlSNrS9Oz+bETpVztJLs7faSInm4crr
EPEAWmdOkq5GU94RfMQBVFj8LcdNuHVIWnEAyYPeZvgAuvTgQh0=
=Snj2
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--

--===============2061563830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============2061563830==--
