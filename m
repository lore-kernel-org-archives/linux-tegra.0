From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Binding together tegradrm & nvhost
Date: Mon, 20 Aug 2012 16:01:07 +0300
Message-ID: <50323513.3090606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I've been trying to figure out the best way to bind together tegradrm
and nvhost. I assume that nvhost and tegradrm will live as separate
drivers, with tegradrm taking care of display controller, and nvhost
taking care of host1x and other client devices.

I've identified a bumps that we need to agree on. I've included here the
problem and my proposal:

1) Device & driver registration
tegradrm registers as platform_driver, and exports ioctl's. Here we
already have to agree on which device the platform_driver maps to.
Currently it maps to host1x, but we'll need to move control of host1x to
nvhost driver. We'll need to pass drm_platform_init() some
platform_device - I propose that we create a virtual device for this.

2) Device tree parsing
At bootup, we need to parse only host1x node and create a device for
that. host1x probe will need to dig into host1x to create the children.
This is something that we'll need to implement first in the internal
kernel. tegra-dc would get probed only after this sequence. If this is
ok, I'll take care of this part, and adjustments to tegradrm when this
becomes topical.

We include in device tree the register addresses. Some information that
would be needed is still clocks, clock gating behavior, power domain
ids, mapping of client devices to channels, and mapping of sync points
per channnel

3) The handling of ioctl's from user space
The ioctl's represent the needed synchronization and channel
functionality. I'll write the necessary glue. There would be two
categories of ioctl's:

3a) Simple operations such as synchronization:

Wait, signal, read, etc. are exported from nvhost as public APIs, and
tegradrm simply calls them. No big hurdle there. I already have concept
code to do this.

3b) Channel operations:

tegradrm needs to have a concept of logical channel. Channel open
creates a logical channel (/context) by calling nvhost. nvhost needs to
know which hw is going to be used by the channel to be able to control
power, and to map to physical channel, so that comes as a parameter in
ioctl.

Each channel operation needs to pass the channel id, and tegradrm passes
the calls to nvhost. Most important operation is submit, which sends a
command buffer to nvhost's queue.

4) Buffer management
We already know that this is a missing part. Hopefully we can get this
filled soon.

Terje
