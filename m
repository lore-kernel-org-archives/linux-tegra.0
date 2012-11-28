From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 19:46:48 +0100
Message-ID: <1354128408.1479.137.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	    <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	    <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	    <50B46336.8030605@nvidia.com>
	    <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	    <50B476E1.4070403@nvidia.com>
	    <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	    <50B47DA8.60609@nvidia.com>	<1354011776.1479.31.camel@tellur>
	    <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
	    <50B4A483.8030305@nvidia.com>
	    <CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>
	    <50B60EFF.1050703@nvidia.com> <1354109602.1479.66.camel@tellur>
	   <50B61845.6060102@nvidia.com> <1354111565.1479.73.camel@tellur>
	  <50B6237B.8010808@nvidia.com> <1354115609.1479.91.camel@tellur>
	 <50B63A70.8020107@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B63A70.8020107-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 28.11.2012, 18:23 +0200 schrieb Terje Bergstr=C3=B6m:
> On 28.11.2012 17:13, Lucas Stach wrote:
> > To be honest I still don't grok all of this, but nonetheless I try =
my
> > best.
>=20
> Sorry. I promised in another thread a write-up explaining the design.=
 I
> still owe you guys that.
>=20
That would be really nice to have. I'm also particularly interested in
how you plan to do synchronization of command streams to different
engines working together, if that's not too much to ask for now. Like
userspace uploading a texture in a buffer, 2D engine doing mipmap
generation, 3D engine using mipmapped texture.

> > Anyway, shouldn't nvhost be something like an allocator used by hos=
t1x
> > clients? With the added ability to do relocs/binding of buffers int=
o
> > client address spaces, refcounting buffers and import/export dma-bu=
fs?
> > In this case nvhost objects would just be used to back DRM GEM obje=
cts.
> > If using GEM objects in the DRM driver introduces any cross depende=
ncies
> > with nvhost, you should take a step back and ask yourself if the cu=
rrent
> > design is the right way to go.
>=20
> tegradrm has the GEM allocator, and tegradrm contains the 2D kernel
> interface. tegradrm contains a dma-buf exporter for the tegradrm GEM
> objects.
>=20
> nvhost accepts jobs from tegradrm's 2D driver. nvhost increments
> refcounts and maps the command stream and target memories to devices,
> maps the command streams to kernel memory, replaces the placeholders =
in
> command streams with addresses with device virtual addresses, and unm=
aps
> the buffer from kernel memory. nvhost uses dma buf APIs for all of th=
e
> memory operations, and relies on dmabuf for refcounting. After all th=
is
> the command streams are pushed to host1x push buffer as GATHER (kind =
of
> a "gosub") opcodes, which reference to the command streams.
>=20
> Once the job is done, nvhost decrements refcounts and updates pushbuf=
fer
> pointers.
>=20
> The design is done so that nvhost won't be DRM specific. I want to
> enable creating V4L2 etc interfaces that talk to other host1x clients=
=2E
> V4L2 (yeah, I know nothing of V4L2) could pass frames via nvhost to E=
PP
> for pixel format conversion or 2D for rotation and write result to fr=
ame
> buffer.
>=20
> Do you think there's some fundamental problem with this design?
>=20
Ah yes I see. So if we consider nvhost to be the central entity in
charge of controlling all host1x clients and tegradrm as the interface
that happens to bundle display, 2d and 3d engine functionality into it'=
s
interface we should probably aim for two things:
1. Move everything needed by all engines down into nvhost (I especially
see the allocator falling under this point, I'll explain why this would
be beneficial a bit later)

2. Move the exposed DRM interface more in line with other DRM drivers.
Please take a look at how for example the GEM_EXECBUF ioctl works on
other drivers to get a feeling of what I'm talking about. Everything
using the display, 2D and maybe later on the 3D engine should only deal
with GEM handles. I really don't like the idea of having a single
userspace application, which uses engines with similar and known
requirements (DDX) dealing with dma-buf handles or other similar high
overhead stuff to do the most basic tasks.=20

