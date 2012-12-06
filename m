From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Thu, 06 Dec 2012 08:20:41 +0100
Message-ID: <1354778441.1503.92.camel@tellur>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C0440D.3000702-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 06.12.2012, 15:06 +0800 schrieb Mark Zhang:
[...]
> > First action taken is taking a reference to all buffers in the command
> > stream. This includes the command stream buffers themselves, but also
> > the target buffers. We also map each buffer to target hardware to get a
> > device virtual address.
> > 
> > After this, relocation information is processed. Each reference to
> > target buffers in command stream are replaced with device virtual
> > addresses. The relocation information contains the reference to target
> > buffer, and to command stream to be able to do this.
> 
> Could you explain more about this "relocation information"? I assume the
> "target buffers" here mentioned are some memory saving, e.g, textures,
> compressed video data which need to be decoded...
> But the userspace should already allocate the memory to save them, why
> we need to relocate?
> 
"Relocation" is the term used to express the fixup of addresses in the
command buffer. You are right, the memory is allocated and stays the
same, but userspace can not know where in the GPU address space a
specific buffer is bound (maybe it's even unbound at the time, when
userspace stitches together the pushbuf). So userspace dumps some kind
of dummy information into the command stream instead of a real buffer
address. With the relocation information (which is kind of a sideband
buffer to the commandbuf) it then tells the kernel to insert real GPU
virtual addresses in the locations of the dummy info. For the kernel to
do so, it needs to know:
1. where in the command stream is a dummy address
2. which buffers address should be inserted instead
3. which offset into this buffer should be added to the address to be
inserted

So while processing a reloc, kernel pins buffers in memory (makes pages
non-movable and bind them into gpu address space) and substitute all
dummy information with real gpu virt addresses in the commandbuf.

Regards,
Lucas
