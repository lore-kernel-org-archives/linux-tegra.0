From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Date: Fri, 29 Nov 2019 11:33:45 +0100
Message-ID: <20191129103345.GC2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-4-thierry.reding@gmail.com>
 <20191129091244.GC624164@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2054849071=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191129091244.GC624164@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============2054849071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:12:44AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:35PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > It's not known at import time whether or not all users of a DMA-BUF will
> > be able to deal with non-contiguous memory. Each user needs to verify at
> > map-time whether it can access the buffer.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> I'm not seeing any other check for nents ... does this mean that there's
> not actually any block that requires contig mem?

All the blocks require contiguous memory. However, they are all behind
an IOMMU and in practice will always end up mapping the buffers through
the IOMMU. Techically this check should now be in tegra_dc_pin(), which
is called by the ->prepare_fb() callback. I didn't add it because there
are no practical use-cases where this happens, although I guess you
could come up with a kernel and DTB combination where this is actually
possible by jumping through some hoops.

This fix here is to make Tegra DRM interoperation with Nouveau work
again since that's currently broken after moving to the IOMMU-backed DMA
API as an alternative to explicit IOMMU usage. With explicit IOMMU usage
(that's the if corresponding to the else removed below) the IOMMU domain
was shared between the display controllers at the driver level, so it
was fine to make this determination in the else branch because this was
the case where no IOMMU was in play. After the move to the DMA API, this
else branch is also taken when the DMA API is backed by an IOMMU and at
it is unfortunately not known at import time which display controller
ends up scanning out the DMA BUF, nor if that display controller is
behind an IOMMU. We only know that when the actual mapping takes place,
so we'd need to look at sgt->nents after dma_map_sg() in in
tegra_dc_pin().

I'll add that check there, just in case anyone manages to conjure up
such a configuration.

Thierry

> -Daniel
>=20
> > ---
> >  drivers/gpu/drm/tegra/gem.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > index 6dfad56eee2b..bc15b430156d 100644
> > --- a/drivers/gpu/drm/tegra/gem.c
> > +++ b/drivers/gpu/drm/tegra/gem.c
> > @@ -440,13 +440,6 @@ static struct tegra_bo *tegra_bo_import(struct drm=
_device *drm,
> >  		err =3D tegra_bo_iommu_map(tegra, bo);
> >  		if (err < 0)
> >  			goto detach;
> > -	} else {
> > -		if (bo->sgt->nents > 1) {
> > -			err =3D -EINVAL;
> > -			goto detach;
> > -		}
> > -
> > -		bo->iova =3D sg_dma_address(bo->sgt->sgl);
> >  	}
> > =20
> >  	bo->gem.import_attach =3D attach;
> > --=20
> > 2.23.0
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g9AYACgkQ3SOs138+
s6FG4Q/+MELOSntdI3cs//bpJH77d00IZ9a9pXAiFVD0YalrljI5RpYYDzICdEH6
UTc0HSQlRocML4Rf999F7qCg0hTrbbts+zUvwmsOTOlxFtzYe1g/K7MZ6iIyEg7W
pb5FbdjnObRbQLa9nwoq+dauKh38kJIV1+2VAZrtMM4c0TsUf9lRklo8t8pEa3ww
XdAh/qCGFfIt47q30FAuB9FDeRSZoulA4HDfYVueWnDYQHWtJIERsdpz5tR7g8kV
CWHYRLuwRqIWhgfKsXlLBiYoxm++6UbV0zrqwy3UZZQpZvXVuDr1ca5XincUrV1S
q3T/xztSLuIEoFiJydwZbtqW4Z6s+694yNMBOOA88k2uvhKRa9WsTr2R2XhlXXam
jz8RMUBUKY436Zph1kVyen+e9jhcOloJ9UfxzFQt2lgqstlYPmEEOJ9iPdQUmDJh
JhKafEY/pX7RGLJYtRiy/e6+CMXlb9Gc6KCaomPHOszgdwfkyrKzMMMx+Azi6t2H
fB8xtpAjfs7sV1BdEksUOpjT0RPcE2rCHRZABLRM0l1IL+TEwDsETFSLXQ4hTcUQ
rYsx98FuJiuaV5DARARIr36aWHOdkmgghO3U0hSmQJeyqS5au7xbGDnzvosN6Qv2
avRGtpspAMCuPnTQSalUgHYk1pFoqtLjweStvkA+JXPd2J10mhw=
=QGlG
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--

--===============2054849071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2054849071==--
