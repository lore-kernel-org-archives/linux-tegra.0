From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 08/11] drm/nouveau: tegra: Skip IOMMU initialization if
 already attached
Date: Mon, 16 Sep 2019 17:57:24 +0200
Message-ID: <20190916155724.GG7488@ulmo>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-9-thierry.reding@gmail.com>
 <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1307020535=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <156993ea-ece6-9eb5-b664-a55c631e2600@arm.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1307020535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 04:29:18PM +0100, Robin Murphy wrote:
> Hi Thierry,
>=20
> On 16/09/2019 16:04, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > If the GPU is already attached to an IOMMU, don't detach it and setup an
> > explicit IOMMU domain. Since Nouveau can now properly handle the case of
> > the DMA API being backed by an IOMMU, just continue using the DMA API.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   .../drm/nouveau/nvkm/engine/device/tegra.c    | 19 +++++++------------
> >   1 file changed, 7 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drive=
rs/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > index d0d52c1d4aee..fc652aaa41c7 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> > @@ -23,10 +23,6 @@
> >   #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
> >   #include "priv.h"
> > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > -#include <asm/dma-iommu.h>
> > -#endif
> > -
> >   static int
> >   nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
> >   {
> > @@ -109,14 +105,13 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_=
tegra *tdev)
> >   	unsigned long pgsize_bitmap;
> >   	int ret;
> > -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> > -	if (dev->archdata.mapping) {
> > -		struct dma_iommu_mapping *mapping =3D to_dma_iommu_mapping(dev);
> > -
> > -		arm_iommu_detach_device(dev);
> > -		arm_iommu_release_mapping(mapping);
> > -	}
> > -#endif
> > +	/*
> > +	 * Skip explicit IOMMU initialization if the GPU is already attached
> > +	 * to an IOMMU domain. This can happen if the DMA API is backed by an
> > +	 * IOMMU.
> > +	 */
> > +	if (iommu_get_domain_for_dev(dev))
> > +		return;
>=20
> Beware of "iommu.passthrough=3D1" - you could get a valid default domain =
here
> yet still have direct/SWIOTLB DMA ops. I guess you probably want to
> double-check the domain type as well.

Good point. An earlier version of this patch had an additional check for
IOMMU_DOMAIN_DMA, but then that failed on 32-bit ARM because there the
DMA API can also use IOMMU_DOMAIN_UNMANAGED type domains. Checking for
IOMMU_DOMAIN_IDENTIFY should be safe, though. That doesn't seem to
appear in arch/arm, arch/arm64 or drivers/iommu/dma-iommu.c.

Thierry

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/sOQACgkQ3SOs138+
s6G9lxAAqj/Wt4i1/qIqPUnA23oLf9oCnL1Yb6LcxcrqC2WAk/tKXoPLNaiPRm5y
zDP837onw4dnW5PuXrx/r6GiK6I6Uyo48t0Zx9VCqrM5ZJqCEQf95KhOp8vLEmap
LiCDigG53Gjr9oVRENvPzXpwZjaGtAX1R45K3Rl2PpGnkRQVMsznXpzkaKh2H4Pf
Vf2wv8PsNztbDeJKtEFbSDn3EOmKbZeBJ+XtYCl8sR40RLE1hmjT27kCBsNK9aBz
LAnPdU3noP5B356AIsJrcl7r12mBH/dEgfOvWEKAIraUefEBuzO6EgY9bavaPnfO
id/JMqq/A2J/2swMusvTkPx8OwI3aqf+1dMByXSyVNp0RtIJoJbWy3R4BjHDrjO9
gpZ7kaQ8TujNkSYF2TrKc1nHQtZfrcmniNAA+nI3utSbduEfbYKAagQpPqCh+/tn
Qo1bc08Pn2QOwfZwYtJOl68nPZ5PwBqyX2/yBPjqS2DY5yCyhLgP/HumMA4roFEQ
GYAUYaqaKzij6X6+J42UfE7O61N+uy50NfKQKtwjlc7m55H7UTglC+W0vR8jkav/
5qTd3p22XJ+Iw3JlO4Dh/nw9AE/VRHylsBBbcFWK9UjhiuB45dw5I56r16J+edlc
8c/KtpmQR+NmpVaj6NuQGuz7eJ3siyQqprRigyR0hi5ftgz23Fs=
=hD6x
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--

--===============1307020535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1307020535==--
