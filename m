From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 16:01:05 +0300
Message-ID: <4FE9B291.2020305@nvidia.com>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626105513.GA9552-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.06.2012 13:55, Thierry Reding wrote:

> 	host1x {
> 		compatible = "nvidia,tegra20-host1x", "simple-bus";
> 		reg = <0x50000000 0x00024000>;
> 		interrupts = <0 64 0x04   /* cop syncpt */
> 			      0 65 0x04   /* mpcore syncpt */
> 			      0 66 0x04   /* cop general */
> 			      0 67 0x04>; /* mpcore general */


We're only interested in interrupts 65 and 67. The COP interrupts are
not routed to CPU. I guess we could just delete those lines here.

> 
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		ranges = <0x54000000 0x54000000 0x04000000>;


I'm a newbie on device trees, so I need to ask. Why isn't host1x
register space covered by "ranges" property?

> 
> 		status = "disabled";
> 
> 		gart = <&gart>;
> 
> 		/* video-encoding/decoding */
> 		mpe {
> 			reg = <0x54040000 0x00040000>;
> 			interrupts = <0 68 0x04>;
> 			status = "disabled";
> 		};


The client device interrupts are not very interesting, so they could be
left out, too. Display controller related are probably an exception to this.

(...)

Otherwise the proposal looked good.

We also assign certain host1x common resources per device by convention,
f.ex. sync points, channels etc. We currently encode that information in
the device node (3D uses sync point number X, 2D uses numbers Y and Z).
The information is not actually describing hardware, as it just
describes the convention, so I'm not sure if device tree is the proper
place for it.

> This really isn't anything new but merely brings the Tegra DRM binding
> in sync with other devices in tegra20.dtsi (disable devices by default,
> leave out unit addresses for unique nodes). The only actual change is
> that host1x clients are now children of the host1x node. The children
> are instantiated by the initial call to of_platform_populate() since the
> host1x node is also marked compatible with "simple-bus".

>

> An alternative would be to call of_platform_populate() from the host1x
> driver. This has the advantage that it could integrate better with the
> host1x bus implementation that Terje is working on, but it also needs
> additional code to tear down the devices when the host1x driver is
> unloaded because a module reload would try to create duplicate devices
> otherwise.


Yes, we already have a bus_type for nvhost, and we have nvhost_device
and nvhost_driver that device from device and device_driver
respectively. They all accommodate some host1x client device common
behavior and data that we need to store. We use the bus_type also to
match each device and driver together, but the matching is version
sensitive. For example, Tegra2 3D needs different driver than Tegra3 3D.

> The rgb node is something that I don't quite know how to handle yet.
> Since it is really part of the display controller and uses its register
> space, it isn't quite correct to represent it as a separate device. But
> we will need a separate node to make it available as a connector, which
> will become more obvious below.


I'm not familiar enough with display controller to be able to comment.

> Perhaps the ranges property can also be used to remap the reg properties
> of the child nodes so that they can be specified as an offset into the
> host1x aperture instead of an address in the CPU address space. But
> that's just a minor issue because the OF code should be able to handle
> it transparently.


Either way is fine for me. The full addresses are more familiar to me as
we tend to use them internally.

> Basically this turns on the first display controller and the RGB/LVDS
> output and hooks up a static EDID block with the LVDS output. There is
> also a carveout property which might be a better replacement for the
> "crippled" GART on Tegra20. Alternatively the CMA might work just as
> well instead.


We use carveout for Tegra2. Memory management is a big question mark
still for tegradrm that I'm trying to find a solution for.

Terje
