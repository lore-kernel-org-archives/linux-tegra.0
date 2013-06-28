From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: binding for nvec mfd device
Date: Fri, 28 Jun 2013 20:51:03 +0200
Message-ID: <20130628185102.GB15416@manwe>
References: <1690589.tt8Uan1NDT@ax5200p>
 <51CDA822.3090005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51CDA822.3090005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 09:13:38AM -0600, Stephen Warren wrote:
> On 06/27/2013 12:26 PM, Marc Dietrich wrote:
[...]
> > Another question is how the children will get their platform data. I gu=
ess=20
> > they will just walk the device tree of their parent node and search for=
 it,=20
> > but maybe there is a better way?
>=20
> In option (a), there will be a separate struct device for each child
> node, instantiated directly from the child DT node. Hence, the driver
> (chosen from the compatible value just like any other) would simply
> parse dev.of_node just like any other driver. The only difference would
> be that the driver would have to go to the parent node, and search for a
> driver for it, and ask that driver for any "supporting resources", such
> as a device handle that allowed you to all APIs to send/receive bytes
> over the protocol. Perhaps the parent device might just pre-create
> regmaps for all the child devices if that abstraction works. That would
> save the child devices even having to look for the parent device.

I've often seen a much easier method employed and something similar is
also done in host1x/tegra-drm. Child devices directly pass dev->parent
to some API provided by the parent. The API then takes care of checking
and extracting the driver-specific data of the parent from the struct
device before performing the operation. Or you could provide an API to
cast from a struct device to the parent's type.

So in the specific case of nvec this would translate to either making
the nvec_write_{sync,async}() functions take a struct device * instead
of the struct nvec_chip as first parameter, then do something like:

	struct nvec_chip *nvec =3D dev_get_drvdata(dev);

Or provide a function such as this:

	struct nvec_chip *nvec_chip_from_device(struct device *dev)
	{
		/* perhaps do some validation */
		return dev_get_drvdata(dev);
	}

which can be called from child drivers before calling nvec_write_sync()
or nvec_write_async().

Thierry

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzdsWAAoJEN0jrNd/PrOheBEP/2M5CvudNEtqM7dNNIOxm5zP
ks4qwhJrifi2DzSvrB70+TxQJavGQCzLDKB3bSbh5sY/+4xcN1XB/V8yHCbzIfJk
UPLLIjm99cZQrAURTnPy/TigxDLXj0WwMUUDU1NrPA3lYYZ4wOwjIsE/+ZmVpeNm
VE9KVKmgUaaOmFJgX1jz+CjbbIiIOXKZ2Km/+IffISsXd32GP1kz7O01zDAb1KWx
7z3HsFSuJOfKQEUVvroat1x2OgAGAh8KSqeG/XTlvsHR6k+ct3L+mMseE87g5wNK
OWhI1HBWHthSK6Iz9Xaptap7B2zy2Wn2jqkVlMh5i5OplvLXYY3/Kv/0Ude4gk2K
x2U0V6UZL2inQoWWm6amjrIw861TKRkoJz2HPG4wW+v8mDKzjqX2GVlccElgzh+/
J6Op+POFuljkwuy4cg+V/e2+9Z9NAWER3td/cEDkVGUpT+QOmoRQKHyH9HqnPyUa
1gSiOlub/9RrHCr98E8iQ6VSvamAzhWHG564o34x7q3vZux6HYw9mAfkJuUbWBGA
5YDmEhlpHlR0Mtfqm89pv/BwGSuXgX/mfy2SXF5649oM3T6Mock1CNDDt9acqMW3
nN1kpe2euH+uCKy2TFqG04uBYz/ECge6Y8s0sqL4XOd8iThKO57L1F4d/VbX8Reg
Dh/AxXaaKpMcWStc81+u
=xSto
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
