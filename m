From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v3 1/5] mtd: nand: tegra: add devicetree binding
Date: Wed, 22 Jul 2015 15:32:33 -0700
Message-ID: <20150722223233.GA8876@google.com>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
 <1431282602-7137-2-git-send-email-dev@lynxeye.de>
 <20150721210537.GL24125@google.com>
 <1437596129.2289.2.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437596129.2289.2.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 22, 2015 at 10:15:29PM +0200, Lucas Stach wrote:
> Am Dienstag, den 21.07.2015, 14:05 -0700 schrieb Brian Norris:
> > > +Optional properties:
> > > +- nvidia,wp-gpios: GPIO used to disable write protection of the flash
> > 
> > I think write-protect is a pretty common function, so we might want to
> > just remove the 'nvidia,' prefix, so we can eventually move your code to
> > the core nand_base.c library (BTW, I noticed you grab the GPIO, but you
> > don't do anything with it; is that intentional?). In fact, I've seen
> > requests for that very feature on the mailing list.
> > 
> 
> Actually I request and activate the GPIO in the driver, so the chip is
> permanently unprotected.

Whoops, I missed that part. I'm not too familiar with the GPIO API.
Thanks for clearing that up.

> I agree that it would be nice to integrate this better into the NAND
> core. If it's okay for you I'll drop the nvidia prefix and follow up
> with patches to move this to the core after this driver is in. I don't
> really want this driver get blocked on more dependencies.

Perfect. Yes, sorry for the delays, and I think most things look really
good, actually.

And I guess I wasn't clear: I'd only ask you to change the binding name
now, since we can't change that later; the code can be moved at a later
time, once the DT ABI is set. FWIW, there are other features that might
be useful alongside common NAND write-protect support. For instance, a
user might want to gain a little extra safety by having MTD bring WP#
low only when erasing/writing, so that most of the time, the flash is
protected. 

Brian
