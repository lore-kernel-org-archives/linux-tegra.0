From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Thu, 5 Nov 2015 09:55:56 +0000
Message-ID: <563B27AC.2000702@nvidia.com>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446657109-15568-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 04/11/15 17:11, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
> set of lanes that are used for PCIe, SATA and USB.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/phy/nvidia,tegra-xusb-padctl.txt      | 359 +++++++++++++++++++++
>  1 file changed, 359 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
> new file mode 100644
> index 000000000000..026e924ae54a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
> @@ -0,0 +1,359 @@
> +Device tree binding for NVIDIA Tegra XUSB pad controller
> +========================================================
> +
> +The Tegra XUSB pad controller manages a set of pads, each of which controls
> +one or more lanes. Each lane can in turn be assigned to one out of a set of
> +different outputs. A pad contains logic common for all its lanes. Each lane
> +can additionally be separately configured and powered up.
> +
> +Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
> +super-speed USB. Other lanes are for various types of low-speed, full-speed
> +or high-speed USB (such as UTMI, ULPI and HSIC).
> +
> +In addition to per-lane configuration, USB 3.0 ports may require additional
> +settings on a per-board basis.
> +
> +Pads will be represented as children of the top-level XUSB pad controller
> +device tree node. Each lane exposed by the pad will be represented by its
> +own subnode and can be referenced by users of the lane using the standard
> +PHY bindings, as described by the phy-bindings.txt file in this directory.
> +
> +Required properties:
> +--------------------
> +- compatible: Must be:
> +  - "nvidia,tegra124-xusb-padctl": for Tegra124 and Tegra132
> +- reg: Physical base address and length of the controller's registers.
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must include the following entries:
> +  - "padctl"
> +- mboxes: Must contain an entry for each entry in mbox-names.
> +- mbox-names: Must include the following entries:
> +  - "xusb"
> +
> +
> +Pad nodes:
> +==========
> +
> +A required child node named "pads" contains a list of subnodes, one for each
> +of the pads exposed by the XUSB pad controller. Each pad may need additional
> +resources that can be referenced in its pad node.
> +
> +The "status" property is used to enable or disable the use of a pad. If set
> +to "disabled", the pad will not be used on the given board. In order to use
> +the pad and any of its lanes, this property must be set to "okay".
> +
> +For Tegra124 and Tegra132, the following pads exist: utmi, ulpi, hsic, pcie
> +and sata. No extra resources are required for operation of these pads.
> +
> +
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
> +- #phy-cells: Should be 0. Since each lane represents a single PHY, there is
> +  no need for an additional specifier.
> +- nvidia,function: The output function of the PHY. See below for a list of
> +  valid functions per SoC generation.
> +
> +For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
> +- utmi: utmi-0, utmi-1, utmi-2
> +  - functions: "snps", "xusb", "uart"
> +- ulpi: ulpi-0
> +  - functions: "snps", "xusb"
> +- hsic: hsic-0, hsic-1
> +  - functions: "snps", "xusb"
> +- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4
> +  - functions: "pcie", "usb3-ss"

Per the patch I recently sent out [0], although from the register
description the above is correct, the reality is that the usb3-ss
function is not available on all pcie lanes. We really need to make this
clear somehow.

> +- sata: sata-0
> +  - functions: "usb3-ss", "sata"
> +
> +Port nodes:
> +===========
> +
> +A required child node named "ports" contains a list of all the ports exposed
> +by the XUSB pad controller. Per-port configuration is only required for USB.

What about pcie? For example, how/where can we map the pcie1-x2 to the
pcie lanes? Again per patch [0] there are only a finite number of
options for mapping pcie ports to lanes and so it would be good to
represent this as well.

> +UTMI ports:
> +-----------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- mode: A string that determines the mode in which to run the port. Valid
> +  values are:
> +  - "host": for USB host mode
> +  - "device": for USB device mode
> +  - "otg": for USB OTG mode
> +
> +Optional properties:
> +- nvidia,internal: A boolean property whose presence determines that a port
> +  is internal. In the absence of this property the port is considered to be
> +  external.
> +- vbus-supply: phandle to a regulator supplying the VBUS voltage.
> +
> +ULPI ports:
> +-----------
> +
> +Optional properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +- nvidia,internal: A boolean property whose presence determines that a port
> +  is internal. In the absence of this property the port is considered to be
> +  external.
> +
> +HSIC ports:
> +-----------
> +
> +Required properties:
> +- status: Defines the operation status of the port. Valid values are:
> +  - "disabled": the port is disabled
> +  - "okay": the port is enabled
> +
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

I am a bit confused by what nvidia,port property is used for. Is this to
program XUSB_PADCTL_SS_PORT_MAP_0? If so then I think that this should
be an optional property because if you want to use the usb3 ports for
usb3, then we should not need to specify this here.

Also the XHCI has 3 usb2 ports and 2 usb3 ports and so when you have
port numbers 0-2 I am not sure what you are referring too.

Cheers
Jon

[0] https://lkml.org/lkml/2015/10/16/193
