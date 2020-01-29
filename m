From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Wed, 29 Jan 2020 13:39:35 +0100
Message-ID: <20200129123935.GG2479935@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E69HUUNAyIJqGpVn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2f5c6fda-adf9-c6c3-7601-fa912813ce1f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--E69HUUNAyIJqGpVn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 05:53:03AM +0300, Dmitry Osipenko wrote:
> 13.12.2019 18:35, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 13.12.2019 18:10, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
> >>> Hello Thierry,
> >>>
> >>> Commit [1] introduced a severe GPU performance regression on Tegra20 =
and
> >>> Tegra30 using.
> >>>
> >>> [1]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?h=3Dv5.5-rc1&id=3Dfa6661b7aa0b52073681b0d26742650c8cbd30f3
> >>>
> >>> Interestingly the performance is okay on Tegra30 if
> >>> CONFIG_TEGRA_HOST1X_FIREWALL=3Dn, but that doesn't make difference for
> >>> Tegra20.
> >>>
> >>> I was telling you about this problem on the #tegra IRC sometime ago a=
nd
> >>> you asked to report it in a trackable form, so finally here it is.
> >>>
> >>> You could reproduce the problem by running [2] like this
> >>> `grate/texture-filter -f -s` which should produce over 100 FPS for 72=
0p
> >>> display resolution and currently it's ~11 FPS.
> >>>
> >>> [2]
> >>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture=
-filter.c
> >>>
> >>> Previously I was seeing some memory errors coming from Host1x DMA, but
> >>> don't see any errors at all right now.
> >>>
> >>> I don't see anything done horribly wrong in the offending commit.
> >>>
> >>> Unfortunately I couldn't dedicate enough time to sit down and debug t=
he
> >>> problem thoroughly yet. Please let me know if you'll find a solution,
> >>> I'll be happy to test it. Thanks in advance!
> >>
> >> I suspect that the problem here is that we're now using the DMA API,
> >> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
> >> that that code doesn't coalesce entries in the SG table, so we may end
> >> up calling iommu_map() a lot of times, and miss out on much of the
> >> advantages that the ->iotlb_sync_map() gives us on Tegra20.
> >>
> >> At the same time dma_map_sg() will flush caches, which we didn't do
> >> before. This we should be able to improve by passing the attribute
> >> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
> >> maintenance isn't needed.
> >>
> >> And while thinking about it, one other difference is that with the DMA
> >> API we actually map/unmap the buffers for every submission. This is
> >> because the DMA API semantics require that buffers be mapped/unmapped
> >> every time you use them. Previously we would basically only map each
> >> buffer once (at allocation time) and only have to deal with cache
> >> maintenance, so the overhead per submission was drastically lower.
> >>
> >> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
> >> may want to restore explicit IOMMU usage, at least on anything prior to
> >> Tegra124 where we're unlikely to ever use different IOMMU domains anyw=
ay
> >> (because they are such a scarce resource).
> >=20
> > Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
> > think that it's the root of the problem. Disabling IOMMU for Tegra30
> > also didn't help (IIRC).
> >=20
> > The offending patch shouldn't change anything in regards to the DMA API,
> > if I'm not missing something. Strange..
> >=20
> > Please keep me up-to-date!
> >=20
>=20
> Hello Thierry,
>=20
> I took another look at the problem and here what was found:
>=20
> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
>=20
>     1. host1x_drm_probe() is invoked *before* any of the
>        host1x_client_iommu_attach() happens, so there is no way
>        on earth the 'use_explicit_iommu' could ever be true.

That's not correct. host1x_client_iommu_attach() happens during
host1x_device_init(), which is called during host1x_drm_probe(). The
idea is that host1x_drm_probe() sets up the minimum IOMMU so that all
devices can attach, if they want to. If any of them connect (because
they aren't already attached via something like the DMA/IOMMU glue)
then the tegra->use_explicit_iommu is set to true, in which case the
IOMMU domain setup for explicit IOMMU API usage is completed. If, on
the other hand, none of the clients have a need for the explicit IOMMU
domain, there's no need to set it up and host1x_drm_probe() will just
discard it.

>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
>        attached is wrong because it never attached in the case
>        of CONFIG_TEGRA_HOST1X_FIREWALL=3Dy [1] and this also
>        makes no sense for T20/30 that do not support LPAE.

It's not at all wrong. Take for example the case of Tegra124 and
Tegra210 where host1x and its clients can address 34 bits. In those
cases, allocating individual pages via shmem has a high probability of
hitting physical addresses beyond the 32-bit range, which means that the
host1x can not access them unless it is also attached to an IOMMU where
physical addresses to >=3D 4 GiB addresses can be translated into < 4 GiB
virtual addresses. This is a very real problem that I was running into
when testing on Tegra124 and Tegra210.

But I agree that this shouldn't be necessary on Tegra20 and Tegra30. We
should be able to remedy the situation on Tegra20 and Tegra30 by adding
another check, based on the DMA mask. Something like the below should
work:

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index aa9e49f04988..bd268028fb3d 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1037,23 +1037,9 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t =
size, void *virt,
 	free_pages((unsigned long)virt, get_order(size));
 }
