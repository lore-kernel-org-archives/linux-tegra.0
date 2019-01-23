From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] drm/tegra: Restrict IOVA space to DMA mask
Date: Wed, 23 Jan 2019 15:04:06 +0100
Message-ID: <20190123140406.GA16034@ulmo>
References: <20190123093951.24908-1-thierry.reding@gmail.com>
 <20190123093951.24908-5-thierry.reding@gmail.com>
 <314d2386-3d1b-dda0-3d5e-b277d8c09045@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0573246566=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <314d2386-3d1b-dda0-3d5e-b277d8c09045@gmail.com>
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


--===============0573246566==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 04:41:44PM +0300, Dmitry Osipenko wrote:
> 23.01.2019 12:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > On Tegra186 and later, the ARM SMMU provides an input address space that
> > is 48 bits wide. However, memory clients can only address up to 40 bits.
> > If the geometry is used as-is, allocations of IOVA space can end up in a
> > region that cannot be addressed by the memory clients.
> >=20
> > To fix this, restrict the IOVA space to the DMA mask of the host1x
> > device. Note that, technically, the IOVA space needs to be restricted to
> > the intersection of the DMA masks for all clients that are attached to
> > the IOMMU domain. In practice using the DMA mask of the host1x device is
> > sufficient because all host1x clients share the same DMA mask.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 271c7a5fc954..0c5f1e6a0446 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -136,11 +136,12 @@ static int tegra_drm_load(struct drm_device *drm,=
 unsigned long flags)
> > =20
> >  	if (tegra->domain) {
> >  		u64 carveout_start, carveout_end, gem_start, gem_end;
> > +		u64 dma_mask =3D dma_get_mask(&device->dev);
> >  		dma_addr_t start, end;
> >  		unsigned long order;
> > =20
> > -		start =3D tegra->domain->geometry.aperture_start;
> > -		end =3D tegra->domain->geometry.aperture_end;
> > +		start =3D tegra->domain->geometry.aperture_start & dma_mask;
> > +		end =3D tegra->domain->geometry.aperture_end & dma_mask;
> > =20
> >  		gem_start =3D start;
> >  		gem_end =3D end - CARVEOUT_SZ;
> >=20
>=20
> Wow, so IOVA could address >32bits on later Tegra's. AFAIK, currently
> there is no support for a proper programming of the 64bit addresses in
> the drivers code, hence.. won't it make sense to force IOVA mask to
> 32bit for now and hope that the second halve of address registers
> happen to be 0x00000000 in HW?

I think this restriction only applies to display at this point. In
practice you'd be hard put to trigger that case because IOVA memory is
allocated from the bottom, so you'd actually need to use up to 4 GiB of
IOVA space before hitting that.

That said, I vaguely remember typing up the patch to support writing the
WINBUF_START_ADDR_HI register and friends, but it looks as if that was
never merged.

I'll try to dig out that patch (or rewrite it, shouldn't be very
difficult) and make it part of this series. I'd rather fix that issue
than arbitrarily restrict the IOVA space, because that's likely to come
back and bite us at some point.

Thierry

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxIdFUACgkQ3SOs138+
s6HemA/+J/4Lyz2Td40kAovE0HtbffPfZtYwUtxe6GjGyOHx2qpLhaYJu8JmJWiI
RxTmZIQItrxMv79n7SGmmbg9K5tPuis7rDl+fgYcGD+let0RlB3JdZVDnzWds885
J/cJvoUDVu30HFBP4jwuwXSv6BncUovOFBn0DA7l9l9rSoN+Eu2V7pXnxHp6Jd7u
0AyeqviX5J1VeI6babuv6Krk3gXz8Ooa3Zu8YsvMW2Qdc3ZDWrXc4QjFeczEJPSv
OlQFhs4uRe9hHo2drEqkvOHs33mnOwRVxvgZEEILuOr8e9DUw1nXyhCUhfF7cN0h
o+3AdlZxSGMuw9bnmBwRSKfnnJagsGO+Di7Q3UXmU3+oxSRmG/daIcGsHG/RsaGo
z/oUMJ5PbjScM1mui7qI/2I1PJ1Ep2idb+Ddz4sUn/6A931cqAanYmLjUBezaLrE
j+D1uFc1scQFGeb+t6c9yOvySRCq8Q29w503G05LJ1b5pLWRdQEUiW9kROdzaDlI
adryq2/HfFTADezSLG63ucsrvKGF4MIgQQyTMhC6Zy3Ls+JX5wN/KoC1cQ7hYw7I
XczJZwM24WUrBGmFjI5Kf5+rwblSytRGaZ0jnG/kYQDZJMEjsIsUBo0kthp5Ye4o
Vxj6ruB3F2KSm62HRhVm7gT8Hb25GwTxRp248fQdlHnOYx6Dvfw=
=wIUK
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--

--===============0573246566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0573246566==--
