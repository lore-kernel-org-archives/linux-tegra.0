From: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Fri, 7 Dec 2012 08:44:12 +0200
Message-ID: <50C1903C.8040608@nvidia.com>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com> <50C08338.3070408@nvidia.com> <50C180DA.508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C180DA.508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.12.2012 07:38, Mark Zhang wrote:
> On 12/06/2012 07:36 PM, Terje Bergstr=F6m wrote:
>> This is about the hardware, and the correct verb is "copy". HOST1X
>> hardware pre-fetches opcodes from push buffer and contents of GATHER=
s to
>> a FIFO to overcome memory latencies. The execution happens from FIFO=
=2E
> Okay, so the command FIFO is not a part of memory we need to allocate=
=2E
> It's inside in every host1x clients.

Almost - it's part of HOST1X itself, not clients.

> Yeah, I have known the idea. What I'm confused before is that why we
> need this reloc table because all mem are allocated from us(I mean,
> tegradrm/nvhost) so ideally we can find out all buffer related infos =
in
> the driver while userspace doesn't need to provide such informations.

=46or lots of buffers, there's no need to map them to user space at all=
,
so user space can treat the buffer as just an abstract region. For
example, getting handle to frame buffer and passing it to 2D for
rendering doesn't require user space to map the memory.

Second point is that as long as we haven't pinned memory, there's a
possibility to move the pages around to do defragmenting etc. As soon a=
s
you get a device virtual address to a page, you need to pin it and can'=
t
move it anymore. So we want to build the APIs and sequences so that the
pages can be pinned as late as possible.

Naturally, in CMA, the second point isn't that relevant, but I want the
API to tolerate IOMMU support, too.

Terje
