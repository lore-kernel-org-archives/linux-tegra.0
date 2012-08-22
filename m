From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Wed, 22 Aug 2012 07:54:27 +0200
Message-ID: <20120822055427.GB28845@avionic-0098.mockup.avionic-design.de>
References: <50323513.3090606@nvidia.com>
 <1345525045.31608.145.camel@markz-desktop>
 <50331F32.4040903@nvidia.com>
 <1345529528.31608.165.camel@markz-desktop>
 <50332C22.7090009@nvidia.com>
 <50340445.6010908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50340445.6010908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 03:57:25PM -0600, Stephen Warren wrote:
> On 08/21/2012 12:35 AM, Terje Bergstr=C3=B6m wrote:
> > On 21.08.2012 09:12, Mark Zhang wrote:
> >> OK, thank you. In current version, all devices are created by
> >> "of_platform_populate" in board init function. So if we still need to
> >> define devices in dt, what's the benefit that we put these device
> >> creation works into host1x's probe function? I don't see any difference
> >> although create device in host1x probe() sounds more reasonable...
> >=20
> > Until I have managed to integrate nvhost to tegradrm, the devices
> > creation should be done as it is done now. With nvhost, we will need
> > extra data per device, so we'll need to create the devices in nvhost.
>=20
> I don't believe that has any impact on how the devices need to be created.
>=20
> Both the following should be equally workable:
>=20
> a)
>=20
> * Each device gets instantiated as a platform device through simple
> of_platform_populate.
>=20
> * Each driver parses the device node for any information needed by a
> host1x client. This parsing could be implemented via a helper function.
>=20
> The driver can then register the device with host1x, passing in the
> host1x-client-information parsed from DT.
>=20
> b)
>=20
> * host1x driver enumerates all the clients (sub-nodes) manually.
>=20
> * As part of the enumeration, the host1x driver parses information from
> the client nodes in order to create the device.
>=20
> * Drivers for host1x devices get probed based on the devices created in
> the previous step.
>=20
> (a) sounds a heck of a lot simpler, because we don't end up creating a
> new bus types etc., which in previous conversations you'd mentioned
> ended up duplicating a lot of the logic already in the platform bus drive=
r.

The former is what I've implemented in the latest series. host1x will
obviously be probed before any of the child devices because it is their
parent. Client drivers rely on the parent-child relationship to obtain a
reference to the host1x and register themselves with a call to the
host1x_register_client() function. Each struct host1x_client is required
to have some fields prefilled by the driver, like .ops or .dev. An extra
field for the channel can easily be added. I think we previously agreed
that sync points could be allocated on an as-needed basis, so that
assignment can happen in host1x_register_client().

I find this implementation very lightweight and it is very close to how
other subsystems (input, fb, I2C, SPI, ...) work. And after all, host1x
isn't anything else than a small subsystem.

Thierry

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQNHQTAAoJEN0jrNd/PrOhvxcP/RhMXnZVSzvVDAuzmdQZOIEc
DH8TPBD8zjqDG310uoYj8jwJfHiUjVYWe86pXyc6+LYjrZUmB/ri3X3jmTUj3QEW
RR2mqqlyYohTD/uQPAb9e+Qwj/dPJbGE2B69Yh2UkNVkepP8ScrteUriAK4rhUhr
OCgzM6ywxlX27kPBb6DjlQN0DBVUQ3jZ3iE48nUsqut6WrS8NQlQ1keaMysYKaz6
IxOfbb53vYvtgCqSSjQX9zflQcJz5z3GSvxgEsDH2QEmSfr5GcnNyJsfUXvFeoTy
Bt7dApZynIYYJsfXyW5BX3zVVEab4jaltDrDfshoPTRYQbbp2d6AlIo0+vhHXWCu
Yptk2rzEWk3ACQp2dgofd3nmsED4za4lgi2bAsTYin4rQ7KgZEgFQlsd+tX8lfU6
o0LQ70Iuj94uEnxhp1NNzEi+/237pfuFPiTCkPMZ4sM/n6xJvoFkvJD29TDpNwJ+
GbqikZTrOArP/7gOyhCkpgDajpmMfc4F3QRyPEoOaQRZEpi4/uJiy/9yzBo8C402
TjYyENq1OjUAHXbPQhbDc3fa7BDCu18I62vdncUONPtXgf2RW8VEPvJ5EYcdZKyG
yQRs6AZJNtyr45yWpgqYRIPdrKh1ux9BPr7OVFaVSNR2K18L7dk+5zg9eSBvUOyt
lHgTisJ4oZDqnakCFZj3
=D20Z
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
