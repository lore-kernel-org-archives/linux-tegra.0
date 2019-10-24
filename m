From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Do not use ->load() and ->unload() callbacks
Date: Thu, 24 Oct 2019 19:12:34 +0200
Message-ID: <20191024171234.GA174225@ulmo>
References: <20191024151030.3822283-1-thierry.reding@gmail.com>
 <20191024160754.GK11828@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1424847928=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024160754.GK11828@phenom.ffwll.local>
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


--===============1424847928==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 06:07:54PM +0200, Daniel Vetter wrote:
> On Thu, Oct 24, 2019 at 05:10:30PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The ->load() and ->unload() drivers are midlayers and should be avoided
> > in modern drivers. Fix this by moving the code into the driver ->probe()
> > and ->remove() implementations, respectively.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 386 +++++++++++++++++-------------------
> >  1 file changed, 186 insertions(+), 200 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 3012f13bab97..bd7a00272965 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -82,202 +82,6 @@ tegra_drm_mode_config_helpers =3D {
> >  	.atomic_commit_tail =3D tegra_atomic_commit_tail,
> >  };
> > =20
> > -static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
> > -{
> > -	struct host1x_device *device =3D to_host1x_device(drm->dev);
> > -	struct iommu_domain *domain;
> > -	struct tegra_drm *tegra;
> > -	int err;
> > -
> > -	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
> > -	if (!tegra)
> > -		return -ENOMEM;
> > -
> > -	/*
> > -	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
> > -	 * likely to be allocated beyond the 32-bit boundary if sufficient
> > -	 * system memory is available. This is problematic on earlier Tegra
> > -	 * generations where host1x supports a maximum of 32 address bits in
> > -	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
> > -	 * as well it won't be able to process buffers allocated beyond the
> > -	 * 32-bit boundary.
> > -	 *
> > -	 * The DMA API will use bounce buffers in this case, so that could
> > -	 * perhaps still be made to work, even if less efficient, but there
> > -	 * is another catch: in order to perform cache maintenance on pages
> > -	 * allocated for discontiguous buffers we need to map and unmap the
> > -	 * SG table representing these buffers. This is fine for something
> > -	 * small like a push buffer, but it exhausts the bounce buffer pool
> > -	 * (typically on the order of a few MiB) for framebuffers (many MiB
> > -	 * for any modern resolution).
> > -	 *
> > -	 * Work around this by making sure that Tegra DRM clients only use
> > -	 * an IOMMU if the parent host1x also uses an IOMMU.
> > -	 *
> > -	 * Note that there's still a small gap here that we don't cover: if
> > -	 * the DMA API is backed by an IOMMU there's no way to control which
> > -	 * device is attached to an IOMMU and which isn't, except via wiring
> > -	 * up the device tree appropriately. This is considered an problem
> > -	 * of integration, so care must be taken for the DT to be consistent.
> > -	 */
> > -	domain =3D iommu_get_domain_for_dev(drm->dev->parent);
> > -
> > -	if (domain && iommu_present(&platform_bus_type)) {
> > -		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
> > -		if (!tegra->domain) {
> > -			err =3D -ENOMEM;
> > -			goto free;
> > -		}
> > -
> > -		err =3D iova_cache_get();
> > -		if (err < 0)
> > -			goto domain;
> > -	}
> > -
> > -	mutex_init(&tegra->clients_lock);
> > -	INIT_LIST_HEAD(&tegra->clients);
> > -
> > -	drm->dev_private =3D tegra;
> > -	tegra->drm =3D drm;
> > -
> > -	drm_mode_config_init(drm);
> > -
> > -	drm->mode_config.min_width =3D 0;
> > -	drm->mode_config.min_height =3D 0;
> > -
> > -	drm->mode_config.max_width =3D 4096;
> > -	drm->mode_config.max_height =3D 4096;
> > -
> > -	drm->mode_config.allow_fb_modifiers =3D true;
> > -
> > -	drm->mode_config.normalize_zpos =3D true;
> > -
> > -	drm->mode_config.funcs =3D &tegra_drm_mode_config_funcs;
> > -	drm->mode_config.helper_private =3D &tegra_drm_mode_config_helpers;
> > -
> > -	err =3D tegra_drm_fb_prepare(drm);
> > -	if (err < 0)
> > -		goto config;
> > -
> > -	drm_kms_helper_poll_init(drm);
> > -
> > -	err =3D host1x_device_init(device);
> > -	if (err < 0)
> > -		goto fbdev;
> > -
> > -	if (tegra->group) {
> > -		u64 carveout_start, carveout_end, gem_start, gem_end;
> > -		u64 dma_mask =3D dma_get_mask(&device->dev);
> > -		dma_addr_t start, end;
> > -		unsigned long order;
> > -
> > -		start =3D tegra->domain->geometry.aperture_start & dma_mask;
> > -		end =3D tegra->domain->geometry.aperture_end & dma_mask;
> > -
> > -		gem_start =3D start;
> > -		gem_end =3D end - CARVEOUT_SZ;
> > -		carveout_start =3D gem_end + 1;
> > -		carveout_end =3D end;
> > -
> > -		order =3D __ffs(tegra->domain->pgsize_bitmap);
> > -		init_iova_domain(&tegra->carveout.domain, 1UL << order,
> > -				 carveout_start >> order);
> > -
> > -		tegra->carveout.shift =3D iova_shift(&tegra->carveout.domain);
> > -		tegra->carveout.limit =3D carveout_end >> tegra->carveout.shift;
> > -
> > -		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
> > -		mutex_init(&tegra->mm_lock);
> > -
> > -		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
> > -		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
> > -		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
> > -				 carveout_end);
> > -	} else if (tegra->domain) {
> > -		iommu_domain_free(tegra->domain);
> > -		tegra->domain =3D NULL;
> > -		iova_cache_put();
> > -	}
> > -
> > -	if (tegra->hub) {
> > -		err =3D tegra_display_hub_prepare(tegra->hub);
> > -		if (err < 0)
> > -			goto device;
> > -	}
> > -
> > -	/*
> > -	 * We don't use the drm_irq_install() helpers provided by the DRM
> > -	 * core, so we need to set this manually in order to allow the
> > -	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> > -	 */
> > -	drm->irq_enabled =3D true;
> > -
> > -	/* syncpoints are used for full 32-bit hardware VBLANK counters */
> > -	drm->max_vblank_count =3D 0xffffffff;
> > -
> > -	err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > -	if (err < 0)
> > -		goto hub;
> > -
> > -	drm_mode_config_reset(drm);
> > -
> > -	err =3D tegra_drm_fb_init(drm);
> > -	if (err < 0)
> > -		goto hub;
> > -
> > -	return 0;
> > -
> > -hub:
> > -	if (tegra->hub)
> > -		tegra_display_hub_cleanup(tegra->hub);
> > -device:
> > -	if (tegra->domain) {
> > -		mutex_destroy(&tegra->mm_lock);
> > -		drm_mm_takedown(&tegra->mm);
> > -		put_iova_domain(&tegra->carveout.domain);
> > -		iova_cache_put();
> > -	}
> > -
> > -	host1x_device_exit(device);
> > -fbdev:
> > -	drm_kms_helper_poll_fini(drm);
> > -	tegra_drm_fb_free(drm);
> > -config:
> > -	drm_mode_config_cleanup(drm);
> > -domain:
> > -	if (tegra->domain)
> > -		iommu_domain_free(tegra->domain);
> > -free:
> > -	kfree(tegra);
> > -	return err;
> > -}
> > -
> > -static void tegra_drm_unload(struct drm_device *drm)
> > -{
> > -	struct host1x_device *device =3D to_host1x_device(drm->dev);
> > -	struct tegra_drm *tegra =3D drm->dev_private;
> > -	int err;
> > -
> > -	drm_kms_helper_poll_fini(drm);
> > -	tegra_drm_fb_exit(drm);
> > -	drm_atomic_helper_shutdown(drm);
> > -	drm_mode_config_cleanup(drm);
> > -
> > -	err =3D host1x_device_exit(device);
> > -	if (err < 0)
> > -		return;
> > -
> > -	if (tegra->domain) {
> > -		mutex_destroy(&tegra->mm_lock);
> > -		drm_mm_takedown(&tegra->mm);
> > -		put_iova_domain(&tegra->carveout.domain);
> > -		iova_cache_put();
> > -		iommu_domain_free(tegra->domain);
> > -	}
> > -
> > -	kfree(tegra);
> > -}
> > -
> >  static int tegra_drm_open(struct drm_device *drm, struct drm_file *fil=
p)
> >  {
> >  	struct tegra_drm_file *fpriv;
> > @@ -1046,8 +850,6 @@ static int tegra_debugfs_init(struct drm_minor *mi=
nor)
> >  static struct drm_driver tegra_drm_driver =3D {
> >  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM |
> >  			   DRIVER_ATOMIC | DRIVER_RENDER,
> > -	.load =3D tegra_drm_load,
> > -	.unload =3D tegra_drm_unload,
> >  	.open =3D tegra_drm_open,
> >  	.postclose =3D tegra_drm_postclose,
> >  	.lastclose =3D drm_fb_helper_lastclose,
> > @@ -1231,6 +1033,8 @@ void tegra_drm_free(struct tegra_drm *tegra, size=
_t size, void *virt,
> >  static int host1x_drm_probe(struct host1x_device *dev)
> >  {
> >  	struct drm_driver *driver =3D &tegra_drm_driver;
> > +	struct iommu_domain *domain;
> > +	struct tegra_drm *tegra;
> >  	struct drm_device *drm;
> >  	int err;
> > =20
> > @@ -1238,18 +1042,179 @@ static int host1x_drm_probe(struct host1x_devi=
ce *dev)
> >  	if (IS_ERR(drm))
> >  		return PTR_ERR(drm);
> > =20
> > +	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
> > +	if (!tegra) {
> > +		err =3D -ENOMEM;
> > +		goto put;
> > +	}
> > +
> > +	/*
> > +	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
> > +	 * likely to be allocated beyond the 32-bit boundary if sufficient
> > +	 * system memory is available. This is problematic on earlier Tegra
> > +	 * generations where host1x supports a maximum of 32 address bits in
> > +	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
> > +	 * as well it won't be able to process buffers allocated beyond the
> > +	 * 32-bit boundary.
> > +	 *
> > +	 * The DMA API will use bounce buffers in this case, so that could
> > +	 * perhaps still be made to work, even if less efficient, but there
> > +	 * is another catch: in order to perform cache maintenance on pages
> > +	 * allocated for discontiguous buffers we need to map and unmap the
> > +	 * SG table representing these buffers. This is fine for something
> > +	 * small like a push buffer, but it exhausts the bounce buffer pool
> > +	 * (typically on the order of a few MiB) for framebuffers (many MiB
> > +	 * for any modern resolution).
> > +	 *
> > +	 * Work around this by making sure that Tegra DRM clients only use
> > +	 * an IOMMU if the parent host1x also uses an IOMMU.
> > +	 *
> > +	 * Note that there's still a small gap here that we don't cover: if
> > +	 * the DMA API is backed by an IOMMU there's no way to control which
> > +	 * device is attached to an IOMMU and which isn't, except via wiring
> > +	 * up the device tree appropriately. This is considered an problem
> > +	 * of integration, so care must be taken for the DT to be consistent.
> > +	 */
> > +	domain =3D iommu_get_domain_for_dev(drm->dev->parent);
> > +
> > +	if (domain && iommu_present(&platform_bus_type)) {
> > +		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
> > +		if (!tegra->domain) {
> > +			err =3D -ENOMEM;
> > +			goto free;
> > +		}
> > +
> > +		err =3D iova_cache_get();
> > +		if (err < 0)
> > +			goto domain;
> > +	}
> > +
> > +	mutex_init(&tegra->clients_lock);
> > +	INIT_LIST_HEAD(&tegra->clients);
> > +
> >  	dev_set_drvdata(&dev->dev, drm);
> > +	drm->dev_private =3D tegra;
> > +	tegra->drm =3D drm;
> > +
> > +	drm_mode_config_init(drm);
> > +
> > +	drm->mode_config.min_width =3D 0;
> > +	drm->mode_config.min_height =3D 0;
> > +
> > +	drm->mode_config.max_width =3D 4096;
> > +	drm->mode_config.max_height =3D 4096;
> > +
> > +	drm->mode_config.allow_fb_modifiers =3D true;
> > +
> > +	drm->mode_config.normalize_zpos =3D true;
> > +
> > +	drm->mode_config.funcs =3D &tegra_drm_mode_config_funcs;
> > +	drm->mode_config.helper_private =3D &tegra_drm_mode_config_helpers;
> > +
> > +	err =3D tegra_drm_fb_prepare(drm);
> > +	if (err < 0)
> > +		goto config;
> > +
> > +	drm_kms_helper_poll_init(drm);
> > +
> > +	err =3D host1x_device_init(dev);
> > +	if (err < 0)
> > +		goto fbdev;
> > +
> > +	if (tegra->group) {
> > +		u64 carveout_start, carveout_end, gem_start, gem_end;
> > +		u64 dma_mask =3D dma_get_mask(&dev->dev);
> > +		dma_addr_t start, end;
> > +		unsigned long order;
> > +
> > +		start =3D tegra->domain->geometry.aperture_start & dma_mask;
> > +		end =3D tegra->domain->geometry.aperture_end & dma_mask;
> > +
> > +		gem_start =3D start;
> > +		gem_end =3D end - CARVEOUT_SZ;
> > +		carveout_start =3D gem_end + 1;
> > +		carveout_end =3D end;
> > +
> > +		order =3D __ffs(tegra->domain->pgsize_bitmap);
> > +		init_iova_domain(&tegra->carveout.domain, 1UL << order,
> > +				 carveout_start >> order);
> > +
> > +		tegra->carveout.shift =3D iova_shift(&tegra->carveout.domain);
> > +		tegra->carveout.limit =3D carveout_end >> tegra->carveout.shift;
> > +
> > +		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
> > +		mutex_init(&tegra->mm_lock);
> > +
> > +		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
> > +		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
> > +		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
> > +				 carveout_end);
> > +	} else if (tegra->domain) {
> > +		iommu_domain_free(tegra->domain);
> > +		tegra->domain =3D NULL;
> > +		iova_cache_put();
> > +	}
> > +
> > +	if (tegra->hub) {
> > +		err =3D tegra_display_hub_prepare(tegra->hub);
> > +		if (err < 0)
> > +			goto device;
> > +	}
> > +
> > +	/*
> > +	 * We don't use the drm_irq_install() helpers provided by the DRM
> > +	 * core, so we need to set this manually in order to allow the
> > +	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> > +	 */
> > +	drm->irq_enabled =3D true;
> > +
> > +	/* syncpoints are used for full 32-bit hardware VBLANK counters */
> > +	drm->max_vblank_count =3D 0xffffffff;
> > +
> > +	err =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +	if (err < 0)
> > +		goto hub;
> > +
> > +	drm_mode_config_reset(drm);
> > +
> > +	err =3D tegra_drm_fb_init(drm);
> > +	if (err < 0)
> > +		goto hub;
> > =20
> >  	err =3D drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrm=
fb", false);
>=20
> I think you want to do this before you set up the drmfb. Well probably you
> want to do this as the one of the very first things in your probe code,
> before you start touching any of the hw. At least that's what the old
> order did.

Hm... you're right. I had actually wondered about this and then
concluded that it might be best to only remove the conflicting
framebuffers when it was relatively certain that the driver could
correctly create a new DRM framebuffer.

But yeah, it definitely needs to kick out the conflicting framebuffer
before the call to tegra_drm_fb_init().

I'll Cc Micha=C5=82 on the next version, maybe he's got a way to actually
test this. I don't have access to any hardware where the firmware
installs a framebuffer.

Thierry

>=20
> >  	if (err < 0)
> > -		goto put;
> > +		goto fb;
> > =20
> >  	err =3D drm_dev_register(drm, 0);
> >  	if (err < 0)
> > -		goto put;
> > +		goto fb;
> > =20
> >  	return 0;
> > =20
> > +fb:
> > +	tegra_drm_fb_exit(drm);
> > +hub:
> > +	if (tegra->hub)
> > +		tegra_display_hub_cleanup(tegra->hub);
> > +device:
> > +	if (tegra->domain) {
> > +		mutex_destroy(&tegra->mm_lock);
> > +		drm_mm_takedown(&tegra->mm);
> > +		put_iova_domain(&tegra->carveout.domain);
> > +		iova_cache_put();
> > +	}
> > +
> > +	host1x_device_exit(dev);
> > +fbdev:
> > +	drm_kms_helper_poll_fini(drm);
> > +	tegra_drm_fb_free(drm);
> > +config:
> > +	drm_mode_config_cleanup(drm);
> > +domain:
> > +	if (tegra->domain)
> > +		iommu_domain_free(tegra->domain);
> > +free:
> > +	kfree(tegra);
> >  put:
> >  	drm_dev_put(drm);
> >  	return err;
> > @@ -1258,8 +1223,29 @@ static int host1x_drm_probe(struct host1x_device=
 *dev)
> >  static int host1x_drm_remove(struct host1x_device *dev)
> >  {
> >  	struct drm_device *drm =3D dev_get_drvdata(&dev->dev);
> > +	struct tegra_drm *tegra =3D drm->dev_private;
> > +	int err;
> > =20
> >  	drm_dev_unregister(drm);
> > +
> > +	drm_kms_helper_poll_fini(drm);
> > +	tegra_drm_fb_exit(drm);
> > +	drm_atomic_helper_shutdown(drm);
> > +	drm_mode_config_cleanup(drm);
> > +
> > +	err =3D host1x_device_exit(dev);
> > +	if (err < 0)
> > +		dev_err(&dev->dev, "host1x device cleanup failed: %d\n", err);
> > +
> > +	if (tegra->domain) {
> > +		mutex_destroy(&tegra->mm_lock);
> > +		drm_mm_takedown(&tegra->mm);
> > +		put_iova_domain(&tegra->carveout.domain);
> > +		iova_cache_put();
> > +		iommu_domain_free(tegra->domain);
> > +	}
> > +
> > +	kfree(tegra);
> >  	drm_dev_put(drm);
> > =20
> >  	return 0;
>=20
> Aside from the one question:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> > --=20
> > 2.23.0
> >=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2x238ACgkQ3SOs138+
s6Enlw//WG970cVViIiOCdFS+pZpQtLf8AOJXT8o2kvcxcd8bCoIw3Cq+bYZmn7b
ax9KeDKWnig5sZ38izQGOi6+ypJXD1e5MG5WIRKpiQyalOfLFrhtfPtKf9EWzdEv
1PJkztaTElcw8B5nE8hucgPGNEHrZNUqBYTUnB1zIu1+aKmblfF9zmNTfNrA8Brl
77touYihYeWYTbnReBk28ZbX5LvFb2no/3IDb6zNyqy2GQjP1RY7auC3tAzxS4QO
x2KTlAOlp9MK00Ipjk7e/DjpuLKXWLoFeihoCBbNKnez6TS3iIL+7xCLHNjsxfcz
284M7csMeRasX4r9ngr/Sn8WWJGaq/BLYgriCTdxJ6CHnwrTLgXG9RMuhual/d9j
0H3mtneQN+vh9ggXj2Tza0h7OVkvTtT31Ws4kdKxI9WlEAt8xwZd2PUO1ZbOhkxH
PyabXXL5x0leQkIQ3AABK57mQR+NKbYL8Ff/YjN2wu5x/TtNCKQHPERdExRhxQob
AfopywY+B8brwK+VHUGF57PgXje8n8fzqW28l+v2Ytrfkjm/2oN2e9idIVotXSYC
McugRsFKH8VJD0jb3Bu2j9UNQBhKa518UWjKdYcNoQSIZYQNysYJc1nsmRHnJl38
odBsw3mrwyl/9r1OxsBjv6B8c/n8zmEr6qAaMOy5EpgXfyISqBs=
=OIrX
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============1424847928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1424847928==--
