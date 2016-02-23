From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/tegra: Set DMA ops
Date: Tue, 23 Feb 2016 16:28:15 +0100
Message-ID: <20160223152815.GD27656@ulmo>
References: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0051349171=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1456208754-12362-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0051349171==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 03:25:53PM +0900, Alexandre Courbot wrote:
> The current settings leaves the DRM device's dma_ops field NULL, which
> makes it use the dummy DMA ops on arm64 and return an error whenever we
> try to import a buffer. Call of_dma_configure() with a NULL node (since
> the device is not spawn from the device tree) so that
> arch_setup_dma_ops() is called and sets the default ioswtlb DMA ops.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index d347188bf8f4..bc0555adecaf 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -9,6 +9,7 @@
> =20
>  #include <linux/host1x.h>
>  #include <linux/iommu.h>
> +#include <linux/of_device.h>
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -990,6 +991,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  		return -ENOMEM;
> =20
>  	dev_set_drvdata(&dev->dev, drm);
> +	of_dma_configure(drm->dev, NULL);

Looking at the various pieces, I think this really belongs in
host1x_device_add() (see drivers/gpu/host1x/bus.c) where it can replace
the open-coded setting of DMA and coherent DMA masks. Also why can't we
pass the correct device tree node here? The DRM device is a virtual
device that hangs off the host1x device, so I think it could use the
same device tree node as the host1x device.

Something like the below (untested).

Thierry

--- >8 ---
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index c2e7fba370bb..d46d26a574da 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -17,6 +17,7 @@
=20
 #include <linux/host1x.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
=20
 #include "bus.h"
@@ -393,9 +394,8 @@ static int host1x_device_add(struct host1x *host1x,
 	INIT_LIST_HEAD(&device->list);
 	device->driver =3D driver;
=20
-	device->dev.coherent_dma_mask =3D host1x->dev->coherent_dma_mask;
-	device->dev.dma_mask =3D &device->dev.coherent_dma_mask;
 	dev_set_name(&device->dev, "%s", driver->driver.name);
+	of_dma_configure(&device->dev, host1x->dev->of_node);
 	device->dev.release =3D host1x_device_release;
 	device->dev.bus =3D &host1x_bus_type;
 	device->dev.parent =3D host1x->dev;

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzHqMAAoJEN0jrNd/PrOhYkQP/Rv+/mB6vFRedUYxEBcj9te+
aN0AzJShF2DuzQyjf97Hb/hdfU7EGpF0p5L2R3ssCW3BIyKwm0SNWGSpHX/f/5b0
SeSkoh2Sx89Tju8EDH7CJYVI0QjJhxGMBUhK2e39yM+0BKmMg1pbVw0zLuZecp3Q
vpB/1Gdn8/Rsf7QHJ5dhCkqTRYhG9Jv8dzxH0naBp+4Q0WXLOlGMUudq8vDUpod4
KJ9dYiYI6hucnz5ZCW+50nSn/iijB3PsBbIG0xrGAqGIRbYVvV+QywK7TXLbtJB+
dptYA/KJEgR+wqKp7IBB4lkPNzPSBGQJ3mUwiuAL1PXpa8L5KTAdP6Uq+TxOwkbh
1nv2sonpeArOzsZAnTgSpEtLhoGDoAB+/f4rC80MOQ/EBsEbfJIVHOii9QzyhPJY
ijeyPxnOssE2LZxFK2yKlF2cbwtkkZtP1cZlOuaohcytgM5hCZ6xRziRTqi8gck1
wgpVzGOhm+hfEKXmszJXUIOXFBaNcb+U1acck55ovS4Nbcn3zPdXTFrYBr/RqifC
qKoj2ZZD2/fAasvnUPW+5rmf/4FTDm5BDDKZlE9+JRzocYhQuSj0NQaUwZEEKa2Q
R7hZsowCXUWAuT4ql6IqPZfw4CVQfVECm7Dyrski/IR6zrhYv6bUOcF6YsD3k9hO
rUtEqxcewrj+M4G2ylOY
=wS5j
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--

--===============0051349171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0051349171==--
