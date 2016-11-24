From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add Tegra186 support
Date: Thu, 24 Nov 2016 16:40:45 +0100
Message-ID: <CACRpkdbfaCSqcg0mRghC=V5C6v+zAUhWQkQ0RZmJFD+p2D3aLA@mail.gmail.com>
References: <20161122173042.GA3239@ulmo.ba.sec> <20161122175539.3897-1-thierry.reding@gmail.com>
 <CACRpkdYs3WoBPCiuuuka_DQz5KP0Sxc_wT57Zd3c4MF+9xH1+Q@mail.gmail.com> <20161123194423.GA26733@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161123194423.GA26733@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 23, 2016 at 8:44 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Nov 23, 2016 at 02:30:45PM +0100, Linus Walleij wrote:
>> On Tue, Nov 22, 2016 at 6:55 PM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>>
>> > From: Thierry Reding <treding@nvidia.com>
>> >
>> > Tegra186 has two GPIO controllers that are largely register compatible
>> > between one another but are completely different from the controller
>> > found on earlier generations.
>> >
>> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>>
>> I would prefer if you could try to convert this driver to use
>> CONFIG_GPIOLIB_IRQCHIP and install a chained interrupt
>> handler with gpiochip_irqchio_add() + gpiolib_set_chained_irqchip().
>> It would save us so much trouble and so much complicated
>> code to maintain for this custom irqdomain.
>>
>> I suggest you to look into the mechanisms mentioned in my
>> previous mail for how to poke holes in the single linear
>> irqdomain used by this mechanism.
>>
>> As it seems, you only have one parent interrupt with all
>> these IRQs cascading off it as far as I can tell.
>
> Like I said in other email, I don't think this will work because the
> GPIOLIB_IRQCHIP support seems to be limited to cases where a single
> parent interrupt is used. We could possibly live with a single IRQ
> handler and data, but we definitely need to request multiple IRQs if
> we want to be able to use all GPIOs as interrupts.

Sorry if I missed that.

Actually it works.

If you look at gpiochip_set_chained_irqchip() it just calls
irq_set_chained_handler_and_data() for the parent interrupt.

There is a loop afterwards that call irq_set_parent()
on all child IRQs but to the kernel this is just a noop I
never fully grasped that thing. Maybe it should even be deleted.
It just sets the parent in the irq descriptor, and the IRQ core only
ever use this on threaded interrupts, so maybe it should
really just be set on those (nested) interrupts.

Maybe Marc/tglx could shed some light on the intended
use of irq_set_parent() given that only two MFD drivers
and the gpiolib uses it. I think I need to dig into some
commitlogs.

If it is semantically required to call irq_set_parent() with the
right child/parent, we could add an
gpiochip_set_chained_irqchip_interval(first, last) to set the
parent for just an interval of the offsets.

Yours,
Linus Walleij
