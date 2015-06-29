From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/nouveau: add GEM_SET_TILING staging ioctl
Date: Mon, 29 Jun 2015 15:30:57 +0200
Message-ID: <20150629133055.GC32467@ulmo.nvidia.com>
References: <1434352169-10501-1-git-send-email-acourbot@nvidia.com>
 <1434352169-10501-3-git-send-email-acourbot@nvidia.com>
 <557E7B98.1040908@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557E7B98.1040908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 04:15:36PM +0900, Alexandre Courbot wrote:
> On 06/15/2015 04:09 PM, Alexandre Courbot wrote:
> >From: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> >Add new NOUVEAU_GEM_SET_TILING ioctl to set correct tiling
> >mode for imported dma-bufs. This ioctl is staging for now
> >and enabled with the "staging_tiling" module option.
>=20
> Adding Thierry to the conversation since he knows best about exported
> buffers and attributes. I wonder if this would not better be done at the
> time the buffer gets imported. It seems to me that this would be a more
> appropriate way than having an ioctl dedicated to this. Thierry, would you
> have any input based on your experience with tegradrm? In the end, it see=
ms
> like you have settled for a similar ioctl to set the tiling mode of
> displayed buffers.

You can't do this at the time the buffer is imported because the PRIME
API doesn't have a means to communicate this type of meta-data. The data
is also very driver-specific, so you can't easily make it generic enough
to be useful in a generic import API.

That said, I have a couple of other comments. First, the commit message
doesn't mention why this needs to be protected by a module option. Also
I think that if we go for a module option it should be more generic and
provide an umbrella if ever we want to have more code guarded by the
option. It might also be useful to introduce a Kconfig symbol that in
turn depends on the STAGING symbol so that users can't accidentally
enable this.

> >diff --git a/drm/nouveau/nouveau_drm.c b/drm/nouveau/nouveau_drm.c
> >index 28860268cf38..45a2c88ebf8e 100644
> >--- a/drm/nouveau/nouveau_drm.c
> >+++ b/drm/nouveau/nouveau_drm.c
> >@@ -75,6 +75,10 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1=
), optimus only default (-1
> >  int nouveau_runtime_pm =3D -1;
> >  module_param_named(runpm, nouveau_runtime_pm, int, 0400);
> >
> >+MODULE_PARM_DESC(staging_tiling, "enable staging GEM_SET_TILING ioctl");
> >+int nouveau_staging_tiling =3D 0;
> >+module_param_named(staging_tiling, nouveau_staging_tiling, int, 0600);

Perhaps make this a boolean parameter? And like I said, maybe make it
more general and provide a single option for potentially other staging
features.

A word of caution: let's only resort to this if absolutely necessary.
Doing this is going to get messy and if we want this merged I suspect
that we do have userspace that uses this. Hence if ever this gets
modified that userspace will break. Can't we find a way around it?

Note that the DRM_TEGRA_STAGING option is a bit of a special case as
there aren't any real users of it beyond proof of concept code. Nouveau,
on the other hand, has real users that will want to take advantage of
this code. So if we really need to do this, let's come up with a *very*
good rationale.

> >diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
> >index 0e690bf19fc9..0e69449798aa 100644
> >--- a/drm/nouveau/nouveau_gem.c
> >+++ b/drm/nouveau/nouveau_gem.c
> >@@ -172,6 +172,64 @@ nouveau_gem_object_close(struct drm_gem_object *gem=
, struct drm_file *file_priv)
> >  	ttm_bo_unreserve(&nvbo->bo);
> >  }
> >
> >+extern int nouveau_staging_tiling;

Put this in nouveau_drm.h along with other external declarations?

> >+int
> >+nouveau_gem_ioctl_set_tiling(struct drm_device *dev, void *data,
> >+			     struct drm_file *file_priv)
> >+{
> >+	struct nouveau_drm *drm =3D nouveau_drm(dev);
> >+	struct nouveau_cli *cli =3D nouveau_cli(file_priv);
> >+	struct nvkm_fb *pfb =3D nvxx_fb(&drm->device);
> >+	struct drm_nouveau_gem_set_tiling *req =3D data;
> >+	struct drm_gem_object *gem;
> >+	struct nouveau_bo *nvbo;
> >+	struct nvkm_vma *vma;
> >+	int ret =3D 0;
> >+
> >+	if (!nouveau_staging_tiling)
> >+		return -EINVAL;
> >+
> >+	if (!pfb->memtype_valid(pfb, req->tile_flags)) {
> >+		NV_PRINTK(error, cli, "bad page flags: 0x%08x\n", req->tile_flags);
> >+		return -EINVAL;
> >+	}
> >+
> >+	gem =3D drm_gem_object_lookup(dev, file_priv, req->handle);
> >+	if (!gem)
> >+		return -ENOENT;
> >+
> >+	nvbo =3D nouveau_gem_object(gem);
> >+
> >+	/* We can only change tiling on PRIME-imported buffers */
> >+	if (nvbo->bo.type !=3D ttm_bo_type_sg) {
> >+		ret =3D -EINVAL;
> >+		goto out;
> >+	}

I don't think that's the right way to check for PRIME-imported buffers.
The right check is:

	if (!gem->import_attach) {
		ret =3D -EINVAL;
		goto out;
	}

The comment above this block should probably also say *why* we can only
change tiling on PRIME-imported buffers.

Thierry

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVkUiMAAoJEN0jrNd/PrOhdtsQAJI7Zd26/rm5uW/yg6fT8eEY
9HIbECpj4m7suBdmFvTSYuLsqHN6oLtxvmPARQgORsEcTkAqgyfULdW0lNCTPzdH
FNMy3XMIx92YHNPqG9bmMz4ROjnI7zQkpTOEmgyzuoZxC5P1eUQKBGQSRlsFz9T1
vUUnxXScTK6EgOIXYvEwmScQeth38rvpbC65+WydqYG2iv5Mufnt5TGAyGf6fdIe
v6ih/9KYfLxvRvmJT30TtVGn/SwZWhTmX1BuS41XacGfJhWgXfVP41qYcDcKPDac
PTeFnWN8lNNW9UtZ6kpenvfu07U/lOdhyUEooevRlcH6JzS0Cx/bYNqFbDCF8vP0
3hf7ZZ3KuOiUNtBRcdMd51DHNsDAB2fT5U4xK2wVTwrBWrlSfwUzj2X89Dw96en+
7GUH1ptzDWgWOMLIcP8cWk1gID63gFuWWBms+LJf4Xab2cT/FFGZO/u1EK57x9it
d3d16tu583zkg6s7VzthNOTYGXEUFwIV/8DP5icOjQERGyYRrhPARuXL31cpCa2s
Y/pmwUQ3Ln3e02uVdjufI1VzwqYHIaIVCq1bSnIRzg65ckYRA4tmzDTNQaL8NawA
L7Y2HJyiMxI14NbX5XJjUIyt7qKdkI8S+a8gR9NAEdlfAlTDVBCF3Y0YYXUWSqXX
cRqbOr4OJW92HvAydXcz
=03JL
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
