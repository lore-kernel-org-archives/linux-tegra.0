From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Thu, 24 Nov 2016 16:08:08 +0100
Message-ID: <CACRpkdYEpenBbb9u=VPzu4eZOQutk4qP6h5T84=AKi73AJCQHw@mail.gmail.com>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org> <20161122173042.GA3239@ulmo.ba.sec>
 <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com> <20161123194036.GA25876@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123194036.GA25876-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2016 at 8:40 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Nov 23, 2016 at 02:25:51PM +0100, Linus Walleij wrote:

>> Everything, all kernel users and all character device users, end up
>> calling gpiod_request().
>
> It looks like I stumbled across the only case where this isn't true.
> What I was seeing, and which ultimately led me to implement the compact
> numberspace is that gpiochip_add_data() calls ->get_direction() directly
> without first going through ->request(). We'd have to guard that one
> case as well in order for this to work.

Hm. So there are two ways we could address that:

- Make irq_valid_mask a pure .valid_mask so we can mask off
  gpios not just for IRQs but for anything, if this is consistent
  with what Mika needs or

- Make the .get_direction() callback return -EINVAL or whatever
  for the non-available lines, exactly how .request() does it,
  and manage that in the core when looping over them to get
  the direction in the gpiochip_add() call.

>> How this blocks the IRQs from being requested can be seen
>> in the irqchip helpers in gpiolib.c. The common GPIOLIB_IRQCHIP
>> gracefully handles this too.
>
> I don't think it does. The issue I mentioned for gpiochip_add_data()
> exists in gpiochip_lock_as_irq(). That code assumes that all GPIOs from
> 0 to chip.ngpio - 1 are valid.

It shouldn't matter since we should deny these to be even
mapped as IRQs before the irqchip callbacks for requesting
resources are called so it's not happening. This is happening
with GPIOLIB_IRQCHIP.

> Each hardware block also implements a number of "ports": 8 for AON and
> 23 for main. Each of these ports has a different number of pins. Often
> there will be 6, 7 or 8, but a couple of ports have as little as a
> single pin.

What a maze. I would be happy if all this weirdness resides
in the device driver ;)

> Each port is associated with a given "controller", that is
> interrupt, so when a GPIO of a port is configured as input and enabled
> to generate an interrupt, the interrupt of it's parent controller will
> be asserted. I'm not exactly sure how this association is done, I have
> not found anything in the TRM.

Is nVidia one of those throw-over-the-wall engineering companies
where hardware engineers toss a chip over the wall to the software
developers and don't expect them to ask any questions?

I'm asking since there are so many nVidia people on this thread.

I would normally expect that you could simply go and ask the
hardware people?

>> It seems that "controller" refer to two different things in the two
>> sentences. Do you mean your hardware has ONE controller with
>> several BANKS? (as described in Documentation/gpio/driver.txt?)
>
> I hope the above clarifies things. struct gpio_chip represents the
> entire hardware block (in current drivers) and the driver deals with
> individual controllers and ports internally. The proposal I was talking
> about above is to have one driver create multiple struct gpio_chip, each
> representing an individual port. Hence each struct gpio_chip would be
> assigned the exact number of pins that the port supports, removing all
> of the problems with numberspaces. It has its own set of disadvantages,
> such as creating a large number of GPIO chips, which may in the end be
> just as confusing as the current implementation.

I have a soft preference toward making one chip for each port/bank.

But it is not strong.

That opionon is stronger if the port/bank has resources such as a
clock, power supply or IRQ line. Then it tends toward mandatory
to have a gpio_chip for each.

>> Use the new character device, and for a new SoC like the tegra186
>> you can CERTAINLY convince any downstream consumers to
>> switch to that.
>
> I've looked a little at the character device implementation and I think
> it would work equally bad with the compact numberspace as sysfs. The
> reason is that gpiolib doesn't allow remapping of chip-relative indices
> except for DT. I think this might be possible by generalizing the
> ->of_xlate() to be used in translating internal numbers as well. The way
> I could imagine this to work is that an IOCTL providing offsets of the
> lines to use would pass the offsets through the chip's ->xlate()
> function to retrieve the index (0 to chip->ngpio). The alternative is to
> stick with the sparse numberspace and deal with non-existing GPIOs via a
> ->request() callback.

I don't understand. Userspace should have no concern about the
numberspace. Lines can be named from DT or ACPI so you can
look up line chip+offset from the names.

Further sysfs sys/bus/gpio (notice: NOT /sys/class/gpio !)
contains topological information, that is the approach taken by
userspace helpers such as udev.

>> Please just disable CONFIG_GPIO_SYSFS from your defconfig
>> and in any company-internal builds and point everyone and their
>> dog to the character device: tools/gpio/*,
>> and the UAPI <linux/gpio.h>
>
> I don't think we can easily do that. People may still rely on the sysfs
> interface, or even if they aren't this might be enabled in a multi-
> platform image.

Good suggestion. I will go and look at the upstream multiplatform
configs and eradicate this.

> So I think regardless of whether or not we like the
> interface, we have to make sure that our solution plays nicely with it.

I would be concerned if you are designing your driver around the
the way the legacy sysfs happens to work.

The thing is broken. Don't design FOR it.

You are making me tempted to require that for new hardware the
driver has to

   depends on !GPIO_SYSFS

In order to make this a non-argument.

Well it would be undiplomatic on my part I guess. But I have to
encourage/nudge a switch somehow.

> There is no problem with the compact numberspace, though it comes with
> the inconvenience that numbering in sysfs is different from numbering in
> DT.

That is fixed in the chardev ABI. Offset on the chardev is the same
as the internal offset of gpio_chip, and therefore the same as used
when doing xlate in the DT for a chip, i.e. the DT offset numbering.

>   1) use a sparse numberspace and deal with non-existing GPIOs via the
>      ->request() callback
>
>   2) use a compact numberspace and live with separate methods of
>      referencing GPIOs
>
>   3) use a compact numberspace and introduce a mechanism to translate
>      all hardware numbers into per-chip indices
>
> I think 1) is the simplest, but at the cost of wasting memory and CPU
> cycles by maintaining descriptors for GPIOs we know don't exist.

You could make a quick calculation of how much that is actually.
I doubt it matters for a contemporary non-IoT platform, but I may
be wrong.

> 2) is
> fairly simple as well, but it's pretty inconvenient for the user. The
> most invasive solution would be

Inconvenient to in-kernel users or userspace users?

Inconvenient to sysfs users or chardev users?

If it is invonvenient to sysfs users is of no concern, as long
as it is no broken.

> 3), though I personally like that best
> because it is the most explicit. It does have the disavantage of using
> separate numbering for sysfs and everyone else, though. Unless you're
> willing to make sysfs use per-chip export/unexport files and the
> ->xlate() callback.

I don't know if I even understand (3).

Consistency in the sysfs ABI does not concern me. It is inherently
inconsistent already. It will be consistently messy for this hardware,
but it shouldn't be used.

Yours,
Linus Walleij
