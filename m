From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: How to represent active low ARM GIC interrupts, enabled by external
 inverter?
Date: Mon, 23 Jan 2012 13:18:50 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178CB81BA2@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Thomas Gleixner (tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org)" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I'd like guidance on how to model one aspect of Tegra's interrupt
structure.

Tegra has an interrupt input pin for use by a PMU chip.

The PMC HW module within Tegra can optionally invert this signal, but
otherwise has no control over it; no interrupt status bits, no masking,
etc.

The (potentially inverted) signal is then fed into the ARM GIC, which
supports level high or rising edge interrupts only.

So my question is: How to model this.

I assume the best thing to do is have the PMC be an explicit irq_chip,
and have its .set_type op configure the inversion based on whether
its interrupt source requests low or high, and allow either level or
edge.

However, the irq_chip for the PMC couldn't implement any mask or shutdown
operation. Is it acceptable to simple provide dummy/no-op functions in
that case? I see that kernel/irq/dummychip.c does exactly that, but I'm
not sure what use-cases that file is supposed to cover.

That'd result in something like this for device tree:

/ {
    intc: interrupt-controller@50041000 {
        compatible = "arm,cortex-a9-gic";
        /* reg and other properties omitted for brevity throughout */
        interrupt-controller;
        /* 
         * cell 0, 1: interrupt type/ID
         * cell 2: Linux IRQ flags
         */
        #interrupt-cells = <3>;
    };
    interrupt-parent = <&intc>;

    pmc: interrupt-controller@7000e400 {
        compatible = "nvidia,tegra20-pmc";
        interrupt-controller;
        /* 
         * cell 0: interrupt ID (always 0; should we omit this field?)
         * cell 1: 0=no invert, 1=invert
         */
        #interrupt-cells = <2>;
        /*
         * Always high. Level or edge of the PMU interrupt output must be
         * configured here. Or, should it somehow be passed through from
         * the PMU's client's interrupt specifier?
         */
        interrupts = <0 88 0x04>;
    };

    i2c@7000c000 {
        compatible = "nvidia,tegra20-i2c";

        pmu@xxx {
            interrupt-parent = <&pmc>;
            interrupts = <0 1>;
        }
    };
};

Does that look reasonable?

Other alternatives:

1) Don't hook the PMC driver and binding into the interrupt tree, but
simply have a property that controls the inversion of the signal.
The disadvantage is that the PMU's interrupt specifier would need to
always specify active high even if it was really active low with inversion
activated in the PMC.

2) Modify the ARM GIC's driver to allow active low interrupts, and call
some plugin code to request any required inversion. Most platforms
wouldn't provide such a plugin, and hence would still disallow such
requests. The disadvantage here is that it complicates the cross-SoC
GIC driver with something that may only be useful for Tegra.

Thanks.

-- 
nvpublic
