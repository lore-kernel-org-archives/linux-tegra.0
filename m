From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC libdrm] Add NVIDIA Tegra support
Date: Tue, 4 Dec 2012 16:38:41 +0100
Message-ID: <20121204153841.GA18320@avionic-0098.adnet.avionic-design.de>
References: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de>
 <1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
 <CAF6AEGum=cOxcHN1fBNfpLpm=bC-dXHZ_h2u96Ek4gwQSWSTtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6AEGum=cOxcHN1fBNfpLpm=bC-dXHZ_h2u96Ek4gwQSWSTtw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 09:28:25AM -0600, Rob Clark wrote:
> On Tue, Dec 4, 2012 at 9:13 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > +int drm_tegra_bo_new(struct drm_tegra *device, uint32_t flags, uint32_=
t size,
> > +                    struct drm_tegra_bo **bop)
> > +{
> > +       struct drm_tegra_gem_create args;
> > +       struct drm_tegra_bo *bo;
> > +       struct tegra_bo *priv;
> > +       int err;
> > +
> > +       if (!device || size =3D=3D 0 || !bop)
> > +               return -EINVAL;
> > +
> > +       bo =3D calloc(1, sizeof(*bo));
> > +       if (!bo)
> > +               return -ENOMEM;
> > +
> > +       priv =3D tegra_bo(bo);
> > +
> > +       DRMLISTINITHEAD(&priv->list);
> > +       atomic_set(&priv->ref, 1);
> > +       bo->device =3D device;
> > +       bo->flags =3D flags;
> > +       bo->size =3D size;
> > +
> > +       memset(&args, 0, sizeof(args));
> > +       args.flags =3D flags;
> > +       args.size =3D size;
> > +
> > +       err =3D drmCommandWriteRead(device->fd, DRM_TEGRA_GEM_CREATE, &=
args,
> > +                                 sizeof(args));
> > +       if (err < 0) {
> > +               err =3D -errno;
> > +               free(bo);
> > +               return err;
> > +       }
> > +
> > +       DRMLISTADD(&priv->list, &device->bo_list);
> > +       bo->handle =3D args.handle;
> > +       bo->offset =3D args.offset;
>=20
> btw, x11 can rapidly create/destroy temporary pixmaps.. which don't
> necessarily need userspace access.  You might prefer to avoid creating
> mmap offset on GEM bo creation, and instead do this only if userspace
> needs to mmap the bo

Ah, so that's the reason for the MMAP IOCTL provided by other DRMs. Yes,
that might be better in the long run. For now I don't think it makes
much of a difference since the GEM objects are backed by CMA, and
therefore the offset will be created along with the GEM anyway.

With Terje's upcoming rework that handles all the allocations in host1x
this should become more important, especially when the mapping is done
through the Tegra30's IOMMU.

I'll rework that. Thanks for the quick reply.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQvhkBAAoJEN0jrNd/PrOh3IwQAKpjwoRfplIwE7JX0cRGmM91
jwCJAop2UfvuCNOr2D4vRvq0wZ9Cb/TfWHW6kLrVIjqAzyth1+PXlHOQGQ+xYYsV
ydwCVipgxdG38iPrs9TShmH8tTnCAKuroigEg/EqF0kXq363Dt4s6fnKdA2yZSpq
XbvRyfQnKrjOUappsKMVrlatiwdtZ5Hp5lCSzk6RBCqtPRq0aPLEvbpv9bGorGmZ
hjwj7vUsX1BuscFBPzqFoXDv1BBcn3vj0p0d3e6SCFeMCnOzBFVhTIjuNLXdMgDu
g+haWfHsFy/pPqyONlAZFKSvEPZADGu77HWEjBKMvsy9BvuFr2Cu+T6ZHFahjTbY
ZJJSlDhmUfw7LsHcMT73ak/AHjyL8p2CfxD9BcTgpXq5l3Dsdo6RkdTzRA+8+BKU
7jXM8dZ0oXh3g1o9I1OOFe2AneuK+LCyg/PSvIozzvQgAGupNtwgKkFwDRgPOgZx
vQypP0u+kSSlaYx9FL1keEjePXFkSw6CChRTjkeky6/k+C7YJNLOKNdKQQEAIpDF
zw9h5gRZBoK0cHjqTEFnCLHgqJINSnCwfJ0EnvsAFgtTvPZ3LokOjVZ0TIgZOJnn
IsVaUSiWyFkPU0mGmwEyl4taolltF2vz9xaxHByfQ0e8gol8qMFwX0GDF4Rpg9xC
MKnjj/5mSLrCO13T03O0
=WJB9
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
