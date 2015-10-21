From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Wed, 21 Oct 2015 11:40:25 -0600
Message-ID: <5627CE09.3090304@wwwdotorg.org>
References: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
 <20151021121513.GA24168@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021121513.GA24168@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/21/2015 06:15 AM, Thierry Reding wrote:
> On Mon, Oct 19, 2015 at 05:30:42PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Convert the binding to provide a PHY per lane, rather than a PHY per
>> "pad" block in the hardware. This will allow the driver to easily know
>> which lanes are used by clients, and thus only enable those lanes, and
>> generally better aligns with the fact the hardware has configuration per
>> lane rather than solely configuration per "pad" block.
>>
>> Add entries to pinctrl-tegra-xusb.h to enumerate all "pad" blocks on
>> Tegra210, which will allow an XUSB DT node to reference the PHYs it needs.
>>
>> Add an nvidia,ss-port-map register to allow configuration of the
>> XUSB_PADCTL_SS_PORT_MAP register.

> According to Kishon's latest recommendation, the padctl binding should
> probably look more like this:
>
> 	padctl@0,7009f000 {
> 		...
>
> 		phys {
> 			pcie {
> 				/* 5 subnodes on Tegra124, 7 on Tegra210 */
> 				pcie-0 {
> 					...
> 				};
>
> 				...
> 			};

I noticed that he mentioned a separate node per PHY brick or PHY.

That seems like an odd requirement, or even recommendation, since the 
PHY bindings, like (almost?) all other DT provider/consumer bindings, 
use a phandle+specifier to indicate which resource is being provided. As 
such, there's no absolute need to represent objects as DT nodes, 
although there may be other good arguments for doing so.

> This is pretty much a direct transcription of the padctl block diagram
> in the TRM (e.g. page 1312 in vB4 of the Tegra X1 TRM).
>
> Once we have this, I'm beginning to think that we should just drop the
> pinctrl component, because we now have subnodes for each lane that can
> carry the configuration. As an aside, going with this more verbose DT
> representation should also give us an easy way of providing backwards-
> compatibility. The driver could look for the existence of the phys
> sub-node and fallback to the old code in its absence.

I would assert that if we're going to make this kind of radical change 
to the binding, we should simply change the compatible value. This will 
allow us to have two completely separate drivers for the two different 
DT representations. In turn, that will keep each driver simpler, in that 
we don't have two different drivers intermixed into one file.

The two drivers could share some common code e.g. by calling into a 
common C file for some purposes, and only have separate DT parsing 
logic, if that works out well.

In the kernel I guess we'd technically need to keep each driver around 
"forever" due to DT ABI requirements.

In U-Boot, I'd suggest simply dropping support for the old 
compatible-value since we know that the DT is part of the U-Boot source 
tree and tightly coupled. U-Boot is firmware after all.

> The above is also nice because it gives us a complete picture of what
> lanes are being used. For example, if some of the lanes are unused the
> corresponding device tree nodes could be marked status = "disabled",
> which would come in handy for the programming (e.g. IDDQ).

I worry that it's a bit verbose. Still, it's quite readable and as you 
say obviously maps to the documentation, so it may be worth going with this.

> I think for XUSB we'll need some additional information, though. Your
> proposal already adds the nvidia,ss-port-map property to add some of the
> information (mapping of SS ports to USB2 ports), but I think that's a)
> not very readable and b) doesn't give us enough flexibility to describe
> additional meta-data.

That property was only intended to represent that single piece of 
information. If there's other information that needs to be represented, 
we should certainly add more properties. I didn't enumerate all of them 
in my proposal since I was mainly concentrating on discussion the 
representation/specification of a PHY object, and not all the other 
miscellaneous configuration that the HW module has.

For ss-port-map in particular, I believe we should just use the same 
encoding that the HW register itself has. This keeps DT parsing simple, 
and keeps the binding directly in line with the HW documentation.

> I'm aware of at least two other pieces of
> information that we need: VBUS power supplies and port mode.

We also need to configure the mapping between USB controller ports and 
"OC" (over-current) pins, and various per-lane tuning parameters. For 
reference, there's a patch in Andrew Bresticker's tree that adds the 
tuning parameters:

git://github.com/abrestic/linux.git tegra-xhci-v8-test
bff711f935a989c220eabeeffffc150f18f54d7e
pinctrl: Update Tegra XUSB pad controller binding for USB

> Originally
> I think the binding used indexed names (vbus0-supply, vbus1-supply, ...)
> for the VBUS supplies but that's also suboptimally structured in my
> opinion. I think we could combine both into something of this sort
> (within the padctl node above):
>
> 		ports {
> 			usb3-0 {
> 				vbus-supply = <&vbus1_reg>;
> 				nvidia,port = <1>;
> 			};

Is there a standard binding for USB connectors? I've heard hints of a 
standard binding for e.g. HDMI connectors recently. Things like VBUS 
supply, ID pin reading, port mode, OC detection, etc. seem like they'd 
be quite generally applicable, although I must admit I'd rather not 
rat-hole this thread into designing any kind of universal standard...

> 			utmi-1 {
> 				vbus-supply = <&vbus1_reg>;
> 				mode = "host";
> 			};

> Note how both usb3-* and utmi-* ports specify the same regulators for
> the same physical port. It would probably be enough to simply have them
> listed in one place, but I suspect boards could omit USB2 fallback mode
> and wire up only the SS lanes, though I'm not sure if that's permitted.

I don't think that's permitted by USB spec.

It seems like it'd be better to represent the concept of a physical USB 
port. In this case, you wouldn't need to represent the VBUS supply 
multiple times since the physical port only has a single supply. Mapping 
the physical port to the various USB2 and USB3 controller ports could 
happen either elsewhere, or as properties within the physical port object.
