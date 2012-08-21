From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 13:39:21 +0800
Message-ID: <1345527561.31608.152.camel@markz-desktop>
References: <50323513.3090606@nvidia.com>
	 <20120820131800.GA13785@avionic-0098.mockup.avionic-design.de>
Reply-To: <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120820131800.GA13785-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-08-20 at 21:18 +0800, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Aug 20, 2012 at 04:01:07PM +0300, Terje Bergstr=C3=B6m wrote:
> > Hi,
> >=20
> > I've been trying to figure out the best way to bind together tegrad=
rm
> > and nvhost. I assume that nvhost and tegradrm will live as separate
> > drivers, with tegradrm taking care of display controller, and nvhos=
t
> > taking care of host1x and other client devices.
> >=20
> > I've identified a bumps that we need to agree on. I've included her=
e the
> > problem and my proposal:
> >=20
> > 1) Device & driver registration
> > tegradrm registers as platform_driver, and exports ioctl's. Here we
> > already have to agree on which device the platform_driver maps to.
> > Currently it maps to host1x, but we'll need to move control of host=
1x to
> > nvhost driver. We'll need to pass drm_platform_init() some
> > platform_device - I propose that we create a virtual device for thi=
s.
> >=20
> > 2) Device tree parsing
> > At bootup, we need to parse only host1x node and create a device fo=
r
> > that. host1x probe will need to dig into host1x to create the child=
ren.
> > This is something that we'll need to implement first in the interna=
l
> > kernel. tegra-dc would get probed only after this sequence. If this=
 is
> > ok, I'll take care of this part, and adjustments to tegradrm when t=
his
> > becomes topical.
>=20
> I have a new patch series that takes care of these two steps. Mark se=
nt
> some patches for Tegra30 and HDMI on top of the older series that I n=
eed
> to merge with what I have. Maybe I'll decide to send the series out
> without the patches merged, depending on how much time I'll get or ho=
w
> much effort it requires. I had hoped the next series would have worki=
ng
> HDMI support, which is why I waited.

OK. So I'm going to pause the patch writing right now and wait for your
codes to be published on linux-tegra. Regardless of whether my patches
be merged into yours, I'll provide patches for the version which you
send to maillist in the near future.

>=20
> Basically what I have is a very rudimentary driver for host1x, which
> waits for some of the subdevices to be registered and then creates a
> dummy device against which the Tegra DRM driver can bind. It's not qu=
ite
> what you proposed above, but very similar.
>=20
> For now I've also put the host1x driver in the same directory as the
> Tegra DRM because there are no other users. We may want to change tha=
t
> at some point.
>=20
> > We include in device tree the register addresses. Some information =
that
> > would be needed is still clocks, clock gating behavior, power domai=
n
> > ids, mapping of client devices to channels, and mapping of sync poi=
nts
> > per channnel
> >=20
> > 3) The handling of ioctl's from user space
> > The ioctl's represent the needed synchronization and channel
> > functionality. I'll write the necessary glue. There would be two
> > categories of ioctl's:
> >=20
> > 3a) Simple operations such as synchronization:
> >=20
> > Wait, signal, read, etc. are exported from nvhost as public APIs, a=
nd
> > tegradrm simply calls them. No big hurdle there. I already have con=
cept
> > code to do this.
> >=20
> > 3b) Channel operations:
> >=20
> > tegradrm needs to have a concept of logical channel. Channel open
> > creates a logical channel (/context) by calling nvhost. nvhost need=
s to
> > know which hw is going to be used by the channel to be able to cont=
rol
> > power, and to map to physical channel, so that comes as a parameter=
 in
> > ioctl.
> >=20
> > Each channel operation needs to pass the channel id, and tegradrm p=
asses
> > the calls to nvhost. Most important operation is submit, which send=
s a
> > command buffer to nvhost's queue.
>=20
> Some thought will probably have to go into these. The easiest would
> probably be to have a driver that needs to do synchronization or othe=
r
> channel operations. It may make the requirements on the exact ioctls
> clearer.
>=20
> > 4) Buffer management
> > We already know that this is a missing part. Hopefully we can get t=
his
> > filled soon.
>=20
> This should be cheap if we use GEM along with DMA-BUF. However withou=
t
> other drivers that the buffers can be shared with this won't do us an=
y
> good. So maybe something like a video capturing driver for Tegra shou=
ld
> be added first so we can actually test buffer sharing.
>=20
> >=20
> > Terje
> >=20
>=20
> * Unknown Key
> * 0x7F3EB3A1
