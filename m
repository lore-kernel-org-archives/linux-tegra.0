From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Multi-parent IRQ domains
Date: Fri, 14 Sep 2018 12:31:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809141211200.1473@nanos.tec.linutronix.de>
References: <20180913155945.GA19903@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913155945.GA19903@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, 13 Sep 2018, Thierry Reding wrote:
> I've been trying to implement a feature on recent Tegra chips that's
> called "wake events". These wake events are implemented as part of the
> power management controller (PMC) and they control which events can be
> used to wake the system from suspend. Events include things like an
> alarm interrupt from an RTC, or the GPIO interrupt hooked up to a
> power button for example.
> 
> We already have a driver for a couple of other things that the PMC does,
> so I thought it'd be natural to implement this functionality as an IRQ
> chip in the PMC driver. The way that this would work is that for all the
> devices that are wakeup sources, we'd end up specifying the PMC as the
> interrupt parent and the PMC would then itself have the main GIC as its
> parent. That way, the hierarchical IRQ domain infrastructure would take
> care of pretty much everything.
> 
> Unfortunately I've run into some issues here. One problem that I'm
> facing is that PMC could have more than one parent. For example, the RTC
> alarm interrupt goes straight to the GIC, but the power button GPIO goes
> through the GPIO controller first and then to the GIC. This doesn't seem
> to be something that's currently possible.

So what you are saying is that the RTC is directly wired up to the GIC and
the GPIO interrupts are demultiplxed by a single GIC interrupt first, but
at the same time have the requirement to talk to the PMC.

Lets look at the current implementation without taking PMC into account.

- RTC gets its interrupt directly from the GIC domain

- GPIO gets its interrupt from the GPIO domain. The GPIO domain does not
  have a parent domain. It is stand alone because it sets up a demultiplex
  interrupt from the GIC domain.

  So there is absolutely no irqdomain relationship between a single GPIO
  and the GIC. The indirection through the demultiplex interrupt does not
  create one, really.

Now, you need the PMC for both, the GPIOs and the RTC. What you can do here
is to provide two irq domains in PMC. One which has GIC as its parent and
one which has no parent. Surely they need to share some resources, but
that should be a solvable problem.

Now you connect RTC to the GIC parented one and let the PMC irq chip just
hand through, except for the set_wake() functionality.

The GPIO domain is connected to the parentless PMC domain and the irq chip
merily provides the set_wake() stuff and everything else is a noop.

So GPIO ends up as a hierarchy which is still not connected to the GIC
directly.

Hmm?

Thanks,

	tglx
