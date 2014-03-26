From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: JTAG debugging the linux kernel on tegra3 platforms
Date: Wed, 26 Mar 2014 12:23:12 -0600
Message-ID: <53331B10.3030904@wwwdotorg.org>
References: <5332E13D.3070907@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5332E13D.3070907-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Oh <oh_alexander-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/26/2014 08:16 AM, Alexander Oh wrote:
> Hi!
> 
> I'm currently trying to debug a QuadMo747-X T30. I'm trying to update
> the versions of u-boot and linux kernel. I run into problems while
> booting the kernel (similar to [2], but I'm not sure whats going on yet)
> and was hoping to get some help here about JTAG debuggers.

Turning on earlyprintk is hopefully the simplest way to debug this; see
the details in the thread you linked to.

> I've seen that people are already running the flyswatter2 JTAG debuggers
> with the nvidia tegra2 [1]. Is this debugger also working with the
> nvidia tegra3? I found out that James Zhao has been working on OpenOCD
> to get the Tegra3 running. But I could not find any references or
> manuals to get it working. I'm not entirely sure that the debugger is
> compatible with tegra3 processors.
> 
> Is anybody here actually using a flyswatter2 debugger with a tegra3
> processor?

While my OpenOCD config files imply that I did try it on some Tegra30
device in the past, I haven't ever had much good luck with using it on
the main CPUs. I certainly have done some simple operations on the
AVP/boot processor, but not much worked on the A9s. This might be user
error, or might not; I'm not sure. This isn't an area I've put much time
into understanding.
