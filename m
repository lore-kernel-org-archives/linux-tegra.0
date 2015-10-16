From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V9] dt: add NVIDIA Tegra XUSB controller binding
Date: Fri, 16 Oct 2015 10:36:43 -0600
Message-ID: <5621279B.60804@wwwdotorg.org>
References: <1444158109-1590-1-git-send-email-swarren@wwwdotorg.org>
 <561EAAF5.8000108@wwwdotorg.org> <5620C557.3050800@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5620C557.3050800-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2015 03:37 AM, Jon Hunter wrote:
>
> On 14/10/15 20:20, Stephen Warren wrote:
>> (Dropping a lot of CCs since it looks like this needs some more work)
>>
>> On 10/06/2015 01:01 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Add device-tree binding documentation for the XUSB (xHCI) controller
>>> present on Tegra124 and later SoCs.
>>>
>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> [swarren, combined separate MFD, mailbox, XHCI bindings into one node]
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>>> b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>>
>>> +Optional properties:
>>> +--------------------
>>> + - phys: Must contain an entry for each entry in phy-names.
>>> +   See ../phy/phy-bindings.txt for details.
>>> + - phy-names: Should include an entry for each PHY used by the
>>> controller.
>>> +   Names must be of the form "<type>-<number>" where <type> is one of
>>> "utmi",
>>> +   "hsic", or "usb3" and <number> is a 0-based index.  On Tegra124,
>>> there may
>>> +   be up to 3 UTMI, 2 HSIC, and 2 USB3 PHYs.
>>
>> Now that I've looked at this binding in more detail, I think this
>> phy-related text is wrong.
>>
>> First off, I don't think the phys are optional at all. Whenever a phy is
>> used, we must include it in the phys/phy-names list. I guess what we
>> need is a more precise definition of which entries are required, and
>> then to make these properties mandatory.
>>
>> I think the naming of the phys above may be wrong too. The text above
>> sounds like it's using the names of the actual phys, rather than of the
>> ports that are using them. Since there's a big mux between the ports and
>> the phys, I suspect it would make more sense to identify the ports in
>> phy-names, and have the values in phys reflect the configuration of the
>> mux. That way no matter how the mux is configured, the names used in
>> phy-names always map 1:1 to the XUSB controller ports. Does that make
>> sense? For some of the ports, this makes no difference since all the mux
>> does is allow XUSB vs. some other module access to the PHY. But I think
>> for at least the USB3 ports, each port could be mux'd to various
>> different PHYs/lanes, so this distinction does have an effect.
>
> Yes but please note that the documentation is a bit misleading on the
> number of actual options you have. For example, usb3-port0 is only
> available on pcie lane 0. I have just posted a patch to correct this [0].
>
>> Question: Should the XUSB controller driver determine which of its ports
>> to enable/use based solely on which phy-names are present, or should we
>> have some explicit property to define which ports are in use? Downstream
>> does have a property for this purpose.
>
> Given that the number of port-to-phy mappings are finite and there are
> not too many, could be good to define them all and have the board dts
> enabled the ones it is using. Right now it is not very clear exactly
> what ports are available on which lanes.

I think I'd prefer a binding with something more like a node per port or 
an enable bit/flag per port. This keeps things simple and maps directly 
to the HW. If we start enumerating all the valid combinations of which 
ports are active and mapped where, then we will need (a) to maintain 
that table in the binding, (b) a table in the driver to map from the 
list of options the binding allows to the set of HW ports/registers/... 
that are enabled. That sounds like extra complexity that's not necessary.

>> Question: Each physical USB connector contains signals from both a USB2
>> port and a USB3 port. The HW can be configured to associate different
>> USB2 and USB3 controllers with each-other for this purpose. The
>> configuration for this happens via a register in the XUSB padctl module
>> in register SS_PORT_MAP. However, the XUSB padctl binding doesn't allow
>> specification of that mapping yet, and the driver doesn't program that
>> register. I'm not sure if we should have a similar mapping property in
>> the XUSB controller's DT node, a custom API between the two drivers to
>> retrieve that information, or perhaps the XUSB controller driver doesn't
>> actually care, since HW implements all required interactions. Does
>> anyone know? Downstream also has a property that describes this mapping.
>
> My understanding is the the XUSB controller has 3 usb2 ports and 2 usb3
> ports. The SS_PORT_MAP allows you to map any of the 3 usb2 ports from
> the XUSB module to any of the 2 usb3 ports. Yes this mapping is not
> supported currently by the padctl binding but this was in Andrew's
> series for XHCI [1] and the patch you are probably interested in is
> here [2].

> [2]
> https://github.com/abrestic/linux/commit/82281999409b6c5a6a51df449a1c45204a249df8

Oh, I hadn't noticed that one since it wasn't part of the posted XHCI v8 
series, but in a different branch that built on it.

The binding proposed there (i.e. the usb2-port and usb3-port properties) 
don't map correctly to the way HW represents the data. I think we need 
to tie the binding to how the HW works much more directly. In HW there's 
a single "which USB2 port is associated with this USB3 port" register. I 
think we need DT to have a single property (or a property per USB3 port 
since there's a register field per USB3 port) that represents that, 
rather than properties that represent which USB2/3 controller ports will 
be using which lanes thus requiring the driver to derive the register 
data by comparing those values.

Also, I'm not sure the set of entries in 
include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h represents HW 
correctly; after the patch, some of TEGRA_XUSB_PADCTL_* (e.g. 
TEGRA_XUSB_PADCTL_PCIE) represent actual physical PHYs (which often have 
multiple lanes, each potentially used by various different PCIe/SATA/USB 
controllers), whereas some of them (e.g. TEGRA_XUSB_PADCTL_USB3_P*) 
represent the USB3 controllers that make use of PHYs rather than the 
PHYs or lanes themselves. That feels inconsistent to me.

Thierry, you mentioned you had a proposal for XUSB padctl which 
represented things using sub-nodes. Can you please post a DT binding (or 
at least example DT content) for that ASAP so that all the proposed 
options are out on the table, and we can get to work on a final binding 
proposal? Thanks.
