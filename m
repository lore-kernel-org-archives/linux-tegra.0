From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Fri, 07 Dec 2012 15:05:20 +0800
Message-ID: <50C19530.2030106@gmail.com>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com> <50C08338.3070408@nvidia.com> <50C180DA.508@gmail.com> <50C1903C.8040608@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C1903C.8040608-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/07/2012 02:44 PM, Terje Bergstr=F6m wrote:
> On 07.12.2012 07:38, Mark Zhang wrote:
>> On 12/06/2012 07:36 PM, Terje Bergstr=F6m wrote:
>>> This is about the hardware, and the correct verb is "copy". HOST1X
>>> hardware pre-fetches opcodes from push buffer and contents of GATHE=
Rs to
>>> a FIFO to overcome memory latencies. The execution happens from FIF=
O.
>> Okay, so the command FIFO is not a part of memory we need to allocat=
e.
>> It's inside in every host1x clients.
>=20
> Almost - it's part of HOST1X itself, not clients.

Got it.

>=20
>> Yeah, I have known the idea. What I'm confused before is that why we
>> need this reloc table because all mem are allocated from us(I mean,
>> tegradrm/nvhost) so ideally we can find out all buffer related infos=
 in
>> the driver while userspace doesn't need to provide such informations=
=2E
>=20
> For lots of buffers, there's no need to map them to user space at all=
,
> so user space can treat the buffer as just an abstract region. For
> example, getting handle to frame buffer and passing it to 2D for
> rendering doesn't require user space to map the memory.
>=20
> Second point is that as long as we haven't pinned memory, there's a
> possibility to move the pages around to do defragmenting etc. As soon=
 as
> you get a device virtual address to a page, you need to pin it and ca=
n't
> move it anymore. So we want to build the APIs and sequences so that t=
he
> pages can be pinned as late as possible.
>=20

Great, these are another two strong evidences. Big thanks. :)

> Naturally, in CMA, the second point isn't that relevant, but I want t=
he
> API to tolerate IOMMU support, too.
>=20
> Terje
>=20
