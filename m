From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/5] drm/tegra: gr2d: Add IOMMU support
Date: Fri, 4 May 2018 12:54:16 +0200
Message-ID: <20180504105416.GN13459@ulmo>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180503234723.4368-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0859223489=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503234723.4368-3-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0859223489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwjEIfU64POCkTAH"
Content-Disposition: inline


--iwjEIfU64POCkTAH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 02:47:20AM +0300, Dmitry Osipenko wrote:
> Attach GR2D to the display IOMMU group in order to provide GR2D access
> to BO's IOVA.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 9a8ea93016a9..8eb530a85dd0 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -7,12 +7,14 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/iommu.h>
> =20
>  #include "drm.h"
>  #include "gem.h"
>  #include "gr2d.h"
> =20
>  struct gr2d {
> +	struct iommu_group *group;
>  	struct tegra_drm_client client;
>  	struct host1x_channel *channel;
>  	struct clk *clk;
> @@ -30,7 +32,9 @@ static int gr2d_init(struct host1x_client *client)
>  	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
>  	struct drm_device *dev =3D dev_get_drvdata(client->parent);
>  	unsigned long flags =3D HOST1X_SYNCPT_HAS_BASE;
> +	struct tegra_drm *tegra =3D dev->dev_private;
>  	struct gr2d *gr2d =3D to_gr2d(drm);
> +	int err;
> =20
>  	gr2d->channel =3D host1x_channel_request(client->dev);
>  	if (!gr2d->channel)
> @@ -42,23 +46,46 @@ static int gr2d_init(struct host1x_client *client)
>  		return -ENOMEM;
>  	}
> =20
> -	return tegra_drm_register_client(dev->dev_private, drm);
> +	if (tegra->domain) {
> +		gr2d->group =3D iommu_group_get(client->dev);
> +
> +		if (gr2d->group) {
> +			err =3D iommu_attach_group(tegra->domain, gr2d->group);
> +			if (err < 0) {
> +				dev_err(client->dev,
> +					"failed to attach to domain: %d\n",
> +					err);
> +				host1x_syncpt_free(client->syncpts[0]);
> +				host1x_channel_put(gr2d->channel);
> +				iommu_group_put(gr2d->group);
> +				return err;
> +			}
> +		}
> +	}

This is almost identical to the code in DC, perhaps we should factor
this out into a separate helper? Nothing that needs to be done right
now, I'll take a look at it and see if I can come up with something
good in a follow-up patch.

> +
> +	return tegra_drm_register_client(tegra, drm);
>  }
> =20
>  static int gr2d_exit(struct host1x_client *client)
>  {
>  	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
>  	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> +	struct tegra_drm *tegra =3D dev->dev_private;
>  	struct gr2d *gr2d =3D to_gr2d(drm);
>  	int err;
> =20
> -	err =3D tegra_drm_unregister_client(dev->dev_private, drm);
> +	err =3D tegra_drm_unregister_client(tegra, drm);
>  	if (err < 0)
>  		return err;
> =20
>  	host1x_syncpt_free(client->syncpts[0]);
>  	host1x_channel_put(gr2d->channel);
> =20
> +	if (gr2d->group) {
> +		iommu_detach_group(tegra->domain, gr2d->group);
> +		iommu_group_put(gr2d->group);
> +	}
> +
>  	return 0;
>  }
> =20

Thierry

--iwjEIfU64POCkTAH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsO9gACgkQ3SOs138+
s6EX3w//QTNsjY4k4OYcOmm0mBZFpaBX9xHfzfFhRxe/L4p4kdXTAJA5G+CWu2lN
drv2txO6biz1fenlXckEr8l0TGxJhDjNRvtEJkR6lDJuIe3G3EcLbzMJRc8bxUug
LNcXzAv8IT7fBMSXr1v+MKf7bTot3TBc3pdenhdUwyDTv9UbUxbxmK9ev/rMnFJj
W5ki7gnu+imY5UoK1kyeNPQj5bBdTFXMQJkMSEjnNpLrq+qZOr51ZPsMa/nJxf4j
Y8CzMH/QIldjsxQyDWiZoXbh/V6TpcNoo2VF1bvKh4sFD6v0h73kFK9VgoUmLxL4
lznysHXjj+NzRdeDff2jTlzstG4fAHHmeh2kpXaExy6XSw5VFzPV4gSnHWPxn+sQ
LB1VMFrIOhUSQsTbO5yGdvlDAicaOq+cGkdM/vcFwDFzRAZAB9gA2LKCKaxvCry0
IhWItAqcr66hcX0HtrGRTtapNmY0ViLfqafKuhqkqAJZWHOD+D/T5/BRmNEtHHZT
WszVLVYxDMs7AZXfmxzL5qYtXGfUfluoFaDwffVRTcpQy18Qql/qzuTNxzDBst0G
b6F6lbvnHgex2Gzzev2F+GoQwJhsQB7MeJIBBBtcI2EGvhp1ggVc1CWConMlJnt1
XZ/0eM5SC+cDRuQOSG+syIVPqzGwxNoFXnVtPEXWt1U8+huX39M=
=IsMP
-----END PGP SIGNATURE-----

--iwjEIfU64POCkTAH--

--===============0859223489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0859223489==--
