From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] tegrarcm: Add SPI flash support to tegra114 miniloader
Date: Mon, 17 Jun 2013 21:55:36 -0700
Message-ID: <20130618045536.GC8973@badger>
References: <1371525987-2799-1-git-send-email-amartin@nvidia.com>
 <51BFDAA7.1080106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51BFDAA7.1080106-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 17, 2013 at 08:57:27PM -0700, Stephen Warren wrote:
> On 06/17/2013 09:26 PM, Allen Martin wrote:
> > Update tegra114 miniloader file with a version that supports boot from
> > SPI flash.  The previous version would hang if the board was
> > configured to boot from SPI.
> 
> Out of curiosity, why does it hang? I thought the miniloader would only
> interpret the SDRAM portion of the BCT, and hence the boot flash
> configuration would have no effect on it at all. Does it also enable
> whatever boot flash is in the BCT too?
> 
> Either way, I guess I have no problem with the patch, so,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Miniloader is AOS based, like fastboot.  This was a bug in the AOS
implementation of SPI which I think was still using a t30 style "slink"
driver on t114.

I don't know all the details but I would guess miniloader assumes
you're about to write to the boot device so it applies the boot device
timing parameters in the BCT to make sure it's running at greater than
the bootROM failsafe clocks.

-Allen
-- 
nvpublic
