From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 05/10] dt-bindings: PCI: tegra: Add device tree support
 for T194
Date: Mon, 8 Apr 2019 18:29:13 +0000
Message-ID: <1554748151.2142.31.camel@impinj.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-6-git-send-email-vidyas@nvidia.com>
 <5ca06149.1c69fb81.720fd.79e1@mx.google.com>
 <5ef50168-2476-1088-7156-8a4488d7a2e1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ef50168-2476-1088-7156-8a4488d7a2e1@nvidia.com>
Content-Language: en-US
Content-ID: <349395070C07C84CBA7984E45E83C38F@namprd06.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh@kernel.org" <robh@kernel.org>, "vidyas@nvidia.com" <vidyas@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "heiko@sntech.de" <heiko@sntech.de>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "spujar@nvidia.com" <spujar@nvidia.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "kthota@nvidia.com" <kthota@nvidia.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "kishon@ti.com" <kishon@ti.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "krzk@kernel.org" <krzk@kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "tiwai@suse.de" <tiwai@suse.de>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, linux-pci@vger
List-Id: linux-tegra@vger.kernel.org

On Mon, 2019-04-01 at 16:48 +0530, Vidya Sagar wrote:
> On 3/31/2019 12:12 PM, Rob Herring wrote:
> > On Tue, Mar 26, 2019 at 08:43:22PM +0530, Vidya Sagar wrote:
> > > 
> > > +- clock-names: Must include the following entries:
> > > +  - core_clk

Basically every single device has a "core" clock.  Yet, there's just
only one device using "core_clk" as the name.  So it doesn't seem like
a very good choice.  Just "core" is used 186 times.  But if you have
just the one clock, then you don't need to provide "clock-names" at
all.

> > > +- resets: Must contain an entry for each entry in reset-names.
> > > +  See ../reset/reset.txt for details.
> > > +- reset-names: Must include the following entries:
> > > +  - core_apb_rst
> > > +  - core_rst

IMHO, it's redundant to name the reset "core reset".  We already know
it's a reset.  So I scanned the current kernel dts files to see the
convention, and I couldn't find a single driver that uses "*_rst" for
the reset names.  "core" is used a number of times, and there are a few
"apb" resets.

Suggest naming these "core" and "apb".

> > > +- phys: Must contain a phandle to P2U PHY for each entry in phy-names.
> > > +- phy-names: Must include an entry for each active lane.
> > > +  "pcie-p2u-N": where N ranges from 0 to one less than the total number of lanes
> > > +- Controller dependent register offsets
> > > +  - nvidia,event-cntr-ctrl: EVENT_COUNTER_CONTROL reg offset
> > > +      0x168 - FPGA
> > > +      0x1a8 - C1, C2 and C3
> > > +      0x1c4 - C4
> > > +      0x1d8 - C0 and C5
> > > +  - nvidia,event-cntr-data: EVENT_COUNTER_DATA reg offset
> > > +      0x16c - FPGA
> > > +      0x1ac - C1, C2 and C3
> > > +      0x1c8 - C4
> > > +      0x1dc - C0 and C5

Does the event counter count events that are not part of pci-e?  Looks
like there are lots of empty spaces in the register map we see above
for other things.  Seems like the way this should be done is with a
driver for the event counter, and have handle here to an index in the
event counter driver.  I think there's a generic driver for something
like this that is just a register array shared between different
devices.

> > > +- nvidia,controller-id : Controller specific ID
> > > +      0x0 - C0
> > > +      0x1 - C1
> > > +      0x2 - C2
> > > +      0x3 - C3
> > > +      0x4 - C4
> > > +      0x5 - C5

Do you need this for something in the driver?  If you are trying to
enumerate controllers, then the board's aliases node would be the way
to do that.
 
> > > +- vddio-pex-ctl-supply: Regulator supply for PCIe side band signals
> > > +
> > > +Optional properties:
> > > +- nvidia,max-speed: limits controllers max speed to this value.
> > > +    1 - Gen-1 (2.5 GT/s)
> > > +    2 - Gen-2 (5 GT/s)
> > > +    3 - Gen-3 (8 GT/s)
> > > +    4 - Gen-4 (16 GT/s)
> > > +- nvidia,init-speed: limits controllers init speed to this value.
> > > +    1 - Gen-1 (2. 5 GT/s)
> > > +    2 - Gen-2 (5 GT/s)
> > > +    3 - Gen-3 (8 GT/s)
> > > +    4 - Gen-4 (16 GT/s)
> > 
> > Don't we have standard speed properties?
> 
> Not that I'm aware of. If you come across any, please do let me know and
> I'll change these.

This is already in Documentation/devicetree/bindings/pci/pci.txt

