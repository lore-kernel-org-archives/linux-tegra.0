From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/7] drm/tegra: Add kerneldoc for UAPI
Date: Sat, 19 May 2018 00:01:27 +0200
Message-ID: <20180518220127.GB28123@ulmo>
References: <20180517154132.10058-1-thierry.reding@gmail.com>
 <20180517154132.10058-8-thierry.reding@gmail.com>
 <2628cd65-3aa1-300e-c952-4a5914544fb6@gmail.com>
 <20180518201202.GA21358@ulmo>
 <f9ee428a-aff5-f95b-8877-33ee3d452555@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0066227736=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f9ee428a-aff5-f95b-8877-33ee3d452555@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0066227736==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 19, 2018 at 12:07:15AM +0300, Dmitry Osipenko wrote:
> On 18.05.2018 23:12, Thierry Reding wrote:
> > On Fri, May 18, 2018 at 08:19:55PM +0300, Dmitry Osipenko wrote:
> >> On 17.05.2018 18:41, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Document the userspace ABI with kerneldoc to provide some information=
 on
> >>> how to use it.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>  drivers/gpu/drm/tegra/gem.c  |   4 +-
> >>>  include/uapi/drm/tegra_drm.h | 480 +++++++++++++++++++++++++++++++++=
+-
> >>>  2 files changed, 468 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> >>> index 387ba1dfbe0d..e2987a19541d 100644
> >>> --- a/drivers/gpu/drm/tegra/gem.c
> >>> +++ b/drivers/gpu/drm/tegra/gem.c
> >>> @@ -291,10 +291,10 @@ struct tegra_bo *tegra_bo_create(struct drm_dev=
ice *drm, size_t size,
> >>>  	if (err < 0)
> >>>  		goto release;
> >>> =20
> >>> -	if (flags & DRM_TEGRA_GEM_CREATE_TILED)
> >>> +	if (flags & DRM_TEGRA_GEM_TILED)
> >>>  		bo->tiling.mode =3D TEGRA_BO_TILING_MODE_TILED;
> >>> =20
> >>> -	if (flags & DRM_TEGRA_GEM_CREATE_BOTTOM_UP)
> >>> +	if (flags & DRM_TEGRA_GEM_BOTTOM_UP)
> >>>  		bo->flags |=3D TEGRA_BO_BOTTOM_UP;
> >>> =20
> >>>  	return bo;
> >>> diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_dr=
m.h
> >>> index 99e15d82d1e9..86a7b1e7559d 100644
> >>> --- a/include/uapi/drm/tegra_drm.h
> >>> +++ b/include/uapi/drm/tegra_drm.h
> >>> @@ -29,146 +29,598 @@
> >>>  extern "C" {
> >>>  #endif
> >>> =20
> >>> -#define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
> >>> -#define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
> >>> +#define DRM_TEGRA_GEM_TILED		(1 << 0)
> >>> +#define DRM_TEGRA_GEM_BOTTOM_UP		(1 << 1)
> >>> +#define DRM_TEGRA_GEM_FLAGS		(DRM_TEGRA_GEM_TILED | \
> >>> +					 DRM_TEGRA_GEM_BOTTOM_UP)
> >>
> >> The current userspace won't compile with the above changes, so this is=
 the ABI
> >> breakage. Please keep the old DRM_TEGRA_GEM_CREATE_* DRM_TEGRA_GEM_* f=
lags for now.
> >=20
> > It looks like I fumbled this during a rebase and didn't catch it. I've
> > left the original flags in.
> >=20
> > [...]
> >>> +/**
> >>> + * struct drm_tegra_syncpt_read - parameters for the read syncpoint =
IOCTL
> >>> + */
> >>>  struct drm_tegra_syncpt_read {
> >>> +	/**
> >>> +	 * @id:
> >>> +	 *
> >>> +	 * ID of the syncpoint to read the current value from.
> >>> +	 */
> >>>  	__u32 id;
> >>> +
> >>> +	/**
> >>> +	 * @value:
> >>> +	 *
> >>> +	 * Return location for the current syncpoint value.
> >>> +	 */>  	__u32 value;
> >>>  };
> >>
> >> What about:
> >>
> >> Returned value of the given syncpoint.
> >>
> >> Could we replace "return location for the.." with just "Returned.." in=
 other
> >> places too? My mind is stuttering while reading "location for the valu=
e", though
> >> I know that my english isn't ideal and maybe it's only me.
> >=20
> > How about something a little more explicit, like:
> >=20
> > 	The current value of the syncpoint. Will be set by the kernel
> > 	upon successful completion of the IOCTL.
> >=20
> > ?
>=20
> That's better.
>=20
> Maybe we could also use format like this:
>=20
> /**
>  * struct drm_tegra_syncpt_read - parameters for the read syncpoint IOCTL
>  * @id:		ID of the syncpoint to read the current value from.
>  * @value:	Return current value of the syncpoint.
>  */
> struct drm_tegra_syncpt_read {
> 	__u32 id;
> 	__u32 value;
> };

The per-field description blocks are preferred in the DRM subsystem. I
think primarily this is to decrease the chances of anyone forgetting to
update the documentation when the code changes.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr/TTcACgkQ3SOs138+
s6FVgw/6Aub90jpPAY7YnBvgPFn+hr08UFpI8g7BUt0adhTkKf5izDTyDJWNPzJP
o1MAs8dw+nH2ikJ8GrrG8qfGfRrwYyUtn4UhmlsVYRSoFS7VG1aHDtuO5p6r1MaE
XNPqL+zv2cXdWn3Bzw6yx1AueliQ6YkVCNA5DE58GRhKfBTLAkSNcJRtuTmOcTE8
bsdxCLbOHL83wLcXsFIUfHT3C4Mo1cbyXrBd3j6OWkm4kVYVYD7zqxCimoIZDmj9
nE5HwadLlj42+E9tS5OcFSzpYK31i7TK8yfcBQ7j2SjUMInP7hppRn91yMz4JWf/
Ckidc0eoJlQqjYsFeDrZBcULUXjmuUFFfOOszXiDExLZbQktFJkrddeoSPz+P0vd
89v84rlxcioMCQACUYnU5VQUHEcp+Yoh3rvpFVDlE89Sgu9i7PAK2ZDmttBwS/W5
+Xmdi8L0OdymEuKVya5Ey6ydCpqFVRoWlObQo3LaoK0CTkt8iuCRo8JDXyoHgqMs
iFFpB1C2VHiVHuV+dC+o84cmme1Ljs+jyU67BqnOnXGDw3009dzBhpU46TrO7cE7
jYtPwYI+8t0JGRxV0OAZ+cb/JM7UanltFfIhHpMhgkkzcz69MJhDUvQdr6pAZC+A
fiMnPONrKvAKHPaF8foJfo9klYkf1RJ7FJ+rHUzFNBtfuW8/5bU=
=u2u8
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--

--===============0066227736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0066227736==--
