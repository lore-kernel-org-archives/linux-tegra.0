From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] drm/tegra: Support for sync file-based fences in
 submit
Date: Mon, 13 Mar 2017 08:15:00 +0100
Message-ID: <20170313071500.GB15513@ulmo.ba.sec>
References: <20170309175718.14843-1-mperttunen@nvidia.com>
 <20170309175718.14843-4-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170309175718.14843-4-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 07:57:18PM +0200, Mikko Perttunen wrote:
> Add support for sync file-based prefences and postfences
> to job submission. Fences are passed to the Host1x implementation.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 69 ++++++++++++++++++++++++++++++++++++++-=
------
>  1 file changed, 59 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 64dff8530403..bf4a2a13c17d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -10,6 +10,7 @@
>  #include <linux/bitops.h>
>  #include <linux/host1x.h>
>  #include <linux/iommu.h>
> +#include <linux/sync_file.h>
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -344,6 +345,7 @@ int tegra_drm_submit(struct tegra_drm_context *contex=
t,
>  		     struct drm_tegra_submit *args, struct drm_device *drm,
>  		     struct drm_file *file)
>  {
> +	struct host1x *host1x =3D dev_get_drvdata(drm->dev->parent);
>  	unsigned int num_cmdbufs =3D args->num_cmdbufs;
>  	unsigned int num_relocs =3D args->num_relocs;
>  	unsigned int num_waitchks =3D args->num_waitchks;
> @@ -361,6 +363,11 @@ int tegra_drm_submit(struct tegra_drm_context *conte=
xt,
>  	if (args->num_syncpts !=3D 1)
>  		return -EINVAL;
> =20
> +	/* Check for unrecognized flags */
> +	if (args->flags & ~(DRM_TEGRA_SUBMIT_WAIT_FENCE_FD |
> +	                    DRM_TEGRA_SUBMIT_CREATE_FENCE_FD))
> +		return -EINVAL;
> +
>  	job =3D host1x_job_alloc(context->channel, args->num_cmdbufs,
>  			       args->num_relocs, args->num_waitchks);
>  	if (!job)
> @@ -372,19 +379,27 @@ int tegra_drm_submit(struct tegra_drm_context *cont=
ext,
>  	job->class =3D context->client->base.class;
>  	job->serialize =3D true;
> =20
> +	if (args->flags & DRM_TEGRA_SUBMIT_WAIT_FENCE_FD) {
> +		job->prefence =3D sync_file_get_fence(args->fence);
> +		if (!job->prefence) {
> +			err =3D -ENOENT;
> +			goto put_job;
> +		}
> +	}
> +
>  	while (num_cmdbufs) {
>  		struct drm_tegra_cmdbuf cmdbuf;
>  		struct host1x_bo *bo;
> =20
>  		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
>  			err =3D -EFAULT;
> -			goto fail;
> +			goto put_fence;
>  		}
> =20
>  		bo =3D host1x_bo_lookup(file, cmdbuf.handle);
>  		if (!bo) {
>  			err =3D -ENOENT;
> -			goto fail;
> +			goto put_fence;
>  		}
> =20
>  		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
> @@ -398,19 +413,19 @@ int tegra_drm_submit(struct tegra_drm_context *cont=
ext,
>  						  &relocs[num_relocs], drm,
>  						  file);
>  		if (err < 0)
> -			goto fail;
> +			goto put_fence;
>  	}
> =20
>  	if (copy_from_user(job->waitchk, waitchks,
>  			   sizeof(*waitchks) * num_waitchks)) {
>  		err =3D -EFAULT;
> -		goto fail;
> +		goto put_fence;
>  	}
> =20
>  	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
>  			   sizeof(syncpt))) {
>  		err =3D -EFAULT;
> -		goto fail;
> +		goto put_fence;
>  	}
> =20
>  	job->is_addr_reg =3D context->client->ops->is_addr_reg;
> @@ -423,20 +438,54 @@ int tegra_drm_submit(struct tegra_drm_context *cont=
ext,
> =20
>  	err =3D host1x_job_pin(job, context->client->base.dev);
>  	if (err)
> -		goto fail;
> +		goto put_fence;
> =20
>  	err =3D host1x_job_submit(job);
>  	if (err)
> -		goto fail_submit;
> +		goto unpin_job;

Shouldn't all error-unwinding gotos after this jump to the unpin_job
label as well? Seems like they all jump to put_fence instead, which I
think would leave the job pinned on failure.

> =20
> -	args->fence =3D job->syncpt_end;
> +	if (args->flags & DRM_TEGRA_SUBMIT_CREATE_FENCE_FD) {
> +		struct dma_fence *fence;
> +		struct sync_file *file;
> +
> +		fence =3D host1x_fence_create(
> +			host1x, host1x_syncpt_get(host1x, job->syncpt_id),
> +			job->syncpt_end);
> +		if (!fence) {
> +			err =3D -ENOMEM;
> +			goto put_fence;
> +		}
> +
> +		file =3D sync_file_create(fence);
> +		if (!file) {
> +			dma_fence_put(fence);
> +			err =3D -ENOMEM;
> +			goto put_fence;
> +		}
> +
> +		err =3D get_unused_fd_flags(O_CLOEXEC);
> +		if (err < 0) {
> +			dma_fence_put(fence);
> +			goto put_fence;
> +		}
> +
> +		fd_install(err, file->file);
> +		args->fence =3D err;
> +	} else {
> +		args->fence =3D job->syncpt_end;
> +	}
> =20
> +	if (job->prefence)
> +		dma_fence_put(job->prefence);
>  	host1x_job_put(job);
>  	return 0;
> =20
> -fail_submit:
> +unpin_job:
>  	host1x_job_unpin(job);
> -fail:
> +put_fence:
> +	if (job->prefence)
> +		dma_fence_put(job->prefence);

Since we already have a conditional to check for usage of fence, I'm
wondering if we can simplify this a little and leave out the put_fence
label altogether, like so:

	unpin_job:
		host1x_job_unpin(job);
	put_job:
		if (job->prefence)
			dma_fence_put(job->prefence);

		host1x_job_put(job);

Thierry

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljGRvQACgkQ3SOs138+
s6EcQhAAmM2vZOsCI5lXtX58UkWuNwcDlhRsCXh1gRAOwbz1xw2YZV462/mPUPFp
6IzsNkRB5RknWfybmJotjSDJGdvS2TymXj0PvX+6GF1qYocKzwB1J00C7vFDtmNj
OX9+aJxxogqb66e8YMq+FG6ho1/yxylYY8Ez3td0Lb5tzjyEMSP/k/GehVPCPKLR
dc3m/cInwxVEtwfqJ5p8YW+mg/QnGoDTW9QZEH0PtlK1HE2mLvHTPlSzSyyYPdUS
rZ0D7L/rQ7TyObxEnBUl0CNvR48uO/ZwbXIY22BFnMCFkuVFPo2MLnUMLgRxmPws
acI0SfNTiVwZTFp5JqaD8ifDbuOYZ0wEelxc9o70pWE+1mTPJI5sDNhGsV4y2fSH
uGsNyckbYujsFS1QsknXrABSSZlTMsBphWmcLcwqeiR5zyqswxid/Iu1rYLj11C7
y6bzxdmuwBdwpANvLBmb+svhuF0r9sQRbUzeba42XJEEm5RJMTqrV3QcCKjTzX0+
WJEG9dgAtddd1g0yKet1UEspKRVm5Zl/XPnnlmw9toYPapvQX9T1AmXyM2i861aG
QwOO9OTJNCSn/U4ZEdx6ZRZWEEYNHCnTaTOqLUgbw6xHHYmVcifWVfUV93cbPkLf
m+CBW2ds1+Vrz+aMfcmNoerKMLM6Yo0IMNxCeIXakiEZMjSqrCk=
=fB8g
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
