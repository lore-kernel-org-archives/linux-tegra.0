From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add NVIDIA Tegra XUSB pad
 controller binding
Date: Mon, 16 Nov 2015 13:13:45 -0700
Message-ID: <564A38F9.8070902@wwwdotorg.org>
References: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
 <1446657109-15568-2-git-send-email-thierry.reding@gmail.com>
 <563A7077.20902@wwwdotorg.org> <20151113161138.GA7219@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151113161138.GA7219@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/13/2015 09:11 AM, Thierry Reding wrote:
> On Wed, Nov 04, 2015 at 01:54:15PM -0700, Stephen Warren wrote:
>> On 11/04/2015 10:11 AM, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The NVIDIA Tegra XUSB pad controller provides a set of pads, each with a
>>> set of lanes that are used for PCIe, SATA and USB.
>>
>>>   .../bindings/phy/nvidia,tegra-xusb-padctl.txt      | 359 +++++++++++++++++++++
>>
>> For Tegra bindings, we usually use the full compatible value as the
>> filename, so I'd expect the chip number in the filename too.
>
> I specifically didn't do that to avoid confusion. The XUSB pad
> controller was introduced on Tegra114, but patches weren't posted until
> Tegra124. So nvidia,tegra114-xusb-padctl.txt would be the proper name
> for this binding if we were following the conventions, but then we have
> never specified that binding (though I think it would look mostly the
> same as for Tegra124).
>
> I can of course still go for nvidia,tegra114-xusb-padctl.txt, the
> content would explicitly list valid compatible strings. It's just that
> none of them would match the filename.

I was asking that the file be named to match the compatible flag, not 
the SoC version that contains the HW module.

The first/oldest compatible value currently documented is Tegra124, so 
I'd expect that to appear in the filename.

