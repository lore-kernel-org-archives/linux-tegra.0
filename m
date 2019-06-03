From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Mon, 3 Jun 2019 19:30:19 +0200
Message-ID: <CACRpkdaiZEqLWYGoVLYTzWEc-hX10kT4bXqx3bUynBDcyStLjw@mail.gmail.com>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo> <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
 <20190603121227.GB30132@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603121227.GB30132@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 3, 2019 at 2:12 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> > On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > Me
> >
> > > > Please drop this. The default .to_irq() should be good for everyone.
> > > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > > .to_irq() which I suspect you indended to drop, actually.
> > >
> > > It's not actually identical to the gpiolib implementation. There's still
> > > the conversion to the non-linear DT representation for GPIO specifiers
> > > from the linear GPIO number space, which is not taken care of by the
> > > gpiolib variant. That's precisely the point why this patch makes it
> > > possible to let the driver override things.
> >
> > OK something is off here, because the purpose of the irqdomain
> > is exactly to translate between different number spaces, so it should
> > not happen in the .to_irq() function at all.
> >
> > Irqdomain uses .map() in the old variant and .translate() in the
> > hierarchical variant to do this, so something is skewed.
> >
> > All .to_irq() should ever do is just call the irqdomain to do the
> > translation, no other logic (unless I am mistaken) so we should
> > be able to keep the simple .to_irq() logic inside gpiolib.
>
> Well, that's exactly the problem that I'm trying to solve. The problem
> is that .translate() translates from the DT number space to the GPIO or
> IRQ number space. However, since gpiochip_to_irq() now wants to call the
> irq_create_fwspec_mapping() interface, it must convert from the offset
> (in GPIO space) into the DT number space, which is what that function
> expects.

It sounds a lot like you want to use the irqdomain APIs for
something they were not made for.

The irqdomain in general remaps from hwirqs to Linux irqs.

The hierarchical irqdomain 1-to-1 remaps hwirqs on interrupt
controller A to hwirqs on interrupt controller B, then to Linux irqs.

The DT number space is not normally any concern of the
irqdomain, and is not normally used to shape up that.

But how to do it is another question. Maybe making it
possible to override .translate() is what we need to do,
as you say.

That way .translate() can account for weirdness in the DT,
get the real hwirq out and proceed to translate as usual.

And then in the end the irqdomain .translate() is indeed
used to fix up weird DTs.... well. Hm this one is strange. :)

Yours,
Linus Walleij
