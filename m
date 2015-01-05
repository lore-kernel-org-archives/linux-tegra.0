From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] gpu: host1x: Provide a proper struct bus_type
Date: Mon, 5 Jan 2015 15:49:43 +0100
Message-ID: <20150105144941.GE12010@ulmo.nvidia.com>
References: <1419002698-4963-1-git-send-email-thierry.reding@gmail.com>
 <1419002698-4963-4-git-send-email-thierry.reding@gmail.com>
 <54991A0C.4050203@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54991A0C.4050203-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2014 at 03:30:20PM +0800, Mark Zhang wrote:
> On 12/19/2014 11:24 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Previously the struct bus_type exported by the host1x infrastructure was
> > only a very basic skeleton. Turn that implementation into a more full-
> > fledged bus to support proper probe ordering and power management.
> >=20
> > Note that the bus infrastructure needs to be available before any of the
> > drivers can be registered, so the bus needs to be registered before the
> > host1x module. Otherwise drivers could be registered before the module
> > is loaded and trigger a BUG_ON() in driver_register(). To ensure the bus
> > infrastructure is always there, always build the code into the kernel
> > when enabled and register it with a postcore initcall.
> >=20
>=20
> So this means there is no chance that host1x can be built as a kernel
> module, right? I'm fine with that, just asking.

No, it means that not all of host1x can be built as a module. The host1x
bus infrastructure will always be built-in when TEGRA_HOST1X is enabled.

> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> [...]
> > diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> > index c1189f004441..a3e667a1b6f5 100644
> > --- a/drivers/gpu/host1x/Makefile
> > +++ b/drivers/gpu/host1x/Makefile
> > @@ -1,5 +1,4 @@
> >  host1x-y =3D \
> > -	bus.o \
> >  	syncpt.o \
> >  	dev.o \
> >  	intr.o \
> > @@ -13,3 +12,5 @@ host1x-y =3D \
> >  	hw/host1x04.o
> > =20
> >  obj-$(CONFIG_TEGRA_HOST1X) +=3D host1x.o
> > +
> > +obj-y +=3D bus.o
>=20
> I didn't get it, why we need to do this?

If CONFIG_TEGRA_HOST1X=3Dm, then obj-$(CONFIG_TEGRA_HOST1X) builds the
bus.o into a module. But we want it to always be built-in. The build
system will descend into the drivers/gpu/host1x directory only if the
TEGRA_HOST1X symbol is selected (either =3Dy or =3Dm), therefore obj-y here
will result in bus.o being built-in whether the rest of host1x is built
as a module or built-in.

> > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > index 0b52f0ea8871..28630a5e9397 100644
> > --- a/drivers/gpu/host1x/bus.c
> > +++ b/drivers/gpu/host1x/bus.c
> > @@ -72,13 +72,14 @@ static void host1x_subdev_del(struct host1x_subdev =
*subdev)
> [...]
> > =20
> >  static inline struct host1x_device *to_host1x_device(struct device *de=
v)
> >=20
>=20
> The change looks good to me. Just one thing I feel not comfortable:
> "struct host1x_device" is not a real device, it represents the drm
> device actually. The real tegra host1x device is represented by "struct
> host1x". But the name "host1x_device" makes people confusing, I mean, it
> will make people thinking it's the real "tegra host1x" device then bring
> the reading difficulty.

The reason behind that name is that host1x provides a bus (real to some
degree, but also virtual). host1x is the device that provides the bus
whereas a host1x_device is a "device" on the "host1x" bus. That's just
like an i2c_client is a "client" on the "I2C" bus. Or an spi_device is a
"device" on the "SPI" bus.

> Why don't we change this to something like "drm_device" or
> "tegra_drm_device"?

Other devices can be host1x devices. Some time ago work was being done
on a driver for the CSI/VI hardware (for camera or video input). The
idea was that it would also be instantiated as a host1x_device in some
other subsystem (V4L2 at the time).

The functionality here is generic and in no way DRM specific.

Thierry

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUqqSFAAoJEN0jrNd/PrOh6hcQALhHbNGN1Z4O4goXGV+UkCIy
FwhjwQT3YzY0W2DPWWDhMwe0EWEq83CsLAEB+2bRkKX6lV7A84oN3NISukJVcCMi
06R4zvTePrUNZJppIhS4RAnvYZCrjjaqUWUazVN4ZClmcLstIGs2kMT+D7/Cf0dc
07X3s7QTvmGj9YAj7zX84LW9HUwTb4ofODbF5l98HlGMGxgEjTJ9pt6pJ/odYY4f
RBdTwjSwm2VQzFtbNS1DW/tlT/9BdrJKI4P90WSASdPwysojIb+d3ohn4vGTqNkR
XzQm2gTxyx+0EP0g5m9E7Fr+AIeVNMheJnxpVLe+Gj6x6cuF7b7BrPxLH6InEiRV
0jCMuhIPuMy9lL8yrr/cEiFuT+bN/9hn2Ez4HYNUQZr6wruqzOYUkDSxIucgOmGy
oMYsyIEp++7rWXQ5wpHUr02dp2vIE5FgOBJ6fN9DZn3ysXKMEg+xk8r0EfHH1KZL
r0TULKgh/ZCW3z/ycXB69hTP3/FXWRyLfu+ctvp8BzNCTsmnoenzbdEUEN4brT+z
6glaiDkCsqQCAwqTac9utkETsPJqCdCQz3Xqub1gqIdHXzngIlTDEqBmyPc2T9VN
5LGKyKcPnaa5OKdMqLRFWuuNsZCj8WO/QSHtrjiNGAF3ZqY/Y6xXakc8TjkecRpy
ZxWTupc/FZRulh4M/0ll
=wL7A
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
