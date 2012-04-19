From: Andrey Smirnov <andrey.smirnov-MC3rjLPHZ0ivD/XHwUtZZ+TW4wlIGRCZ@public.gmane.org>
Subject: Re: [RFC] tegra_pcm DMA buffers allocation
Date: Thu, 19 Apr 2012 16:30:53 -0700
Message-ID: <1334878253.13681.68.camel@marvin>
References: <1334851253.13681.49.camel@marvin>
	 <4F90708F.8070504@wwwdotorg.org> <1334869632.13681.59.camel@marvin>
	 <4F90858D.4010206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F90858D.4010206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2012-04-19 at 17:37 -0400, Stephen Warren wrote:
> On 04/19/2012 03:07 PM, Andrey Smirnov wrote:
> > On Thu, 2012-04-19 at 16:07 -0400, Stephen Warren wrote:
> ...
> >> BTW, did you try running the mainline code on your board. If it's
> >> derived from Harmony, it should be easy to get it going.
> > 
> > Last time we did there was no support for Tegra's NAND and display
> > controllers
> 
> What do you need the NAND controllers for? I'm not 100% certain, but I
> believe we plan on upstreaming NAND support into U-Boot, but not the
> kernel, since we didn't see a need for it there IIRC. (Not that we'd
> stop anyone else doing it)

Our design is Harmony based, but unlike the original Harmony board we
have eMMC instead of removable SDMMC card, which means that for now the
only way for us to update the software on the board is to use nvflash.
Nvflash, to the best of my knowledge at least, does not support flashing
of eMMC for boards other than Ventana and Cardhu, and that forces us to
use one of the NAND partitions to store kernel image and rootfs.

Andrey Smirnov
