From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 15:06:05 +0100
Message-ID: <1354111565.1479.73.camel@tellur>
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
	 <50B61845.6060102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B61845.6060102@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>
Cc: Dave Airlie <airlied@gmail.com>, Thierry Reding <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 28.11.2012, 15:57 +0200 schrieb Terje Bergstr=C3=B6m:
> On 28.11.2012 15:33, Lucas Stach wrote:
> > So this is obviously wrong. Userspace has to allocate a pushbuffer =
from
> > the kernel just as every other buffer, then map it into it's own ad=
dress
> > space to push in commands. At submit time of the pushbuf kernel has=
 to
> > make sure that userspace is not able to access the memory any more,=
 i.e.
> > kernel shoots down the vma or pagetable of the vma. To keep overhea=
d low
> > and not do any blocking you can just keep some pushbufs around for =
one
> > channel and switch over the pagetable entries to the next free buff=
er,
> > just make sure that userspace is never able to tamper with a buffer=
 as
> > long as the gpu isn't done with it.
>=20
> That's really not something dma-buf APIs are equipped to handle. We n=
eed
> something to ensure user space doesn't have the buffer mapped (either
> return error if has, or zap the mapping), something to ensure user sp=
ace
> cannot mmap the buffer, and something to revert this all once we're d=
one.
>=20
> We could add these as special ops to tegradrm dmabuf code for now, an=
d
> assume that command streams are always allocated by tegradrm. Now we
> allow any dmabuf to be used as buffers for command streams.
>=20
Why do even need/use dma-buf for this use case? This is all one DRM
device, even if we separate host1x and gr2d as implementation modules.

So standard way of doing this is:
1. create gem object for pushbuffer
2. create fake mmap offset for gem obj
3. map pushbuf using the fake offset on the drm device
4. at submit time zap the mapping

You need this logic anyway, as normally we don't rely on userspace to
sync gpu and cpu, but use the kernel to handle the concurrency issues.

Regards,
Lucas
