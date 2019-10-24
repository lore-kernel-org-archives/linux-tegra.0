From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Date: Thu, 24 Oct 2019 13:50:16 +0200
Message-ID: <20191024115016.GA2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:37:41PM +0300, Dmitry Osipenko wrote:
> On ARM32 we don't want any of the clients device to be backed by the
> implicit domain, simply because we can't afford such a waste on older
> Tegra SoCs that have very few domains available in total. The recent IOMMU
> support addition for the Video Decoder hardware uncovered the problem
> that an unfortunate drivers probe order results in the DRM driver probe
> failure if CONFIG_ARM_DMA_USE_IOMMU=3Dy due to a shortage of IOMMU domains
> caused by the implicit backing. The host1x_client_register() is a common
> function that is invoked by all of the relevant DRM drivers during theirs
> probe and hence it is convenient to remove the implicit backing there,
> resolving the problem.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I don't really want to do this in a central place like this. If we
really do need this, why can't we do it in the individual drivers? Also,
we already call host1x_client_iommu_attach() from all the drivers and
that detaches from the IOMMU as well. So I'm not sure I understand why
this is needed.

Thierry

>=20
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 742aa9ff21b8..559df3974afb 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -14,6 +14,10 @@
>  #include "bus.h"
>  #include "dev.h"
> =20
> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> +#include <asm/dma-iommu.h>
> +#endif
> +
>  static DEFINE_MUTEX(clients_lock);
>  static LIST_HEAD(clients);
> =20
> @@ -710,6 +714,21 @@ int host1x_client_register(struct host1x_client *cli=
ent)
>  	struct host1x *host1x;
>  	int err;
> =20
> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> +	/*
> +	 * The client's driver could be backed by implicit IOMMU mapping
> +	 * and we don't want to have that because all of current Tegra
> +	 * drivers are managing IOMMU by themselves. This is a convenient
> +	 * place for unmapping of the implicit mapping because this function
> +	 * is called by all host1x drivers during theirs probe.
> +	 */
> +	if (client->dev->archdata.mapping) {
> +		struct dma_iommu_mapping *mapping =3D
> +			to_dma_iommu_mapping(client->dev);
> +		arm_iommu_detach_device(client->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +#endif
>  	mutex_lock(&devices_lock);
> =20
>  	list_for_each_entry(host1x, &devices, list) {
> --=20
> 2.22.0
>=20

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xj/UACgkQ3SOs138+
s6HkpA//YOpfeYtP6xh+CQ5j2ZbD2rIvdDo20CunZvL5l67FbNp+cPfNZ5Pi6oZ2
dkOn/d+D9+xSOA5ix6QA4/wz2wb0mzpw/FKv45y09hWl9znqrdB6SNiZPXIewFp7
/CPbN/7MsZOA/s8VO2oJV/iDXjp7RHMXQANRe2myanv/PMcP9MNNtv192rQoevkS
Co1WCPbmJjeGIe0Cv+nBtqc53+YW6zb4vNKzLQ9l3aE6AZW61C3rS65y0bhdqCYh
yYr7Rfd3lagKZbBoLShqMDijO/OntWsoPb2aqHOfJrRwYEzrgquhfkGyzxEYlOZz
O9eAxL0bO8R9hswcUAh2pNyYqpWDPA/97JffHDV71xvyQUzqgSACi0+3p1mQrVfz
6sCx8c0pJ3OesuZIQBWjdyNAgJXoKeGTlg/GKO2U2uu2PBbqQLRtagQnwkL+VJ4b
YD8OWcrtwjcFWxsqYesZecAi359jdNWsvtnaJxbyFtsXPmldBq7u8/aKskbCSfDZ
GgvaJlk9BTRYeU7gGVS30s4gY0SIwNmt5oDQ3VzaEGuwHDDzdt8+JMT97LmfDq5S
mFD7sDlfoGAAI8TQBaqFVP3lJ0n65bN24Nye1z9zDE13Yb+mmylyB7wsXw2J/JZr
N6PjGf93wqnopXfUpDU7r+CoC/VOLHuou6CNipxhKA+bbslRKrk=
=/3Lb
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