- max-link-speed:
   If present this property specifies PCI gen for link capability. Host
   drivers could add this as a strategy to avoid unnecessary operation or
   unsupported link speed, for instance, trying to do training for
   unsupported link speed, etc.  Must be '4' for gen4, '3' for gen3, '2'
   for gen2, and '1' for gen1. Any other values are invalid.

> > Why do we need 2 values?
> 
> max-speed configures the controller to advertise the speed mentioned through
> this flag, whereas, init-speed gets the link up at this speed and software
> can further take the link speed to a different speed by retraining the link.
> This is to give flexibility to developers depending on the platform.

It doesn't seem like this is a hardware description then.  It seems
like Linux driver configuration.

> > > +- nvidia,disable-aspm-states : controls advertisement of ASPM states
> > > +    bit-0 to '1' : disables advertisement of ASPM-L0s
> > > +    bit-1 to '1' : disables advertisement of ASPM-L1. This also disables
> > > +                 advertisement of ASPM-L1.1 and ASPM-L1.2
> > > +    bit-2 to '1' : disables advertisement of ASPM-L1.1
> > > +    bit-3 to '1' : disables advertisement of ASPM-L1.2
> > 
> > Seems like these too should be common.
> 
> This flag controls the advertisement of different ASPM states by root port.
> Again, I'm not aware of any common method for this.

Found this one in rockchip.

Optional Property:
- aspm-no-l0s: RC won't support ASPM L0s. This property is needed if
        using 24MHz OSC for RC's PHY.

Using individual boolean properties would be more device tree style
than encoding bits in a single property.
  
> > 
> > > +- nvidia,disable-clock-request : gives a hint to driver that there is no
> > > +    CLKREQ signal routing on board
> > > +- nvidia,update-fc-fixup : needs it to improve perf when a platform is designed
> > > +    in such a way that it satisfies at least one of the following conditions
> > > +    1. If C0/C4/C5 run at x1/x2 link widths (irrespective of speed and MPS)
> > > +    2. If C0/C1/C2/C3/C4/C5 operate at their respective max link widths and
> > 
> > What is Cx?
> 
> Cx is the Controller with its ID.
> 
> > 
> > > +       a) speed is Gen-2 and MPS is 256B
> > > +       b) speed is >= Gen-3 with any MPS

Could the driver figure it out on its own if it needs this?  Looks like
the rules are defined.

> > > +- nvidia,cdm-check : Enables CDM checking. For more information, refer Synopsis
> > > +    DesignWare Cores  PCI Express Controller Databook r4.90a Chapter S.4

Should this be snps or dwc property then?

> > > +- nvidia,enable-power-down : Enables power down of respective controller and
> > > +    corresponding PLLs if they are not shared by any other entity
> > > +- "nvidia,pex-wake" : Add PEX_WAKE gpio number to provide wake support.

GPIO number? Shouldn't this be phandle to gpio provider and address of
gpio?

> > > +- "nvidia,plat-gpios" : Add gpio number that needs to be configured before
> > > +   system goes for enumeration. There could be platforms where enabling 3.3V and
> > > +   12V power supplies are done through GPIOs, in which case, list of all such
> > > +   GPIOs can be specified through this property.
> > 
> > These should be split out to their specific function.
> 
> Enabling Power rails is just an example and depending on the platform, there could be
> some on-board muxes which are controlled through GPIOs and all such platform specific
> configuration can be handled through this flag.

Wouldn't regulator framework be proper place to put enabling power for
device?  There is already standard support for adding a phandle to a
regulator to a device to enable the regulator.

