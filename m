From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Thu, 06 Dec 2012 11:46:12 -0700
Message-ID: <50C0E7F4.2090802@wwwdotorg.org>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com>  <1354778441.1503.92.camel@tellur> <50C04E1D.1050702@gmail.com> <1354780836.1503.102.camel@tellur> <50C053AD.2000802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C053AD.2000802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2012 01:13 AM, Mark Zhang wrote:
> On 12/06/2012 04:00 PM, Lucas Stach wrote:
>> Am Donnerstag, den 06.12.2012, 15:49 +0800 schrieb Mark Zhang:
> [...]
>>>
>>> OK. So these relocation addresses are used to let userspace tells kernel
>>> which buffers mentioned in the command should be relocated to addresses
>>> which host1x clients able to reach.
>>>
>> Yep, preferably all buffers referenced by a command stream should
>> already be set up in such a position (CMA with Tegra2) or the relocation
>> should be nothing more than setting up IOMMU page tables (Tegra3).
>>
>>> I'm also wondering that, if our driver understands the stuffs in the
>>> commands, maybe we can find out all addresses in the command, in that
>>> way, we will not need userspace tells us which are the addresses need to
>>> be relocated, right?
>>
>> No. How will the kernel ever know which buffer gets referenced in a
>> command stream? All the kernel sees is is a command stream with
>> something like "blit data to address 0xADDR" in it. The only info that
>> you can gather from that is that there must be some buffer to blit into.
>> Neither do you know which buffer the stuff should be going to, nor can
>> you know if you blit to offset zero in this buffer. It's perfectly valid
>> to only use a subregion of a buffer.
>>
>> Or maybe I'm misunderstanding you and you mean it the other way around.
>> You don't let userspace dictate the addresses, the relocation
>> information just tells the kernel to find the addresses of the
>> referenced buffers for you and insert them, instead of the dummy
>> information, into the command stream.
> 
> Yes, I think this is what I mean. No dummy information in the command
> stream, userspace just fills the address which it uses(actually this is
> cpu address of the buffer) in the command stream, and our driver must
> have a HashTable or something which contains the buffer address pair --
> (cpu address, dma address), so our driver can find the dma addresses for
> every buffer then modify the addresses in the command stream.

Typically there would be no CPU address; there's no need in most cases
to ever map most buffers to the CPU.

Automatically parsing the buffer sounds like an interesting idea, but
then the kernel relocation code would have to know the meaning of every
single register or command-stream "method" in order to know which of
them take a buffer address as an argument. I am not familiar with this
HW specifically, so perhaps it's much more regular than I think and it's
actually easy to do that, but I imagine it'd be a PITA to implement that
(although perhaps we have to for the command-stream validation stuff
anyway?). Also, it'd be a lot quicker at least for larger command
buffers to go straight to the few locations in the command stream where
a buffer is referenced (i.e. use the side-band metadata for relocation)
rather than having the CPU re-read the entire command stream in the
kernel to parse it.
