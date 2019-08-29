From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
Date: Thu, 29 Aug 2019 14:40:34 +0200
Message-ID: <20190829124034.GA19842@ulmo>
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: YueHaibing <yuehaibing@huawei.com>, digetx@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, robin.murphy@arm.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
> On 8/26/19 3:31 PM, YueHaibing wrote:
> > If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
> > to m will set IOMMU_IOVA to m, this fails the building of
> > TEGRA_HOST1X and DRM_TEGRA which is y like this:
> >=20
> > drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
> > cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
> > cdma.c:(.text+0x698): undefined reference to `__free_iova'
> >=20
> > drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
> > drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
> > drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
> >=20
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
> > Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU suppo=
rt")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/=
media/tegra-vde/Kconfig
> > index ba49ea5..a41d30c 100644
> > --- a/drivers/staging/media/tegra-vde/Kconfig
> > +++ b/drivers/staging/media/tegra-vde/Kconfig
> > @@ -1,9 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  config TEGRA_VDE
> >  	tristate "NVIDIA Tegra Video Decoder Engine driver"
> > -	depends on ARCH_TEGRA || COMPILE_TEST
> > +	depends on ARCH_TEGRA
>=20
> What happens if you drop this change,
>=20
> >  	select DMA_SHARED_BUFFER
> > -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> > +	select IOMMU_IOVA if IOMMU_SUPPORT
>=20
> but keep this change?
>=20
> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
> work when compile testing this tegra-vde driver.
>=20
> Haven't tried it, but making sure that compile testing keep working is
> really important.

Yeah, that variant seems to work for me. I think it's also more correct
because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
then IOVA is not needed either, so the dummies will do just fine.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1nx78ACgkQ3SOs138+
s6FjdBAAjPVTLKQa12c+8O/ecTX4Bkd37JWHnmOyfuQByXvgyFwDufWK1I19NpQh
gunYeGFxSe36t4aIK8w27Jtr86Zo7tw8xUmNs2cZrNLZahvEx4DERmV3VeqqKv8L
hNjLT61akI4MlN7rGpRcwbUrtL39NJW3msO/NzvnZAy8EetobwDPVkcyhG+XfQhc
XsNXJhnvj3W5PR1+RzhL1i2UGwpc4HhLEFjHgzHcBsVgo6QixR/vSCNQ+mJPEcsz
G5NRpG8zqh6gGUCs4Fxi2Pn6FwWqYaqyqBbSZoAydYULWMhEUsZPTiyihsOP2PxM
V8ni2vhx6hzqlr0Sml5LfsT8eDjuKLFHacfFzg0ediSy7HI3p8hxotcdZXfJ0T9G
q1W7wK5WDhA3FP/z9iBQRjryaTUUQtf/F1NBMvTPvIfUipxqcgYq2/SayQ12g/9l
e36ocSD+yuI0sZNa549AVTF5hYmmbkGAcrX+vF6OB0e0tGZoPAmBvQwd7XH2MHzI
T2r6b1S4WMlZ6XX4ko8boqXVGzO8cGybF2S3pdNnQrWQc/EiFimCLlxVFjdvR6w2
MdzxVAYlU47MNIhMaCbOCzEW5lq6krlMSVC3vpK13RGegyM7LHp5XXrhnRk5n6yf
Ap68NCbc9fsg3oNPcddpiHnadEVLap36FWSpLixSYuZLUevnhZc=
=jI77
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
