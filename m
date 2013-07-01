From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: binding for nvec mfd device
Date: Mon, 01 Jul 2013 09:36:55 -0600
Message-ID: <51D1A217.7020605@wwwdotorg.org>
References: <1690589.tt8Uan1NDT@ax5200p> <51CDA822.3090005@wwwdotorg.org> <5104794.7rpTCZqV23@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5104794.7rpTCZqV23@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/29/2013 10:22 AM, Marc Dietrich wrote:
> On Friday 28 June 2013 09:13:38 Stephen Warren wrote:
>> On 06/27/2013 12:26 PM, Marc Dietrich wrote:
...
>>> I'm puzzling for some time now to find a binding for a mfd device. So
>>> let's
>>> start with something I think I have learned already, let's describe the
>>> hardware.
...
>> I would eventually like to do the following:
>>
>> * Have a node that represents the I2C slave controller HW module in Tegra.
>>
>> * Have a node (or nodes) (perhaps a child node of that) which represents
>> the protocol that "binds" to the slave controller. This would have its
>> own compatible value that describes which protocol to instantiate.
>>
>> This will separate the driver for the I2C slave HW from the driver for
>> the protocol, so that you could even run the same protocol with a
>> different I2C slave device if needed.
> 
> I agree with you that the slave driver should be separated from the protocol 
> (which itself can also be separated into e.g. smbus and nvec layers). But 
> that's more like a long term goal which we cannot handle so quickly. For this 
> to work, you probably also need a kernel api for i2c slaves which many people 
> failed to introduce in the past already. The NVIDIA downstream kernel has 
> something like this already (are there any clients?), but unfortunately no 
> smbus protocol support yet.
> 
> So keeping this in mind, the binding above already looks ok, even if it is 
> named "nvec" instead of e.g. "i2c-slave" for now.

Well, the DT binding is supposed to be describing the HW (or at least
the SW-visible aspects of the HW), so we should not be designing the
binding to suit a particular SW/driver structure. Instead, the binding
should describe the HW, and the SW should be written to work with the
binding.

Put another way, the binding is something that shouldn't change even if
the SW/driver structure does.

So, if we're coming up with a final binding to correctly represent nvec,
we should split the I2C slave, protocol, protocol clients all out, since
that's the best representation of the HW and protocol.

...
>>> One question is now how to instantiate the mfd children from this. I see
>>> three> 
>>> different methods used in different drivers:
>>> 		a) just add a "compatible =" property to the child nodes and a
>>> 		
>>> 			"simple-bus" property to the the driver
>>
>> (or instead of simple-bus, have the top-level node's probe() do the
>> following at the end:
>>
>>         of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>>
>> That's what sounds/soc/tegra/tegra30_ahub.c does.
> 
> "simple-bus" and maybe also of_platform_populate are only favored if there is 
> a real bus, AFAIU, which isn't the here (and maybe also not for other mfds).

I don't think that restriction is generally true. I've certainly seen
seasoned DT experts state that *not* breaking things up into individual
components has almost always turned out to be a mistake.

Besides, the nvec protocol really is a bus, even a physical one in some
ways. It multiplexes access to a variety of endpoints (keyboard, GPIOs)
over a communication channel (nvec protocol, over a physical I2C channel).

>> I prefer either:
...
>> 2) Your option a. I believe if we're going to break down the MFD device
>> into chunks, the way we do it should mirror existing DT techniques as
>> closely as possible, and using nodes with compatible values to represent
>> the child devices seems most consistent with existing techniques.
> 
> Thinking about what you said at the beginning, I think it's best not to use 
> any sub-nodes at all, but give all children a node of their own (standalone 
> driver) with compatible properties and a link property to the device 
> responsible for the communications (nvec or i2c-slave in our case), similar to 
> the backlight property for panels:
> 
> root {
> ....
> 	nvec: nvec {
> 		compatible = "nvidia,nvec";
> 		...
> 	};
> 
> 	keyboard {
> 		compatible = "nvidia,nvec-keyboard";
> 		nvec = <&nvec>;
> 	};
> 	....
> };

So here, the keyboard node is using nvec as the communication transport
for all its data. That *is* a bus, and devices on buses are typically
child nodes of the bus itself; take a look at the I2C or SPI master
bindings. The only exception to this I can think off quickly is the I2C
mux bindings, and that's because the control of the muxing isn't
necessarily part of the data path being muxed.

> I'm not sure if we can still use the function exports from the nvec or if we 
> need to add some "ops" to the nvec struct. Maybe the latter would be the 
> better solution. I'm also wondering if we can guaranty that the nvec is loaded 
> before any children and that the children are unloaded before the nvec core 
> driver.

The driver for the keyboard node above would have to convert the phandle
in the nvec property to some kind of nvec device/driver handle. That
process would need to defer the probe of the keyboard node's
driver/device if the nvec node's driver/device was not yet available.

However, this would be entirely automatic if nvec was a bus, and the
devices behind the bus were children of the nvec node.
