From: Antti P Miettinen <ananaza-X3B1VOXEql0@public.gmane.org>
Subject: Re: Linux timer interrupts not working when booting in normal-world
Date: Thu, 13 Sep 2012 10:22:58 +0300
Message-ID: <87ipbiwfn1.fsf@amiettinen-lnx.nvidia.com>
References: <505095C9.5000108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:
> I'm currently playing with the TrustZone technology on the Tegra2
> Harmony board, and my goal is to boot Linux not in the secure world
> (as it is in mainstream Linux), but in the normal world. However, in
> doing this, timer interrupts are not being triggered and the system
> halts early in the bootstrap stage. I'd like to ask if anyone could
> give me a hint for why this is happening.

GIC configuration? I'm not at all familiar with TZ, but you might need
to configure the interrupts as non-secure:

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ihi0048a/CHDCEAIF.html

So you have a secure monitor you can create SMCs for? Is that code
available?

--
Antti P Miettinen
http://www.iki.fi/~ananaza/
