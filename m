From: Rob Herring <robherring2@gmail.com>
Subject: Re: How to represent active low ARM GIC interrupts,
 enabled by external inverter?
Date: Mon, 23 Jan 2012 17:48:27 -0600
Message-ID: <4F1DF1CB.20707@gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178CB81BA2@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB81BA2@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "Thomas Gleixner (tglx@linutronix.de)" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: linux-tegra@vger.kernel.org

On 01/23/2012 03:18 PM, Stephen Warren wrote:
> I'd like guidance on how to model one aspect of Tegra's interrupt
> structure.
> 
> Tegra has an interrupt input pin for use by a PMU chip.
> 
> The PMC HW module within Tegra can optionally invert this signal, but
> otherwise has no control over it; no interrupt status bits, no masking,
> etc.
> 
> The (potentially inverted) signal is then fed into the ARM GIC, which
> supports level high or rising edge interrupts only.
> 
> So my question is: How to model this.
> 
> I assume the best thing to do is have the PMC be an explicit irq_chip,
> and have its .set_type op configure the inversion based on whether
> its interrupt source requests low or high, and allow either level or
> edge.
> 
> However, the irq_chip for the PMC couldn't implement any mask or shutdown
> operation. Is it acceptable to simple provide dummy/no-op functions in
> that case? I see that kernel/irq/dummychip.c does exactly that, but I'm
> not sure what use-cases that file is supposed to cover.
> 
> That'd result in something like this for device tree:
> 
> / {
>     intc: interrupt-controller@50041000 {
>         compatible = "arm,cortex-a9-gic";
>         /* reg and other properties omitted for brevity throughout */
>         interrupt-controller;
>         /* 
>          * cell 0, 1: interrupt type/ID
>          * cell 2: Linux IRQ flags
>          */
>         #interrupt-cells = <3>;
>     };
>     interrupt-parent = <&intc>;
> 
>     pmc: interrupt-controller@7000e400 {
>         compatible = "nvidia,tegra20-pmc";
>         interrupt-controller;
>         /* 
>          * cell 0: interrupt ID (always 0; should we omit this field?)
>          * cell 1: 0=no invert, 1=invert
>          */
>         #interrupt-cells = <2>;
>         /*
>          * Always high. Level or edge of the PMU interrupt output must be
>          * configured here. Or, should it somehow be passed through from
>          * the PMU's client's interrupt specifier?
>          */
>         interrupts = <0 88 0x04>;
>     };
> 
>     i2c@7000c000 {
>         compatible = "nvidia,tegra20-i2c";
> 
>         pmu@xxx {
>             interrupt-parent = <&pmc>;
>             interrupts = <0 1>;
>         }
>     };
> };
> 
> Does that look reasonable?
> 
> Other alternatives:
> 
> 1) Don't hook the PMC driver and binding into the interrupt tree, but
> simply have a property that controls the inversion of the signal.
> The disadvantage is that the PMU's interrupt specifier would need to
> always specify active high even if it was really active low with inversion
> activated in the PMC.

I think i would go this route considering it's only a single interrupt
line and probably just a couple of lines of code to set a bit if a
property is present.

Rob

> 2) Modify the ARM GIC's driver to allow active low interrupts, and call
> some plugin code to request any required inversion. Most platforms
> wouldn't provide such a plugin, and hence would still disallow such
> requests. The disadvantage here is that it complicates the cross-SoC
> GIC driver with something that may only be useful for Tegra.
> 
> Thanks.
> 
