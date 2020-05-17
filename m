From: Peter Hutterer <peter.hutterer-Pf4JEFdB4epeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Mon, 18 May 2020 08:55:10 +1000
Message-ID: <20200517225510.GA205823@koala>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <842b95bb-8391-5806-fe65-be64b02de122-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2020 at 08:19:10PM +0200, Hans de Goede wrote:
> Hi Andrezj,
> 
> On 5/15/20 6:49 PM, Andrzej Pietrasiewicz wrote:
> > Userspace might want to implement a policy to temporarily disregard input
> > from certain devices, including not treating them as wakeup sources.
> > 
> > An example use case is a laptop, whose keyboard can be folded under the
> > screen to create tablet-like experience. The user then must hold the laptop
> > in such a way that it is difficult to avoid pressing the keyboard keys. It
> > is therefore desirable to temporarily disregard input from the keyboard,
> > until it is folded back. This obviously is a policy which should be kept
> > out of the kernel, but the kernel must provide suitable means to implement
> > such a policy.
> 
> Actually libinput already binds together (inside libinput) SW_TABLET_MODE
> generating evdev nodes and e.g. internal keyboards on devices with 360°
> hinges for this reason. libinput simply closes the /dev/input/event#
> node when folded and re-opens it when the keyboard should become active
> again. Thus not only suppresses events but allows e.g. touchpads to
> enter runtime suspend mode which saves power. Typically closing the
> /dev/input/event# node will also disable the device as wakeup source.
> 
> So I wonder what this series actually adds for functionality for
> userspace which can not already be achieved this way?

Thanks Hans. To expand on this:
libinput has heuristics to guess which input devices (keyboards, touchpads)
are built-in ones. When the tablet mode switch is on, we disable these
devices internally (this is not visible to callers), and re-enable it again
later when the tablet mode switch is off again.

This is done for keyboards and touchpads atm (and I think pointing sticks)
and where the heuristics fail we have extra quirks in place. For example
the Lenovo Yogas tend to disable the keyboard mechanically in tablet mode
but buttons (e.g. volume keys) around the screen send events through the
same event node. So on those devices we don't disable the keyboard.

We've had this code for a few years now and the only changes to it have been
the various device quirks for devices that must not suspend the keyboard,
it's otherwise working as expected.

If we ever have a device where we need to disable parts of the keyboard
only, we could address this with EVIOCSMASK but so far that hasn't been
necessary.

I agree with Hans, right now I don't see the usefulness of this new sysfs
toggle. For it to be really useful you'd have to guarantee that it's
available for 100% of the devices and that's IMO unlikely to happen.

Cheers,
   Peter

> I also noticed that you keep the device open (do not call the
> input_device's close callback) when inhibited and just throw away
> any events generated. This seems inefficient and may lead to
> the internal state getting out of sync. What if a key is pressed
> while inhibited and then the device is uninhibited while the key
> is still pressed?  Now the press event is lost and userspace
> querying the current state will see the pressed key as being
> released.
> 
> On top of this you add special inhibit and uninhibit callbacks
> and implement those for just a few devices. How do these differ
> from just closing the device and later opening it again ?
> 
> Also using a sysfs property for this is very weird given that the
> rest of the evdev interface is using ioctls for everything...
> 
> So all in all I see a lot of question marks here and I think we
> need to have a detailed discussion about what use-cases this
> series tries to enable before moving forward with this.
> 
> Regards,
> 
> Hans
> 
