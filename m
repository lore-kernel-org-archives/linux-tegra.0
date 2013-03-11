From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Mon, 11 Mar 2013 12:54:00 -0600
Message-ID: <20130311185400.GC10992@obsidianresearch.com>
References: <512CF87A.4090404@wwwdotorg.org>
 <20130226181114.GU17833@n2100.arm.linux.org.uk>
 <5130E757.6090500@wwwdotorg.org>
 <20130304063436.GB27241@tbergstrom-lnx.Nvidia.com>
 <20130304091600.GC27241@tbergstrom-lnx.Nvidia.com>
 <5134D50B.8060001@wwwdotorg.org>
 <20130305074047.GH27241@tbergstrom-lnx.Nvidia.com>
 <513624AA.4090207@wwwdotorg.org>
 <513CC21E.7080901@ti.com>
 <CAOesGMgYL19+u-bLp080iasct5xtC=qfNCoz=SY7bbVgF=7JQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMgYL19+u-bLp080iasct5xtC=qfNCoz=SY7bbVgF=7JQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 10, 2013 at 11:47:31AM -0700, Olof Johansson wrote:

> If we already have to use appended DTB on these systems, then we
> already have a need to wrap the kernel in a per-system image (i.e. by
> appending the DTB to the kernel and booting that). If we're already
> doing that, we could just as well add a wrapper around the whole thing
> that enables the errata before launching the zimage.

What about bundling the DTB and a block of asm code to do 'CPU
startup' together somehow? If it was easy to locate the code in the
bundle then it could be jumped to directly from the vmlinux pre-mmu
startup code, from the secondary CPU startup, and from the CPU wake up
as well.

The tool to generate this bundle could generate and compile the asm
code based on an errata list in the DTB itself..

Regards,
Jason
