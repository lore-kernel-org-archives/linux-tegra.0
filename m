From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Fri, 07 Dec 2012 13:38:34 +0800
Message-ID: <50C180DA.508@gmail.com>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com> <50C08338.3070408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C08338.3070408-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2012 07:36 PM, Terje Bergstr=F6m wrote:
> On 06.12.2012 09:06, Mark Zhang wrote:
>> Thank you for the doc. So here I have questions:
>>
>> Push buffer contains a lot of opcodes for this channel. So when mult=
iple
>> userspace processes submit jobs to this channel, all these jobs will=
 be
>> saved in the push buffer and return, right? I mean, nvhost driver wi=
ll
>> create a workqueue or something to pull stuffs out from the push buf=
fer
>> and process them one by one?
>=20
> Yes, "sync queue" contains the list of jobs that are pending (or that
> kernel thinks are pending).
>

I see.

> Push buffer in general case contains GATHER opcodes, which point to t=
he
> streams from user space. This way we don't have to copy command strea=
ms.
> In case IOMMU is not available, we either have to copy the contents
> directly to push buffer so user space can't modify it later (I'm tryi=
ng
> to implement this), or then we have to ensure the command streams can=
not
> be tampered with in some other way.
>=20

Yes, we have been talking about this for several days.

>> Besides, "If command DMA sees opcode GATHER, it will allocate(you mi=
ssed
>> a verb here and I suppose it may be "allocate") a memory area to com=
mand
>> FIFO" -- So why we need command FIFO, this extra component? Can't we
>> just pass the correct address in push buffer to host1x clients?
>=20
> This is about the hardware, and the correct verb is "copy". HOST1X
> hardware pre-fetches opcodes from push buffer and contents of GATHERs=
 to
> a FIFO to overcome memory latencies. The execution happens from FIFO.
>=20
> host1x clients don't know about push buffers. They're a feature of
> HOST1X. HOST1X just interprets the opcodes and performs the operation=
s
> indicated, for example writes a value to a register of 2D.
>=20
> In general, the FIFO is invisible to users of HOST1X, but important t=
o
> understand when debugging stuck hardware.
>=20

Okay, so the command FIFO is not a part of memory we need to allocate.
It's inside in every host1x clients.

>> And when the host1x client starts working is controlled by userspace
>> program, right? Because command DMA allocates the command FIFO when =
it
>> sees opcode "GATHER". Or nvhost driver will generate "GATHER" as wel=
l,
>> to buffer some opcodes then send them to host1x clients in one shot?
>=20
> FIFO is hardware inside HOST1X, so it's not allocated by user space o=
r
> kernel.
>=20

Got it. We just need to copy stuffs into FIFO.

>> Could you explain more about this "relocation information"? I assume=
 the
>> "target buffers" here mentioned are some memory saving, e.g, texture=
s,
>> compressed video data which need to be decoded...
>> But the userspace should already allocate the memory to save them, w=
hy
>> we need to relocate?
>=20
> Lucas already did a better job of explaining than I could've, so I'll
> pass. :-)
>=20

Yeah, I have known the idea. What I'm confused before is that why we
need this reloc table because all mem are allocated from us(I mean,
tegradrm/nvhost) so ideally we can find out all buffer related infos in
the driver while userspace doesn't need to provide such informations.

> I'll add some notes about these to the doc.
>=20

Thanks for the doc and it's really helpful.

> Terje
>=20
