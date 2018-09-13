From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Multi-parent IRQ domains
Date: Thu, 13 Sep 2018 14:50:21 -0700
Message-ID: <ea9261a9-2c4d-7ca4-6dca-73f385aa46d5@gmail.com>
References: <20180913155945.GA19903@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913155945.GA19903@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 09/13/18 08:59, Thierry Reding wrote:
> Hi everyone,
> 
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
> 
> The way I imagine this to work from a DT perspective is as follows:

There is an interrupts-extended property which as a first cell takes a
phandle to the parent interrupt controller, e.g:

interrupts-extended = <&gic 73 GIPC_SPI IRQ_TYPE_LEVEL_HIGH>,
			<&pmc 10>;

(provided that I understood your problem and example correctly). We have
a similar use case on our STB chips where we have "main" interrupts
wired to the ARM GIC and wake-up interrupts wired to a specific wake-up
interrupt controller in an always-on domain. The two controllers have a
different #interrupt-cells specifier.

The interrupt infrastructure in Linux already knows how to deal with
that and whether you use of_get_irq() or platform_get_irq() you should
obtain the correct virtual interrupt numbers that you expected, parented
to the appropriate interrupt controller.

Hope this helps.
-- 
Florian