Yes, it's theoretically possible for the binding to be enhanced in the 
future to cover Tegra114, and at that time we'd probably want to rename 
the file. However, I believe the likelihood of that happening is zero 
(or even negative, which is admittedly mathematically impossible, but 
I'm being hyperbolic).

>> I'd expect to see a patch in this series that edits the existing
>> Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
>> and mentions that the binding is deprecated.
>
> How about this:
>
> --- >8 ---
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> index 30676ded85bb..77dfba05ccfd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
> @@ -1,6 +1,11 @@
>   Device tree binding for NVIDIA Tegra XUSB pad controller
>   ========================================================
>
> +NOTE: It turns out that this binding isn't an accurate description of the XUSB
> +pad controller. While the description is good enough for the functional subset
> +required for PCIe and SATA, it lacks the flexibility to represent the features
> +needed for USB. For the new binding, see ../phy/nvidia,tegra-xusb-padctl.txt.
> +
>   The Tegra XUSB pad controller manages a set of lanes, each of which can be
>   assigned to one out of a set of different pads. Some of these pads have an
>   associated PHY that must be powered up before the pad can be used.
> --- >8 ---

That sounds good, although I'd suggest explicitly mentioning that the 
binding is deprecated. Perhaps add ", and so this binding is deprecated" 
at the end of the first sentence?

>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt
>>> +- reg: Physical base address and length of the controller's registers.
>>> +- resets: Must contain an entry for each entry in reset-names.
>>> +- reset-names: Must include the following entries:
>>> +  - "padctl"
>>
>> Are there no clocks or power domains that affect XUSB padctl? I suppose we
>> can start off without any, and add them later if we need.
>
> I don't think there are any. The TRM specifies that it's in the ungated
> Vaux_soc power partition, and doesn't mention any clocks.

OK. Obviously the module must used some clock, since it contains clocked 
logic. However, equally that clock is obviously on even without the 
driver explicitly managing it since the HW works right now. So, I 
suppose we can defer adding any clock entries to the binding/DT until 
later, if the need arises. It'd still be nice if we could put the 
complete details into the binding from day one, but I understand that 
the documentation isn't exactly forthcoming on these topics.

>>> +- mboxes: Must contain an entry for each entry in mbox-names.
>>> +- mbox-names: Must include the following entries:
>>> +  - "xusb"
>>
>> I thought we'd decided not to use any mbox binding or drivers in XUSB now?
>> See for example my proposed XUSB controller binding at:
>>
>> http://www.spinics.net/lists/linux-tegra/msg23922.html
>> [PATCH V9] dt: add NVIDIA Tegra XUSB controller binding
>>
>> The idea is that the mailbox should be entirely internal to the XUSB
>> controller driver, and if the receipt of a mailbox message requires any
>> change in the XUSB pad controller programming, the XUSB controller driver
>> should simply call the XUSB pad controller driver to perform that operation.
>
> Okay, I think that should work, but it'll require a rather large rewrite
> of... well, everything. I think Martyn was going to look into that, so I
> guess I'll just drop this for now.
>
> Instead I think we'll need a phandle to the XUSB pad controller, so that
> we can resolve it to the proper context. Something like this perhaps?
>
> 	- nvidia,padctl: phandle to the XUSB pad controller that is used
> 	  to configure the USB pads used by the XHCI controller.
>
> That should of course go into the XHCI controller binding. The nice
> thing about this would be that we get rid of the circular dependency
> XHCI -> padctl -> mailbox -> XHCI.

Yes, that sounds good.

>>> +Pad nodes:
>>> +==========
>>
>>> +For Tegra124 and Tegra132, the following pads exist: utmi, ulpi, hsic, pcie
>>> +and sata. No extra resources are required for operation of these pads.
>>
>> Judging by the diagram in the TRM (e.g. figure 41 in the Tegra124 TRM,
>> figure 36 in the Tegra210 TRM), there is not a single "utmi" pad, but rather
>> a separate pad per USB2 lane. However, the other types of pads are indeed
>> multi-lane. The TRM also refers to "USB2" pads rather than "UTMI" pads. I
>> don't see a ULPI pad in the diagram either. Assuming the diagram in the TRM
>> is consistent with the register layout, I think we should have the following
>> set of pad nodes:
>>
>> utmi-0
>> utmi-1
>> utmi-2
>> hsic
>> pcie
>> sata
>
> I think the diagram is incomplete. If you look at the register
> definitions there is clearly a ULPI lane that can be muxed to SNPS or
> XUSB. Further there are two registers that allow configuration of the
> ULPI link.

OK, I see ULPI-related fields/registers in the Tegra124 register specs. 
They've apparently been removed from Tegra210.

> Similarly I think the UTMI pads are innacurately represented. First I
> think naming them UTMI is more accurate, because USB2 could be either
> UTMI or HSIC. Also there is common logic shared between all UTMI pads
> which is why I think it makes sense to collect them in a separate top
> level utmi pad node.
 >
> With Tegra210 this will become more important because having the top-
> level utmi pad node provides for a good location to put shared resources
> in the device tree.

Can you please provide more details re: which shared resources you're 
referring to? Looking at the implementation I have of struct 
tegra_xusb_phy_ops .prepare()/.enable() I'm not seeing any common 
logic/resources. Note that I'm making the subtle (perhaps arbitrary) 
distinction between logic that's global to the entire of XUSB PADCTL 
(but naturally affects everything contained inside it, such as the 
clamping and reset bits) and logic that actually binds N USB2/UTMI lanes 
together into some common sub-block (such as registers 
XUSB_PADCTL_UPHY_PLL_P0_CTL* for PCIe), rather than those lanes being 
bound together only at the top level of XUSB PADCTL.

While I agree that "USB2" isn't good naming, it /is/ the naming used by 
the TRM and the register documentation. I'm not quite convinced that the 
DT binding is the correct place to fix this naming mistake. At the very 
least, can we add a note near the "utmi" names indicating that they're 
referred to as "USB2" in the HW documentation?

...
>>> +Super-speed USB ports:
>>> +----------------------
>>> +
>>> +Required properties:
>>> +- status: Defines the operation status of the port. Valid values are:
>>> +  - "disabled": the port is disabled
>>> +  - "okay": the port is enabled
>>> +- nvidia,port: A single cell that specifies the physical port number to map
>>> +  this super-speed USB port to. The range of valid port numbers varies with
>>> +  the SoC generation:
>>> +  - 0-2: for Tegra124 and Tegra132
>>
>> Wouldn't it be better to name the node after the physical port number, just
>> like we name the PHY/lane nodes after the PHY/lane identity? We don't seem
>> to have any such mapping information in the UTMI port nodes; how do we
>> correlate the USB2 and USB3 ports?
>
> The mapping of UTMI and HSIC ports seems to be static. ...
...
> The correlation of USB2 and USB3 ports is specifically done using this
> nvidia,port property.

OK, perhaps nvidia,usb2-companion-port-id would be a more descriptive 
property name then. I got the impression this property indicated which 
USB3 port this node contained configuration for.

> The index in the USB3 port name represents the
> hardware index of the port, which is used to index registers etc. Now I
> suppose we could turn this around, and have the ports named after the
> physical port, but then we'd still need an nvidia,port property to
> relate that "physical port" to the pad controller hardware index. That
> seems the wrong way around to me, since we're describing the XUSB pad
> controller part of the port here.
>
>> I wonder if we shouldn't represent USB (physical) ports at the lane-side of
>> the XUSB pad controller rather than the IO controller side. That way, we
>> could pack both USB2- and USB3-related information into a single node. For
>> example, vbus-supply really applies equally to the companion USB2 and USB3
>> ports, whereas this binding represents those two parts of the overall USB
>> port separately, with the vbus-supply property appearing in only one of the
>> two places.
>
> My understanding is that the USB3 ports work on top of USB2 ports. USB3
> ports don't work standalone, so they must always be associated with one
> of the USB2 ports. If they aren't there is a hardware mechanism in place
> that disables the USB3 port.

Yes, a USB3 port must be coupled with a "companion" USB2 port.

> There are further some registers that control the electrical signalling
> of each of these ports, so I think it makes sense to represent this from
> the perspective of the pad controller rather than the I/O controller.

But at the signal interface between the XUSB controller and XUSB PADCTL 
module, the two are the same thing.

By "port" are you referring to something other than the signals at the 
periphery of the XUSB PADCTL module (either directed internally for 
connection to the XUSB controller, or externally to the physical balls 
on the chip package).

>> I guess this boils down to what a "port" actually is; the IO
>> controller <-> XUSB pad controller interface, or the XUSB pad controller <->
>> SoC pins interface.
>>
>>> +For Tegra124 and Tegra132, the XUSB pad controller exposes the following
>>> +ports:
>>> +- 3x UTMI: utmi-0, utmi-1, utmi-2
>>> +- 1x ULPI: ulpi-0
>>> +- 2x HSIC: hsic-0, hsic-1
>>> +- 2x super-speed USB: usb3-0, usb3-1
>>
>> I suspect that chunk would be better placed directly inside the "Port
>> nodes:" section, since it describes valid values for the nodes that are
>> subsequently described.
>>
>> Do we need port nodes for PCIe or SATA at all? If not, should we
>> s/ports/usb-ports/ in the container node name? I suppose it doesn't matter,
>> but it feels slightly odd to only represent some of the ports.
>
> I've seen references to "PCIe ports" and "SATA port" in documentation,
> but I don't see any immediate need to include them. An early version of
> the binding (and implementation) had them, but they ended up unused and
> empty. I don't see any registers that would substantiate that we need
> them. Then again, keeping the top-level node named "ports" will give us
> the flexibility to add them if necessary with the benefit that the
> parent name is still accurate, whereas naming it "usb-ports" would make
> things somewhat inconsistent if we ever need PCIe and SATA ports.

OK, I was expecting to add top-level "sata-ports" and "pcie-ports" nodes 
in the future if required, but I supposed we can indeed just add 
everything under "ports" instead.

>>> +Examples:
>>> +=========
>>> +
>>> +Tegra124 and Tegra132:
>>> +----------------------
>>
>> The example isn't valid for Tegra132 since the compatible values don't
>> include any Tegra132 entry.
>>
>> BTW, I've suggested a lot of phrasing changes. Once we've settled the other
>> questions, just let me know if you want me to propose an updated version of
>> the patch that contains all those phrasing changes so you don't have to do
>> them all yourself.
>
> Feel free to integrate whatever phrasing changes you think improve the
> binding. It might be best for you to do that yourself to avoid churn due
> to me misunderstanding what you were suggesting.

I think I'd like to see a bit more clarity on the definition of "ports" 
and the description of the node structure before I suggest any more 
tweaks to the wording. I'm not 100% sure I understood the proposed 
structure fully yet.
