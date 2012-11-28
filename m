From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 15:57:25 +0200
Message-ID: <50B61845.6060102@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>  <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>  <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>  <50B46336.8030605@nvidia.com>  <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>  <50B476E1.4070403@nvidia.com>  <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>  <50B47DA8.60609@nvidia.com>	<1354011776.1479.31.camel@tellur>  <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>  <50B4A483.8030305@nvidia.com>  <CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>  <50B60EFF.1050703@nvidia.com> <1354109602.1479.66.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354109602.1479.66.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 28.11.2012 15:33, Lucas Stach wrote:
> So this is obviously wrong. Userspace has to allocate a pushbuffer from
> the kernel just as every other buffer, then map it into it's own address
> space to push in commands. At submit time of the pushbuf kernel has to
> make sure that userspace is not able to access the memory any more, i.e.
> kernel shoots down the vma or pagetable of the vma. To keep overhead low
> and not do any blocking you can just keep some pushbufs around for one
> channel and switch over the pagetable entries to the next free buffer,
> just make sure that userspace is never able to tamper with a buffer as
> long as the gpu isn't done with it.

That's really not something dma-buf APIs are equipped to handle. We need
something to ensure user space doesn't have the buffer mapped (either
return error if has, or zap the mapping), something to ensure user space
cannot mmap the buffer, and something to revert this all once we're done.

We could add these as special ops to tegradrm dmabuf code for now, and
assume that command streams are always allocated by tegradrm. Now we
allow any dmabuf to be used as buffers for command streams.

And, with IOMMU I don't think we would need any of this. I guess we need
to press the gas pedal on figuring out how to enable that for tegradrm
on Tegra30.

We already allocate multiple buffers to be able to fill in the next
buffer once we've send one to kernel, so that part is ok. We reuse only
once we know that the operations contained are done.

Terje
