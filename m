From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Wed, 16 Mar 2016 11:39:28 -0600
Message-ID: <56E99A50.4010002@wwwdotorg.org>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 09:19 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> set of lanes that are used for PCIe, SATA and USB.

>   .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   | 376 +++++++++++++++++++++
>   .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   5 +

It seems odd to add part of the deprecation notice in this patch and one 
more line in the second/next patch. Did an update get squashed into the 
wrong commit? I'd suggest moving the edit to existing file 
nvidia,tegra124-xusb-padctl.txt entirely into patch 2. Perhaps this 
could happen while/when the patch is applied to avoid having to post 
another version.

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt

...
> +Pads will be represented as children of the top-level XUSB pad controller
 > +device tree node.

Nit: grand-children, since they're house inside pads{} first. I might 
suggest:

A "pads" node exists to represent all pads contained within the XUSB 
controller. Each pad is represented as a subnode of the pads node.

> Each lane exposed by the pad will be represented by its
> +own subnode and can be referenced by users of the lane using the standard
> +PHY bindings, as described by the phy-bindings.txt file in this directory.

"Each lane exposed by the pad will be represented as a subnode of the 
pad node ..."?

I'd suggest adding a similar paragraph describing the ports node, and 
that ports are child nodes of that. Otherwise, since the documentation 
of the nodes isn't nested in any way, it's not clear from the text 
exactly what nodes are children of what other nodes.

> +The Tegra hardware documentation refers to the connection between the XUSB
> +pad controller and the XUSB controller as "ports".

I think, being pedantic, that "port" in the TRM refers to the set of 
signals at the edge/interface-to the IO controller, not the connection 
between the IO controller and the XUSB controller. Still, the existing 
wording in this patch is fine; no need to change it.

Still, the examples do clear this up, so perhaps it's not worth another 
version of the series to fix this. Or if you do think it's worth fixing, 
I'd be perfectly happy to see that done in follow-on patches. If you 
want I can write that follow-on patch once this series is applied.

...
> +PHY nodes:
> +==========
> +
> +Each pad node has one or more children, each representing one of the lanes
> +controlled by the pad.
> +
> +Required properties:
> +--------------------
> +- status: Defines the operation status of the PHY. Valid values are:
> +  - "disabled": the PHY is disabled
> +  - "okay": the PHY is enabled

Presumably the standard semantics of a missing status property 
implicitly meaning "okay" are also intended? A similar comment applies 
to other places where status is documented. "status" is typically not a 
required property.

> +Port nodes:
> +===========

> +USB2 ports:
> +-----------

Should that say "UTMI ports"? ULPI and HSIC below are (or can be) USB2 
ports too.

> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- mode: A string that determines the mode in which to run the port. Valid
> +  values are:
> +  - "host": for USB host mode
> +  - "device": for USB device mode
> +  - "otg": for USB OTG mode

How do these properties tie the DT-based port definition to a particular 
PHY/lane/... in HW? I don't see a property that contains any kind of HW 
ID here.

...
> +Optional properties:
> +- nvidia,internal: A boolean property whose presence determines that a port
> +  is internal. In the absence of this property the port is considered to be
> +  external.

It's not clear what "internal" and "external" mean. Presumably it's 
on-PCB vs. physical-connector-exposed-to-the-user. It may be worth 
explicitly mentioning that.

Is there no vbus-supply for USB2/UTMI ports? I'm also not sure why 
vbus-supply is optional for ULPI and HSIC. Even if there is no SW 
/control/ over VBUS, there still must be some source of power; IIRC Mark 
Brown typically desires that to be explicitly modelled with an always-on 
regulator if there's no SW control.

> +Super-speed USB ports:
> +----------------------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- nvidia,usb2-companion: A single cell that specifies the physical port number
> +  to map this super-speed USB port to. The range of valid port numbers varies
> +  with the SoC generation:
> +  - 0-2: for Tegra124 and Tegra132

How can this be used to look up the corresponding USB2 node in DT? I 
would have expected a phandle here, with the physical (HW) port ID being 
represented in the referenced node. Otherwise, I don't see how to tie 
together the USB2 and USB3 DT nodes.

> +For Tegra124 and Tegra132, the XUSB pad controller exposes the following
> +ports:
> +- 3x USB2: usb2-0, usb2-1, usb2-2
> +- 1x ULPI: ulpi-0
> +- 2x HSIC: hsic-0, hsic-1
> +- 2x super-speed USB: usb3-0, usb3-1

Oh, is the physical port ID implicit in the DT node name? It may be 
worth mentioning that when describing the properties for each type of node.

I'll assume that's how the USB2<->USB3 mapping works. All of my comments 
are mainly re: the description/documentation of the binding itself. That 
can all be enhanced later. The underlying binding itself, and the 
example, look reasonable. As such, this patch,

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
