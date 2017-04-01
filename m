From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Sat, 1 Apr 2017 19:46:24 +0200
Message-ID: <CACRpkdZBp1Q=J9QgwegcfqxmnDSjzYnJQg1t2UpbRkemo9aCWg@mail.gmail.com>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
 <CACRpkdZpev7op=4e7DwYfnRpNBPN6U_EXd6G3PqM-XQudLHqow@mail.gmail.com> <20170331145437.GA16964@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331145437.GA16964-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 31, 2017 at 4:54 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Mar 31, 2017 at 03:59:40PM +0200, Linus Walleij wrote:

> If I call this multiple times with different parent_irq parameters, then
> only the last one will be stored in gpiochip->irq_chained_parent. Later
> on, this is used to disconnect the chained handler and data upon GPIO
> chip removal, which means that handler and data for all but the last one
> end up dangling.

People are using this code already for chained handlers with several
parents.

I guess it works so nicely because gpiochips are often just added
and seldom removed.

Overall that means this is a bug and should be fixed, not that new
drivers should avoid using this approach, or that we should discourage
new drivers to use this API.

>>       /* Set the parent IRQ for all affected IRQs */
>>       for (offset = 0; offset < gpiochip->ngpio; offset++) {
>>               if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
>>                       continue;
>>               irq_set_parent(irq_find_mapping(gpiochip->irqdomain, offset),
>>                              parent_irq);
>>       }
>> }
>
> Similarly here, we'd be setting the parent IRQ of all associated GPIOs
> to the first, second... last parent IRQ. This is completely unnecessary
> work and it's also setting the wrong parent. Note that we don't actually
> care about that in the driver right now, but it's still wrong.

Is that a way of saying there are bugs in the gpiolib?

I know there are, maintainers working on core code are always
lacking. I wrote this code and I admit I make mistakes, please help
me fix them instead of trying to make this into a reason not to
use this code.

>> Why are you keeping the irqs around after requesting?
>> Use devm_*
>
> First I prefer to keep resource request and driver initialization
> separate because it makes error recovery more robust. So this is used to
> first store the results from platform_get_irq() and later on to iterate
> over when installing the chained handlers.

OK no big deal. But it could be in a local variable rather than
in the driver state container, right?

> Also, devm_* doesn't exist for irq_set_chained_handler_and_data(). So I
> need to keep these around in order to properly uninstall the handlers
> again on removal.

OK is this something that should be fixed in the irqchip code?

> Like I explained above, I don't think it works the way it is supposed to
> for this case. The armada-37xx patch that you linked to earlier seems to
> suffer from the same issues in that all but the last parent IRQ handlers
> will be left dangling after removal, which would cause the kernel to run
> non-existing code if by any chance the interrupts were to still fire for
> some reason.

Again, bugs is not a reason not to use library code. We need to fix
those bugs and centralize more, or we get too much strange code
to maintain.

Yours,
Linus Walleij
