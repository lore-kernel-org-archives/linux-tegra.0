From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: First version of host1x intro
Date: Thu, 06 Dec 2012 12:17:08 +0100
Message-ID: <1354792628.1503.107.camel@tellur>
References: <50BF1831.3060606@nvidia.com> <50C0440D.3000702@gmail.com>
	  <1354778441.1503.92.camel@tellur> <50C04E1D.1050702@gmail.com>
	 <1354780836.1503.102.camel@tellur> <50C053AD.2000802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C053AD.2000802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 06.12.2012, 16:13 +0800 schrieb Mark Zhang:
> On 12/06/2012 04:00 PM, Lucas Stach wrote:
[...]
> > 
> > Or maybe I'm misunderstanding you and you mean it the other way around.
> > You don't let userspace dictate the addresses, the relocation
> > information just tells the kernel to find the addresses of the
> > referenced buffers for you and insert them, instead of the dummy
> > information, into the command stream.
> 
> Yes, I think this is what I mean. No dummy information in the command
> stream, userspace just fills the address which it uses(actually this is
> cpu address of the buffer) in the command stream, and our driver must
> have a HashTable or something which contains the buffer address pair --
> (cpu address, dma address), so our driver can find the dma addresses for
> every buffer then modify the addresses in the command stream.
> 
> Hope I explain that clear.
> 

And to do so we would have to hold an unfortunately large table in
kernel, as a buffer can be mapped by different userspace processes at
different locations. Also you would have to match against some variably
sized ranges to find the correct buffer, as the userspace would have to
pack bufferbaseaddress and offset into same value.

I really don't think it's worth the hassle and it's the right way to use
the proven scheme of a sidebandbuffer to pass in the reloc informations.

Regards,
Lucas
