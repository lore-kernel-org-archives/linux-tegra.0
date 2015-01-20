From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 34/36] drm/tegra: Track active planes in CRTC state
Date: Tue, 20 Jan 2015 12:43:05 +0100
Message-ID: <20150120114304.GA8423@ulmo>
References: <1421750935-4023-1-git-send-email-thierry.reding@gmail.com>
 <1421750935-4023-35-git-send-email-thierry.reding@gmail.com>
 <20150120111845.GA10113@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0254707907=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150120111845.GA10113@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0254707907==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 12:18:45PM +0100, Daniel Vetter wrote:
> On Tue, Jan 20, 2015 at 11:48:53AM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Wrap struct drm_crtc_state in a driver-specific structure and add the
> > planes field which keeps track of which planes are updated or disabled
> > during a modeset. This allows atomic updates of the the display engine
> > at ->atomic_flush() time.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> commit 6ddd388ab222b66b596342becc76d5031c0e2fc8
> Author: Rob Clark <robdclark@gmail.com>
> Date:   Fri Nov 21 15:28:31 2014 -0500
>=20
>     drm/atomic: track bitmask of planes attached to crtc
>=20
> added this to the core since it seems to be generally useful. Does tegra
> need more?

That commit adds code to track planes that are being activated, whereas
this commit sets bits for all planes that are being changed, including
those that are being disabled.

The difference is important because we have "GO" bits for each of the
planes, so if one is being disabled we have to set the "GO" bit to make
sure the changes are applied on the next VBLANK.

Perhaps the subject should be updated to something like:

	drm/tegra: Track changed planes in CRTC state

?

Thierry

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUvj9IAAoJEN0jrNd/PrOhOr0P/RC9tGJve1/1OnBUgxi5U3Y1
avJyxSfqu9Po0Vo4FHhd6RtKIS826oyeABxkvlO4t+otLvb07ckVs++Q/f6lSDdh
erZ3Bn8x6C5dJpAGpl5y8T4aTNzBtzt3CiKBJ/7JZx5Rrp454Vk3Q2yYeg4MvbU+
GdgGQGgTmmf+PIlipt4rW8PnATdM6dVxGay4JRJffS/FPjVj8ZNwXEHF1ElLe0jE
6hG/+w44hbx0FydacNedGDZXHtODsvgFlYqPmmCJ9+g0+sQnBp+JFZ9j7FUobfcP
Utl2F1Pcwl7piAjlxbw8qccMLt6I3DdRG8CDcY5jm5zx2ZOXVWK/MMabnYX2Kyr/
+ksySPwrxBy+CUr0UKBjMT9aDhQ0j7sU4Rim+AmmSk0ehu0+QmeMfS0PoBJM4V3A
GOjWJBCDanveCy2JJfYo4+jtnlfhLJ3XwJ3GEWTi3GMRhS+M3/M2sGezxsq3bLLa
qpbF+kD7hppIJjX7oUWRVxn2xrOGDo0qjnZHsF8CztXgof9Fe4+hxngBqGQh0bAv
3yIwvegN1x2i6md35Jer/s76xhmhznLiOOqHgnvqoa13eC/yNi6obgz9jrTYcyEj
SXOPcTyBsGmTkv6hcSCbOLFokXSByQ8iTlpLAGEdAFzN5vovd89CcVQK7fD/sJXQ
N811/E9zvoS51P6Cu/Un
=nkzP
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============0254707907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0254707907==--
