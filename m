From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Multi-parent IRQ domains
Date: Mon, 17 Sep 2018 14:28:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809171358070.16580@nanos.tec.linutronix.de>
References: <20180913155945.GA19903@ulmo> <alpine.DEB.2.21.1809141211200.1473@nanos.tec.linutronix.de> <20180917095222.GA27927@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917095222.GA27927@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 17 Sep 2018, Thierry Reding wrote:
> On Fri, Sep 14, 2018 at 12:31:18PM +0200, Thomas Gleixner wrote:
> > Now, you need the PMC for both, the GPIOs and the RTC. What you can do here
> > is to provide two irq domains in PMC. One which has GIC as its parent and
> > one which has no parent. Surely they need to share some resources, but
> > that should be a solvable problem.
> 
> I think I have this working to some degree, finally. GPIO is still
> proving difficult, but RTC seems to be working fine. I've currently
> solved this by making the PMC an interrupt controller and then have
> an interrupt-map property in its device tree node that lists those
> wake events that we're interested in. It looks something like this:
> 
> 	pmc: pmc@c360000 {
> 		compatible = "nvidia,tegra194-pmc";
> 		reg = <0x0c360000 0x10000>,
> 		      <0x0c370000 0x10000>,
> 		      <0x0c380000 0x10000>,
> 		      <0x0c390000 0x10000>,
> 		      <0x0c3a0000 0x10000>;
> 		reg-names = "pmc", "wake", "aotag", "scratch", "misc";
> 
> 		#interrupt-cells = <1>;
> 		interrupt-controller;
> 
> 		interrupt-map = /*<29 &gpio_aon TEGRA194_AON_GPIO(EE, 4)
> 					      IRQ_TYPE_LEVEL_HIGH>,*/
> 				<73 &gic GIC_SPI 10
> 					 IRQ_TYPE_LEVEL_HIGH>;
> 	};
> 
> Note that I've commented out the GPIO wake event (this is for the power
> button) because that currently crashes in the GPIO driver, probably
> because I misunderstood how to properly implement this.

I'm not a DT wizerd, but the GPIO cannot be linked there I think.

    RTC ---------------------------> [ PMC domain 1] -----> GIC

    Button --> [GPIO domain] ------> [ PMC domain 2]

The RTC is connected to PMC domain 1 and that allocates the GIC irq.

The button is conntected to the GPIO which connect to the PMC domain
2. That PMC domain has no connection to anything. It ends there.

> When I use the above code on the PMC/GPIO domain, then I see crashes
> because the GPIO controller doesn't implement things like the ->alloc()
> callback for its IRQ domain. But perhaps this is what I misunderstand.
> Are you saying that for the case of GPIO I can just *not* pass through
> all other operations and just let them be NULL? So that the only
> callback will be ->irq_set_wake()? What I don't quite understand is how
> the IRQ code would know how to properly set up the GPIO interrupt in
> that case.

Let's look at the PMC level first:

  The PMC has a fixed number of interrupts which are avail

  domain 1:

       That domain is used for interrupts which have a dedicated GIC
       interrupt line, e.g. the RTC

       The interrupt domain needs at least:

       alloc		= pmc_domain1_alloc

       The interrupt chip has:

       irq_mask		= irq_chip_mask_parent
       irq_unmask	= irq_chip_unmask_parent
       irq_eoi		= irq_chip_eoi_parent
       irq_set_affinity	= irq_chip_set_affinity_parent
       irq_set_type	= irq_chip_set_type_parent
       irq_set_wake	= pmc_set_wake

  domain 2:

       That domain is used for interrupts which are not related to the GIC
       directly, e.g. GPIO

       The interrupt domain needs at least:

       alloc		= pmc_domain2_alloc
       
       The interrupt chip has:

       irq_set_wake	= pmc_set_wake


Now the GPIO domain builds on top of PMC domain2

    	i.e. the parent of the GPIO domain is PMC domain2, which means that
    	it's part of a hierarchy and therefore needs an alloc function in
    	the domain ops.

	The GPIO irq chip gains one extra callback:

       	irq_set_wake	= irq_chip_set_wake_parent,


So, I don't know how GPIOs are mapped into the PMC when they are a wakeup
source. It might be all of them have the ability so there is some 1:1
relation ship or if the whole GPIO -> PMC connection can be built at run
time, but that's just an implementation detail.

Thanks,

	tglx
