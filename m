From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 16:13:29 +0100
Message-ID: <1354115609.1479.91.camel@tellur>
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
	 <50B6237B.8010808@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B6237B.8010808-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 28.11.2012, 16:45 +0200 schrieb Terje Bergstr=C3=B6m:
> On 28.11.2012 16:06, Lucas Stach wrote:
> > Why do even need/use dma-buf for this use case? This is all one DRM
> > device, even if we separate host1x and gr2d as implementation modul=
es.
>=20
> I didn't want to implement dependency to drm gem objects in nvhost, b=
ut
> we have thought about doing that. dma-buf brings quite a lot of
> overhead, so implementing support for gem buffers would make the
> sequence a bit leaner.
>=20
> nvhost already has infra to support multiple memory managers.
>=20
To be honest I still don't grok all of this, but nonetheless I try my
best.

Anyway, shouldn't nvhost be something like an allocator used by host1x
clients? With the added ability to do relocs/binding of buffers into
client address spaces, refcounting buffers and import/export dma-bufs?
In this case nvhost objects would just be used to back DRM GEM objects.
If using GEM objects in the DRM driver introduces any cross dependencie=
s
with nvhost, you should take a step back and ask yourself if the curren=
t
design is the right way to go.

> > So standard way of doing this is:
> > 1. create gem object for pushbuffer
> > 2. create fake mmap offset for gem obj
> > 3. map pushbuf using the fake offset on the drm device
> > 4. at submit time zap the mapping
> >=20
> > You need this logic anyway, as normally we don't rely on userspace =
to
> > sync gpu and cpu, but use the kernel to handle the concurrency issu=
es.
>=20
> Taking a step back - 2D streams are actually very short, in the order=
 of
> <100 bytes. Just copying them to kernel space would actually be faste=
r
> than doing MMU operations.
>=20
Is this always the case because of the limited abilities of the gr2d
engine, or is it just your current driver flushing the stream very
often?

> I think for Tegra20 and non-IOMMU case, we just need to copy the comm=
and
> stream to kernel buffer. In Tegra30 IOMMU case reference to user spac=
e
> buffers are fine, as tampering the streams doesn't have any ill effec=
ts.
>=20
In which way is it a good design choice to let the CPU happily alter
_any_ buffer the GPU is busy processing without getting the concurrency
right?

Please keep in mind that the interfaces you are now trying to introduce
have to be supported for virtually unlimited time. You might not be abl=
e
to scrub your mistakes later on without going through a lot of hassles.

To avoid a lot of those mistakes it might be a good idea to look at how
other drivers use the DRM infrastructure and only part from those prove=
n
schemes where really necessary/worthwhile.

Regards,
Lucas
