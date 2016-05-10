From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 27/35] drm/tegra: Use lockless gem BO free callback
Date: Tue, 10 May 2016 15:33:00 +0200
Message-ID: <20160510133300.GA30323@ulmo.ba.sec>
References: <1461691808-12414-1-git-send-email-daniel.vetter@ffwll.ch>
 <1461691808-12414-28-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0358065690=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1461691808-12414-28-git-send-email-daniel.vetter@ffwll.ch>
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org


--===============0358065690==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2016 at 07:30:00PM +0200, Daniel Vetter wrote:
> No dev->struct_mutex anywhere to be seen.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXMeMGAAoJEN0jrNd/PrOh1xIQAKMbbgR4VIUaZFgbsM5qRAN7
yZ5LRsDnvAtQMkQDCvt4+pan0VIZ2bu75iNxHkRk3ml4coJSFnTiJ/Uzmvs+mh5B
hC4dFigBPmumU53L0Fg+L2/JXIoa5QPgh0hcJ7ahHTINY21iL+bmNzS5Pz1NdUrT
geYnuOipXgFBJ+MWqeEfcshO2LDbqwlRUytUBKIpiZ7fH3jt1vIC+CApWhZUN1+f
3y74B6cIKKdYbRgjl7YRsfwJX0x0bS0lnsGWimaRfoflsmREpfcd0hh3PcuQTCsk
hpR3YfEv1tG1F4qbpMhOhbvusw3WsD6zYjFjLQDJ/mKWi6KUDBm5mUiyto2RaGEl
f62h+rsicoPslqwPRJMNi5AQ+SyHxDi1n/wDAFkIho9XC0XxCfUTOMjM8jQDtgFr
OQw0ftay0Kr05GS2x8DTh7OrLsbIRvsTWwfay44Xz7lLrfo+cUhpUO8l2dILkGA2
PnlhJhwvcXuIRCdqwYxRSoSA0VfHCE/uNNSSUWH7hxT8U6m8RWfvyb/zeGaxVgaE
mokapZgTDCXDWaf8iDlfXKnzdRiz1ornUbZ6U/Ca2RjYiTZ6U9PJtWoyTp6Cq3Gc
l61hLGBrB4Yr29PmYLaYRj2nKhL+lVB8pX2e0GgLThZG5oJ3ysaHaBtx6Yh2e28Y
KzYMp2L5myfG01XGLRxv
=RE6x
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

--===============0358065690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0358065690==--
