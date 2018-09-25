From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/9] gpio: Add support for hierarchical IRQ domains
Date: Tue, 25 Sep 2018 12:33:54 +0200
Message-ID: <CACRpkdbOpVPB5MqgCyF5x_ENzLscz5oYEstYqwVceqeKZq2w5g@mail.gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-7-thierry.reding@gmail.com> <CACRpkdYnrf7FknvnZyFSgfT5aCrcWT4hxSnQo0UqxYfR6Fkqwg@mail.gmail.com>
 <20180925093315.GB7097@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925093315.GB7097@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 25, 2018 at 11:33 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Tue, Sep 25, 2018 at 10:11:06AM +0200, Linus Walleij wrote:

> > While I think it is really important that we start supporting hierarchical
> > irqdomains in the gpiolib core, I want a more complete approach,
> > so that drivers that need hierarchical handling of irqdomains
> > can get the same support from gpiolib as they get for simple
> > domains.
(...)
> > I can't see if you need to pull more stuff into the core to accomplish
> > that, but I think in essence the core gpiolib needs to be more helpful
> > with hierarchies.
>
> This is not as trivial as it sounds. I think we could probably provide a
> simple helper in the core that may work for the majority of GPIO
> controllers, and would be similar to irq_domain_xlate_twocell(). The
> problem is that ->gpio_to_irq() effectively needs to convert the offset
> of the pin in the GPIO controller to an IRQ specifier. If the IRQ domain
> can use irq_domain_xlate_twocell(), that should be easy, but if it does
> not, then we likely need a custom implementation as well.

This sounds a lot like the "gpio-ranges" we have in the
gpiochip DT bindings, mapping gpio offsets to pin offsets.

I assume that we could just introduce a cross-mapping
array from IRQ to IRQ in struct gpio_irq_chip for the
hierarchical irqchip? Is it any
more complicated than an array of [(int, int)] tuples?

I guess this is what you have in mind for twocell?

> For example, as you may remember, the Tegra186 GPIO controller is
> somewhat quirky in that it has a number of banks, each of which can have
> any number of pins up to 8. However, in order to prevent users from
> attempting to use one of the non-existent GPIOs, we resorted to
> compacting the GPIO number space so that the GPIO specifier uses
> basically a (bank, pin) pair that is converted into a GPIO offset. The
> same is done for interrupt specifiers.

I guess this stuff is what you refer to?

#define TEGRA_MAIN_GPIO_PORT(port, base, count, controller)     \
        [TEGRA_MAIN_GPIO_PORT_##port] = {                       \
                .name = #port,                                  \
                .offset = base,                                 \
                .pins = count,                                  \
                .irq = controller,                              \
        }

static const struct tegra_gpio_port tegra186_main_ports[] = {
        TEGRA_MAIN_GPIO_PORT( A, 0x2000, 7, 2),
        TEGRA_MAIN_GPIO_PORT( B, 0x3000, 7, 3),
        TEGRA_MAIN_GPIO_PORT( C, 0x3200, 7, 3),
        TEGRA_MAIN_GPIO_PORT( D, 0x3400, 6, 3),
(...)

Maybe things have changed slightly.

As I see it there are some ways to go about this:

1. Create one gpiochip per bank and just register the number of
GPIOs actually accessible per bank offset from 0. This works
if one does not insist on having one gpiochip covering all pins,
and as long as all usable pins are stacked from offset 0..n.
(Tegra186 doesn't do this, it is registering one chip for all.)

2. If the above cannot be met, register enough pins to cover all
(e.g. 32 pins for a 32bit GPIO register) then mask off the
unused pins in .valid_mask in the gpio_chip. This was fairly
recently introduced to add ACPI support for Qualcomm, as
there were valid, but unusable GPIO offsets, but it can be
used to cut arbitrary holes in any range of offsets.

3. Some driver-specific way. Which seems to be what Tegra186
is doing.

Would you consider to move over to using method (2) to
get a more linear numberspace? I.e. register 8 GPIOs/IRQs
per port/bank and then just mask off the invalid ones?
.valid_mask in gpio_chip can be used for the GPIOs and
.valid_mask in the gpio_irq_chip can be used for IRQs.

Or do you think it is nonelegant?

> Since there is no 1:1 relationship between the value in the specifier
> and the GPIO offset, we can't use irq_domain_xlate_twocell().

Am I right that if you switch to method (2) above this is solved
and we get rid of the custom tegra186 xlate function == big win?

> I think we can probably just implement the simple two-cell version in
> gpiochip_to_irq() directly and leave it up to drivers that require
> something more to override ->to_irq().

And if what I assume (in my naive thinking) you can do with
.valid_mask is correct, then you can convert tegra186 to use
common twocell translation.

Sorry for being a pest, I just have a feeling we are reinventing
wheels here, I really want to pull as many fringe cases as
possible into gpiolib if I can so the maintenance gets
simpler.

Yours,
Linus Walleij
