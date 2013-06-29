From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: binding for nvec mfd device
Date: Sat, 29 Jun 2013 18:22:54 +0200
Message-ID: <5104794.7rpTCZqV23@ax5200p>
References: <1690589.tt8Uan1NDT@ax5200p> <51CDA822.3090005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CDA822.3090005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 28 June 2013 09:13:38 Stephen Warren wrote:
> On 06/27/2013 12:26 PM, Marc Dietrich wrote:
> > Hi,
> 
> (CC'ing linux-tegra)
> 
> > I'm puzzling for some time now to find a binding for a mfd device. So
> > let's
> > start with something I think I have learned already, let's describe the
> > hardware.
> > 
> > Here the problem starts, because the nvec (nvidia [protocol] compliant
> > embedded controller) isn't a well defined piece of silicon at all, but
> > more a protocol which specifies how to communicate with certain devices
> > (keyboard, mouse, gpio, system state, battery, oem specific hw ...). Even
> > worse, the number of "attached" devices may vary for each implementation
> > and there is no way to sanely probe which which devices exist or not.
> > 
> > For example, the "hardware" in my case is an ENE KB926 keyboard controller
> > with an additional ps/2 port (for the touchpad) and a number of gpio's for
> > connecting leds, spi bus, a charger chip and some other stuff. Most gpio's
> > cannot be controlled directly, but only through certain ec commands. The
> > i2c protocol used for communication with the host cpu is handled by a
> > good old 8051 type integrated in the keyboard controller.
> > 
> > Other vendors may implement this in totally different hardware, keeping
> > only the protocol. So I think this is a case where the "describe the
> > hardware" principle just fails.
> 
> I think "describe the HW" should work quite well. However, it's a matter
> of interpretation what that means:-) I take it to mean describing the
> SW-visible aspects of that HW, which in this case is the protocol used
> to talk to that HW.
> 
> > So I thought ok - forget this principle for now and describe it from a
> > higher> 
> > protocol point of view. We currently have something like this:
> >         nvec@7000c500 {
> >         
> >                 compatible = "nvidia,nvec";
> >                 reg = <0x7000c500 0x100>;
> >                 interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >                 clock-frequency = <80000>;
> >                 request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
> >                 slave-addr = <138>;
> >                 clocks = <&tegra_car TEGRA20_CLK_I2C3>,
> >                 
> >                          <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
> >                 
> >                 clock-names = "div-clk", "fast-clk";
> >         
> >         };
> 
> I would eventually like to do the following:
> 
> * Have a node that represents the I2C slave controller HW module in Tegra.
> 
> * Have a node (or nodes) (perhaps a child node of that) which represents
> the protocol that "binds" to the slave controller. This would have its
> own compatible value that describes which protocol to instantiate.
> 
> This will separate the driver for the I2C slave HW from the driver for
> the protocol, so that you could even run the same protocol with a
> different I2C slave device if needed.

I agree with you that the slave driver should be separated from the protocol 
(which itself can also be separated into e.g. smbus and nvec layers). But 
that's more like a long term goal which we cannot handle so quickly. For this 
to work, you probably also need a kernel api for i2c slaves which many people 
failed to introduce in the past already. The NVIDIA downstream kernel has 
something like this already (are there any clients?), but unfortunately no 
smbus protocol support yet.

So keeping this in mind, the binding above already looks ok, even if it is 
named "nvec" instead of e.g. "i2c-slave" for now.

> > which describes how the host cpu should setup the i2c communication. The
> > devices are currently hard coded in the driver, but I like to make them
> > more> 
> > flexible through a device tree binding, eg. something like this:
> > 		nvec {
> > 		
> > 				...
> > 				<properties from above>
> > 				...
> > 				
> > 				keyboard {
> > 				
> > 						<add some key bindings here>
> > 				
> > 				};
> > 				
> > 				ps2 {
> > 				
> > 						packet-size = 6; /* for the ac100 tp */
> > 				
> > 				};
> 
> ... (more child nodes)
> 
> > 		};
> > 
> > One question is now how to instantiate the mfd children from this. I see
> > three> 
> > different methods used in different drivers:
> > 		a) just add a "compatible =" property to the child nodes and a
> > 		
> > 			"simple-bus" property to the the driver
> 
> (or instead of simple-bus, have the top-level node's probe() do the
> following at the end:
> 
>         of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> 
> That's what sounds/soc/tegra/tegra30_ahub.c does.

"simple-bus" and maybe also of_platform_populate are only favored if there is 
a real bus, AFAIU, which isn't the here (and maybe also not for other mfds).

> > 		b) search for sub-nodes and instantiate the children "manually" by
> > 		
> > 			"guessing" some driver name from the node name and use
> > 			platform_add_device
> > 		
> > 		c) use an mfd_cell struct hard coded in the driver and "enable" 
only
> > 		
> > 			the children found in the sub-node list and use 
mfd_add_devices.
> > 
> > All these methods above have their advantages and disadvantages. But lets
> > ignore them for now and ask what's the preferred way to do this?
> 
> I'm not sure if there is a preferred way as a global rule.
> 
> I prefer either:
> 
> 1) The existing method of entirely hard-coding everything in the
> top-level device driver, since it is a driver for the particular HW
> setup, it knows exactly what is there, and so it's fine to hard-code
> everything. The disadvantage here is that any configuration for all the
> child nodes gets merged together into the one top-level node though,
> which could get messy.

also this method is hard to expand to other devices which may only implement a 
subset of the functions (or needs different platform data).

> 2) Your option a. I believe if we're going to break down the MFD device
> into chunks, the way we do it should mirror existing DT techniques as
> closely as possible, and using nodes with compatible values to represent
> the child devices seems most consistent with existing techniques.

Thinking about what you said at the beginning, I think it's best not to use 
any sub-nodes at all, but give all children a node of their own (standalone 
driver) with compatible properties and a link property to the device 
responsible for the communications (nvec or i2c-slave in our case), similar to 
the backlight property for panels:

root {
....
	nvec: nvec {
		compatible = "nvidia,nvec";
		...
	};

	keyboard {
		compatible = "nvidia,nvec-keyboard";
		nvec = <&nvec>;
	};
	....
};

I'm not sure if we can still use the function exports from the nvec or if we 
need to add some "ops" to the nvec struct. Maybe the latter would be the 
better solution. I'm also wondering if we can guaranty that the nvec is loaded 
before any children and that the children are unloaded before the nvec core 
driver.

With the above method, we should have no problems to parse the platform data, 
as each "child" needs to provide its own dt parser function.

Marc


> > Another question is how the children will get their platform data. I guess
> > they will just walk the device tree of their parent node and search for
> > it,
> > but maybe there is a better way?
> 
> In option (a), there will be a separate struct device for each child
> node, instantiated directly from the child DT node. Hence, the driver
> (chosen from the compatible value just like any other) would simply
> parse dev.of_node just like any other driver. The only difference would
> be that the driver would have to go to the parent node, and search for a
> driver for it, and ask that driver for any "supporting resources", such
> as a device handle that allowed you to all APIs to send/receive bytes
> over the protocol. Perhaps the parent device might just pre-create
> regmaps for all the child devices if that abstraction works. That would
> save the child devices even having to look for the parent 
> device.
