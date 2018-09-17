From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Multi-parent IRQ domains
Date: Mon, 17 Sep 2018 15:27:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809171510020.16580@nanos.tec.linutronix.de>
References: <20180913155945.GA19903@ulmo> <alpine.DEB.2.21.1809141211200.1473@nanos.tec.linutronix.de> <20180917095222.GA27927@ulmo> <alpine.DEB.2.21.1809171358070.16580@nanos.tec.linutronix.de> <20180917130712.GC27927@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180917130712.GC27927@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 17 Sep 2018, Thierry Reding wrote:
> On Mon, Sep 17, 2018 at 02:28:01PM +0200, Thomas Gleixner wrote:
> > I'm not a DT wizerd, but the GPIO cannot be linked there I think.
> > 
> >     RTC ---------------------------> [ PMC domain 1] -----> GIC
> > 
> >     Button --> [GPIO domain] ------> [ PMC domain 2]
> > 
> > The RTC is connected to PMC domain 1 and that allocates the GIC irq.
> > 
> > The button is conntected to the GPIO which connect to the PMC domain
> > 2. That PMC domain has no connection to anything. It ends there.
> 
> Interesting, I was assuming the following:
> 
>     Button --> [PMC domain 2] --> [GPIO domain]
> 
> based on the hardware documentation that maps the wake events to
> specific signals on the chip.

That might be, but there is no reason why we can't interpret that
creatively :)

> > So, I don't know how GPIOs are mapped into the PMC when they are a wakeup
> > source. It might be all of them have the ability so there is some 1:1
> > relation ship or if the whole GPIO -> PMC connection can be built at run
> > time, but that's just an implementation detail.
> 
> There's a fixed mapping for which signals go to which wake event. Some
> of those events are mapped to GPIOs, others to different signals, such
> as the RTC alarm. I think I should be able to build a GPIO -> PMC map
> at runtime using a static table.

Ok, so for the RTC and the like (which are directly GIC backed) it's easy
as you just say: RTC interrupt = PMC irq #N.

And for GPIO you can just have the GPIO domains all parented by the PMC
domain 2 and then have the allocation function of the PMC domain do the
lookup of the GPIOs which actually have a PMC connection.

If it's there then you set the hwirq in the domains irq_data to the real
PMC hwirq number and for those which are not connected you set it to some
invalid value. In the set_type() callback you can then error out when it's
called for a GPIO which is not connected to the PMC by checking the hwirq
value.

That way the GPIO code does not have any requirement to know about the PMC
connections and only the PMC domain 2 needs to know. So if in the next chip
the GPIO/PMC association changes, you don't have to worry about it at the
GPIO (driver) level, you just hand a different GPIO/PMC map to the PMC
driver via DT.

Thanks,

	tglx