> > > +- "nvidia,aspm-cmrt" : Common Mode Restore time for proper operation of ASPM to
> > > +   be specified in microseconds
> > > +- "nvidia,aspm-pwr-on-t" : Power On time for proper operation of ASPM to be
> > > +   specified in microseconds
> > > +- "nvidia,aspm-l0s-entrance-latency" : ASPM L0s entrance latency to be specified
> > > +   in microseconds
> > 
> > properties with units need unit suffixes as defined in
> > property-units.txt.
> 
> Done. I'll take care of this in next patch series.
> 
> > 
> > > +
> > > +Examples:
> > > +=========
> > > +
> > > +Tegra194:
> > > +--------
> > > +
> > > +SoC DTSI:
> > > +
> > > +	pcie@14180000 {
> > > +		compatible = "nvidia,tegra194-pcie", "snps,dw-pcie";
> > > +		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_PCIEX8B>;
> > > +		reg = <0x00 0x14180000 0x0 0x00020000   /* appl registers (128K)      */
> > > +		       0x00 0x38000000 0x0 0x00040000   /* configuration space (256K) */
> > > +		       0x00 0x38040000 0x0 0x00040000>; /* iATU_DMA reg space (256K)  */
> > > +		reg-names = "appl", "config", "atu_dma";
> > > +
> > > +		status = "disabled";
> > > +
> > > +		#address-cells = <3>;
> > > +		#size-cells = <2>;
> > > +		device_type = "pci";
> > > +		num-lanes = <8>;
> > > +		linux,pci-domain = <0>;
> > > +
> > > +		clocks = <&bpmp TEGRA194_CLK_PEX0_CORE_0>;
> > > +		clock-names = "core_clk";
> > > +
> > > +		resets = <&bpmp TEGRA194_RESET_PEX0_CORE_0_APB>,
> > > +			 <&bpmp TEGRA194_RESET_PEX0_CORE_0>;
> > > +		reset-names = "core_apb_rst", "core_rst";
> > > +
> > > +		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,	/* controller interrupt */
> > > +			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;	/* MSI interrupt */
> > > +		interrupt-names = "intr", "msi";
> > > +
> > > +		#interrupt-cells = <1>;
> > > +		interrupt-map-mask = <0 0 0 0>;
> > > +		interrupt-map = <0 0 0 0 &gic 0 72 0x04>;
> > > +
> > > +		nvidia,bpmp = <&bpmp>;
> > > +
> > > +		nvidia,max-speed = <4>;
> > > +		nvidia,disable-aspm-states = <0xf>;
> > > +		nvidia,controller-id = <&bpmp 0x0>;
> > > +		nvidia,aux-clk-freq = <0x13>;
> > > +		nvidia,preset-init = <0x5>;
> > > +		nvidia,aspm-cmrt = <0x3C>;
> > > +		nvidia,aspm-pwr-on-t = <0x14>;
> > > +		nvidia,aspm-l0s-entrance-latency = <0x3>;
> > > +
> > > +		bus-range = <0x0 0xff>;
> > > +		ranges = <0x81000000 0x0 0x38100000 0x0 0x38100000 0x0 0x00100000      /* downstream I/O (1MB) */
> > > +			  0x82000000 0x0 0x38200000 0x0 0x38200000 0x0 0x01E00000      /* non-prefetchable memory (30MB) */
> > > +			  0xc2000000 0x18 0x00000000 0x18 0x00000000 0x4 0x00000000>;  /* prefetchable memory (16GB) */
> > > +
> > > +		nvidia,cfg-link-cap-l1sub = <0x1c4>;
> > > +		nvidia,cap-pl16g-status = <0x174>;
> > > +		nvidia,cap-pl16g-cap-off = <0x188>;
> > > +		nvidia,event-cntr-ctrl = <0x1d8>;
> > > +		nvidia,event-cntr-data = <0x1dc>;
> > > +		nvidia,dl-feature-cap = <0x30c>;
> > > +	};
> > > +
> > > +Board DTS:
> > > +
> > > +	pcie@14180000 {
> > > +		status = "okay";
> > > +
> > > +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
> > > +
> > > +		phys = <&p2u_2>,
> > > +		       <&p2u_3>,
> > > +		       <&p2u_4>,
> > > +		       <&p2u_5>;
> > > +		phy-names = "pcie-p2u-0", "pcie-p2u-1", "pcie-p2u-2",
> > > +			    "pcie-p2u-3";
> > > +	};
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> > > new file mode 100644
> > > index 000000000000..cc0de8e8e8db
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> > > @@ -0,0 +1,34 @@
> > > +NVIDIA Tegra194 P2U binding
> > > +
> > > +Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
> > > +Speed) each interfacing with 12 and 8 P2U instances respectively.
> > > +A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
> > > +interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
> > > +lane.
> > > +
> > > +Required properties:
> > > +- compatible: For Tegra19x, must contain "nvidia,tegra194-phy-p2u".
> > > +- reg: Should be the physical address space and length of respective each P2U
> > > +       instance.
> > > +- reg-names: Must include the entry "base".
> > > +
> > > +Required properties for PHY port node:
> > > +- #phy-cells: Defined by generic PHY bindings.  Must be 0.
> > > +
> > > +Refer to phy/phy-bindings.txt for the generic PHY binding properties.
> > > +
> > > +Example:
> > > +
> > > +hsio-p2u {
> > > +	compatible = "simple-bus";
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +	ranges;
> > > +	p2u_0: p2u@03e10000 {
> > > +		compatible = "nvidia,tegra194-phy-p2u";
> > > +		reg = <0x0 0x03e10000 0x0 0x00010000>;
> > > +		reg-names = "base";
> > > +
> > > +		#phy-cells = <0>;
> > > +	};
> > > +}
> > > -- 
> > > 2.7.4
> > > 
> 
> 
