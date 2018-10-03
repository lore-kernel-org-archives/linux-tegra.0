From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/9] gpio: Add support for hierarchical IRQ domains
Date: Wed, 3 Oct 2018 09:52:16 +0200
Message-ID: <CACRpkdY8PnfrfPcD8Gusk-HeiCmVxdyB0GAsb9nvg3JYY3vpLQ@mail.gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <20180921102546.12745-7-thierry.reding@gmail.com> <CACRpkdYnrf7FknvnZyFSgfT5aCrcWT4hxSnQo0UqxYfR6Fkqwg@mail.gmail.com>
 <20180925093315.GB7097@ulmo> <CACRpkdbOpVPB5MqgCyF5x_ENzLscz5oYEstYqwVceqeKZq2w5g@mail.gmail.com>
 <20180925111716.GA7925@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925111716.GA7925@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 25, 2018 at 1:17 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Tue, Sep 25, 2018 at 12:33:54PM +0200, Linus Walleij wrote:
> > On Tue, Sep 25, 2018 at 11:33 AM Thierry Reding
> > <thierry.reding@gmail.com> wrote:
> > > On Tue, Sep 25, 2018 at 10:11:06AM +0200, Linus Walleij wrote:

> > As I see it there are some ways to go about this:
> >
> > 1. Create one gpiochip per bank and just register the number of
> > GPIOs actually accessible per bank offset from 0. This works
> > if one does not insist on having one gpiochip covering all pins,
> > and as long as all usable pins are stacked from offset 0..n.
> > (Tegra186 doesn't do this, it is registering one chip for all.)
> >
> > 2. If the above cannot be met, register enough pins to cover all
> > (e.g. 32 pins for a 32bit GPIO register) then mask off the
> > unused pins in .valid_mask in the gpio_chip. This was fairly
> > recently introduced to add ACPI support for Qualcomm, as
> > there were valid, but unusable GPIO offsets, but it can be
> > used to cut arbitrary holes in any range of offsets.
> >
> > 3. Some driver-specific way. Which seems to be what Tegra186
> > is doing.
> >
> > Would you consider to move over to using method (2) to
> > get a more linear numberspace? I.e. register 8 GPIOs/IRQs
> > per port/bank and then just mask off the invalid ones?
> > .valid_mask in gpio_chip can be used for the GPIOs and
> > .valid_mask in the gpio_irq_chip can be used for IRQs.
> >
> > Or do you think it is nonelegant?
>
> This is all pretty much the same discussion that I remember we had
> earlier this year. Nothing's changed so far.
>
> Back at the time I had pointed out that we'd be wasting a lot of memory
> by registering 8 GPIOs/IRQs per bank, because on average only about 60-
> 75% of the GPIOs are actually used. In addition we waste processing
> resources by having to check the GPIO offset against the valid mask
> every time we want to access a GPIO.
>
> I think that's inelegant, but from the rest of what you're saying you
> don't see it that way.

(...)

> > Sorry for being a pest, I just have a feeling we are reinventing
> > wheels here, I really want to pull as many fringe cases as
> > possible into gpiolib if I can so the maintenance gets
> > simpler.
>
> Like I said, we had this very discussion a couple of months ago, and I
> don't think I want to go through all of it again. I think, yes, I could
> make Tegra186 work with .valid_mask, even if I consider it wasteful. So
> if that's what you want, I'll go rewrite the driver so we'll never have
> to repeat this again.

Well, IMO rolling custom code into every driver that needs a
hierarchical interrupt is pretty inelegant too, so I guess it is one
of those choose the lesser evil situations for me as a maintainer.

I am very happy if this hairy hierarchical irqdomain handling can
be standardized and pushed into the core, and as it seems this
memory optimization stops that and forces a local solution with
some necessarilily different code, also for xlate since a while
back and now for the hierarchical irqdomain.

So if I let this pass then I will just be grumpy again the next
time another local kludge needs to be added.

I am worried that there will be more and more of this special
code just to account for the nonlinear blocks of GPIOs.

I agree memory footprint matters, as does performance,
as does maintainability and reuse. So it's not like there is
a hard factor determining this.

How much memory are we talking about for a tegra186, and
how much is that in proportion to how much memory a
typical tegra186 system has connected to it? If it is significant
and hurting the kernel and/or applications on that platform
I would agree we need to look into memory optimizations.

Yours,
Linus Walleij
