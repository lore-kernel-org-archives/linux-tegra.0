From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 12:57:25 +0800
Message-ID: <1345525045.31608.145.camel@markz-desktop>
References: <50323513.3090606@nvidia.com>
Reply-To: <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50323513.3090606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2012-08-20 at 21:01 +0800, Terje Bergstrom wrote:
> Hi,
> 
> I've been trying to figure out the best way to bind together tegradrm
> and nvhost. I assume that nvhost and tegradrm will live as separate
> drivers, with tegradrm taking care of display controller, and nvhost
> taking care of host1x and other client devices.
> 
> I've identified a bumps that we need to agree on. I've included here the
> problem and my proposal:
> 
> 1) Device & driver registration
> tegradrm registers as platform_driver, and exports ioctl's. Here we
> already have to agree on which device the platform_driver maps to.
> Currently it maps to host1x, but we'll need to move control of host1x to
> nvhost driver. We'll need to pass drm_platform_init() some
> platform_device - I propose that we create a virtual device for this.
> 

This has been discussed several times. Indeed, we need a virtual device
for drm driver. The problem is, where do we define it? It's not a good
idea define it in dt, we all agreed with that before. Also it's not good
to define it in the code...
So, do you have any further proposal about this?

> 2) Device tree parsing
> At bootup, we need to parse only host1x node and create a device for
> that. host1x probe will need to dig into host1x to create the children.
> This is something that we'll need to implement first in the internal
> kernel. tegra-dc would get probed only after this sequence. If this is
> ok, I'll take care of this part, and adjustments to tegradrm when this
> becomes topical.
> 

I know little about host1x hardware. I wanna know does host1x have the
functionality to enum it's children? If this is true, do we still need
to define these host1x child devices in the dt? Will the 2 dc devices be
enumed and created during host1x's probe?

> We include in device tree the register addresses. Some information that
> would be needed is still clocks, clock gating behavior, power domain
> ids, mapping of client devices to channels, and mapping of sync points
> per channnel
> 
> 3) The handling of ioctl's from user space
> The ioctl's represent the needed synchronization and channel
> functionality. I'll write the necessary glue. There would be two
> categories of ioctl's:
> 
> 3a) Simple operations such as synchronization:
> 
> Wait, signal, read, etc. are exported from nvhost as public APIs, and
> tegradrm simply calls them. No big hurdle there. I already have concept
> code to do this.
> 

Hm... I think in last conference we agreed that nvhost driver will not
have it's device file, so this kind of ioctl's are going to routed to
tegra drm driver, then drm driver passes these ioctl's to nvhost driver.
Right?

> 3b) Channel operations:
> 
> tegradrm needs to have a concept of logical channel. Channel open
> creates a logical channel (/context) by calling nvhost. nvhost needs to
> know which hw is going to be used by the channel to be able to control
> power, and to map to physical channel, so that comes as a parameter in
> ioctl.
> 
> Each channel operation needs to pass the channel id, and tegradrm passes
> the calls to nvhost. Most important operation is submit, which sends a
> command buffer to nvhost's queue.
> 
> 4) Buffer management
> We already know that this is a missing part. Hopefully we can get this
> filled soon.
> 

I'm still not very clear about this part. So let me try to explain this.
Correct me if I'm wrong.
[Userspace]
Cause dma-buf has not explicit userspace apis, so we consider GEM.
Userspace programs call GEM interfaces to create/close/flink/mmap the
buffers.
Besides, by using GEM PRIME's handle to fd ioctl, userspace program is
able to convert a GEM handle to a dma-buf fd. This FD can be passed to
kernel driver so that the drivers gain the opportunity to access the
buffer.

[Kernel]
DRM driver handles GEM buffer creation. Shmfs or CMA can be used as
backing storage. Right now CMA buffer allocation is wrapped by dma
mapping apis and shmfs has it's individual APIs.
DRM driver should export this buffer as dma-buf after GEM buffer is
created. Otherwise, drm prime can't get fd from this gem buffer handle
later.

Currently I'm still confused with these problems:
1. Userspace program is able to get a dma-buf fd for a specific GEM
buffer. Is this a unique fd? I mean, can I pass this fd from one process
to another, then other processes can access the same buffer? If the
answer is yes, does this mean we don't need GEM's "flink" functionality?
If the answer is no, GEM's "flink" makes sense. 

2. How to sync buffer operations between these different frameworks? For
example, GEM has it's own buffer read/write/mmap interfaces, while
dma-buf has either. So if the userspace program does something on the
buffer via GEM apis, while a kernel driver is operating the same buffer
via dma-buf interfaces, what should we do? Because GEM and dma-buf are
different frameworks, where shall we setup a sync mechanism?

> Terje
