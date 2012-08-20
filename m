From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Mon, 20 Aug 2012 15:18:01 +0200
Message-ID: <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
References: <50323513.3090606@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50323513.3090606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2012 at 04:01:07PM +0300, Terje Bergstr=C3=B6m wrote:
> Hi,
>=20
> I've been trying to figure out the best way to bind together tegradrm
> and nvhost. I assume that nvhost and tegradrm will live as separate
> drivers, with tegradrm taking care of display controller, and nvhost
> taking care of host1x and other client devices.
>=20
> I've identified a bumps that we need to agree on. I've included here the
> problem and my proposal:
>=20
> 1) Device & driver registration
> tegradrm registers as platform_driver, and exports ioctl's. Here we
> already have to agree on which device the platform_driver maps to.
> Currently it maps to host1x, but we'll need to move control of host1x to
> nvhost driver. We'll need to pass drm_platform_init() some
> platform_device - I propose that we create a virtual device for this.
>=20
> 2) Device tree parsing
> At bootup, we need to parse only host1x node and create a device for
> that. host1x probe will need to dig into host1x to create the children.
> This is something that we'll need to implement first in the internal
> kernel. tegra-dc would get probed only after this sequence. If this is
> ok, I'll take care of this part, and adjustments to tegradrm when this
> becomes topical.

I have a new patch series that takes care of these two steps. Mark sent
some patches for Tegra30 and HDMI on top of the older series that I need
to merge with what I have. Maybe I'll decide to send the series out
without the patches merged, depending on how much time I'll get or how
much effort it requires. I had hoped the next series would have working
HDMI support, which is why I waited.

Basically what I have is a very rudimentary driver for host1x, which
waits for some of the subdevices to be registered and then creates a
dummy device against which the Tegra DRM driver can bind. It's not quite
what you proposed above, but very similar.

For now I've also put the host1x driver in the same directory as the
Tegra DRM because there are no other users. We may want to change that
at some point.

> We include in device tree the register addresses. Some information that
> would be needed is still clocks, clock gating behavior, power domain
> ids, mapping of client devices to channels, and mapping of sync points
> per channnel
>=20
> 3) The handling of ioctl's from user space
> The ioctl's represent the needed synchronization and channel
> functionality. I'll write the necessary glue. There would be two
> categories of ioctl's:
>=20
> 3a) Simple operations such as synchronization:
>=20
> Wait, signal, read, etc. are exported from nvhost as public APIs, and
> tegradrm simply calls them. No big hurdle there. I already have concept
> code to do this.
>=20
> 3b) Channel operations:
>=20
> tegradrm needs to have a concept of logical channel. Channel open
> creates a logical channel (/context) by calling nvhost. nvhost needs to
> know which hw is going to be used by the channel to be able to control
> power, and to map to physical channel, so that comes as a parameter in
> ioctl.
>=20
> Each channel operation needs to pass the channel id, and tegradrm passes
> the calls to nvhost. Most important operation is submit, which sends a
> command buffer to nvhost's queue.

Some thought will probably have to go into these. The easiest would
probably be to have a driver that needs to do synchronization or other
channel operations. It may make the requirements on the exact ioctls
clearer.

> 4) Buffer management
> We already know that this is a missing part. Hopefully we can get this
> filled soon.

This should be cheap if we use GEM along with DMA-BUF. However without
other drivers that the buffers can be shared with this won't do us any
good. So maybe something like a video capturing driver for Tegra should
be added first so we can actually test buffer sharing.

>=20
> Terje
>=20

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQMjkIAAoJEN0jrNd/PrOhhooP/03mANhuVtFAP5+Q/glAuFa5
+HAVn0ft21k32GITmu3F4HcxVTLNSn6+LGyOFPcl008J7mzhfwsIhtLaZ8G2TwfA
IBtewSI+pKCwhrX9G185sR7FkX48wQqBkT7zNiMXbfNGtHGA45FRhvLdyOW5ycdF
QGAHqp6+cQi8BaW3OYHhbqBAjlzcJhens1q6hEPV6+fiPmIRqfVNd/YRXw0KWWVw
Va73nwdZUjLT0sLCmYIgFXktvzOJV6HJW6+/N9MbK511N72D1JGhELzmXgUC0/4+
BUTcMLSg6vrd6SintcqjR2pzmiYugAKlz4fPraSOW/k2/3PzceruQFjN1xQdIDH/
LRdRAYpW3MQRYGWPA3p/auRWg/3anTH+MumSCmktvJCUQuvC3ft+8mkeToQNHfsg
foRMN3Vpf1m7w+y1CA6m9b/78xx2sZSJb95qzazScrkaoOV3MOWQwd7s7kS5RFMO
Q/+u1r2UGT33dHqWmmtadLGhVQ3uIg7DTj+yNO+57LLOn5TrW9KMIuJab7UIdrvZ
/f+RmiMo7uC4ipliWWrkwd5x41Tz2C+UFSPxCSHkpAMEzMr0DUTqeGOB6HKaC5KC
CUZtDt9Tj1d/yltp4a/VDtdNIPH2p0BKkYOFvOqX5yw91djI+QxIbRCsfxip+x3K
UxU3TCHiLZkFZKEusEQE
=TsdK
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
