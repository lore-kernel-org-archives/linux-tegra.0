From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
Date: Mon, 16 Sep 2019 17:49:46 +0200
Message-ID: <20190916154946.GD7488@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
 <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0850092312=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0850092312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 04:35:30PM +0100, Ben Dooks wrote:
> On 16/09/2019 16:04, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > There are extra registers that need to be programmed to make the level 2
> > cache work on GP10B, such as the stream ID register that is used when an
> > SMMU is used to translate memory addresses.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
> >   .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
> >   .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
> >   .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 69 +++++++++++++++++++
> >   .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
> >   5 files changed, 74 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h b/driver=
s/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > index 644d527c3b96..d76f60d7d29a 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> > @@ -40,4 +40,5 @@ int gm107_ltc_new(struct nvkm_device *, int, struct n=
vkm_ltc **);
> >   int gm200_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> >   int gp100_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> >   int gp102_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> > +int gp10b_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> >   #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/device/base.c
> > index c3c7159f3411..d2d6d5f4028a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > @@ -2380,7 +2380,7 @@ nv13b_chipset =3D {
> >   	.fuse =3D gm107_fuse_new,
> >   	.ibus =3D gp10b_ibus_new,
> >   	.imem =3D gk20a_instmem_new,
> > -	.ltc =3D gp102_ltc_new,
> > +	.ltc =3D gp10b_ltc_new,
> >   	.mc =3D gp10b_mc_new,
> >   	.mmu =3D gp10b_mmu_new,
> >   	.secboot =3D gp10b_secboot_new,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild b/drivers/g=
pu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > index 2b6d36ea7067..728d75010847 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> > @@ -6,3 +6,4 @@ nvkm-y +=3D nvkm/subdev/ltc/gm107.o
> >   nvkm-y +=3D nvkm/subdev/ltc/gm200.o
> >   nvkm-y +=3D nvkm/subdev/ltc/gp100.o
> >   nvkm-y +=3D nvkm/subdev/ltc/gp102.o
> > +nvkm-y +=3D nvkm/subdev/ltc/gp10b.o
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> > new file mode 100644
> > index 000000000000..4d27c6ea1552
> > --- /dev/null
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> > @@ -0,0 +1,69 @@
> > +/*
> > + * Copyright (c) 2019 NVIDIA Corporation.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * Authors: Thierry Reding
> > + */
> > +
> > +#include "priv.h"
> > +
> > +static void
> > +gp10b_ltc_init(struct nvkm_ltc *ltc)
> > +{
> > +	struct nvkm_device *device =3D ltc->subdev.device;
> > +#ifdef CONFIG_IOMMU_API
> > +	struct iommu_fwspec *spec;
> > +#endif
> > +
> > +	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
> > +	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
> > +	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
> > +
> > +#ifdef CONFIG_IOMMU_API
> > +	spec =3D dev_iommu_fwspec_get(device->dev);
> > +	if (spec) {
> > +		u32 sid =3D spec->ids[0] & 0xffff;
> > +
> > +		/* stream ID */
> > +		nvkm_wr32(device, 0x160000, sid << 2);
> > +	}
> > +#endif
>=20
> Could we get rid of the #ifdef blocks here if there was a NULL
> inline version of dev_iommu_fwspec_get() in the include/linux/iommu.h
> header? The compiler should then optimise the lot out if the config
> is not set.

I had thought the same thing and had even typed up the patch to add a
dummy for dev_iommu_fwspec_get(), but then when I tested some builds, I
got build errors nevertheless because struct iommu_fwspec is only
declared under IOMMU_API.

The obvious thing would have been to move struct iommu_fwspec outside of
the IOMMU_API protection, but then I remembered having an earlier
discussion with Joerg about something similar. I guess the issue here is
that we need to reach into struct iommu_fwspec, so it has to be
available in full.

Anyway, I can add a patch to do this and remove the IOMMU_API guards,
but let's see what Joerg thinks about that first.

Joerg, to summarize: the proposal here is to move the declaration of the
iommu_fwspec outside of the IOMMU_API guard and provide a dummy
implementation of dev_iommu_fwspec_get() to allow this code to be built
without the #ifdef guards. We had discussed something similar about 5
years back and at the time you had been opposed:

	https://lore.kernel.org/linux-iommu/1406897113-20099-1-git-send-email-thie=
rry.reding@gmail.com/

The case here is slightly different and a lot of time has passed since,
so just wanted to ask if your opinion here is the same, or whether you
would accept a patch to make this buildable without resorting to
#ifdef'ery.

Thierry

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/rxcACgkQ3SOs138+
s6H1CA/9EEUUpuujS2lhaYHlgGsxbZYo87hmFqomDZ/H1Vicm3buyXQ4QIq7tQHq
y6ul6QuMc2Tht7+wPXOsvlGeNfhRFB13Wka0NPnpIIao1tV3mL9UT61UbNxgwHsp
hFWyBR+5maXeNZi0z2xPBACYOZNenHNvIPs/zqlhFA23fhQJcorVzKgFWe5k29Xr
SNOQPG5962K+76h41Aqe1s55pLDZBegRCT3zGJOv5SDl+Au/j7ViEmjSDqmRIHLN
jFYbfYf+dxEFFhvNbWImMuIYvLUWt6XCq4jHHT8fOpxHE6VWogE1gixELbPP+lWg
bBb2C6cfdXEksGSRjPefpbA4sbAIxV1rw53xsiu/kAXPFAbwDE5MsaBDS7C0nsDq
YT+w4whVHm9fN2E4tMfO5sAfNgffLYRibTA++D5w7KDdnnM2mFK0Oo8Mo+Ee8hv9
0HDGdEoLP2HwxFWPcvukzjB4DSj82jY6oTb3+J8H6PldweZz/rcnwjl83CS3Szrd
+47qkWFf6DLUQYZSiazi3YuNzVF4Xo0td1E6JXOhQIT/+hMKA/xqla7QB6toFEjF
gNcQASNlpLpjjJwiIuKzKY5r8suis1rKuJh15hHhn1ehffAcEEGIXzwE3dpTYaoe
K9o0hauR9pzQmwMVu+Za9ztOSt7Xts+5GWQ+T+8N1JtriR5q1B0=
=OJmN
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--

--===============0850092312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0850092312==--
