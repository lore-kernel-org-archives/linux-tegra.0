From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Thu, 29 Nov 2012 10:09:13 +0100
Message-ID: <1354180153.1479.162.camel@tellur>
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
	  <50B63A70.8020107@nvidia.com> <1354128408.1479.137.camel@tellur>
	 <50B71A28.5060807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B71A28.5060807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 29.11.2012, 10:17 +0200 schrieb Terje Bergstr=C3=B6m=
:
> On 28.11.2012 20:46, Lucas Stach wrote:
> > Am Mittwoch, den 28.11.2012, 18:23 +0200 schrieb Terje Bergstr=C3=B6=
m:
> >> Sorry. I promised in another thread a write-up explaining the desi=
gn. I
> >> still owe you guys that.
> > That would be really nice to have. I'm also particularly interested=
 in
> > how you plan to do synchronization of command streams to different
> > engines working together, if that's not too much to ask for now. Li=
ke
> > userspace uploading a texture in a buffer, 2D engine doing mipmap
> > generation, 3D engine using mipmapped texture.
>=20
> I can briefly explain (and then copy-paste to a coherent text once I =
get
> to it) how inter-engine synchronization is done. It's not specificall=
y
> for 2D or 3D, but generic to any host1x client.
[...]
Thanks for that.
[...]

> > 2. Move the exposed DRM interface more in line with other DRM drive=
rs.
> > Please take a look at how for example the GEM_EXECBUF ioctl works o=
n
> > other drivers to get a feeling of what I'm talking about. Everythin=
g
> > using the display, 2D and maybe later on the 3D engine should only =
deal
> > with GEM handles. I really don't like the idea of having a single
> > userspace application, which uses engines with similar and known
> > requirements (DDX) dealing with dma-buf handles or other similar hi=
gh
> > overhead stuff to do the most basic tasks.
> > If we move down the allocator into nvhost we can use buffers alloca=
ted
> > from this to back GEM or V4L2 buffers transparently. The ioctl to
> > allocate a GEM buffer shouldn't do much more than wrapping the nvho=
st
> > buffer.
>=20
> Ok, this is actually what we do downstream. We use dma-buf handles on=
ly
> for purposes where they're really needed (in fact, none yet), and use
> our downstream allocator handles for the rest. I did this, because
> benchmarks were showing that memory management overhead shoot through
> the roof if I tried doing everything via dma-buf.
>=20
> We can move support for allocating GEM handles to nvhost, and GEM
> handles can be treated just as another memory handle type in nvhost.
> tegradrm would then call nvhost for allocation.
>=20
We should aim for a clean split here. GEM handles are something which i=
s
really specific to how DRM works and as such should be constructed by
tegradrm. nvhost should really just manage allocations/virtual address
space and provide something that is able to back all the GEM handle
operations.

nvhost has really no reason at all to even know about GEM handles. If
you back a GEM object by a nvhost object you can just peel out the
nvhost handles from the GEM wrapper in the tegradrm submit ioctl handle=
r
and queue the job to nvhost using it's native handles.

This way you would also be able to construct different handles (like GE=
M
obj or V4L2 buffers) from the same backing nvhost object. Note that I'm
not sure how useful this would be, but it seems like a reasonable desig=
n
to me being able to do so.

> > This may also solve your problem with having multiple mappings of t=
he
> > same buffer into the very same address space, as nvhost is the sing=
le
> > instance that manages all host1x client address spaces. If the buff=
er is
> > originating from there you can easily check if it's already mapped.=
 For
> > Tegra 3 to do things in an efficient way we likely have to move awa=
y
> > from dealing with the DMA API to dealing with the IOMMU API, this g=
ets a
> > _lot_ easier_ if you have a single point where you manage memory
> > allocation and address space.
>=20
> Yep, this would definitely simplify our IOMMU problem. But, I thought
> the canonical way of dealing with device memory is DMA API, and you'r=
e
> saying that we should just bypass it and call IOMMU directly?
>=20
This is true for all standard devices. But we should not consider this
as something set in stone and then building some crufty design around
it. If we can manage to make our design a lot cleaner by managing DMA
memory and the corresponding IOMMU address spaces for the host1x device=
s
ourselves, I think this is the way to go. All other graphics drivers in
the Linux kernel have to deal with their GTT in some way, we just happe=
n
to do so by using a shared system IOMMU and not something that is
exclusive to the graphics devices.

This is more work on the side of nvhost, but IMHO the benefits make it
look worthwhile.

What we should avoid is something that completely escapes the standard
ways of dealing with memory used in the Linux kernel, like using
carveout areas, but I think this is already consensus among us all.

[...]
> > This an implementation detail. Whether you shoot down the old pushb=
uf
> > mapping and insert a new one pointing to free backing memory (which=
 may
> > be the way to go for 3D) or do an immediate copy of the channel pus=
hbuf
> > contents to the host1x pushbuf (which may be beneficial for very sm=
all
> > pushs) is all the same. Both methods implicitly guarantee that the
> > memory mapped by userspace always points to a location the CPU can =
write
> > to without interfering with the GPU.
>=20
> Ok. Based on this, I propose the way to go for cases without IOMMU
> support and all Tegra20 cases (as Tegra20's GART can't provide memory
> protection) is to copy the stream to host1x push buffer. In Tegra30 w=
ith
> IOMMU support we can just reference the buffer. This way we don't hav=
e
> to do expensive MMU operations.
>=20
Sounds like a plan.

Regards,
Lucas
