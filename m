From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Wed, 4 Nov 2015 13:54:15 -0700
Message-ID: <563A7077.20902@wwwdotorg.org>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446657109-15568-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/04/2015 10:11 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> set of lanes that are used for PCIe, SATA and USB.

>   .../bindings/phy/nvidia,tegra-xusb-padctl.txt      | 359 +++++++++++++++++++++

For Tegra bindings, we usually use the full compatible value as the 
filename, so I'd expect the chip number in the filename too.

I'd expect to see a patch in this series that edits the existing 
Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt and 
mentions that the binding is deprecated.

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt

> +Device tree binding for NVIDIA Tegra XUSB pad controller
> +========================================================
> +
> +The Tegra XUSB pad controller manages a set of pads, each of which controls
> +one or more lanes.

The term "pad" usually refers to a single pad/pin/ball/signal on the 
chip. As such, saying "pad" here for something that's more than one pin 
is a bit confusing, even if that is what our HW documentation calls it.

> Each lane can in turn be assigned to one out of a set of
> +different outputs.

That doesn't sound correct. That phrasing implies that the mux is 
between the HW-blocks-known-as-pads and the "outputs", whereas the mux 
is actually between the IO controllers and the HW-blocks-known-as-pads

 > A pad contains logic common for all its lanes. Each lane
> +can additionally be separately configured and powered up.

I'd suggest rephrasing that all as:

The Tegra XUSB pad controller manages a set of IO lanes (differential 
signals) which connect directly to pins/pads on the SoC package. Each 
lane is controlled by a HW block referred to as a "pad" in the Tegra HW 
documentation. Each such "pad" may control either one or multiple lanes, 
and contains any logic common to all its lanes. Each lane can be 
separately configured and powered up.

> +Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
> +super-speed USB. Other lanes are for various types of low-speed, full-speed
> +or high-speed USB (such as UTMI, ULPI and HSIC).

Perhaps add the following after that?

The XUSB pad controller contains a software-configurable mux that sits 
between the IO controller ports (e.g. PCIe) and the lanes.

> +Required properties:
> +--------------------
> +- compatible: Must be:
> +  - "nvidia,tegra124-xusb-padctl": for Tegra124 and Tegra132

For Tegra132, we need both a "tegra124" and a "tegra132 value". I would 
suggest listing the valid complete property values for each SoC for 
simplicity and preciseness, as I did in the XUSB controller binding 
proposal I link to later:

  - compatible: Valid options are:
    - Tegra124: "nvidia,tegra124-xusb-padctl".
    - Tegra132: "nvidia,tegra132-xusb-padctl", \
                                  "nvidia,tegra124-xusb-padctl".

This also makes it very easy to add entries for future SoCs without 
editing the diff touching any existing lines of text.

> +- reg: Physical base address and length of the controller's registers.
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must include the following entries:
> +  - "padctl"

Are there no clocks or power domains that affect XUSB padctl? I suppose 
we can start off without any, and add them later if we need.

> +- mboxes: Must contain an entry for each entry in mbox-names.
> +- mbox-names: Must include the following entries:
> +  - "xusb"

I thought we'd decided not to use any mbox binding or drivers in XUSB 
now? See for example my proposed XUSB controller binding at:

http://www.spinics.net/lists/linux-tegra/msg23922.html
[PATCH V9] dt: add NVIDIA Tegra XUSB controller binding

The idea is that the mailbox should be entirely internal to the XUSB 
controller driver, and if the receipt of a mailbox message requires any 
change in the XUSB pad controller programming, the XUSB controller 
driver should simply call the XUSB pad controller driver to perform that 
operation.

> +Pad nodes:
> +==========

> +For Tegra124 and Tegra132, the following pads exist: utmi, ulpi, hsic, pcie
> +and sata. No extra resources are required for operation of these pads.

Judging by the diagram in the TRM (e.g. figure 41 in the Tegra124 TRM, 
figure 36 in the Tegra210 TRM), there is not a single "utmi" pad, but 
rather a separate pad per USB2 lane. However, the other types of pads 
are indeed multi-lane. The TRM also refers to "USB2" pads rather than 
"UTMI" pads. I don't see a ULPI pad in the diagram either. Assuming the 
diagram in the TRM is consistent with the register layout, I think we 
should have the following set of pad nodes:

utmi-0
utmi-1
utmi-2
hsic
pcie
sata

> +Required properties:
> +--------------------

> +For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
> +- utmi: utmi-0, utmi-1, utmi-2
> +  - functions: "snps", "xusb", "uart"

I think that entry needs rework based on my comment above re: the set of 
utmi PHYs/pads that exist.

> +Port nodes:
> +===========
> +
> +A required child node named "ports" contains a list of all the ports exposed
> +by the XUSB pad controller. Per-port configuration is only required for USB.

I'm not sure this section clearly spells out there must be a node named 
"ports" inside the main node, and a node per port within "ports". The 
structure/text under "Pad nodes" seemed better at that.

Perhaps add the text "Each port represents the connection between one 
port on an IO controller, such as a PCIe root port, and the XUSB pad 
controller" either here, or mention something like this in the 
introduction to this binding? Otherwise, someone the distinction between 
lanes, ports, ... might not be clear to someone not familiar with Tegra. 
Perhaps an ASCII art diagram might make sense?

> +UTMI ports:
> +-----------

> +Optional properties:

> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.

This is the only port type that specifies vbus-supply as a valid 
property. There could well be control over VBUS even for ULPI. Shouldn't 
we add this property there too?

> +Super-speed USB ports:
> +----------------------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- nvidia,port: A single cell that specifies the physical port number to map
> +  this super-speed USB port to. The range of valid port numbers varies with
> +  the SoC generation:
> +  - 0-2: for Tegra124 and Tegra132

Wouldn't it be better to name the node after the physical port number, 
just like we name the PHY/lane nodes after the PHY/lane identity? We 
don't seem to have any such mapping information in the UTMI port nodes; 
how do we correlate the USB2 and USB3 ports?

I wonder if we shouldn't represent USB (physical) ports at the lane-side 
of the XUSB pad controller rather than the IO controller side. That way, 
we could pack both USB2- and USB3-related information into a single 
node. For example, vbus-supply really applies equally to the companion 
USB2 and USB3 ports, whereas this binding represents those two parts of 
the overall USB port separately, with the vbus-supply property appearing 
in only one of the two places. I guess this boils down to what a "port" 
actually is; the IO controller <-> XUSB pad controller interface, or the 
XUSB pad controller <-> SoC pins interface.

> +For Tegra124 and Tegra132, the XUSB pad controller exposes the following
> +ports:
> +- 3x UTMI: utmi-0, utmi-1, utmi-2
> +- 1x ULPI: ulpi-0
> +- 2x HSIC: hsic-0, hsic-1
> +- 2x super-speed USB: usb3-0, usb3-1

I suspect that chunk would be better placed directly inside the "Port 
nodes:" section, since it describes valid values for the nodes that are 
subsequently described.

Do we need port nodes for PCIe or SATA at all? If not, should we 
s/ports/usb-ports/ in the container node name? I suppose it doesn't 
matter, but it feels slightly odd to only represent some of the ports.

> +Examples:
> +=========
> +
> +Tegra124 and Tegra132:
> +----------------------

The example isn't valid for Tegra132 since the compatible values don't 
include any Tegra132 entry.

BTW, I've suggested a lot of phrasing changes. Once we've settled the 
other questions, just let me know if you want me to propose an updated 
version of the patch that contains all those phrasing changes so you 
don't have to do them all yourself.
