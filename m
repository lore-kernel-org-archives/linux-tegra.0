From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Thu, 06 Dec 2012 15:06:53 +0800
Message-ID: <50C0440D.3000702@gmail.com>
References: <50BF1831.3060606@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BF1831.3060606-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/05/2012 05:47 PM, Terje Bergstr=F6m wrote:
> Hi,
>=20
[...]
>=20
> Channels
> --------
>=20
> Channel is a push buffer containing HOST1X opcodes. The push buffer
> boundaries are defined with `HOST1X_CHANNEL_DMASTART_0` and
> `HOST1X_CHANNEL_DMAEND_0`. `HOST1X_CHANNEL_DMAGET_0` indicates the ne=
xt
> position within the boundaries that is going to be processes, and
> `HOST1X_CHANNEL_DMAPUT_0` indicates the position of last valid opcode=
=2E
> Whenever `HOST1X_CHANNEL_DMAPUT_0` and `HOST1X_CHANNEL_DMAGET_0` diff=
er,
> command DMA will copy commands from push buffer to a command FIFO.
>=20
> If command DMA sees opcode GATHER, it will a memory area to command
> FIFO. The number of words is indicated in GATHER opcode, and the base
> address is read from the following word. GATHERs are not recursive.
>=20

Thank you for the doc. So here I have questions:

Push buffer contains a lot of opcodes for this channel. So when multipl=
e
userspace processes submit jobs to this channel, all these jobs will be
saved in the push buffer and return, right? I mean, nvhost driver will
create a workqueue or something to pull stuffs out from the push buffer
and process them one by one?

Besides, "If command DMA sees opcode GATHER, it will allocate(you misse=
d
a verb here and I suppose it may be "allocate") a memory area to comman=
d
=46IFO" -- So why we need command FIFO, this extra component? Can't we
just pass the correct address in push buffer to host1x clients?

And when the host1x client starts working is controlled by userspace
program, right? Because command DMA allocates the command FIFO when it
sees opcode "GATHER". Or nvhost driver will generate "GATHER" as well,
to buffer some opcodes then send them to host1x clients in one shot?

> HOST1X command processor goes through the FIFO and executes opcodes.
> Each channel has some stored state, such as the client unit this chan=
nel
> is talking to. The most important opcodes are:
>
[...]
> First action taken is taking a reference to all buffers in the comman=
d
> stream. This includes the command stream buffers themselves, but also
> the target buffers. We also map each buffer to target hardware to get=
 a
> device virtual address.
>=20
> After this, relocation information is processed. Each reference to
> target buffers in command stream are replaced with device virtual
> addresses. The relocation information contains the reference to targe=
t
> buffer, and to command stream to be able to do this.

Could you explain more about this "relocation information"? I assume th=
e
"target buffers" here mentioned are some memory saving, e.g, textures,
compressed video data which need to be decoded...
But the userspace should already allocate the memory to save them, why
we need to relocate?

>=20
> After relocation, each wait is checked against expiration. Any wait
> whose threshold has already expired will be converted to a no-wait by
> writing `0x00000000` over the word. This will essentially turn any
> expired wait into a wait for sync point register 0, value 0, and thus=
 we
> keep sync point 0 reserved for this purpose and never change it from
> value 0.
>=20
> In upstream kernel without IOMMU support we also check the contents o=
f
> the command stream for any accesses to memory that are not taken care=
 of
> by relocation information.
>=20
[...]
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
