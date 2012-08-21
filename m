From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 08:40:02 +0300
Message-ID: <50331F32.4040903@nvidia.com>
References: <50323513.3090606@nvidia.com> <1345525045.31608.145.camel@markz-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345525045.31608.145.camel@markz-desktop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.08.2012 07:57, Mark Zhang wrote:
> On Mon, 2012-08-20 at 21:01 +0800, Terje Bergstrom wrote:
>> I propose that we create a virtual device for this.
> This has been discussed several times. Indeed, we need a virtual device
> for drm driver. The problem is, where do we define it? It's not a good
> idea define it in dt, we all agreed with that before. Also it's not good
> to define it in the code...
> So, do you have any further proposal about this?

Let's see what Thierry came up with once he gets the code up. It seems
he solved this somehow.

> I know little about host1x hardware. I wanna know does host1x have the
> functionality to enum it's children? If this is true, do we still need
> to define these host1x child devices in the dt? Will the 2 dc devices be
> enumed and created during host1x's probe?

No, host1x doesn't have any probing functionality. Everything must be
known by software beforehand.

The dc devices can be created in host1x probe the same time as the rest.
I checked exynos driver and it seems to create the subdevices/drivers at
drm load callback. I don't know if it matters whether it's done in load
or probe phase.

> Hm... I think in last conference we agreed that nvhost driver will not
> have it's device file, so this kind of ioctl's are going to routed to
> tegra drm driver, then drm driver passes these ioctl's to nvhost driver.
> Right?

Yes, nvhost will export in-kernel API so that tegradrm can call nvhost
to implement the functionality. tegradrm will handle all ioctl related
infra, and nvhost will handle the hardware interaction.

nvhost has in our own kernel variant also ioctl API, but that won't
exist in upstream version.

> I'm still not very clear about this part. So let me try to explain this.
> Correct me if I'm wrong.
> [Userspace]
> Cause dma-buf has not explicit userspace apis, so we consider GEM.
> Userspace programs call GEM interfaces to create/close/flink/mmap the
> buffers.
> Besides, by using GEM PRIME's handle to fd ioctl, userspace program is
> able to convert a GEM handle to a dma-buf fd. This FD can be passed to
> kernel driver so that the drivers gain the opportunity to access the
> buffer.

Yes, correct. We can (naively) consider GEM being the API towards user
space, and dma-buf as the kernel side implementation. We can consider if
we need to implement GEM flink(), though. Please see below why.

> [Kernel]
> DRM driver handles GEM buffer creation. Shmfs or CMA can be used as
> backing storage. Right now CMA buffer allocation is wrapped by dma
> mapping apis and shmfs has it's individual APIs.
> DRM driver should export this buffer as dma-buf after GEM buffer is
> created. Otherwise, drm prime can't get fd from this gem buffer handle
> later.

We can just allocate memory with dma mapping API and use IOMMU for
handling the mapping to hardware and dma-buf for mapping to user and
kernel space. I don't think we need shmfs.

> Currently I'm still confused with these problems:
> 1. Userspace program is able to get a dma-buf fd for a specific GEM
> buffer. Is this a unique fd? I mean, can I pass this fd from one process
> to another, then other processes can access the same buffer? If the
> answer is yes, does this mean we don't need GEM's "flink" functionality?
> If the answer is no, GEM's "flink" makes sense. 

User space process can send the fd to another process via a unix socket,
and the other process can import the fd to gain access to the same
memory. This is more secure thank flink, which (if I understand
correctly) allows anybody with knowledge about the name to access the
buffer.

> 2. How to sync buffer operations between these different frameworks? For
> example, GEM has it's own buffer read/write/mmap interfaces, while
> dma-buf has either. So if the userspace program does something on the
> buffer via GEM apis, while a kernel driver is operating the same buffer
> via dma-buf interfaces, what should we do? Because GEM and dma-buf are
> different frameworks, where shall we setup a sync mechanism?

User space must take care that it does not access the buffer if it has
given the buffer to hw. We can't enforce it, though, but we can give an
API to help. The API relies on fences, which map to sync points in hardware.

When user space sends an operation to host1x client, it will be given a
fence, which maps to a pair of sync point register number and value. The
operation will ask host1x client to signal the fence via host1x (=sync
point increment). We will give IOCTL's to user space so that it can
check if buffer is safe to reuse, and operation to wait for the fence.

For dc, I haven't checked what kinds of operations on buffers there will
be. We'll probably need dc to allocate a fence from nvhost (=sync point
increment max), and increment sync point when an event has completed.
This way we can pass the fence to user space, and let user space wait
for it. This way user space will know when a buffer that was passed to
dc is free to be reused.

In Linaro's mm-sig there is discussion on generalizing this
synchronization mechanism.

Terje
