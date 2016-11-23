From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Wed, 23 Nov 2016 14:25:51 +0100
Message-ID: <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org> <20161122173042.GA3239@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161122173042.GA3239-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2016 at 6:30 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> So I don't really know how to go about merging both. I'll reply to this
> email later with a copy of the patch that I wrote, maybe we can take it
> from there.

I trust you nVidia people to sort this out.

I guess in worst case you can have a company strategy meeting about it.

Let me just say: when one of you have a patch that bears the ACK of the
other, I will merge it.

> However there's another problem with this patch. If you try and export
> a non-existing GPIO via sysfs and try to read the value file you can
> easily make the driver hang a CPU. This only seems to happen for the
> AON GPIO controller.

That sounds like a bug. But I strongly suggest you first and foremost
to test your code with the character device and not through sysfs.

sysfs is second priority, and while I don't want it to screw things up, it
is an optional legacy bolt-on not a compiled-in recommended thing.

The character device, on the other hand, is a recommended
practice for userspace GPIO.

> One way to solve this is to make a massive change to the GPIO subsystem
> to check for the validity of a GPIO before any access. I'm not sure if
> that's desirable, maybe Linus has some thoughts about that.

This is already possible and several drivers are doing this.

Everything, all kernel users and all character device users, end up
calling gpiod_request().

We agree violently that if this GPIO is not valid, inaccessible (etc)
it should not return a valid GPIO descriptor.

Consider drivers/gpio/gpio-stmpe.c which has a device tree property
"st,norequest-mask" that mark some GPIO lines as "nonusable".
This is because they are statically muxed for something else.

(It is a subject of debate whether that is a good way to mark the
lines as unusable, probably not, but it is legacy code.)

We know a number of lines are not elegible for request
or to be used for triggering interrupts.

The code does this in .request():

if (stmpe_gpio->norequest_mask & BIT(offset))
                return -EINVAL;

Thus any gpiod_get() will fail. And we are fine.

Further, since it can also be used as an interrupt parent, it
does this in .probe():

of_property_read_u32(np, "st,norequest-mask",
                 &stmpe_gpio->norequest_mask);

if (stmpe_gpio->norequest_mask)
         stmpe_gpio->chip.irq_need_valid_mask = true;
for (i = 0; i < sizeof(u32); i++)
         if (stmpe_gpio->norequest_mask & BIT(i))
                   clear_bit(i, stmpe_gpio->chip.irq_valid_mask);

How this blocks the IRQs from being requested can be seen
in the irqchip helpers in gpiolib.c. The common GPIOLIB_IRQCHIP
gracefully handles this too.

If the sysfs ABI does not block the use of the same lines
as efficiently, it is a bug in the sysfs code. This works fine
to block access for all in-kernel and chardev users.

But as far as I can tell, sysfs ALSO uses gpiod_get() so it should
work fine.

> If we stick with a compacted number space, there are two solutions that
> I can think of to remedy the sysfs problem. One would be to register a
> separate struct gpio_chip for each controller. That's kind of a sledge-
> hammer solution because it will create multiple number spaces and hence
> completely avoid the sparse number space for the whole controller. I
> think Stephen had originally proposed this as a solution.

Note ambigous use of "controller" above. I'm confused.

"One would be to register a separate struct gpio_chip for each controller."
/ "and hence completely avoid the sparse number space for the whole
controller."

Eheheh

It seems that "controller" refer to two different things in the two
sentences. Do you mean your hardware has ONE controller with
several BANKS? (as described in Documentation/gpio/driver.txt?)

> The other possibility would be for the GPIO subsystem to gain per-chip
> GPIO export via sysfs. That is, instead of the global export file that
> you write a global GPIO number to, each per-chip directory would get
> an export file.

No. The sysfs ABI is in
Documentation/ABI/obsolete/sysfs-gpio
for a reason: I hate it and it should not be extended whatsoever.

Use the new character device, and for a new SoC like the tegra186
you can CERTAINLY convince any downstream consumers to
switch to that.

Please just disable CONFIG_GPIO_SYSFS from your defconfig
and in any company-internal builds and point everyone and their
dog to the character device: tools/gpio/*,
and the UAPI <linux/gpio.h>

Yours,
Linus Walleij
