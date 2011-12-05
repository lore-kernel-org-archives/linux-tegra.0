From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio/tegra: Dynamically allocate IRQ base, and
 support DT
Date: Mon, 5 Dec 2011 22:44:05 +0800
Message-ID: <20111205144404.GE2980@S2100-06.ap.freescale.net>
References: <1322700336-26866-1-git-send-email-swarren@nvidia.com>
 <1322700336-26866-2-git-send-email-swarren@nvidia.com>
 <20111205065527.GD2980@S2100-06.ap.freescale.net>
 <4EDCC894.7060200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EDCC894.7060200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 05, 2011 at 07:35:16AM -0600, Rob Herring wrote:
> Shawn,
> 
> On 12/05/2011 12:55 AM, Shawn Guo wrote:
> > On Wed, Nov 30, 2011 at 05:45:36PM -0700, Stephen Warren wrote:
> > [...]
> >>  static void tegra_gpio_irq_ack(struct irq_data *d)
> >>  {
> >> -	int gpio = d->irq - INT_GPIO_BASE;
> >> +	int gpio = d->hwirq;
> >>  
> > Though it's working right now, I'm not sure it's safe enough.  This
> > only works when d->hwirq_base is 0, which is true for now.  But I doubt
> > it will be always true.  I guess hwirq_base was introduced there for
> > some reason.  When some day irqdomain starts using this field, the
> > above code starts being broken.  IMO, the way that generic-chip.c is
> > using to calculate the number, d->irq - gc->irq_base, is much more
> > safer.
> 
> It does work as the GIC hwirq_base is non-zero. It was introduced
> exactly so that no conversion of hwirq is needed for functions like
> this. hwirq_base is the starting point local to the controller
> numbering. Say you have gpio controller with 16 lines, but only the
> upper 8 lines have interrupt capability. Then you would set hwirq_base
> to 8 and nr_irq to 8. Then hwirq will always be set to 8-15.
> 
Ah, ok.  In that case, it's safe to use.  Thanks for help understand
it.  I will use hwirq for my gpio-mxc patch then.

-- 
Regards,
Shawn
