From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
Date: Fri, 1 Nov 2019 10:47:57 +0100
Message-ID: <20191101094757.GA1167505@ulmo>
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
 <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuehaibing <yuehaibing@huawei.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, mperttunen@nvidia.com, arnd@arndb.de, seanpaul@chromium.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 09:33:38PM +0800, Yuehaibing wrote:
> On 2019/10/31 6:26, Dmitry Osipenko wrote:
> > 30.10.2019 16:54, YueHaibing =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> If IOMMU_SUPPORT is not set, but IOMMU_IOVA is m and
> >> COMPILE_TEST is y, building fails:
> >>
> >> drivers/gpu/host1x/dev.o: In function `host1x_remove':
> >> dev.c:(.text+0x624): undefined reference to `put_iova_domain'
> >> dev.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 aga=
inst undefined symbol `put_iova_domain'
> >> dev.c:(.text+0x62c): undefined reference to `iova_cache_put'
> >> dev.c:(.text+0x62c): relocation truncated to fit: R_AARCH64_CALL26 aga=
inst undefined symbol `iova_cache_put'
> >>
> >> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
> >>
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> >> Fixes: 52499a6ad2ae ("gpu: host1x: select IOMMU_IOVA")
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >> ---
> >>  drivers/gpu/host1x/Kconfig | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
> >> index cf987a3..354232d 100644
> >> --- a/drivers/gpu/host1x/Kconfig
> >> +++ b/drivers/gpu/host1x/Kconfig
> >> @@ -2,7 +2,7 @@
> >>  config TEGRA_HOST1X
> >>  	tristate "NVIDIA Tegra host1x driver"
> >>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> >> -	select IOMMU_IOVA if IOMMU_SUPPORT
> >> +	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> >>  	help
> >>  	  Driver for the NVIDIA Tegra host1x hardware.
> >> =20
> >>
> >=20
> > It should be better to unconditionally select IOMMU_IOVA here.
> >=20
> > The same could be done for drivers/staging/media/tegra-vde/ and
> > drivers/gpu/host1x/, please see [1].
>=20
> Yep, I will repost, thanks!

No need to resend, I already have patches for that.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl27/0oACgkQ3SOs138+
s6EWPA//dBzkncU7+5Fx+wB0ll6n1Xc1ZFAP926QU2qICk9o6Uk+E/Nzua7dQFoe
ges3kWygaLZqdKbc2x84wRq8hu3FcFy33oE1ThrQBlJ7fSzhwuNYlz4fsFxRw6bJ
yE5vL412omLWlJuDntsxueODPjHO4KW3F/yBA2TM0WlpSYDzKPlnFSf6uw3ypQqf
SQkzPW+vJF2G1lboBg+vBqS6XN78wuThsHN6v+CAe+POAimqz/xAvijKqFQPLN+w
gSM/BlIpTFDRr2HnrKZG6rMxZFabPwxhTFeiM6zBMqhE63O2j5kPQ3LmbVRl/Otk
8zOX9VebV5AMjY+C/U43yGJ3UfkK8qmJjBZkD4HKDvuQxbkFxVkg4/whuBuRtEgr
JYkJy0k4PrhiUcvhqCOIX42VUeUsHRq2yC0yV4x2ORxXZjxlOvKSTj/2COdcMQml
R+Jz0e6odOetH2x4zAzYR4Mw6foZGwnsssnefVhuos7BVErYkIdhWWLy2kxL9JZW
XzprLVUg+TrRXgO3PUamO5aHg1fqKERl4I0MrlG1uCFBBVNUWzSL6nV8QgPlo0CS
HPaHYM9lOTwh0+dPTfQW5hdHeyo8hpfHNJu0li78bK9QZcP6qelqeL3r5IPEfBcv
RXQtNzxBUZVu147WKiiemWA3/VM/QrY7ZYTGMA9TDBu16BzMEZc=
=327H
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
