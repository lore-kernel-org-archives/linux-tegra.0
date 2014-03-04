From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH V3 1/5] genirq: define flag IRQ_SRC_DST_INVERTED, and
 accessors
Date: Tue, 4 Mar 2014 11:04:55 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403041018370.18573@ionos.tec.linutronix.de>
References: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393876300-3061-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 3 Mar 2014, Stephen Warren wrote:

> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Some devices have configurable IRQ output polarities. Software might
> use IRQ_TYPE_* to determine how to configure such a device's IRQ
> output polarity in order to match how the IRQ controller input is
> configured. If the board or SoC inverts the signal between the
> device's IRQ output and controller's IRQ output, software must be
> aware of this fact, in order to program the IRQ output to the correct
> (i.e. opposite) polarity. This flag provides that information.

So what you're saying is:

Device IRQ output --> [Optional Inverter Logic] --> IRQ controller input.

And you're storing the information about the presence of the inverter
logic in the irq itself, but the core does not make any use of it and
you let the device driver deal with the outcome.

This sucks as all affected drivers have to implement the same sanity
logic for this.

Why don't you implement a core function which tells the driver which
polarity to select? That requires a few more changes, but I think it's
worth it for other reasons.

Right now the set_type logic requires the irq chip drivers to
implement sanity checking and default selections for TYPE_NONE. We can
be more clever about that and add this information to the irq chip
flags.

enum {
     IRQ_CHIP_TYPES_MASK	= 0x0f,
     IRQ_CHIP_DEFAULT_MASK	= 0xf0,
     IRQ_CHIP_EXISTING_FLAGS	....
}

Now the irq_chip setup tells the core which types are available and
which one is the default fallback for TYPE_NONE.

So the core can do the sanity checks and we can kill quite some
repeated stuff from the irq chip implementations. For the inverted
logic case you can handle the inversion in the core as well, i.e. if a
driver requests IRQ_TYPE_LEVEL_HIGH you select IRQ_TYPE_LEVEL_LOW for
the chip, if possible.

For the case where the irq chip can only handle a single polarity you
can provide a core function to figure out to which polarity the driver
should set the device IRQ output line.

int irq_get_device_irq_polarity(int irq, int device_types)
{
	/*
	 * Handle the inversion logic and select a proper
	 * device irq polarity from irq_chip(@irq)->flags and
	 * @device_types.
	 *
	 * Return a proper error code if no match.
	 */
}

Let's look at an example:

      irq_chip.flags = IRQ_TYPE_LEVEL_HIGH;
      device_types = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;

Now for the non inverted case, this returns IRQ_TYPE_LEVEL_HIGH, for
the inverted case it returns IRQ_TYPE_LEVEL_LOW.

In both cases the irq_set_type() logic handles this correctly:

Non-Inverted case:
  	     irq_set_type(irq, IRQ_TYPE_LEVEL_HIGH);
	     -> Success

Inverted case:
  	     irq_set_type(irq, IRQ_TYPE_LEVEL_LOW);
	     invert -> IRQ_TYPE_LEVEL_HIGH
	     -> Success

To make this work for interrupt chips which have no set_type callback
we can do the following in irq_set_type():

       if (irq_is_inverted(irq))
	  type = invert(type);

       ret = irq_check_type(chip, &type);
       if (ret < 0 || !chip->irq_settype)
	  return ret;

       return chip->irq_settype();

And irq_check_type() does:

       if (!(chip->flags & IRQ_CHIP_TYPES_MASK))
       	  return chip->irq_settype ? 0 : -ENOTSUP;

       if (*type == IRQ_TYPE_NONE)
       	  *type == (chip->flags & IRQ_CHIP_DEFAULT_MASK) >> 4;
	
       return type_supported(chip->flags, *type);

Thanks,

	tglx
       	  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
