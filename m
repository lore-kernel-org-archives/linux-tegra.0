From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Thu, 06 Dec 2012 15:49:49 +0800
Message-ID: <50C04E1D.1050702@gmail.com>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com> <1354778441.1503.92.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354778441.1503.92.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2012 03:20 PM, Lucas Stach wrote:
> Am Donnerstag, den 06.12.2012, 15:06 +0800 schrieb Mark Zhang:
> [...]
>>> First action taken is taking a reference to all buffers in the command
>>> stream. This includes the command stream buffers themselves, but also
>>> the target buffers. We also map each buffer to target hardware to get a
>>> device virtual address.
>>>
>>> After this, relocation information is processed. Each reference to
>>> target buffers in command stream are replaced with device virtual
>>> addresses. The relocation information contains the reference to target
>>> buffer, and to command stream to be able to do this.
>>
>> Could you explain more about this "relocation information"? I assume the
>> "target buffers" here mentioned are some memory saving, e.g, textures,
>> compressed video data which need to be decoded...
>> But the userspace should already allocate the memory to save them, why
>> we need to relocate?
>>
> "Relocation" is the term used to express the fixup of addresses in the
> command buffer. You are right, the memory is allocated and stays the
> same, but userspace can not know where in the GPU address space a
> specific buffer is bound (maybe it's even unbound at the time, when
> userspace stitches together the pushbuf). So userspace dumps some kind
> of dummy information into the command stream instead of a real buffer
> address. With the relocation information (which is kind of a sideband
> buffer to the commandbuf) it then tells the kernel to insert real GPU
> virtual addresses in the locations of the dummy info. For the kernel to
> do so, it needs to know:
> 1. where in the command stream is a dummy address
> 2. which buffers address should be inserted instead
> 3. which offset into this buffer should be added to the address to be
> inserted
> 

OK. So these relocation addresses are used to let userspace tells kernel
which buffers mentioned in the command should be relocated to addresses
which host1x clients able to reach.

I'm also wondering that, if our driver understands the stuffs in the
commands, maybe we can find out all addresses in the command, in that
way, we will not need userspace tells us which are the addresses need to
be relocated, right?

Mark
> So while processing a reloc, kernel pins buffers in memory (makes pages
> non-movable and bind them into gpu address space) and substitute all
> dummy information with real gpu virt addresses in the commandbuf.
> 
> Regards,
> Lucas
> 
