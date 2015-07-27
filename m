From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [Patch v3 2/5] mtd: nand: add NVIDIA Tegra NAND Flash
 controller driver
Date: Mon, 27 Jul 2015 21:19:57 +0200
Message-ID: <1438024797.2313.11.camel@lynxeye.de>
References: <1431282602-7137-1-git-send-email-dev@lynxeye.de>
	 <1431282602-7137-3-git-send-email-dev@lynxeye.de>
	 <20150721212710.GN24125@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150721212710.GN24125-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 21.07.2015, 14:27 -0700 schrieb Brian Norris:

[...]
> 
> > +		return 0;
> > +	}
> > +
> > +	if (value & DEC_STATUS_ERR_COUNT_MASK) {
> > +		value = (value & DEC_STATUS_ERR_COUNT_MASK) >>
> > +			DEC_STATUS_ERR_COUNT_SHIFT;
> 
> What does this ERR_COUNT represent? The total bitflips seen in this
> page? The max seen per ECC region? Or something else?
> 
> > +		mtd->ecc_stats.corrected += value;
> 
> I ask because this ^^^ should be accounting the total bitflips for the
> page, if possible...
> 
> > +		return value;
> 
> ...and this ^^^ should be returning the max bitflips seen in a single
> correction region (see the mtd_read() API). There is a subtle
> difference.
> 
I've checked this again and unfortunately the DEC_STATUS_ERR_COUNT seems
to be completely bogus. It is certainly only set when there are
bitflips, but it doesn't represent a valid value.

I have another register that seems to accurately reflect the maximum
number of bitflips in any of the 512b ECC blocks, so I'm able to return
the correct amount of bitflips to the upper level.
The downside is that the hardware already does the calculation of max
bitflips, so I'm unable to count bitflips correctly for the stats. All I
can do is to return a pessimistic value that assumes that all 512b
blocks had the returned number of bitflips. Could this be a problem?

Regards,
Lucas
