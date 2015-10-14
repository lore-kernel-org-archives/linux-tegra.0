From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V9] dt: add NVIDIA Tegra XUSB controller binding
Date: Wed, 14 Oct 2015 13:20:21 -0600
Message-ID: <561EAAF5.8000108@wwwdotorg.org>
References: <1444158109-1590-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444158109-1590-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

(Dropping a lot of CCs since it looks like this needs some more work)

On 10/06/2015 01:01 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add device-tree binding documentation for the XUSB (xHCI) controller
> present on Tegra124 and later SoCs.
>
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> [swarren, combined separate MFD, mailbox, XHCI bindings into one node]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt

> +Optional properties:
> +--------------------
> + - phys: Must contain an entry for each entry in phy-names.
> +   See ../phy/phy-bindings.txt for details.
> + - phy-names: Should include an entry for each PHY used by the controller.
> +   Names must be of the form "<type>-<number>" where <type> is one of "utmi",
> +   "hsic", or "usb3" and <number> is a 0-based index.  On Tegra124, there may
> +   be up to 3 UTMI, 2 HSIC, and 2 USB3 PHYs.

Now that I've looked at this binding in more detail, I think this 
phy-related text is wrong.

First off, I don't think the phys are optional at all. Whenever a phy is 
used, we must include it in the phys/phy-names list. I guess what we 
need is a more precise definition of which entries are required, and 
then to make these properties mandatory.

I think the naming of the phys above may be wrong too. The text above 
sounds like it's using the names of the actual phys, rather than of the 
ports that are using them. Since there's a big mux between the ports and 
the phys, I suspect it would make more sense to identify the ports in 
phy-names, and have the values in phys reflect the configuration of the 
mux. That way no matter how the mux is configured, the names used in 
phy-names always map 1:1 to the XUSB controller ports. Does that make 
sense? For some of the ports, this makes no difference since all the mux 
does is allow XUSB vs. some other module access to the PHY. But I think 
for at least the USB3 ports, each port could be mux'd to various 
different PHYs/lanes, so this distinction does have an effect.

Question: Should the XUSB controller driver determine which of its ports 
to enable/use based solely on which phy-names are present, or should we 
have some explicit property to define which ports are in use? Downstream 
does have a property for this purpose.

Question: Each physical USB connector contains signals from both a USB2 
port and a USB3 port. The HW can be configured to associate different 
USB2 and USB3 controllers with each-other for this purpose. The 
configuration for this happens via a register in the XUSB padctl module 
in register SS_PORT_MAP. However, the XUSB padctl binding doesn't allow 
specification of that mapping yet, and the driver doesn't program that 
register. I'm not sure if we should have a similar mapping property in 
the XUSB controller's DT node, a custom API between the two drivers to 
retrieve that information, or perhaps the XUSB controller driver doesn't 
actually care, since HW implements all required interactions. Does 
anyone know? Downstream also has a property that describes this mapping.

(Although note that the downstream properties for those two purposes, or 
at least the code that handles them, seems like a mess to me so far).

Either way, I think we need to update the XUSB padctl binding to contain 
this information before we consider the XUSB controller binding to be 
fully fleshed out, so we can make sure the two bindings interact well.

> +Example:

> +		phys = <&padctl TEGRA_XUSB_PADCTL_UTMI_P1>, /* mini-PCIe USB */
> +		       <&padctl TEGRA_XUSB_PADCTL_UTMI_P2>, /* USB A */
> +		       <&padctl TEGRA_XUSB_PADCTL_USB3_P0>; /* USB A */
> +		phy-names = "utmi-1", "utmi-2", "usb3-0";

We're also missing an update to the XUSB padctl binding to define all 
those TEGRA_XUSB_PADCTL_UTMI_P* values. I think we need to complete that 
in order to make sure that both bindings are fully thought out.

Thierry, I found your WIP patches perhaps related to this at:
> https://github.com/thierryreding/linux/commits/staging/xhci

However, those top two patches there don't contain any DT binding or 
.dts file updates so it's difficult to tell where the changes are going. 
Do you have binding/.dts patches elsewhere to show the intended result?

I notice that series may also have support for configuring the per-board 
tuning parameters too. That'd be useful to get in place too. Do you have 
a source for the actual tuning values for any of the T210 boards that 
mainline U-Boot now supports?
