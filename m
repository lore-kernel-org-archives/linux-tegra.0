From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Wed, 31 Jul 2013 16:57:13 +0200
Message-ID: <6071437.eL7j9JF89s@fb07-iapwap2.physik.uni-giessen.de>
References: <1416005.VvfEeGuSWa@ax5200p> <51F6E5BE.3080400@wwwdotorg.org> <20130731141314.GO29859@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130731141314.GO29859-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, 31. Juli 2013, 15:13:14 schrieb Mark Rutland:
> On Mon, Jul 29, 2013 at 10:59:26PM +0100, Stephen Warren wrote:
> > (Also Cc'ing the DT binding maintainers and hence quoting this in full)
> 
> Cheers.
> 
> > On 07/27/2013 07:23 AM, Marc Dietrich wrote:
> > > Hi,
> > > 
> > > this is an RFC for an mfd device introduced here [1]. I didn't got much
> > > response, except from Stephen, but that bothered me enough already ;-)
> > > 
> > > I'm going describe the hw again shortly, for a more complete
> > > description, see [1]. What we have here is an EC which communicates to
> > > the host cpu (NVIDIA Tegra) via I2C. The unusual part is that the EC is
> > > I2C master while the host cpu is the slave. The EC has several ports to
> > > connect peripherals like keyboard, mouse, ... and also to control some
> > > system states (suspend, low bat, power key, ...). Ok, so much for the
> > > hardware description, now the binding. I think I integrated all
> > > comments made by Stephen in [2].
> > > 
> > > i2c-slave@7000c500 {
> > > 
> > > 	compatible = "nvidia,tegra20-i2c-slave", "simple-bus";
> > 
> > Thinking more about this, I don't think simple-bus is appropriate here,
> > for the same reasons that i2c-master bindings don't specify simple-bus
> > here.
> > 
> > "simple-bus" is usually used in a case where the node in question is
> > pretty much just a simple aggregation of some child nodes, and the child
> > nodes are the same "type" of node as the node that is the simple-bus.
> > For example, when grouping a variety of memory-mapped peripherals
> > together to provide some structure to a larger memory-mapped bus,
> > perhaps with a "ranges" property etc. to do some remapping. In this
> > case, the child nodes are basically independent of the simple-bus node,
> > just relying on it for a bit of DT parsing, but not at run-time.
> 
> I'd expect any simple-bus node to be completely ignorable - if it
> *requires* any configuration to child nodes to be usable, or child node
> require any information from the bus (other than some addresss
> translation via the ranges property), then the node is clearly not
> compatible with the simple-bus concept.
> 
> If you need to instantiate child nodes as Linux platform devices, this
> should be done in the driver for the bus. Relying on simple-bus to do
> this is a hack.

ok, I'll rip this off from both nodes. I guess I should use 
of_platform_populate instead and keeping the compatible node in the childs - 
right?

> > In this case, the child nodes are a different type of object, and we
> > really need the driver for the i2c-slave node to know how to handle the
> > child nodes; we can't just go an instantiate them
> > directly/independently, and plug the devices into the bus that contains
> > the i2c-slave.
> 
> +1
> 
> > One question I have here: There is a single I2C HW module on Tegra that
> > can act either as a master or a slave. I don't think it can do both at
> 
> > once.

looking at the TRM, master and slave controllers are two hw blocks connected 
to the same bus (I wonder how they can share the same resources or the TRM 
block diagram is wrong). I don't know if both can act together at the same 
time, but I don't see what should speak against this (beside increase of 
entropy and caos). At least the isr can differentiate this by the irq status 
word. Maybe Stephen could ask internally about this.

> > Should we:
> Is that configurable at run-time, or an integration decision?
> 
> > a) Have a different compatible property for each use-case
> > 
> > b) Use the same compatible property (after all, the same HW module is
> > there in either case), yet have some kind of flag which tells the driver
> > whether to act as a master or slave. This flag could be standardized and
> > used by any binding for a "dual role" I2C controller.
> > 
> > I think it's reasonable to go with a separate compatible value in this
> > case, but I wonder if anyone wants to argue against it?
> 
> I believe a separate compatible string would make sense.

This will rule out a possible parallel operation of master and slave 
controllers on the same bus (I think an example is mentioned in the TRM as 
loopback mode). Personally, I also prefer a) because otherwise we would have 
to add slave support directly into the i2c master driver, which is likely the 
point I would hand over this work to someone at NVIDIA who understands more 
about the hw (and software in general) then I do.

--- Marc


> > > 	reg = <0x7000c500 0x100>;
> > > 	interrupts = <0 92 0x04>;
> > > 	#address-cells = <1>;
> > > 	#size-cells = <0>;
> > > 	clock-frequency = <80000>;
> > > 	clocks = <&tegra_car 67>, <&tegra_car 124>;
> > > 	clock-names = "div-clk", "fast-clk";
> > > 	
> > > 	nvec@87 {
> > > 	
> > > 		compatible = "nvidia,nvec", "simple-bus";
> > 
> > Similarly here, I would drop simple-bus.
> > 
> > > 		reg = <0x87>;
> > > 		request-gpios = <&gpio 170 0>; /* gpio PV2 */
> > 
> > Nit: We should s/170/TEGRA_GPIO(V, 2)/ in the final *.dts file, and then
> > we can drop that comment.
> > 
> > > 		keyboard {
> > > 		
> > > 			compatible = "nvidia,nvec-keyboard";
> > > 			...
> > > 			<insert key mappings here>
> > > 			...
> > > 		
> > > 		};
> > > 		
> > > 		ps2 {
> > > 		
> > > 			compatible = "nvidia,nvec-ps2";
> > > 			packet-size = 6; /* for the ac100 tp */
> > > 		
> > > 		};
> > > 		
> > > 		events {
> > > 		
> > > 			compatible = "nvidia,nvec-events";
> > > 			...
> > > 			<add some system events here,
> > > 			
> > > 				e.g. lid switch, power button>
> > > 			
> > > 			...
> > > 		
> > > 		};
> > > 		
> > > 		charger: ac {
> > > 		
> > > 			compatible = "nvidia,nvec-ac";
> > > 		
> > > 		};
> > > 		
> > > 		battery {
> > > 		
> > > 			compatible = "nvidia,nvec-battery";
> > > 			charger = <&charger>;
> > > 			
> > >        	};
> > > 		
> > > 		oem {
> > > 		
> > > 			compatible = "compal,nvec-paz00";
> > > 			/* ac100 specific extentions to the protocol */
> > > 		
> > > 		};
> > > 	
> > > 	};
> > > 
> > > };
> > 
> > To me, this seems like a reasonable binding.
> > 
> > > For multi-slave capable SoCs, there can be more than one master
> > > connected to the i2c slave controller of the host cpu. Therefore I
> > > added "simple-bus" property here. Does "simple-bus" imply bus
> > > addresses?
> > 
> > This binding doesn't describe the external masters, so I'm not sure how
> > the presence or lack of them affects the binding at all. I argue against
> > using simple-bus above; the bus is not "simple".
> > 
> > > The EC registers with
> > > the slave controller by supplying the protocol (e.g. smbus or i2c) and
> > > an
> > > optional gpio.
> > 
> > I don't think "the EC registers ...", but rather "the driver for the EC
> > protocol registers ..."
> 
> I've lost some context here, but I hope this isn't a binding describing
> driver behaviour... :)
> 
> Thanks,
> Mark.
