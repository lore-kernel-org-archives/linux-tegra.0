From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Potential issue with GPIO/IRQ flags
Date: Wed, 16 Sep 2015 20:26:02 -0500
Message-ID: <CAL_JsqKSfx4y_3VGhP5mR1-NJB0cJw5JLjhUk3hs92jM=usHPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andreas Fenkart <afenkart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2015 at 4:07 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
> Hello all,
>
> I've noticed that in a few DT bindings GPIO_ACTIVE_* defines are
> incorrectly used as interrupt flags. GPIO_ACTIVE_*'s are defined
> in:
>
> include/dt-bindings/gpio/gpio.h
>
> and are used to describe GPIO pins. IRQ types are defined in:
>
> include/dt-bindings/interrupt-controller/irq.h
>
> and are flags for IRQ pins.

It is perfectly valid for the meaning of the field to be defined by
the interrupt controller, and gpio interrupts could do something
different. We've tried to standardize this though.

> These seem to have been mixed up in a few places, take for example:
> arch/arm/boot/dts/tegra124-jetson-tk1.dts. On line 1393 we see the
> correct usage, but just before on line 1384 we see the issue.
> GPIO_ACTIVE_HIGH is defined as 0, the same as IRQ_TYPE_NONE. If
> this IRQ was not hard-coded with the correct edge in the driver
> this would not work. What the author probably wanted was
> IRQ_TYPE_LEVEL_HIGH.
>
> Now lets look at commit c21e678b256b, in this the IRQ flags did not
> matter as the correct flag was hard-coded (IRQF_TRIGGER_LOW), this
> patch moves this to the DT, but changed the flag to GPIO_ACTIVE_LOW
> instead of the desired IRQ_TYPE_LEVEL_LOW. GPIO_ACTIVE_LOW is defined
> as 1, or IRQ_TYPE_EDGE_RISING in IRQ flags, which is not the
> equivalent to IRQF_TRIGGER_LOW the author was probably looking for.
>
> A quick grep (git grep "interrupt.*GPIO_ACTIVE_") shows several more
> instances of this. I found this by using one of these files as an
> example and giving myself a lot of problems, so I would like to fix
> this before it spreads anymore.
>
> I have a couple of ideas of how to go at this, first would be to
> just replace the incorrect flags with what was intended, but for
> some of these I don't know what was intended and do not have the
> board to test.
>
> My other solution would be to just change all instances of the GPIO
> flags to their value corresponding IRQ flags:
>
> - interrupts = <11 GPIO_ACTIVE_LOW>;
> + interrupts = <11 IRQ_TYPE_EDGE_RISING>;
>
> this would not make any functional change as the defines would
> still evaluate to the same value, but would make it obvious where
> a problem may be and that they should probably be checked and
> corrected, maybe we could even put a comment after:
>
> - interrupts = <11 GPIO_ACTIVE_LOW>;
> + interrupts = <11 IRQ_TYPE_EDGE_RISING>; // FIXME: Check IRQ type
>
> Well, what do you think?

This seems fine. It is no less wrong.

Rob