=20
-static int host1x_drm_probe(struct host1x_device *dev)
+static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 {
-	struct drm_driver *driver =3D &tegra_drm_driver;
 	struct iommu_domain *domain;
-	struct tegra_drm *tegra;
-	struct drm_device *drm;
-	int err;
-
-	drm =3D drm_dev_alloc(driver, &dev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
-	if (!tegra) {
-		err =3D -ENOMEM;
-		goto put;
-	}
=20
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
@@ -1082,9 +1068,38 @@ static int host1x_drm_probe(struct host1x_device *de=
v)
 	 * up the device tree appropriately. This is considered an problem
 	 * of integration, so care must be taken for the DT to be consistent.
 	 */
-	domain =3D iommu_get_domain_for_dev(drm->dev->parent);
+	domain =3D iommu_get_domain_for_dev(dev->dev.parent);
+
+	/*
+	 * Tegra20 and Tegra30 don't support addressing memory beyond the
+	 * 32-bit boundary, so the regular GATHER opcodes will always be
+	 * sufficient and whether or not the host1x is attached to an IOMMU
+	 * doesn't matter.
+	 */
+	if (!domain && dma_get_mask(dev->dev.parent) <=3D DMA_BIT_MASK(32))
+		return true;
+
+	return domain !=3D NULL;
+}
+
+static int host1x_drm_probe(struct host1x_device *dev)
+{
+	struct drm_driver *driver =3D &tegra_drm_driver;
+	struct tegra_drm *tegra;
+	struct drm_device *drm;
+	int err;
+
+	drm =3D drm_dev_alloc(driver, &dev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	tegra =3D kzalloc(sizeof(*tegra), GFP_KERNEL);
+	if (!tegra) {
+		err =3D -ENOMEM;
+		goto put;
+	}
=20
-	if (domain && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
 		tegra->domain =3D iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err =3D -ENOMEM;
--- >8 ---

> [1]
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c=
#L205
>=20
> 2) Because of the above problems, the DRM clients are erroneously not
> getting attached to IOMMU at all and thus CMA is getting used for the BO
> allocations. Here comes the problems introduced by the "gpu: host1x:
> Support DMA mapping of buffers" patch, which makes DMA API to perform
> CPU cache maintenance on each job submission and apparently this is
> super bad for performance. This also makes no sense in comparison to the
> case of enabled IOMMU, where cache maintenance isn't performed at all
> (like it should be).

It actually does make a lot of sense. Very strictly speaking we were
violating the DMA API prior to the above patch because we were not DMA
mapping the buffers at all. Whenever you pass a buffer to hardware you
need to map it for the device. At that point, the kernel does not know
whether or not the buffer is dirty, so it has to perform a cache flush.
Similarily, when the hardware is done with a buffer, we need to unmap it
so that the CPU can access it again. This typically requires a cache
invalidate.

That things even worked to begin with more by accident than by design.

So yes, this is different from what we were doing before, but it's
actually the right thing to do. That said, I'm sure we can find ways to
optimize this. For example, as part of the DMA API conversion series I
added the possibility to set direction flags for relocation buffers. In
cases where it is known that a certain buffer will only be used for
reading, we should be able to avoid at least the cache invalidate
operation after a job is done, since the hardware won't have modified
the contents (when using an SMMU this can even be enforced). It's
slightly trickier to avoid cache flushes. For buffers that are only
going to be written, there's no need to flush the cache because the CPUs
changes can be assumed to be overwritten by the hardware anyway. However
we still need to make sure that we invalidate the caches in that case to
ensure subsequent cache flushes don't overwrite data already written by
hardware.

One other potential optimization I can imagine is to add flags to make
cache maintenance optional on buffers when we know it's safe to do so.
I'm not sure we can always know, so this is going to require further
thought.

> Please let me know if you're going to fix the problems or if you'd
> prefer me to create the patches.
>=20
> Here is a draft of the fix for #2, it doesn't cover case of imported
> buffers (which should be statically mapped, IIUC):
>=20
> @@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
> *dev, struct host1x_bo *bo,
>          * If we've manually mapped the buffer object through the IOMMU,
> make
>          * sure to return the IOVA address of our mapping.
>          */
> -       if (phys && obj->mm) {
> +       if (phys && (obj->mm || obj->vaddr)) {
>                 *phys =3D obj->iova;

This doesn't work for the case where we use the DMA API for mapping. Or
at least it isn't going to work in the general case. The reason is
because obj->iova is only valid for whatever the device was that mapped
or allocated the buffer, which in this case is the host1x device, which
isn't even a real device, so it won't work. The only case where it does
work is if we're not behind an IOMMU, so obj->iova will actually be the
physical address.

So what this basically ends up doing is avoid dma_map_*() all the time,
which I guess is what you're trying to achieve. But it also gives you
the wrong I/O virtual address in any case where an IOMMU is involved.
Also, as discussed above, avoiding cache maintenance isn't correct.

Thierry

>                 return NULL;
>         }
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 25ca54de8fc5..69adfd66196b 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>         for (i =3D 0; i < job->num_relocs; i++) {
>                 struct host1x_reloc *reloc =3D &job->relocs[i];
> -               dma_addr_t phys_addr, *phys;
> +               dma_addr_t phys_addr;
>                 struct sg_table *sgt;
>=20
>                 reloc->target.bo =3D host1x_bo_get(reloc->target.bo);
> @@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>                         goto unpin;
>                 }
>=20
> -               if (client->group)
> -                       phys =3D &phys_addr;
> -               else
> -                       phys =3D NULL;
> -
> -               sgt =3D host1x_bo_pin(dev, reloc->target.bo, phys);
> +               sgt =3D host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
>                 if (IS_ERR(sgt)) {
>                         err =3D PTR_ERR(sgt);
>                         goto unpin;
> @@ -184,7 +179,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>                         goto unpin;
>                 }
>=20
> -               sgt =3D host1x_bo_pin(host->dev, g->bo, NULL);
> +               sgt =3D host1x_bo_pin(host->dev, g->bo, &phys_addr);
>                 if (IS_ERR(sgt)) {
>                         err =3D PTR_ERR(sgt);
>                         goto unpin;
> @@ -214,7 +209,7 @@ static unsigned int pin_job(struct host1x *host,
> struct host1x_job *job)
>=20
>                         job->unpins[job->num_unpins].size =3D gather_size;
>                         phys_addr =3D iova_dma_addr(&host->iova, alloc);
> -               } else {
> +               } else if (sgt) {
>                         err =3D dma_map_sg(host->dev, sgt->sgl, sgt->nent=
s,
>                                          DMA_TO_DEVICE);
>                         if (!err) {

--E69HUUNAyIJqGpVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xfQQACgkQ3SOs138+
s6HWChAAlCyIorcMK5RHeKegmA2S4u4xd1Z4ROaXeTEBAXOEuz8TTpHUXDo+u+LM
g81szBPh7Zet3aVKvyvYM/jfR+jngurY+oxmV45vzBxhMWOom8pbKgDetN6gDWEZ
zSNvtOirf48D1hUR9D1+5hpu3MxtP+ZW8zosp2ByTAYBuV9+3RqvkKjuun0kRA5q
uFH4K6YkvulLThKIzNBmPU8Iwhzrg6fHTGnUolXiCTOSMHIehuH/CtQw473FMnj4
2VYD0S4oi0iuKRZCKBrN7ESj5vVqtfvXt3TOY9Ac605LParo7zhCS4SqzAaVqW82
N+zB85EL+x67MYDEpRy9dsGVvCtOI1LPC4kXv3gRrKOHmErx7D0a9ef8n7iGrW2U
xWt+TeyM/BF9Jb1edo8DOv+uEfRQlQaSlWAtJIDiz4wkhJpC/cYtFzgnBdfwT+i2
qahKq8/ElgurYaF9hGV3d8MQ3sT+3vgEalH51nd0Xj3gKkwJTdwPacHnMA8MPIc4
u1sOTKwbtmrbDVistJMZ7g+0HA1ZmwwCZkwgnV/XEe6/+LInj7s0jMftQH4+I7SF
jblRWdG84l2BedmUNxC2pBDG378/1+C3fysShuaYwcePTmKKqFZVfpGDt1/IRlT1
sDx7GpNJWjjIwypTAXlRSwX3hCsK2PAya7MgUOPtAJJFDAYUM2k=
=9Bls
-----END PGP SIGNATURE-----

--E69HUUNAyIJqGpVn--
