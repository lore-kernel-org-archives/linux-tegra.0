From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Flash Yocto-built kernel on Tegra2 T20?
Date: Wed, 31 Oct 2012 17:06:12 -0600
Message-ID: <5091AEE4.6080907@wwwdotorg.org>
References: <CAMAb8ZNts=SB2rhD8BU+_wAQ84S3tOzwGazr5hnTveMt-BdwGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMAb8ZNts=SB2rhD8BU+_wAQ84S3tOzwGazr5hnTveMt-BdwGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Evade Flow <evadeflow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/31/2012 12:29 PM, Evade Flow wrote:
> I've inherited a Tegra2 T20-based system that I'd like to flash a new
> kernel to. I built this kernel using OpenEmbedded/Yocto, and the kernel
> sources from:
> 
>   - http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=summary

If you want to use existing SW stack that's on that board (quickboot,
the flashing tools, etc.) I suggest getting support from wherever you
obtained the board. I know nothing about it, and I imagine anyone else
on this list is in the same boat. Any support you receive on this
mailing this will be targeted at using public tools/SW like U-Boot (or
just possible our more usual fastboot bootloader), the mainline kernel,
and the flashing tools/scripts usually used with those.

> burnflash.sh for p852 board

That board name and your mention of quickboot all imply some automotive
board. It isn't one of the boards we support in mainline. The developer
I spoke to was surprised people outside NVIDIA even had the board.

Sorry I can't be any more help.
