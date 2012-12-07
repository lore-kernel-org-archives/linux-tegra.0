From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Fri, 07 Dec 2012 13:49:29 +0800
Message-ID: <50C18369.2080001@gmail.com>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com>  <1354778441.1503.92.camel@tellur> <50C04E1D.1050702@gmail.com> <1354780836.1503.102.camel@tellur> <50C053AD.2000802@gmail.com> <50C0E7F4.2090802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C0E7F4.2090802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/07/2012 02:46 AM, Stephen Warren wrote:
> On 12/06/2012 01:13 AM, Mark Zhang wrote:
[...]
>>
>> Yes, I think this is what I mean. No dummy information in the command
>> stream, userspace just fills the address which it uses(actually this is
>> cpu address of the buffer) in the command stream, and our driver must
>> have a HashTable or something which contains the buffer address pair --
>> (cpu address, dma address), so our driver can find the dma addresses for
>> every buffer then modify the addresses in the command stream.
> 
> Typically there would be no CPU address; there's no need in most cases
> to ever map most buffers to the CPU.
> 
> Automatically parsing the buffer sounds like an interesting idea, but
> then the kernel relocation code would have to know the meaning of every
> single register or command-stream "method" in order to know which of
> them take a buffer address as an argument. I am not familiar with this
> HW specifically, so perhaps it's much more regular than I think and it's
> actually easy to do that, but I imagine it'd be a PITA to implement that
> (although perhaps we have to for the command-stream validation stuff
> anyway?).

Yes. To make the driver understands all command stream stuffs is not an
easy and interesting work. And this part of codes need to be taken care
with each generation of tegra.

> Also, it'd be a lot quicker at least for larger command
> buffers to go straight to the few locations in the command stream where
> a buffer is referenced (i.e. use the side-band metadata for relocation)
> rather than having the CPU re-read the entire command stream in the
> kernel to parse it.
> 

Agree. Although we can categorize the commands and ignore the commands
which not take buffer address as arguments.
