From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Acquire a reference to the IOVA cache
Date: Thu, 17 May 2018 14:09:42 +0200
Message-ID: <20180517120942.GA11379@ulmo>
References: <20180423065745.26102-1-thierry.reding@gmail.com>
 <20180423065745.26102-2-thierry.reding@gmail.com>
 <49971929-ddc7-0cad-bd23-125251bf0af4@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0799957949=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <49971929-ddc7-0cad-bd23-125251bf0af4@gmail.com>
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


--===============0799957949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 01:53:23PM +0300, Dmitry Osipenko wrote:
> On 23.04.2018 09:57, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The IOVA API uses a memory cache to allocate IOVA nodes from. To make
> > sure that this cache is available, obtain a reference to it and release
> > the reference when the cache is no longer needed.
> >=20
> > On 64-bit ARM this is hidden by the fact that the DMA mapping API gets
> > that reference and never releases it. On 32-bit ARM, however, the DMA
> > mapping API doesn't do that, so allocation of IOVA nodes fails.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 4a696fa274a3..0540b0741df6 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -115,6 +115,10 @@ static int tegra_drm_load(struct drm_device *drm, =
unsigned long flags)
> >  			goto free;
> >  		}
> > =20
> > +		err =3D iova_cache_get();
> > +		if (err < 0)
> > +			goto domain;
> > +
> >  		geometry =3D &tegra->domain->geometry;
> >  		gem_start =3D geometry->aperture_start;
> >  		gem_end =3D geometry->aperture_end - CARVEOUT_SZ;
> > @@ -205,11 +209,12 @@ static int tegra_drm_load(struct drm_device *drm,=
 unsigned long flags)
> >  	tegra_drm_fb_free(drm);
> >  config:
> >  	drm_mode_config_cleanup(drm);
> > -
> > +domain:
> >  	if (tegra->domain) {
> >  		mutex_destroy(&tegra->mm_lock);
> >  		drm_mm_takedown(&tegra->mm);
> >  		put_iova_domain(&tegra->carveout.domain);
> > +		iova_cache_put();
>=20
> I've spotted that this ^ is incorrect. This will put the iova_cache witho=
ut
> getting it if iova_cache_get() failed.

Good catch, updated the patch with your suggestion.

Thanks,
Thierry

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr9cQQACgkQ3SOs138+
s6HKoA/+PRnabKAkEB4wKFC/CrWCm1RKHWwK9iPTmjGmChgSmKzLCHX19ukRIHtW
5CRTJaPJpytos712mO1uiNBvZ5eP/Bfyk1FkUyruJxpyEczyZtDQyweOwWlpkYF+
pFaaKBz1Y+E+YXKw7kXxFdT9chIwZbmX10sC5qK4bRc84j+SXZtPKk7ppOpYkaNM
bOyjUaqXvDAvDqyJ+rQeZhFHcjoCW9Be0KU4Mjtrc2Rmh5z9q4pE8jC3vdKPXR7Q
fBzmWPXMjhVLeBfThV65A4FOIr3LK7JnW5bwBI99hfg+3tpLYKHTUc6mrJeaL26C
xzGX3IdjNDUi9ZNcabdRWPXDfUNPZbVsxNVyJLB4rXOzxf5Hx6IY1wUS1na2Bpuy
rhspmyWWyHIeaeKSFyjEuN600h/wamTgJ34xmvyehRQdWMRqkQ0e0kbXSNjHlq/E
HHkkFMtEcEJt49lt9s0Row/CHMdOAJJwvmp9gYUL4f4aVpzfPeYBXG5sWXWCc+Mn
K4aFZgTIrCd5/lYp6SEvBDUiU1K5zs9yAGASRduHx625pXFPh66oYhFzIZkDs+Yk
qhafi9b/A78a7t6vH0wymK2vc3dPwwADlXP1M6q8SLFEBGoih6D0Uu31GzVe2//E
nhbaaFbkObTaNwweH9QNXKNdR28HxRUh53vNH+0D/FKKZ9WUt20=
=b8Wu
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

--===============0799957949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0799957949==--
