From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 15:41:22 +0200
Message-ID: <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9B291.2020305@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE9B291.2020305-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m wrote:
> On 26.06.2012 13:55, Thierry Reding wrote:
>=20
> > 	host1x {
> > 		compatible =3D "nvidia,tegra20-host1x", "simple-bus";
> > 		reg =3D <0x50000000 0x00024000>;
> > 		interrupts =3D <0 64 0x04   /* cop syncpt */
> > 			      0 65 0x04   /* mpcore syncpt */
> > 			      0 66 0x04   /* cop general */
> > 			      0 67 0x04>; /* mpcore general */
>=20
>=20
> We're only interested in interrupts 65 and 67. The COP interrupts are
> not routed to CPU. I guess we could just delete those lines here.

I remember you mentioned that before. I'll drop them.

> >=20
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> >=20
> > 		ranges =3D <0x54000000 0x54000000 0x04000000>;
>=20
>=20
> I'm a newbie on device trees, so I need to ask. Why isn't host1x
> register space covered by "ranges" property?

The ranges property defines the memory aperture that is forwarded to the
children.

> > 		status =3D "disabled";
> >=20
> > 		gart =3D <&gart>;
> >=20
> > 		/* video-encoding/decoding */
> > 		mpe {
> > 			reg =3D <0x54040000 0x00040000>;
> > 			interrupts =3D <0 68 0x04>;
> > 			status =3D "disabled";
> > 		};
>=20
>=20
> The client device interrupts are not very interesting, so they could be
> left out, too. Display controller related are probably an exception to th=
is.

If the interrupts aren't used at all we should drop them.

> (...)
>=20
> Otherwise the proposal looked good.
>=20
> We also assign certain host1x common resources per device by convention,
> f.ex. sync points, channels etc. We currently encode that information in
> the device node (3D uses sync point number X, 2D uses numbers Y and Z).
> The information is not actually describing hardware, as it just
> describes the convention, so I'm not sure if device tree is the proper
> place for it.

Are they configurable? If so I think we should provide for them being
specified in the device tree. They are still hardware resources being
assigned to devices.

> > An alternative would be to call of_platform_populate() from the host1x
> > driver. This has the advantage that it could integrate better with the
> > host1x bus implementation that Terje is working on, but it also needs
> > additional code to tear down the devices when the host1x driver is
> > unloaded because a module reload would try to create duplicate devices
> > otherwise.
>=20
>=20
> Yes, we already have a bus_type for nvhost, and we have nvhost_device
> and nvhost_driver that device from device and device_driver
> respectively. They all accommodate some host1x client device common
> behavior and data that we need to store. We use the bus_type also to
> match each device and driver together, but the matching is version
> sensitive. For example, Tegra2 3D needs different driver than Tegra3 3D.

We'll have to figure out the best place to put this driver. The driver
will need some code to instantiate its children from the DT and fill the
nvhost_device structures with the data parsed from it.

BTW, what's the reason for calling it nvhost and not host1x?

> > Perhaps the ranges property can also be used to remap the reg properties
> > of the child nodes so that they can be specified as an offset into the
> > host1x aperture instead of an address in the CPU address space. But
> > that's just a minor issue because the OF code should be able to handle
> > it transparently.
>=20
>=20
> Either way is fine for me. The full addresses are more familiar to me as
> we tend to use them internally.

Using the OF mechanism for translating the host1x bus addresses,
relative to the host1x base address, to CPU addresses seems "purer", but
either way should work fine.

> > Basically this turns on the first display controller and the RGB/LVDS
> > output and hooks up a static EDID block with the LVDS output. There is
> > also a carveout property which might be a better replacement for the
> > "crippled" GART on Tegra20. Alternatively the CMA might work just as
> > well instead.
>=20
>=20
> We use carveout for Tegra2. Memory management is a big question mark
> still for tegradrm that I'm trying to find a solution for.

AIUI CMA is one particular implementation of the carveout concept, so I
think we should use it, or extend it if it doesn't suit us.

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6bwCAAoJEN0jrNd/PrOhUQMP/3JADffXvgEhc+Alo+Y0UmmA
8qTIuMIBHXXSPhyN5KjgJ5IQSbJesUv/8t0fyoIKGjIE9O9LP/tsSWwtQERykCIg
u0QrGRoHI4i/W6QI2ORdoRnqOIJr3TlO11ZBBXFpd5E3Vn4mJjLQT61SFS+OhCDT
hPDx3lYNWGnAh0s7HKrkvkgcytqvh+4pGmSLrKz6+Gh8v0hRJtt+6GvHb1UG0xS7
z/khBbjEBLqQJ4TK5H840DTqSZY1rn6Y6KJYQ4no95K6Yg51TObAruGaXbaE6cxj
ADJZwU7dDNX+0/hV0xWWRoFwl2HeXYeOUtDEcT9Ie3ZdOS5lLe8l94+RU0FOM8Wz
Xa214rOyvLYmDtTiTm/hSdfx20M9pvYIeCk++L3m5zgUnNJGvYwydmjpOR2Kna5v
8vNhjamKeHLL0z92eVWh9RvYNhADG49sQmC7O06Ydv3umHhnVdFKEkdjuwnJFhpW
nxhVgTBeEqzUhdjJp6RUn5FJtzB+E75Sl2RF1Lbawarp8gwPEZZYGFCULDLRkVdo
sraKB5P1PwmCYcqc2QQ2/jg8qUTCblhPM31WipPb5JfjzT7WaE4UqlAjNzY0WhzZ
BcKri0X6+yFbgI/ZIXj08UC3Bptv3G99+NLvFVYPeDg9TufDCb4uAuwRGj8S5x7H
PZGm2t/9mgj02ZHMPxVG
=pWS0
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
