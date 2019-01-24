From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] drm/tegra: Restrict IOVA space to DMA mask
Date: Thu, 24 Jan 2019 19:08:40 +0100
Message-ID: <20190124180840.GA20519@ulmo>
References: <20190123093951.24908-1-thierry.reding@gmail.com>
 <20190123093951.24908-5-thierry.reding@gmail.com>
 <314d2386-3d1b-dda0-3d5e-b277d8c09045@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0627206927=="
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


--===============0627206927==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
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

Actually we do have proper programming for 40 bit addresses in the
display driver code for Tegra186 and later, see:

	drivers/gpu/drm/tegra/hub.c:
		tegra_shared_plane_atomic_update()

Code to support that on Tegra210 and earlier should be almost identical.
I'll try to add that as well. It's not actually necessary there because
with an SMMU enabled on those chips, the address space will be 32 bits.
I suspect that there could be an issue with running without an SMMU on
Tegra124 (with > 2 GiB of memory and LPAE enabled) or Tegra210. I'll see
if I can produce a case where this actually fails and then add the code
for proper programming there.

In the meantime, I've sent out a v2 of the series that takes care of
properly programming the various bits in host1x required for full 40-bit
addresses on Tegra186 and later.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxJ/yUACgkQ3SOs138+
s6GZ6xAAwWSvhXWLEg9rGZPNbhUjSVlI+WEEWyTQxY3vByueJ98i1U+ZyiJmglh/
nSwFqnkZqmyfrEp3topid7Zvi3zWdI4iP2FKBtdH5jHTplcb/eRH4fQOwxTarmNG
wzFDzOg/K4fXRIOFOS9IK9DlL4K8y1Nd00s14rAC0MigTXpXnlw/di0VU1mRHJnk
l1UmJU6KqYv/dXJw9kPjog4CUBp+NG0T/baf7kD/XnV/Hsu7NokZQagbOCbR/6gy
As+BXkfzjvLHek0HLY1KQfTPKA8l9YeX5kWA+Zh9T/71dGc2mZHDFd7a6AANoSpB
7GFTZ4ZG9iTjHiP9d7ZKqB/jE1cgNhEdsgt86e4JjHDXqV9bjKf6efitExGX1GHB
etgcgZEWtfuSx1UPoPUacCKVl2t3vOtOFcZwzELeqJWUFXSheXFypgPEmIJkBVkP
Uz35b6UBrZObuXJQ1hSHlGyIGTO+Gn49ouDTCe7Wucal+CFRRMGhs4NdUARaUl9J
BKTVG4lphspkIJBfLcg3Qfsnl129V2i2sL0e+/+aCO9IumLm5H57mt35TpHaQLes
zct+pSO+6cdP4rjVxUSRE1pWiaCSvPqjQnwHi7ry+rCukv6mbnqJzkWM8i2OLWKB
rEoNvBJy4heuaZI77bLjbCzvrLIGt3l3mlCU5KAhVGBNhPksJvU=
=6XHe
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============0627206927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0627206927==--
