From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of: configure DMA for host1x devices
Date: Tue, 26 Sep 2017 13:27:03 +0200
Message-ID: <20170926112703.GE23108@ulmo>
References: <20170924090454.28116-1-mperttunen@nvidia.com>
 <20170924090454.28116-2-mperttunen@nvidia.com>
 <20170925074448.GB12494@ulmo.fritz.box>
 <dd8e9524-1d91-2c8b-a753-086d3ad9f9c9@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <dd8e9524-1d91-2c8b-a753-086d3ad9f9c9-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 01:26:46PM +0100, Robin Murphy wrote:
> On 25/09/17 08:44, Thierry Reding wrote:
> > On Sun, Sep 24, 2017 at 12:04:54PM +0300, Mikko Perttunen wrote:
> >> Devices in the host1x bus rely on the old behavior of of_dma_configure
> >> to set up DMA ops. Add a check for them into of_dma_configure.
> >>
> >> We must do the check using a string comparison instead of using
> >> pointers since the host1x bus can be compiled into a module.
> >>
> >> Fixes: 723288836628 ("of: restrict DMA configuration")
> >> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  drivers/of/device.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/of/device.c b/drivers/of/device.c
> >> index 64b710265d39..12368418cd33 100644
> >> --- a/drivers/of/device.c
> >> +++ b/drivers/of/device.c
> >> @@ -104,6 +104,9 @@ int of_dma_configure(struct device *dev, struct de=
vice_node *np)
> >>  		if (!dev_is_pci(dev) &&
> >>  #ifdef CONFIG_ARM_AMBA
> >>  		    dev->bus !=3D &amba_bustype &&
> >> +#endif
> >> +#if IS_ENABLED(CONFIG_TEGRA_HOST1X)
> >> +		    !(dev->bus && !strcmp("host1x", dev->bus->name)) &&
> >>  #endif
> >>  		    dev->bus !=3D &platform_bus_type)
> >>  			return ret =3D=3D -ENODEV ? 0 : ret;
> >=20
> > Maybe a slightly better solution would be to add a dev_is_host1x()
> > function that returns dev->bus =3D=3D &host1x_bus_type if TEGRA_HOST1X =
is
> > enabled and returns false otherwise. That way we can have a "proper"
> > check for the bus type and avoid the #if in this file.
> >=20
> > It's slightly more complicated because of the dependencies between the
> > DT and Tegra DRM trees, but I'm sure we can get Rob to either give his
> > Acked-by on the drivers/of/device.c change or carry the Tegra DRM patch
> > in the DT tree.
>=20
> Alternatively (and modulo Greg's opinion, obviously) it would arguably be
> neatest to handle this at a slightly lower level as below - I only really
> considered this idea after writing the existing fix, but now that I have
> actually written it up I do rather like it.
>=20
> Robin.
>=20
> ----->8-----
> From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> Date: Mon, 25 Sep 2017 12:45:58 +0100
> Subject: [PATCH] drivers: Flag buses which demand DMA configuration
>=20
> We do not want the common dma_configure() pathway to apply
> indiscriminately to all devices, since there are plenty of buses which
> do not have DMA capability, and if their child devices were used for
> DMA API calls it would only be indicative of a driver bug. However,
> there are a number of buses for which DMA is implicitly expected even
> when not described by firmware, so we currently whitelist those to
> automatically opt in to dma_configure(), assuming a 1:1 mapping between
> the DMA address space and the physical address space.
>=20
> Commit 723288836628 ("of: restrict DMA configuration") introduced a
> short-term fix by comparing explicit bus types, but this approach is far
> from pretty, doesn't scale well, and fails to cope at all with bus
> drivers which may be built as modules. Let's refine things by making
> that opt-in a property of the bus type, which neatly addresses those
> problems and lets the decision of whether firmware description of DMA
> capability should be optional or mandatory stay internal to the bus
> drivers themselves.
>=20
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/amba/bus.c       | 1 +
>  drivers/base/platform.c  | 1 +
>  drivers/gpu/host1x/bus.c | 1 +
>  drivers/of/device.c      | 8 +-------
>  drivers/pci/pci-driver.c | 1 +
>  include/linux/device.h   | 4 ++++
>  6 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index e0f74ddc22b7..594c228d2f02 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -195,6 +195,7 @@ struct bus_type amba_bustype =3D {
>  	.match		=3D amba_match,
>  	.uevent		=3D amba_uevent,
>  	.pm		=3D &amba_pm,
> +	.force_dma	=3D true,
>  };
> =20
>  static int __init amba_init(void)
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index d1bd99271066..9c95c8db00f8 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1142,6 +1142,7 @@ struct bus_type platform_bus_type =3D {
>  	.match		=3D platform_match,
>  	.uevent		=3D platform_uevent,
>  	.pm		=3D &platform_dev_pm_ops,
> +	.force_dma	=3D true,
>  };
>  EXPORT_SYMBOL_GPL(platform_bus_type);
> =20
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index f9cde03030fd..ed03b3243195 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -320,6 +320,7 @@ struct bus_type host1x_bus_type =3D {
>  	.name =3D "host1x",
>  	.match =3D host1x_device_match,
>  	.pm =3D &host1x_device_pm_ops,
> +	.force_dma =3D true,
>  };
> =20
>  static void __host1x_device_del(struct host1x_device *device)
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 64b710265d39..25bddf9c9fe1 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -9,9 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
> -#include <linux/pci.h>
>  #include <linux/platform_device.h>
> -#include <linux/amba/bus.h>
> =20
>  #include <asm/errno.h>
>  #include "of_private.h"
> @@ -101,11 +99,7 @@ int of_dma_configure(struct device *dev, struct devic=
e_node *np)
>  		 * DMA configuration regardless of whether "dma-ranges" is
>  		 * correctly specified or not.
>  		 */
> -		if (!dev_is_pci(dev) &&
> -#ifdef CONFIG_ARM_AMBA
> -		    dev->bus !=3D &amba_bustype &&
> -#endif
> -		    dev->bus !=3D &platform_bus_type)
> +		if (!dev->bus->force_dma)
>  			return ret =3D=3D -ENODEV ? 0 : ret;
> =20
>  		dma_addr =3D offset =3D 0;
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 11bd267fc137..38bdb97b6dc6 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1466,6 +1466,7 @@ struct bus_type pci_bus_type =3D {
>  	.drv_groups	=3D pci_drv_groups,
>  	.pm		=3D PCI_PM_OPS_PTR,
>  	.num_vf		=3D pci_bus_num_vf,
> +	.force_dma	=3D true,
>  };
>  EXPORT_SYMBOL(pci_bus_type);
> =20
> diff --git a/include/linux/device.h b/include/linux/device.h
> index c6f27207dbe8..3a1efa56e7c4 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -97,6 +97,8 @@ extern void bus_remove_file(struct bus_type *, struct b=
us_attribute *);
>   * @p:		The private data of the driver core, only the driver core can
>   *		touch this.
>   * @lock_key:	Lock class key for use by the lock validator
> + * @force_dma:	Assume devices on this bus should be set up by dma_config=
ure()
> + * 		even if DMA capability is not explicitly described by firmware.
>   *
>   * A bus is a channel between the processor and one or more devices. For=
 the
>   * purposes of the device model, all devices are connected via a bus, ev=
en if
> @@ -135,6 +137,8 @@ struct bus_type {
> =20
>  	struct subsys_private *p;
>  	struct lock_class_key lock_key;
> +
> +	bool force_dma;

Maybe force_dma_setup to clarify that we're not trying to force DMA
usage, but rather setup of DMA properties.

Either way:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnKOYcACgkQ3SOs138+
s6EK+w/4yVGK8/eXKrzC8MmeacdSggzjbgSi/0GYEk6pL/p+HatKw2h/+6WwR89B
jvj8X9mkMsJKtXDQq7KoLwLtABqIgLVjENoBkPlZzt7rN1Bl1c3i2dbcVJj5b+Rd
ykJWZl/lRbN4MAKxtD3MGdA0781EXMBcLp4PfEfIFPIjRgGKm32GINocEz+L3aft
FbmNmYj3F+JgAGDoPnb3RUrjF2FXm/l0/HFacCDW2FEvKPA4dhEYqpLsG3fT9UI3
j0NBnud/xjKm1JOCm9m7r0hvD/3CcuBfsvpVJsjA0LYkhAFsya9F/FFurRD/wog0
0PuUkcTrE6qckCRIlh8p0SlV81h+N42QXoVnWi42cO5NmJchEmSIHLCS7Hx/F12b
eCwTdTIJcLXPXukw42tkh+ldVq1IMVZWiE7VTeVK5i5tQpEs8MgnxP4avabwFYEu
znPuT74H5X0JuEPaYUfsROOQqy4OvxR7gAw3apJp0PbNDZ9ToqQi4b9WoJVh9qyX
9UYCuG4/7Pgkt2+QAFdmvpZrVKEACp1TkKmtbqQLC/IChqp1FmPinuDNWliueWjM
Q8ISP35Cu5POt9PaAKjh4c9CPIkRMDeT2Ex+Qum2R9bhrm4H363wAQledkBTLd2W
sw5zORK3Fj3IBSZswSScR8MUmamk56/D7/kyL332kpHhsgHL5A==
=yNRP
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
