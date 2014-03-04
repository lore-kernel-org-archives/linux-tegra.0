From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/5] genirq: define flag IRQ_SRC_DST_INVERTED, and
 accessors
Date: Tue, 04 Mar 2014 08:57:15 -0700
Message-ID: <5315F7DB.6000700@wwwdotorg.org>
References: <1393876300-3061-1-git-send-email-swarren@wwwdotorg.org> <alpine.DEB.2.02.1403041018370.18573@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1403041018370.18573-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2014 03:04 AM, Thomas Gleixner wrote:
> On Mon, 3 Mar 2014, Stephen Warren wrote:
> 
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Some devices have configurable IRQ output polarities. Software might
>> use IRQ_TYPE_* to determine how to configure such a device's IRQ
>> output polarity in order to match how the IRQ controller input is
>> configured. If the board or SoC inverts the signal between the
>> device's IRQ output and controller's IRQ output, software must be
>> aware of this fact, in order to program the IRQ output to the correct
>> (i.e. opposite) polarity. This flag provides that information.
> 
> So what you're saying is:
> 
> Device IRQ output --> [Optional Inverter Logic] --> IRQ controller input.
> 
> And you're storing the information about the presence of the inverter
> logic in the irq itself, but the core does not make any use of it and
> you let the device driver deal with the outcome.
> 
> This sucks as all affected drivers have to implement the same sanity
> logic for this.
> 
> Why don't you implement a core function which tells the driver which
> polarity to select? That requires a few more changes, but I think it's
> worth it for other reasons.
> 
> Right now the set_type logic requires the irq chip drivers to
> implement sanity checking and default selections for TYPE_NONE. We can
> be more clever about that and add this information to the irq chip
> flags.

I don't see any such checking in drivers/irqchip/irq-gic.c; it rejects
any type other than IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING, and I
don't see any mention of TYPE_NONE in that file. Is the driver incomplete?

Instead of adding all this extra logic to the core, what do you think of
simply telling each driver that has a configurable interrupt output
polarity exactly which polarity to use. This information would come from
device tree or platform data. This is what I implemented in V1/V2 of
this series:

http://www.spinics.net/lists/devicetree/msg23648.html

Is that any better, or do you definitely want the IRQ core to manage this?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
