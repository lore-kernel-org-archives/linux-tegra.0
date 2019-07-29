From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 2/4] gpio: allow customizing hierarchical IRQ chips
Date: Sun, 28 Jul 2019 20:11:51 -0400
Message-ID: <20190729001151.GA17127@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
 <20190708110138.24657-3-masneyb@onstation.org>
 <CACRpkdZn-czbOOTrRs5ZgR7qTtf2A4i_L4J8_vk+kJiBuAnikg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZn-czbOOTrRs5ZgR7qTtf2A4i_L4J8_vk+kJiBuAnikg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <treding@nvidia.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 29, 2019 at 12:49:55AM +0200, Linus Walleij wrote:
> On Mon, Jul 8, 2019 at 1:01 PM Brian Masney <masneyb@onstation.org> wrote:
> > +static void gpiochip_add_default_irq_domain_ops(struct irq_domain_ops *ops)
> > +{
> > +       if (!ops->activate)
> > +               ops->activate = gpiochip_irq_domain_activate;
> > +
> > +       if (!ops->deactivate)
> > +               ops->deactivate = gpiochip_irq_domain_deactivate;
> > +
> > +       if (!ops->translate)
> > +               ops->translate = gpiochip_hierarchy_irq_domain_translate;
> > +
> > +       if (!ops->alloc)
> > +               ops->alloc = gpiochip_hierarchy_irq_domain_alloc;
> > +
> > +       if (!ops->free)
> > +               ops->free = irq_domain_free_irqs_common;
> > +}
> 
> I'm fine with translate(), this seems to be what Lina needs too.
> 
> But do we really need to make them all optional? activate() and
> deactivate() will require the driver to lock the irq etc which is hairy.

I can't think of a reason right now that we'd need to override the
others. Since the structure was there, I made all of them optional to
try to future proof this a little bit.

It probably would be better to only make translate optional at this
point. If needed, someone can submit a patch for one or more of the
others with their use case.

Brian
