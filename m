From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 08:49:47 +0200
Message-ID: <20120822064947.GC28845@avionic-0098.mockup.avionic-design.de>
References: <50323513.3090606@nvidia.com>
 <50340343.1050206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50340343.1050206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 03:53:07PM -0600, Stephen Warren wrote:
> On 08/20/2012 07:01 AM, Terje Bergstr=C3=B6m wrote:
> > Hi,
> >=20
> > I've been trying to figure out the best way to bind together tegradrm
> > and nvhost. I assume that nvhost and tegradrm will live as separate
> > drivers, with tegradrm taking care of display controller, and nvhost
> > taking care of host1x and other client devices.
> >=20
> > I've identified a bumps that we need to agree on. I've included here the
> > problem and my proposal:
> >=20
> > 1) Device & driver registration
> > tegradrm registers as platform_driver, and exports ioctl's. Here we
> > already have to agree on which device the platform_driver maps to.
> > Currently it maps to host1x, but we'll need to move control of host1x to
> > nvhost driver. We'll need to pass drm_platform_init() some
> > platform_device - I propose that we create a virtual device for this.
>=20
> I don't think there's any need for a virtual device. There's one device
> in HW, and that can be represented by a single device object within the
> kernel. There's nothing then stopping that device exposing multiple
> APIs, i.e. providing host1x APIs to clients, and also instantiating the
> tegra-drm driver directly on top of the host1x device.

The problem with the host1x' platform device is that we already
associate host1x' private data with it. drm_platform_init() will
eventually override that with the struct drm_device. That's the
reason for the drm_soc patch that I've included. It basically
creates a child device of host1x that the DRM driver can bind to
in order to side-step the issue.

This isn't as hackish as it may sound because the DRM device is
essentially a virtual device and no platform device would really
be a good choice.

Thierry

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQNIELAAoJEN0jrNd/PrOhmjAP/2tqSuWVdDNnrZ+jwfLIIrwy
p8H5Q1M2OegttYMnEDBLpXwPn3buR2JnvnT3mBtH9ERNIoSaLGoUHD5PO/rAwf28
BSmosQNSIActtVfMuYRGHqSGiE4g01dmgXYIdz2IgdaLRjepXmJJUv4OgMjWK8zX
6rJUWEQVV0526GN655iPNzhZWTUm+nuqnp3gt1l7doHba8WfSwnbGWJWB9GkiA6q
cMitwYo8aNp9zGG7NQ2Q1lyjTFcUJKZFxpk+rl4B6QIgsVF6bs67Tfw0AVZGDI6a
J5RSDriOVmEU0IPYXXnwwv7+5uxfitx/aoYQsLTZbXnwnumtIbsVn6+plJYPgMLT
P1iPUVLtT94QxKKkSNSSuKadVbGllUmcxH/KFWV/ToKODFs4XrgUWYSK+OZt1x/5
B6Rm8pxkrM/wPPiPZZaW4yyQcsDYkJ/o0qf+4oFEDkKNdGx7gNLXbx1igaRf3b8C
yJV2iWxwqDZBDUGnGqW9/lMbHhzKxpTfrUoOozU34UeTz8uht4zPIhcP3ast4fi/
ObgZ7WcnNvw6bsjMWooMFSXDdp7aP8s2LPU7Ipm/aemlp+zNwH8LIQZ8Z555Y3EL
YcsSYHMqUENq9vlmHkwPgUtb7wTgY48LWeuzi/xOpo0EuVf+jlWhClV74VAAg0qf
3pdFnBHr+dtuIRc3dJ+X
=rYYB
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--