If we move down the allocator into nvhost we can use buffers allocated
from this to back GEM or V4L2 buffers transparently. The ioctl to
allocate a GEM buffer shouldn't do much more than wrapping the nvhost
buffer.
This may also solve your problem with having multiple mappings of the
same buffer into the very same address space, as nvhost is the single
instance that manages all host1x client address spaces. If the buffer i=
s
originating from there you can easily check if it's already mapped. For
Tegra 3 to do things in an efficient way we likely have to move away
from dealing with the DMA API to dealing with the IOMMU API, this gets =
a
_lot_ easier_ if you have a single point where you manage memory
allocation and address space.

dma-buf should only be used where userspace is dealing with devices tha=
t
get controlled by different interfaces, like pointing a display plane t=
o
some camera buffer. And even then with a single allocator for the host1=
x
clients an dma-buf import is nothing more than realizing that the fd is
one of the fds you exported yourself, so you can go and look it up and
then depending on the device you are on just pointing the engine at the
memory location or fixing up the iommu mapping.

> >> Taking a step back - 2D streams are actually very short, in the or=
der of
> >> <100 bytes. Just copying them to kernel space would actually be fa=
ster
> >> than doing MMU operations.
> >>
> > Is this always the case because of the limited abilities of the gr2=
d
> > engine, or is it just your current driver flushing the stream very
> > often?
>=20
> It's because of limited abilities of the hardware. It just doesn't ta=
ke
> that many operations to invoke 2D.
>=20
> The libdrm user space we're created flushes probably a bit too often
> now, but even in downstream the streams are not much longer.  It take=
s
> still at least a week to get the user space code out for you to look =
at.
>=20
That's no problem, as I may not be able to do in-depth reviews of any
code until next week.

> > In which way is it a good design choice to let the CPU happily alte=
r
> > _any_ buffer the GPU is busy processing without getting the concurr=
ency
> > right?
>=20
> Concurrency is handled with sync points. User space will know when a
> command stream is processed and can be reused by comparing the curren=
t
> sync point value, and the fence that 2D driver returned to user space=
=2E
> User space can have a pool of buffers and can recycle when it knows i=
t
> can do so. But, this is not enforced by kernel.
>=20
This is the point where we have differ: You have to deal with syncpts i=
n
kernel anyway, otherwise you don't know when it's safe to destroy a
buffer. And no, userspace should not have the ability to destroy a
buffer itself, userspace should always just be able to free it's
reference to the buffer. Remember: never trust the userspace. And if yo=
u
are dealing with syncpts in kernel anyway, you can just go ahead and
enforce some sane concurrency rules. There may be some corener cases
related to userspace suballocating a kernel buffer, which might need
some more thought still, but that's not a valid excuse to not do any
concurrency validation in kernel.

> The difference with your proposal and what I posted is the level of
> control user space has over its command stream management. But as sai=
d,
> 2D streams are so short that my guess is that there's not too much
> penalty copying it to kernel managed host1x push buffer directly inst=
ead
> of inserting a GATHER reference.
>=20
This an implementation detail. Whether you shoot down the old pushbuf
mapping and insert a new one pointing to free backing memory (which may
be the way to go for 3D) or do an immediate copy of the channel pushbuf
contents to the host1x pushbuf (which may be beneficial for very small
pushs) is all the same. Both methods implicitly guarantee that the
memory mapped by userspace always points to a location the CPU can writ=
e
to without interfering with the GPU.

> > Please keep in mind that the interfaces you are now trying to intro=
duce
> > have to be supported for virtually unlimited time. You might not be=
 able
> > to scrub your mistakes later on without going through a lot of hass=
les.
> >=20
> > To avoid a lot of those mistakes it might be a good idea to look at=
 how
> > other drivers use the DRM infrastructure and only part from those p=
roven
> > schemes where really necessary/worthwhile.
>=20
> Yep, as the owner of this driver downstream, I'm also leveraging my
> experience with the graphics stack in our downstream software stack t=
hat
> is accessible via f.ex. L4T.
>=20
> This is exactly the discussion we should be having, and I'm learning =
all
> the time, so let's continue tossing around ideas until we're both hap=
py
> with the result.
>=20
I really enjoyed the discussion so far and hope we can get to the point
where we have a nice design/interface, working together.

Regards,
Lucas
