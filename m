From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 26/26] drm/<drivers>: Don't set
 FBINFO_(FLAG_)DEFAULT
Date: Fri, 25 Jan 2019 16:14:56 +0100
Message-ID: <20190125151456.GH22565@ulmo>
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
 <20190124165831.16427-27-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0791366939=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190124165831.16427-27-daniel.vetter@ffwll.ch>
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
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, nouveau@lists.freedesktop.org, DRI Development <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-tegra@vger.kernel.org


--===============0791366939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wj9ZLJVQDRFjGSdK"
Content-Disposition: inline


--wj9ZLJVQDRFjGSdK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2019 at 05:58:31PM +0100, Daniel Vetter wrote:
> It's 0.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 1 -
>  drivers/gpu/drm/gma500/framebuffer.c          | 1 -
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c       | 4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 1 -
>  drivers/gpu/drm/tegra/fb.c                    | 1 -
>  5 files changed, 2 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wj9ZLJVQDRFjGSdK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLJ+8ACgkQ3SOs138+
s6E2bRAAhRYy7WfmBsgjqoiAMMHSr15GvFfQbzkmu4PR/tZJzkyKt3OP7dvd4PXa
UohlRCdaHb1zK31yggqH2uEwjPofvI5I42CH7f5xumRAac/qvD+nIrP9Gk6zTq5I
RifQVtlbfoUm7n29P8Ba/Yt+SFIP9BmkmFvIfp01jWI6mv3U/tryVcZFYtmeGVER
/YFUimi9k0MdpqkMkAGVBx4m31BLxYYjuK4lYqcQDksN45DEA6jUSzZbpxPrbE/N
v+x9LTVFLRY2KN5G8ZNknnbzj+6dZSHBhFbhp/pREUIchSzR5sBtqOV1Xj4DOp1C
uMsgQLZk3p/yeHf7K1UTHvCkzWWZrnyePhYN1da2DOK1ZQhLT3+vSBv67PuE79eD
B3tVzcxR65o25af3TXrPTjEaG1ft8/G70o+30rLtvCuFT2xd31+dnnXjhOakVR83
CowTRTsDR0j5OwpE8Y1VFy07qsbWvHNg0xCl++Qnz1aMfQvKvL9FMB0/aNdfWd3v
WmyAzCOwydnsPBh6FG/J0UkPJMgWUAOQq+tLxc6KIgBiKEjk6P9+O/vsfLD9YsTn
Sm3rtZcpHrxV/BAiaROKWcoCH25gPccSqewlDwF6w2JIs6CSG0KZhsA43fMZV6Qb
RZ/glm0h539iZ3fsWoQ0pAP7EeTW4GD/oqWxLUFXEMU/LgbqVQo=
=PbpF
-----END PGP SIGNATURE-----

--wj9ZLJVQDRFjGSdK--

--===============0791366939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0791366939==--
