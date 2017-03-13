From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] drm/tegra: Support for sync file-based fences in
 submit
Date: Mon, 13 Mar 2017 18:46:03 +0100
Message-ID: <20170313174603.GB19679@ulmo.ba.sec>
References: <20170309175718.14843-1-mperttunen@nvidia.com>
 <20170309175718.14843-4-mperttunen@nvidia.com>
 <20170313071500.GB15513@ulmo.ba.sec>
 <f531a54a-40a8-3047-2fa9-2f751257ce13@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1096173747=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f531a54a-40a8-3047-2fa9-2f751257ce13@kapsi.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1096173747==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2017 at 11:07:28AM +0200, Mikko Perttunen wrote:
>=20
>=20
> On 13.03.2017 09:15, Thierry Reding wrote:
> > On Thu, Mar 09, 2017 at 07:57:18PM +0200, Mikko Perttunen wrote:
> > > Add support for sync file-based prefences and postfences
> > > to job submission. Fences are passed to the Host1x implementation.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > >  drivers/gpu/drm/tegra/drm.c | 69 +++++++++++++++++++++++++++++++++++=
+++-------
> > >  1 file changed, 59 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > > index 64dff8530403..bf4a2a13c17d 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/bitops.h>
> > >  #include <linux/host1x.h>
> > >  #include <linux/iommu.h>
> > > +#include <linux/sync_file.h>
> > >=20
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > > @@ -344,6 +345,7 @@ int tegra_drm_submit(struct tegra_drm_context *co=
ntext,
> > >  		     struct drm_tegra_submit *args, struct drm_device *drm,
> > >  		     struct drm_file *file)
> > >  {
> > > +	struct host1x *host1x =3D dev_get_drvdata(drm->dev->parent);
> > >  	unsigned int num_cmdbufs =3D args->num_cmdbufs;
> > >  	unsigned int num_relocs =3D args->num_relocs;
> > >  	unsigned int num_waitchks =3D args->num_waitchks;
> > > @@ -361,6 +363,11 @@ int tegra_drm_submit(struct tegra_drm_context *c=
ontext,
> > >  	if (args->num_syncpts !=3D 1)
> > >  		return -EINVAL;
> > >=20
> > > +	/* Check for unrecognized flags */
> > > +	if (args->flags & ~(DRM_TEGRA_SUBMIT_WAIT_FENCE_FD |
> > > +	                    DRM_TEGRA_SUBMIT_CREATE_FENCE_FD))
> > > +		return -EINVAL;
> > > +
> > >  	job =3D host1x_job_alloc(context->channel, args->num_cmdbufs,
> > >  			       args->num_relocs, args->num_waitchks);
> > >  	if (!job)
> > > @@ -372,19 +379,27 @@ int tegra_drm_submit(struct tegra_drm_context *=
context,
> > >  	job->class =3D context->client->base.class;
> > >  	job->serialize =3D true;
> > >=20
> > > +	if (args->flags & DRM_TEGRA_SUBMIT_WAIT_FENCE_FD) {
> > > +		job->prefence =3D sync_file_get_fence(args->fence);
> > > +		if (!job->prefence) {
> > > +			err =3D -ENOENT;
> > > +			goto put_job;
> > > +		}
> > > +	}
> > > +
> > >  	while (num_cmdbufs) {
> > >  		struct drm_tegra_cmdbuf cmdbuf;
> > >  		struct host1x_bo *bo;
> > >=20
> > >  		if (copy_from_user(&cmdbuf, cmdbufs, sizeof(cmdbuf))) {
> > >  			err =3D -EFAULT;
> > > -			goto fail;
> > > +			goto put_fence;
> > >  		}
> > >=20
> > >  		bo =3D host1x_bo_lookup(file, cmdbuf.handle);
> > >  		if (!bo) {
> > >  			err =3D -ENOENT;
> > > -			goto fail;
> > > +			goto put_fence;
> > >  		}
> > >=20
> > >  		host1x_job_add_gather(job, bo, cmdbuf.words, cmdbuf.offset);
> > > @@ -398,19 +413,19 @@ int tegra_drm_submit(struct tegra_drm_context *=
context,
> > >  						  &relocs[num_relocs], drm,
> > >  						  file);
> > >  		if (err < 0)
> > > -			goto fail;
> > > +			goto put_fence;
> > >  	}
> > >=20
> > >  	if (copy_from_user(job->waitchk, waitchks,
> > >  			   sizeof(*waitchks) * num_waitchks)) {
> > >  		err =3D -EFAULT;
> > > -		goto fail;
> > > +		goto put_fence;
> > >  	}
> > >=20
> > >  	if (copy_from_user(&syncpt, (void __user *)(uintptr_t)args->syncpts,
> > >  			   sizeof(syncpt))) {
> > >  		err =3D -EFAULT;
> > > -		goto fail;
> > > +		goto put_fence;
> > >  	}
> > >=20
> > >  	job->is_addr_reg =3D context->client->ops->is_addr_reg;
> > > @@ -423,20 +438,54 @@ int tegra_drm_submit(struct tegra_drm_context *=
context,
> > >=20
> > >  	err =3D host1x_job_pin(job, context->client->base.dev);
> > >  	if (err)
> > > -		goto fail;
> > > +		goto put_fence;
> > >=20
> > >  	err =3D host1x_job_submit(job);
> > >  	if (err)
> > > -		goto fail_submit;
> > > +		goto unpin_job;
> >=20
> > Shouldn't all error-unwinding gotos after this jump to the unpin_job
> > label as well? Seems like they all jump to put_fence instead, which I
> > think would leave the job pinned on failure.
>=20
> After host1x_job_submit is succesfully called, host1x's job tracking owns
> the job and will call unpin on it once it finishes or times out, so we
> cannot unpin it from here.

Okay, might be worth explaining that in a comment above the call to
host1x_job_submit() because it's not obvious and I'm pretty sure people
would send in patches to "fix" this.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljG2tsACgkQ3SOs138+
s6HqGg/+J++SA1CtQ5SLvtd8V7PWns24KBmPgEzwbo2b77diwjlBV90imXS96HS6
xaZcGMf/48dQjFe5nSUyt1gAnxKrQMHoFmJct51X29bAdg+lexApk5JIHc/qu1Zw
Fv+Jo/kWSv35jSeU9BjusVZ3yFMVXnYv9nL06bM+CMYDG5hifGHkPtW+oHbjkwyl
dK2JXYVzsrXP92dv4MeEutAZQeQEIZz2YTjn7yugw306+nKW1YWxu6a+2ZokiL3D
mgt01p+IGmlTkNSIj7eoFDE//zZugfwdC16qRpNORJHDbBAW+WtKn5uueHjp9YBU
Kdxi1OR+TGwrWm5O7gY8ZEoUWGoWjRHvcOh+nulrMTBBxSMlwhd/sJ7o+RjyqcNR
vdZh5V+uumk3BJ1ZKpu56jj0ZEp092FiTSz/+aint+gSssmONeRqNMvrLK0tRHDA
KQz1j05dpaLtrv+GinlUkuq71R41oeUtTsUjMR4D3k/1Kl/0GT7S2/QQykKDd713
Z7p2MEOBOz3Tguwz5Kzyuwmbn1bB6Sjdt4K5xmCAbu0u+/P/WcguewATEU3d4uCR
RwF/seNSZQFRBFoTDM4B/yhdFisB+sMsAvY3rJ7m/Ket16URxxh2OzL40dZ4iOiH
Lkgsx3kMJ+2p0jRo3g+FnxGyFspeWB9Dzil1yAPtGLZnBbez9YQ=
=diOo
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--

--===============1096173747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1096173747==--
