From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/nouveau: add GEM_SET_TILING
	staging ioctl
Date: Mon, 6 Jul 2015 15:30:09 +0200
Message-ID: <20150706133008.GA30401@ulmo.nvidia.com>
References: <1434352169-10501-1-git-send-email-acourbot@nvidia.com>
 <1434352169-10501-3-git-send-email-acourbot@nvidia.com>
 <557E7B98.1040908@nvidia.com>
 <20150629133055.GC32467@ulmo.nvidia.com>
 <CAAVeFuJG4gL5zzsZg9weEp7X-M_AdiRjmcH99MkMBK07sLfsyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0047601673=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJG4gL5zzsZg9weEp7X-M_AdiRjmcH99MkMBK07sLfsyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============0047601673==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2015 at 08:41:07PM +0900, Alexandre Courbot wrote:
> Hi Thierry,
>=20
> On Mon, Jun 29, 2015 at 10:30 PM, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> > On Mon, Jun 15, 2015 at 04:15:36PM +0900, Alexandre Courbot wrote:
> >> On 06/15/2015 04:09 PM, Alexandre Courbot wrote:
> >> >From: Ari Hirvonen <ahirvonen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> >
> >> >Add new NOUVEAU_GEM_SET_TILING ioctl to set correct tiling
> >> >mode for imported dma-bufs. This ioctl is staging for now
> >> >and enabled with the "staging_tiling" module option.
> >>
> >> Adding Thierry to the conversation since he knows best about exported
> >> buffers and attributes. I wonder if this would not better be done at t=
he
> >> time the buffer gets imported. It seems to me that this would be a more
> >> appropriate way than having an ioctl dedicated to this. Thierry, would=
 you
> >> have any input based on your experience with tegradrm? In the end, it =
seems
> >> like you have settled for a similar ioctl to set the tiling mode of
> >> displayed buffers.
> >
> > You can't do this at the time the buffer is imported because the PRIME
> > API doesn't have a means to communicate this type of meta-data. The data
> > is also very driver-specific, so you can't easily make it generic enough
> > to be useful in a generic import API.
>=20
> Ok, so does it mean that this kind of use-case is best handled by a
> driver-specific IOCTL?

Yeah, I think it is.

> >> >+int
> >> >+nouveau_gem_ioctl_set_tiling(struct drm_device *dev, void *data,
> >> >+                         struct drm_file *file_priv)
> >> >+{
> >> >+    struct nouveau_drm *drm =3D nouveau_drm(dev);
> >> >+    struct nouveau_cli *cli =3D nouveau_cli(file_priv);
> >> >+    struct nvkm_fb *pfb =3D nvxx_fb(&drm->device);
> >> >+    struct drm_nouveau_gem_set_tiling *req =3D data;
> >> >+    struct drm_gem_object *gem;
> >> >+    struct nouveau_bo *nvbo;
> >> >+    struct nvkm_vma *vma;
> >> >+    int ret =3D 0;
> >> >+
> >> >+    if (!nouveau_staging_tiling)
> >> >+            return -EINVAL;
> >> >+
> >> >+    if (!pfb->memtype_valid(pfb, req->tile_flags)) {
> >> >+            NV_PRINTK(error, cli, "bad page flags: 0x%08x\n", req->t=
ile_flags);
> >> >+            return -EINVAL;
> >> >+    }
> >> >+
> >> >+    gem =3D drm_gem_object_lookup(dev, file_priv, req->handle);
> >> >+    if (!gem)
> >> >+            return -ENOENT;
> >> >+
> >> >+    nvbo =3D nouveau_gem_object(gem);
> >> >+
> >> >+    /* We can only change tiling on PRIME-imported buffers */
> >> >+    if (nvbo->bo.type !=3D ttm_bo_type_sg) {
> >> >+            ret =3D -EINVAL;
> >> >+            goto out;
> >> >+    }
> >
> > I don't think that's the right way to check for PRIME-imported buffers.
> > The right check is:
> >
> >         if (!gem->import_attach) {
> >                 ret =3D -EINVAL;
> >                 goto out;
> >         }
> >
> > The comment above this block should probably also say *why* we can only
> > change tiling on PRIME-imported buffers.
>=20
> The reason is because we actually don't want to *change* the tiling
> settings as much as we want to *set* them for imported buffers. The
> DRM_NOUVEAU_GEM_NEW ioctl has a tiling parameter, and we need the same
> feature for PRIME-imported buffers.

That would make a much better comment than what you currently have. =3D)

> This is why I would have preferred to have this information somehow
> attached to the buffer itself, or specified at import time, since
> having a dedicated ioctl tends to suggest that it is to change the
> tiling settings.
>=20
> I wanted your thoughts on the topic because I know you had the same
> issue with tegra DRM and actively looked for a solution - but from
> your comments, it seems like that solution is to simply use a
> dedicated IOCTL for this.

Yes, I know of no other way to do this.

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVmoLdAAoJEN0jrNd/PrOhHXwP/2pT/kOJK4I7Z0ak9D7g55+1
3M9Mwvt533AxbJiXEqvaqZobmlGJJ60kPRNjESoOvZeKEtut+hZEj9V8fhDvd0nD
sWZJ1qdnFnqt9teMATqkgNXVmbnl2OOnOJeZ5q6RiC0k0QCIIvqd/9fyHjGb2uEG
6F8glVI12P8sk9Vnqsp1wwotiwOYeB5C0h1Kz86ErxJvt5jCoXzNSV6nY/Zf7dtH
xWcvdACyvhrl5SwZf5AvmijW2IIH6MSPrliS3CZM3/ZJ/BYqz2h1/c8zCbaDkjxP
5ALprXKGnQJ40GCFvJXknKTtS6PKFxncI/DWacPWrYKspshy2U5SNdtcq/ZIEZV4
i9FhSpz+tN0SyBUMJzjrso3gldxU7biMC5AJh0GkYB3cpzIqC+zOAl9WZEkVbN6N
xjarFQlv7SF2wl65ypxKg91teFxM2DFEcUrZXp9bd7VuZvrecSPF4VfA3iyiGvKi
DvOGbzUHCxT41FuroYjo4luPHCS4dVP3QiSsPrBNK1FLaZ0hTMvFvLjPQbZqKUlp
ZPcNsqyDL7ppVIxJyIjPz/s5hw4v91M0w/1eN2mal7j6Ty74lzX4WMvn8SHMJ9rx
1tw9lDupHsIGrQW9XfDdB7LYRmLgGDGx48qttPw0F3CUD9vPUA3zEB1F7sQSLC7e
UmmzZ9KeAXrU0fpMLTR9
=Pff9
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============0047601673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0047601673==--
